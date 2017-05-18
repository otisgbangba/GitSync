import Foundation
@testable import Utils
@testable import Element

class TestItem:Element{
    lazy var text1:Element = {return self.addSubView(Element(NaN,NaN,self,"text1"))}()
    lazy var text2:Element = {return self.addSubView(Element(NaN,NaN,self,"text2"))}()
    override func resolveSkin() {
        /*
         var css:String = ""
         css += "RepositoryDetailView{float:left;clear:left;}"
         css += "RepositoryDetailView #text1{fill:orange;width:100%;height:48px;float:left;clear:left;}"
         css += "RepositoryDetailView #text2{fill:green;width:100%;height:48px;float:left;clear:left;}"
         css += "RepositoryDetailView TextInput{width:100%;height:48px;float:left;clear:left;fill:Blue;fill-alpha:1;}"
         css += "RepositoryDetailView TextInput Text{width:100px;fill:yellow;fill-alpha:1;}"
         css += "RepositoryDetailView TextInput TextArea{width:100%;fill:blue;fill-alpha:1;}"
         css += "RepositoryDetailView TextInput TextArea Text{width:100%;fill:purple;fill-alpha:1;}"
         */
        //StyleManager.addStyle(css)
        super.resolveSkin()
        _ = text1
        _ = text2
    }
}

class RepositoryDetailView:Element {
    lazy var contentContainer:Container = {return self.addSubView(Container(self.width,self.height,self,"lable"))}()
    lazy var item:TestItem = {return self.addSubView(TestItem(NaN,NaN,self))}()
    
    //lazy var nameTextInput:TextInput = {return self.contentContainer.addSubView(TextInput(self.width, 32, "Name: ", "", self.contentContainer))}()
    //lazy var localPathTextInput:TextInput = {return self.contentContainer.addSubView(TextInput(self.width, 32, "Local-path: ", "", self.contentContainer))}()
    override func resolveSkin() {
        
        var css:String = ""
        css += "RepositoryDetailView Container#lable{float:left;clear:left;}"
        css += "RepositoryDetailView TestItem{fill:orange;width:100%;height:48px;float:left;clear:left;}"
       
        /**/
        //StyleManager.addStyle(css)
        super.resolveSkin()
        _ = contentContainer
         _ = item
         /**/
        //_ = nameTextInput
        //_ = localPathTextInput
    }
}