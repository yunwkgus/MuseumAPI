// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let info: Info
    let records: [Record]
}

// MARK: - Info
struct Info: Codable {
    let totalrecordsperquery, totalrecords, pages, page: Int
    let next: String
    let responsetime: String
}

// MARK: - Record
struct Record: Codable {
    let copyright: JSONNull?
    let contextualtextcount: Int
    let creditline: String
    let accesslevel: Int
    let dateoflastpageview: String
    let classificationid: Int
    let division: Division
    let markscount, publicationcount, totaluniquepageviews: Int
    let contact: Contact
    let colorcount, rank, id: Int
    let state: JSONNull?
    let verificationleveldescription: String
    let period: String?
    let images: [Image]?
    let worktypes: [WorktypeElement]
    let imagecount, totalpageviews, accessionyear: Int
    let standardreferencenumber: JSONNull?
    let signed: String?
    let classification: Classification
    let relatedcount, verificationlevel: Int
    let primaryimageurl: String
    let titlescount, peoplecount: Int
    let style: JSONNull?
    let lastupdate: Date
    let commentary: JSONNull?
    let periodid: Int?
    let technique, edition, description: JSONNull?
    let medium: String
    let lendingpermissionlevel: Int
    let title: String
    let accessionmethod: Accessionmethod
    let colors: [Color]
    let provenance: String?
    let groupcount: Int
    let dated: String
    let audio: [Audio]?
    let department: String
    let dateend: Int
    let people: [Person]?
    let url: String
    let dateoffirstpageview: String
    let century: Century
    let objectnumber: String
    let labeltext: String?
    let datebegin: Int
    let culture: String
    let exhibitioncount, imagepermissionlevel, mediacount, objectid: Int
    let techniqueid: JSONNull?
    let dimensions: String
    let seeAlso: [SeeAlso]
}

enum Accessionmethod: String, Codable {
    case bequest = "Bequest"
    case gift = "Gift"
    case purchase = "Purchase"
}

// MARK: - Audio
struct Audio: Codable {
    let duration: Int
    let copyright: Copyright
    let audioid: Int
    let description: String
    let transcripturl: String
    let primaryurl: String
}

enum Copyright: String, Codable {
    case presidentAndFellowsOfHarvardCollege = "President and Fellows of Harvard College"
}

enum Century: String, Codable {
    case the19ThCentury = "19th century"
}

enum Classification: String, Codable {
    case paintings = "Paintings"
}

// MARK: - Color
struct Color: Codable {
    let color, spectrum: String
    let hue: Hue
    let percent: Double
    let css3: String
}

enum Hue: String, Codable {
    case black = "Black"
    case blue = "Blue"
    case brown = "Brown"
    case green = "Green"
    case grey = "Grey"
    case orange = "Orange"
    case red = "Red"
    case yellow = "Yellow"
}

enum Contact: String, Codable {
    case amAsianmediterraneanHarvardEdu = "am_asianmediterranean@harvard.edu"
    case amEuropeanamericanHarvardEdu = "am_europeanamerican@harvard.edu"
}

enum Division: String, Codable {
    case asianAndMediterraneanArt = "Asian and Mediterranean Art"
    case europeanAndAmericanArt = "European and American Art"
}

// MARK: - Image
struct Image: Codable {
    let date: String?
    let copyright: Copyright
    let imageid, idsid: Int
    let format: ImageFormat
    let description, technique: String?
    let renditionnumber: String
    let displayorder: Int
    let baseimageurl: String
    let alttext: String?
    let width: Int
    let publiccaption: String?
    let iiifbaseuri: String
    let height: Int
}

enum ImageFormat: String, Codable {
    case imageJPEG = "image/jpeg"
}

// MARK: - Person
struct Person: Codable {
    let role: Role
    let birthplace: String?
    let gender: Gender
    let displaydate: String?
    let personPrefix: JSONNull?
    let culture: String?
    let displayname, alphasort, name: String
    let personid: Int
    let deathplace: String?
    let displayorder: Int

    enum CodingKeys: String, CodingKey {
        case role, birthplace, gender, displaydate
        case personPrefix = "prefix"
        case culture, displayname, alphasort, name, personid, deathplace, displayorder
    }
}

enum Gender: String, Codable {
    case male = "male"
    case unknown = "unknown"
}

enum Role: String, Codable {
    case artist = "Artist"
}

// MARK: - SeeAlso
struct SeeAlso: Codable {
    let id: String
    let type: TypeEnum
    let format: SeeAlsoFormat
    let profile: String
}

enum SeeAlsoFormat: String, Codable {
    case applicationJSON = "application/json"
}

enum TypeEnum: String, Codable {
    case iiifManifest = "IIIF Manifest"
}

// MARK: - WorktypeElement
struct WorktypeElement: Codable {
    let worktypeid: String
    let worktype: WorktypeEnum
}

enum WorktypeEnum: String, Codable {
    case painting = "painting"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
