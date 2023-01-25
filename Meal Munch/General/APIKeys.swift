import Foundation

struct APIKeys {
    let obfuscator = Obfuscator()
    func getSpoonfulAPIKey() -> String {
        return obfuscator.reveal(key: APIConstants.SPOONFUL_API_KEY)
    }
}

struct APIConstants {
    static let SPOONFUL_API_KEY: [UInt8] = [34, 65, 66, 118, 92, 10, 92, 94, 5, 17, 86, 124, 103, 42, 84, 9, 7, 86, 18, 37, 71, 64, 112, 84, 92, 1, 1, 83, 66, 92, 119, 53]
}
