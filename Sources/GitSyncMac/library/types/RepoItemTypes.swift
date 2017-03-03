import Foundation

typealias RepoItem = (
    localPath:String,
    interval:Int,
    branch:String,
    keyChainItemName:String,
    upload:Bool,
    title:String,
    download:Bool,
    active:Bool,
    remotePath:String,
    autoSyncInterval:Bool,
    autoCommitMessage:Bool,
    fileChange:Bool,
    pullToAutoSync:Bool
)
class RepoItemTypes{
    static var emptyRepoItem:RepoItem = (
        localPath:"",
        interval:0,
        branch:"",
        keyChainItemName:"",
        upload:false,
        title:"",
        download:false,
        active:false,
        remotePath:"",
        autoSyncInterval:false,
        autoCommitMessage:false,
        fileChange:false,
        pullToAutoSync:false
    )
    static var names = (
        localPath:"localPath",
        interval:"interval",
        branch:"branch",
        keyChainItemName:"keyChainItemName",
        upload:"upload",
        title:"title",
        download:"download",
        active:"active",
        remotePath:"remotePath",
        autoSyncInterval:"autoSyncInterval",
        autoCommitMessage:"autoCommitMessage",
        fileChange:"fileChange",
        pullToAutoSync:"pullToAutoSync"
    )
}
