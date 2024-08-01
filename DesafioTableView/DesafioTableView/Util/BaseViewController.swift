//
//  BaseViewController.swift
//  DesafioTableView
//
//  Created by Renato Vieira on 31/07/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func showAlert(title: String, message: String, titleButton: String) {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let okButton = UIAlertAction(title: titleButton, style: .default)

      alertController.addAction(okButton)
      present(alertController, animated: true)
    }
}
