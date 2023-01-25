public enum RecipeError: Error, Equatable {
    case noURLFound
    case noData
    case customError(Error)
    
    public static func == (lhs: RecipeError, rhs: RecipeError) -> Bool {
        switch (lhs, rhs) {
        case (.noURLFound, .noURLFound):
            return true
        case (.noData, .noData):
            return true
        case (.customError, .customError):
            return true
        default:
            return false
        }
    }
}
