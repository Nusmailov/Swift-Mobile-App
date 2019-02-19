

import Foundation

struct Question : Codable {
    
    let responseCode : Int?
    let results : [Result]?
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        responseCode = try values.decodeIfPresent(Int.self, forKey: .responseCode)
        results = try values.decodeIfPresent([Result].self, forKey: .results)
    }
    
}
