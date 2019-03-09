import Foundation
import SwiftyJSON


class Photo{
    
    var farm : Int
    var id : String
    var isfamily: Int
    var isfriend : Int
    var ispublic : Int
    var owner : String
    var secret : String
    var server : String
    var title : String
    
    init(json: JSON){
        farm = json["farm"].intValue
        id = json["id"].stringValue
        isfamily = json["isfamily"].intValue
        isfriend = json["isfriend"].intValue
        ispublic = json["ispublic"].intValue
        owner = json["owner"].stringValue
        secret = json["secret"].stringValue
        server = json["server"].stringValue
        title = json["title"].stringValue
    }
    
    func getImageUrl() -> URL {
        let url = "http://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
        return URL.init(string: url)!
    }
}
