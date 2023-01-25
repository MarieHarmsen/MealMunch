import UIKit

struct TableView {
    var customTable: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
}

