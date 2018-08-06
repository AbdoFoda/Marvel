// To parse the JSON, add this file to your project and do:
//
//   let marvel = try? JSONDecoder().decode(Marvel.self, from: jsonData)

import Foundation

struct Marvel: Codable {
    let code: Int
    let data: DataClass
}

struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
}

struct Result: Codable {
    let name, description: String
    let thumbnail: Thumbnail
    let comics, series: ComicsURI
}

