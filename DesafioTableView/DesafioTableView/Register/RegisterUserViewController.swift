//
//  RegisterUserViewController.swift
//  DesafioTableView
//
//  Created by Renato Vieira on 31/07/24.
//

import UIKit

class RegisterUserViewController: BaseViewController {
    
    var screen: RegisterUserScreen?
    var listUser: [User] = []
    
    override func loadView() {
        screen = RegisterUserScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screen?.delegate = self
        screen?.tableView.delegate = self
        screen?.tableView.dataSource = self
        screen?.configureTextFieldsDelegate(delegate: self)
    }
    
    private func removeUser(name: String, career: String) {
        listUser.removeAll { $0 == User(name: name, career: career) }
        screen?.tableView.reloadData()
    }
}

extension RegisterUserViewController: RegiterScreenProtocol {
    func tappedAddedUserButton() {
        guard let screen = screen else { return }
        if !screen.nameTextField.hasText || !screen.careerTextField.hasText {
            showAlert(title: "Erro", message: "Preencha todas as informações para adicionar", titleButton: "OK")
        } else {
            guard let name = screen.nameTextField.text, let career = screen.careerTextField.text else { return }
            
            for listName in listUser {
                if listName.name == name || listName.name.isEmpty {
                    showAlert(title: "Atenção", message: "Já contém esse usuário", titleButton: "OK, entendi")
                    return
                }
            }
            
            listUser.append(User(name: name, career: career))
            screen.tableView.reloadData()
        }
    }
    
    func tappedRemovedUserButton() {
        guard let name = screen?.nameTextField.text, let career = screen?.careerTextField.text else { return }
        
        if name.isEmpty || career.isEmpty {
            showAlert(title: "Atenção", message: "Preencha todas as informações para remover o item", titleButton: "OK")
            return
        }
        
        if listUser.isEmpty {
            showAlert(title: "Atenção", message: "Itens preenchidos, mas sem item na lista", titleButton: "OK")
            return
        }
        
        let userToRemove = listUser.first { $0.name == name && $0.career == career }
        
        if let user = userToRemove {
            removeUser(name: user.name, career: user.career)
        } else {
            showAlert(title: "Atenção", message: "Itens não encontrado na lista", titleButton: "OK")
        }
    }

    
//    func tappedRemovedUserButton() {
//        guard let name = screen?.nameTextField.text, let career = screen?.careerTextField.text else { return }
//        if !(screen?.nameTextField.hasText ?? false) || !(screen?.careerTextField.hasText ?? false) {
//            showAlert(title: "Atenção", message: "Preencha todas as informações para remover o item", titleButton: "OK")
//        } else if listUser.isEmpty {
//            showAlert(title: "Atenção", message: "Itens preenchidos, mas sem item na lista", titleButton: "OK")
//        } else {
//            removeUser(name: name, career: career)
//            
//            for listName in listUser {
//                if listName.name != name {
//                    
//                } else {
//                    showAlert(title: "Atenção", message: "Itens não encontrado na lista", titleButton: "OK")
//                }
//            }
//        }
//    }
}

extension RegisterUserViewController: UITableViewDelegate {
    
}

extension RegisterUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUser.isEmpty ? 1 : listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if listUser.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier, for: indexPath) as? EmptyTableViewCell
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell
            
            cell?.setupCell(user: listUser[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }
}

extension RegisterUserViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
      print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
      print(#function)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      print(#function)
      textField.resignFirstResponder()
      return true
    }
}

