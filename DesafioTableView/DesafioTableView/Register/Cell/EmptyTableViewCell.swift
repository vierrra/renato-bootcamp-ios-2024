//
//  EmptyTableViewCell.swift
//  DesafioTableView
//
//  Created by Renato Vieira on 31/07/24.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: EmptyTableViewCell.self)
    
    lazy var emptyView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.clipsToBounds = true
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textColor = .black
      label.font = UIFont.boldSystemFont(ofSize: 22)
      label.numberOfLines = 0
      label.text = "Adicione um nome e um trabalho!!"
      label.textAlignment = .center
      return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements() {
        contentView.addSubview(emptyView)
        emptyView.addSubview(descriptionLabel)
    }
    
    func configConstraints() {
        emptyView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8))
        
        descriptionLabel.anchor(top: emptyView.topAnchor, leading: emptyView.leadingAnchor, bottom: emptyView.bottomAnchor, trailing: emptyView.trailingAnchor, padding: UIEdgeInsets(top: 40, left: 20, bottom: 40, right: 20))
        
        print("Largura contentView: \(contentView.bounds.width)")
    }
}
