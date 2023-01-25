import Foundation
import UIKit

class ImageTextCell: UITableViewCell {
    let image = UIImageView()
    let titleLabel = UILabel()
    let appearanceHandler = AppearanceHandler()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupValues(title: String, imageURL: String) {
        titleLabel.text = title
        image.downloaded(from: imageURL)
    }
    
    private func setupUI() {
        addSubview(image)
        addSubview(titleLabel)
        image.clipsToBounds = true
        image.layer.cornerRadius = 9
        image.contentMode = .scaleAspectFit
        
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = appearanceHandler.subTitleFont(withSize: 12)
        titleLabel.textAlignment = .center
    }

    private func setUpConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: topAnchor, constant: appearanceHandler.mediumSpacing).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: appearanceHandler.mediumSpacing).isActive = true
        image.heightAnchor.constraint(equalToConstant: 250).isActive = true
        image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -appearanceHandler.mediumSpacing).isActive = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: appearanceHandler.mediumSpacing).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -appearanceHandler.mediumSpacing).isActive = true
        titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: appearanceHandler.mediumSpacing).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -appearanceHandler.mediumSpacing).isActive = true
    }
}
