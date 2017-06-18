import Cocoa
@testable import Utils
@testable import Element

extension PrefsView{
    /**
     * New
     */
    func setPrefs(_ prefs:Prefs){
        login?.setInputText(prefs.login)
        let passStr = KeyChainParser.password("GitSyncApp") ?? ""
        pass?.setInputText(passStr)
        local?.setInputText(prefs.local)
        darkMode?.setChecked(prefs.darkMode)
    }
    static var xml:XML{
        get{
            let xml:XML = "<prefs></prefs>".xml
            xml.appendChild("<\(PrefsType.login)>\(PrefsView.prefs.login)</\(PrefsType.login)>".xml)
            xml.appendChild("<\(PrefsType.local)>\(PrefsView.prefs.local)</\(PrefsType.local)>".xml)
            xml.appendChild("<\(PrefsType.darkMode)>\(PrefsView.prefs.darkMode)</\(PrefsType.darkMode)>".xml)
            let winSize:CGSize = WinParser.size(NSApp.windows.first!)
            let pos:CGPoint = WinParser.topLeft(NSApp.windows.first!)
            xml.appendChild("<\(PrefsType.width)>\(winSize.w.str)</\(PrefsType.width)>".xml)
            xml.appendChild("<\(PrefsType.height)>\(winSize.h.str)</\(PrefsType.height)>".xml)
            xml.appendChild("<\(PrefsType.x)>\(winSize.x.str)</\(PrefsType.x)>".xml)
            xml.appendChild("<\(PrefsType.y)>\(winSize.y.str)</\(PrefsType.y)>".xml)
            return xml
        }
    }
}
extension PrefsView{
    var login:TextInput? {return self.element(PrefsType.login)}
    var pass:TextInput? {return self.element(PrefsType.pass)}
    var local:TextInput? {return self.element(PrefsType.local)}
    var darkMode:CheckBoxButton? {return self.element(PrefsType.darkMode)}
}
