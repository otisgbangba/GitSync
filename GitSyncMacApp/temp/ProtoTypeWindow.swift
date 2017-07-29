import Cocoa
@testable import Element
@testable import Utils

class ProtoTypeWindow:Window {
    static var view:ProtoTypeView?
    required init(_ docWidth:CGFloat,_ docHeight:CGFloat){
        super.init(docWidth, docHeight)
        WinModifier.align(self, Alignment.centerCenter, Alignment.centerCenter,CGPoint(6,0))/*aligns the window to the screen*/
    }
    override func resolveSkin() {
        self.contentView = ProtoTypeView(frame.size.width,frame.size.height)/*⬅️️🚪*/
    }
    required init?(coder:NSCoder) {fatalError("init(coder:) has not been implemented")}
}