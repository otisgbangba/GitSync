import Cocoa
@testable import Utils
@testable import Element

protocol Scrollable3:Progressable3 {
    func onScrollWheelChange(_ event:NSEvent)
    func onScrollWheelEnter()
    func onScrollWheelExit()
    func onInDirectScrollWheelChange(_ event:NSEvent)
}
extension Scrollable3{
    /**
     * NOTE: if the prev Change event only had -1 or 1 or 0. Then you released with no momentum and so no anim should be initiated
     */
    func scroll(_ event:NSEvent){
        Swift.print("event.momentumPhase: " + "\(event.momentumPhase)")
        Swift.print("event.phase: " + "\(event.phase)")
        
        Swift.print("NSEventPhase.changed.rawValue: " + "\(NSEventPhase.changed.rawValue)")
        Swift.print("NSEventPhase.mayBegin.rawValue: " + "\(NSEventPhase.mayBegin.rawValue)")
        Swift.print("NSEventPhase.began.rawValue: " + "\(NSEventPhase.began.rawValue)")
        Swift.print("NSEventPhase.ended.rawValue: " + "\(NSEventPhase.ended.rawValue)")
        Swift.print("NSEventPhase.cancelled.rawValue: " + "\(NSEventPhase.cancelled.rawValue)")
        
        //Swift.print("Scrollable3.scroll() \(event.phase.type) scrollDeltaX: \(event.scrollingDeltaX) deltaX: \(event.deltaX)")
        switch event.phase{
            case NSEventPhase.changed:onScrollWheelChange(event)/*Fires everytime there is direct scrollWheel gesture movment and momentum, the momentum fades.*/
            case NSEventPhase.mayBegin:onScrollWheelEnter()/*Can be used to detect if two fingers are touching the trackpad*/
            case NSEventPhase.began:onScrollWheelEnter()/*The mayBegin phase doesn't fire if you begin the scrollWheel gesture very quickly*/
            case NSEventPhase.ended:
                onScrollWheelExit()//Swift.print("ended")/*if you release your touch-gesture and the momentum of the gesture has stopped.*/
                Swift.print("event.momentumPhase: " + "\(event.momentumPhase)")
            /*Swift.print("1. event.scrollingDelta: " + "\(event.scrollingDelta)")
             Swift.print("event.delta: " + "\(event.delta)")*/
            case NSEventPhase.cancelled:
                onScrollWheelExit()//Swift.print("cancelled")/*this trigers if the scrollWhell gestures goes off the trackpad etc*/
            
            /*Swift.print("2. event.scrollingDelta: " + "\(event.scrollingDelta)")
             Swift.print("event.delta: " + "\(event.delta)")*/
            case NSEventPhase(rawValue:0):onInDirectScrollWheelChange(event);/**//*onScrollWheelChange(event)*/_ = "";/*this is the same as momentum aka inDirect scroll, Toggeling this on and off can break things*/
            default:break;
        }
        //super.scrollWheel(with:event)
    }
    func onScrollWheelChange(_ event:NSEvent){
        Swift.print("Scrollable3.onScrollWheelChange()")
        //Swift.print("contentSize: " + "\(contentSize)")
        //let progress:CGFloat = SliderParser.progress(event.delta, maskSize, contentSize).y
        let progressVal:CGPoint = SliderListUtils.progress(event.delta, interval, progress)
        //setProgress(progressVal)
        setProgress(progressVal)
    }/*Direct scroll, not momentum*/
    func onInDirectScrollWheelChange(_ event:NSEvent){
        onScrollWheelChange(event)
        
    }
    func onScrollWheelEnter(){Swift.print("Scrollable3.onScrollWheelEnter()")}
    func onScrollWheelExit(){Swift.print("Scrollable3.onScrollWheelExit()")}
}
extension ContainerView3 {//private maybe?
    /**
     * TODO: Try to override with generics ContainerView<VerticalScrollable>  etc
     */
    override open func scrollWheel(with event: NSEvent) {
       // Swift.print("ContainerView3.scrollWheel")
        if(self is ElasticSlidableScrollable3){
            (self as! ElasticSlidableScrollable3).scroll(event)
        }else if(self is Scrollable3){
            (self as! Scrollable3).scroll(event)
        }/*else if(self is Slidable3){
         if(event.phase == NSEventPhase.mayBegin || event.phase == NSEventPhase.began){
         (self as! Slidable3).showSlider()
         }
         }*/
        super.scrollWheel(with: event)
    }
}
