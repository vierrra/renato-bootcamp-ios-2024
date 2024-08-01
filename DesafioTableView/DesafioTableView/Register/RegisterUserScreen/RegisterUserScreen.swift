//
//  RegisterUserScreen.swift
//  DesafioTableView
//
//  Created by Renato Vieira on 31/07/24.
//

import UIKit

protocol RegiterScreenProtocol: AnyObject {
    func tappedAddedUserButton()
    func tappedRemovedUserButton()
}

class RegisterUserScreen: UIView {
    
    weak var delegate: RegiterScreenProtocol?
    
    lazy var nameTextField: UITextField = {
      let tf = UITextField()
      tf.placeholder = "Nome"
      tf.borderStyle = .roundedRect
      tf.keyboardType = .alphabet
      return tf
    }()
    
    lazy var careerTextField: UITextField = {
      let tf = UITextField()
      tf.placeholder = "Profissão"
      tf.borderStyle = .roundedRect
      tf.keyboardType = .alphabet
      return tf
    }()
    
    lazy var addedButton: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setTitle("Adicionar", for: .normal)
      button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
      button.setTitleColor(.white, for: .normal)
      button.backgroundColor = .systemBlue
      button.clipsToBounds = true
      button.layer.cornerRadius = 8
      button.addTarget(self, action: #selector(tappedAddedUserButton), for: .touchUpInside)
      return button
    }()
    
    lazy var removedButton: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setTitle("Remover", for: .normal)
      button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
      button.setTitleColor(.white, for: .normal)
      button.backgroundColor = .systemBlue
      button.clipsToBounds = true
      button.layer.cornerRadius = 8
      button.addTarget(self, action: #selector(tappedRemovedUserButton), for: .touchUpInside)
      return button
    }()
    
    lazy var tableView: UITableView = {
      let tableView = UITableView()
      tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.register(EmptyTableViewCell.self, forCellReuseIdentifier: EmptyTableViewCell.identifier)
      tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifier)
      tableView.separatorStyle = .none
      return tableView
    }()
    
    @objc func tappedAddedUserButton(_ sender: UIButton) {
        delegate?.tappedAddedUserButton()
    }
    
    @objc func tappedRemovedUserButton(_ sender: UIButton) {
        delegate?.tappedRemovedUserButton()
    }

    init() {
      super.init(frame: .zero)
      backgroundColor = .orange
      addElements()
      configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureTextFieldsDelegate(delegate: UITextFieldDelegate) {
        nameTextField.delegate = delegate
        careerTextField.delegate = delegate
    }
    
    private func addElements() {
        addSubview(nameTextField)
        addSubview(careerTextField)
        addSubview(addedButton)
        addSubview(removedButton)
        addSubview(tableView)
    }
    
    private func configConstraints() {
        nameTextField.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 40, left: 20, bottom: 0, right: 20), size: CGSize(width: 0.0, height: 40))
        
        careerTextField.anchor(top: nameTextField.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20), size: CGSize(width: 0.0, height: 40))
        
        addedButton.anchor(top: careerTextField.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20), size: CGSize(width: 0.0, height: 40))
        
        removedButton.anchor(top: addedButton.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20), size: CGSize(width: 0.0, height: 40))
        
        tableView.anchor(top: removedButton.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))
    }
}
