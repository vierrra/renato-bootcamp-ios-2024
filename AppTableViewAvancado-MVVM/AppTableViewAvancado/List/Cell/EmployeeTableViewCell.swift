//
//  EmployeeTableViewCell.swift
//  AppTableViewAvancado
//
//  Created by Caio Fabrini on 29/07/24.
//

import UIKit

protocol EmployeeTableViewCellProtocol: AnyObject {
  func tappedUpdateHeartButton(employee: Employee)
}

class EmployeeTableViewCell: UITableViewCell {

  static let identifier: String = String(describing: EmployeeTableViewCell.self)
  var employee: Employee?
  var viewModel: EmployeeTableViewCellViewModel = EmployeeTableViewCellViewModel()
  weak var delegate: EmployeeTableViewCellProtocol?

  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.text = "Caio Fabrini"
    return label
  }()

  lazy var ageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.text = "22 anos"
    return label
  }()

  lazy var jobLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.text = "iOS developer"
    return label
  }()

  lazy var salaryLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.text = "R$ 1.000,00"
    return label
  }()

  lazy var heartButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.tintColor = .systemBlue
    button.setImage(UIImage(systemName: "heart"), for: .normal)
    button.addTarget(self, action: #selector(tappedHeartButton), for: .touchUpInside)
    return button
  }()

  @objc func tappedHeartButton() {
    if heartButton.imageView?.image == UIImage(systemName: "heart") {
      heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    } else {
      heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    guard let employee = employee else { return }
    delegate?.tappedUpdateHeartButton(employee: employee)

//    if let employee = employee {
//      delegate?.tappedUpdateHeartButton(employee: employee)
//    }
  }

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
    contentView.addSubview(ageLabel)
    contentView.addSubview(jobLabel)
    contentView.addSubview(salaryLabel)
    contentView.addSubview(heartButton)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

      ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
      ageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),

      jobLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 8),
      jobLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),

      salaryLabel.topAnchor.constraint(equalTo: jobLabel.bottomAnchor, constant: 8),
      salaryLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
      salaryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

      heartButton.topAnchor.constraint(equalTo: nameLabel.topAnchor),
      heartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
      heartButton.heightAnchor.constraint(equalToConstant: 24),
      heartButton.widthAnchor.constraint(equalToConstant: 24),
    ])
  }

  func setupCell(employee: Employee) {
    self.employee = employee
    nameLabel.text = "Nome: \(employee.name)"
    ageLabel.text = "Idade: \(employee.age) anos"
    jobLabel.text = "Profissão: \(employee.job)"
    salaryLabel.text = "Salário: R$\(employee.salary)"

//    let image: UIImage? = employee.isSelectedHeart ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
//    heartButton.setImage(image, for: .normal)

    if employee.isSelectedHeart == true {
      heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    } else {
      heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }
  }

}
