// To parse the JSON, add this file to your project and do:
//
//   let marvel = try? JSONDecoder().decode(Marvel.self, from: jsonData)

import Foundation

struct ComicsResponse: Codable {
    let code: Int
    let data: ComicsDataClass
}

struct ComicsDataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Comic]
}

struct Comic: Codable {
    let title: String
    let description: String?
    let thumbnail: Thumbnail
}












