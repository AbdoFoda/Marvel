// To parse the JSON, add this file to your project and do:
//
//   let marvel = try? JSONDecoder().decode(Marvel.self, from: jsonData)

import Foundation

struct ComicsResponse: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: ComicsDataClass
}

struct ComicsDataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Comic]
}

struct Comic: Codable {
    let id : Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
    let images: [Thumbnail]
}



struct Series: Codable {
    let resourceURI, name: String
}

struct Creators: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItem]
    let returned: Int
}

struct CreatorsItem: Codable {
    let resourceURI, name: String
    let role: Role
}

enum Role: String, Codable {
    case colorist = "colorist"
    case editor = "editor"
    case inker = "inker"
    case letterer = "letterer"
    case penciler = "penciler"
    case penciller = "penciller"
    case pencillerCover = "penciller (cover)"
    case writer = "writer"
}

struct Date: Codable {
    let type: DateType
    let date: String
}

enum DateType: String, Codable {
    case digitalPurchaseDate = "digitalPurchaseDate"
    case focDate = "focDate"
    case onsaleDate = "onsaleDate"
    case unlimitedDate = "unlimitedDate"
}



struct Price: Codable {
    let type: PriceType
    let price: Double
}

enum PriceType: String, Codable {
    case digitalPurchasePrice = "digitalPurchasePrice"
    case printPrice = "printPrice"
}



struct TextObject: Codable {
    let type, language, text: String
}



