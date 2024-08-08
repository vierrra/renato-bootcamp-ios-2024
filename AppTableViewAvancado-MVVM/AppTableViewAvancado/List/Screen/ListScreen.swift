//
//  ListScreen.swift
//  AppTableViewAvancado
//
//  Created by Caio Fabrini on 29/07/24.
//

import UIKit

class ListScreen: UIView {

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifier)
    tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.identifier)
    tableView.separatorStyle = .none
    return tableView
  }()

  init() {
    super.init(frame: .zero)
    backgroundColor = .white
    addElements()
    configConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addElements() {
    addSubview(tableView)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}

