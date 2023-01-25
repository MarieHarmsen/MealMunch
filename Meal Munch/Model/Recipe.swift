struct Recipe: Codable {
    var meals : [Meals]? = []
    var totalResults: Int?
    var offset: Int?
    var number: Int?
    
    enum CodingKeys: String, CodingKey {
        case meals = "results"
        case totalResults
        case offset
        case number
    }
}
