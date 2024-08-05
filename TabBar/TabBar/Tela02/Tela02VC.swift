//
//  Tela02VC.swift
//  TabBar
//
//  Created by Renato Vieira on 05/08/24.
//

import Foundation
import UIKit

class Tela02VC: UIViewController {

  override func viewWillAppear(_ animated: Bool) {
    print("Tela02VC viewWillAppear")
  }

  override func viewDidAppear(_ animated: Bool) {
    print("Tela02VC viewDidAppear")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    print("Tela02VC")
    view.backgroundColor = .green
  }

}
