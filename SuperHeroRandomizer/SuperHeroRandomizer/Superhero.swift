import Foundation


struct Superhero: Codable {
    let name: String?
    let images: Images?
    let powerstats: Powerstats?
    let appearance: Appearance?
    let biography: Biography?
    let connections: Connections?
}


struct Images: Codable {
    let lg: String?
}


struct Powerstats: Codable {
    let intelligence, strength, speed, power, combat: Int?
}


struct Appearance: Codable {
    let gender, race: String?
    let height: [String]?
    let weight: [String]?
}


struct Biography: Codable {
    let fullName, alignment, publisher: String?
}


struct Connections: Codable {
    let groupAffiliation, relatives: String?
}
