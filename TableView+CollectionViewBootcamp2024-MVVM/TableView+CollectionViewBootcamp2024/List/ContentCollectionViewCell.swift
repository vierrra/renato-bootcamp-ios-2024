//
//  ContentCollectionViewCell.swift
//  TableView+CollectionViewBootcamp2024
//
//  Created by Caio Fabrini on 01/08/24.
//

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {

  static let identifier: String = String(describing: ContentCollectionViewCell.self)
  static let heightCell: CGFloat = 80

  private static var labelFont = UIFont.boldSystemFont(ofSize: 16)

  lazy var itemImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  lazy var itemLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = ContentCollectionViewCell.labelFont
    label.textAlignment = .center
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
    addElements()
    configConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addElements() {
    contentView.addSubview(itemImageView)
    contentView.addSubview(itemLabel)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      itemImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      itemImageView.heightAnchor.constraint(equalToConstant: 26),
      itemImageView.widthAnchor.constraint(equalToConstant: 26),

      itemLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 8),
      itemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
      itemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
      itemLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }

  func setupCell(item: Item) {
    itemLabel.text = item.text
    itemImageView.image = UIImage(systemName: item.image)
  }

  static func calculateSize(title: String) -> CGSize {
    let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: heightCell)
    let boundingBox = (title as NSString).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: labelFont], context: nil)
    let widthLayer: CGFloat = 20 // esse valor é a soma das distancias das constraints laterais do elemento + 4 de gordura (8 + 8 == 16 + 4 de gordura)
    return CGSize(width: boundingBox.width + widthLayer, height: heightCell)
  }
}
