import Foundation
import UIKit

struct AppearanceHandler {
    func subTitleFont(withSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.regular)
    }
    
    var mediumSpacing: CGFloat {
        return 16.0
    }
}
