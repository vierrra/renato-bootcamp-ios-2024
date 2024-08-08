//
//  PersonTableViewCell.swift
//  AppTableViewAvancado
//
//  Created by Caio Fabrini on 31/07/24.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

  static let identifier: String = String(describing: PersonTableViewCell.self)

  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.text = "Caio Fabrini"
    return label
  }()

  lazy var lastNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.text = "22 anos"
    return label
  }()


  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    addElements()
    configConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addElements() {
    contentView.addSubview(nameLabel)
    contentView.addSubview(lastNameLabel)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

      lastNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
      lastNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
      lastNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
    ])
  }

  func setupCell(name: String, lastName: String) {
    nameLabel.text = "Nome: \(name)"
    lastNameLabel.text = "Sobrenome: \(lastName)"
  }

}
