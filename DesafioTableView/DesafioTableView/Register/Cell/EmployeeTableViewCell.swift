//
//  EmployeeTableViewCell.swift
//  DesafioTableView
//
//  Created by Renato Vieira on 01/08/24.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: EmployeeTableViewCell.self)
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "Renato Vieira"
        return label
    }()
    
    lazy var careerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "iOS Developer"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addElements()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(careerLabel)
    }
    
    private func configConstraints() {
        nameLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, padding: UIEdgeInsets(top: 10, left: 12, bottom: 0, right: 0))
        careerLabel.anchor(top: nameLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, padding: UIEdgeInsets(top: 8, left: 12, bottom: 10, right: 0))
    }
    
    func setupCell(user: User) {
        self.nameLabel.text = "Nome: \(user.name)"
        self.careerLabel.text = "Profissão: \(user.career)"
    }
}
