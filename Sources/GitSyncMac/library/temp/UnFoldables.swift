import Foundation
@testable import Utils
@testable import Element
/**
 * NOTE: Key: stores keys to access getters and setters,should be moved to the individuel UI extensions
 * NOTE: The structs are nice if you want to sub-class Components, then they can be re-used, avoids duplicate code
 * NOTE: We use static func unfold instead of init, as init cant be overriden in subClasses, static func can
 */
extension TextInput:UnFoldable{/*<-Attaches the Unfoldable protocol to TextInput*/
    enum Key{
        static let text = "text"
        static let inputText = "inputText"
    }
    struct TextInputConfig{
        let element:ElementConfig
        let text:String
        let inputText:String
        init(_ dict:[String:Any],_ parent:IElement? = nil){
            element = .init(dict,parent)
            text = UnFoldUtils.string(dict, Key.text) ?? ""
            inputText = UnFoldUtils.string(dict, Key.inputText) ?? ""
        }
    }
    static func unfold(_ unfoldDict:[String:Any],_ parent:IElement? = nil) -> TextInput{
        let config:TextInputConfig = .init(unfoldDict,parent)
        return TextInput.init(config.element.width, config.element.height, config.text, config.inputText, config.element.parent, config.element.id)
    }
    var data:[String:Any] {
        get{
            //fatalError("not avilabale")
            return [Key.text:self.text.getText(),Key.inputText:self.inputTextArea.text.getText()]
        }set{
            if let text:String = newValue[Key.text] as? String { self.text.setText(text) }
            if let inputText:String = newValue[Key.inputText] as? String { self.inputTextArea.setTextValue(inputText) }
        }
    }
}
extension RadioButton:UnFoldable{
    struct RadioButtonConfig{
        let text:String
        let isSelected:Bool
        let element:ElementConfig
        init(_ dict:[String:Any],_ parent:ElementKind?){
            element = .init(dict,parent)
            text = UnFoldUtils.string(dict, "text") ?? ""
            let isSelectedStr = UnFoldUtils.string(dict, "isSelected") ?? "false"
            isSelected = isSelectedStr.bool
        }
    }
    static func unfold<T>(_ unfoldDict:[String:Any], _ parent:IElement? = nil) -> T{
        let config:RadioButtonConfig = .init(unfoldDict,parent)
        return RadioButton.init(config.element.width, config.element.height,config.text,config.isSelected, config.element.parent, config.element.id) as! T
    }
    override var data:[String:Any] {
        get{
            fatalError("not availale")
        }set{
            fatalError("not availale")
        }
    }
}
extension CheckBoxButton{
    struct CheckBoxButtonConfig{
        let text:String
        let isChecked:Bool
        let element:ElementConfig
        init(_ dict:[String:Any],_ parent:ElementKind?){
            element = .init(dict,parent)
            text = UnFoldUtils.string(dict, "text") ?? ""
            let isCheckedStr = UnFoldUtils.string(dict, "isChecked") ?? "false"
            isChecked = isCheckedStr.bool
        }
    }
    /**
     * UnFolds a CheckBoxButton
     */
    static func unfold(_ unfoldDict:[String:Any], _ parent:ElementKind? = nil) -> CheckBoxButton{
        let config:CheckBoxButtonConfig = .init(unfoldDict,parent)
        return CheckBoxButton.init(config.element.width, config.element.height, config.text, config.isChecked, config.element.parent, config.element.id)
    }
    var data:[String:Any] {
        get{
            fatalError("not availale")
        }set{
            fatalError("not availale")
        }
    }
}
extension TextButton:UnFoldable{
    struct TextButtonConfig{
        let text:String
        let element:ElementConfig

        init(_ dict:[String:Any],_ parent:ElementKind?){
            element = .init(dict,parent)
            text = UnFoldUtils.string(dict, "text") ?? ""
        }
    }
    static func unfold<T>(_ unfoldDict:[String:Any], _ parent:IElement?) -> T {
        let config:TextButtonConfig = .init(unfoldDict,parent)
        return TextButton.init(config.element.width, config.element.height,config.text, config.element.parent, config.element.id) as! T
    }
    var data:[String:Any] {
        get{
            fatalError("not availale")
        }set{
            fatalError("not availale")
        }
    }
}
extension Text:UnFoldable{
    enum Key{
        static let text = "text"
    }
    static func unfold(_ unfoldDict:[String:Any], _ parent:ElementKind? = nil) -> Text{
        let elementConfig:ElementConfig = .init(unfoldDict,parent)
        let text:String = UnFoldUtils.string(unfoldDict, "text") ?? ""
        return Text.init(elementConfig.width, elementConfig.height, text, elementConfig.parent, elementConfig.id)
    }
    var data:[String:Any] {
        get{
            return [Key.text:self.getText()]
        }set{
            if let text:String = newValue[Key.text] as? String { self.setText(text) }
        }
    }
}
extension Element{
    struct ElementConfig{/*Default Element config*/
        let width:CGFloat
        let height:CGFloat
        let parent:IElement?
        let id:String?
        init(_ dict:[String:Any],_ parent:ElementKind? = nil){
            width = UnFoldUtils.cgFloat(dict, "width")
            height = UnFoldUtils.cgFloat(dict, "height")
            self.parent = parent
            id = UnFoldUtils.string(dict, "id")
        }
    }
}
