//
//  ListScreen.swift
//  PrimeiroAppTableViewBootcamp
//
//  Created by Caio Fabrini on 22/07/24.
//

import UIKit

class ListScreen: UIView {

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.identifier)
    tableView.backgroundColor = .white
    tableView.separatorStyle = .none
    return tableView
  }()

  init() {
    super.init(frame: .zero)
    backgroundColor = .red
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
      tableView.leadingAnchor.constraint(equalTo:  leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo:   bottomAnchor),
    ])
  }
}


