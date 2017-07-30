import Cocoa
@testable import Utils
@testable import Element

extension ProtoTypeView {
    /**
     * Drag handler for modal
     */
    func leftMouseDraggedClosure(event:NSEvent)  {
        let relativePos:CGFloat =  self.onMouseDownMouseY - self.window!.contentView!.localPos().y
        //Swift.print("relativePos: " + "\(relativePos)")
        var newRect = Modal.expanded
        newRect.y -= relativePos
        modalBtn.modalAnimator.direct = true
        modalBtn.modalAnimator.setTargetValue(newRect).start()
        if modalBtn.modalAnimator.value.y < 30  {//modal in stayMode
            self.modalStayMode = true
            //Swift.print("reveal buttons: \(modalBtn.modalAnimator.value.y)")
            var p = modalBtn.modalAnimator.value.rect.bottomLeft
            p.y += 15//add some margin
            p.y = p.y.max(PromptButton.expanded.y)
            //
            self.promptBtnAnimator.setTargetValue(p).start()//you could do modalBtn.layer.origin + getHeight etc.
        }else if modalBtn.modalAnimator.value.y > 30 {//modal in leaveMode
            self.modalStayMode = false
            Swift.print("anim buttons out")
            self.promptBtnAnimator.setTargetValue(PromptButton.initial.origin).start() //anim bellow screen
        }
    }
}
