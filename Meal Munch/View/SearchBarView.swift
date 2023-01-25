import Foundation
import UIKit

struct SearchBarView {
    var customSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 0, y: 0, width: 0, height: 70)
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = .default
        searchBar.placeholder = "Search for meals"
        searchBar.sizeToFit()
        return searchBar
    }()
}
