//
//  Tela01VC.swift
//  TabBar
//
//  Created by Renato Vieira on 05/08/24.
//

import Foundation
import UIKit

class Tela01VC: UIViewController {

  override func viewWillAppear(_ animated: Bool) {
    print("Tela01VC viewWillAppear")
  }

  override func viewDidAppear(_ animated: Bool) {
    print("Tela01VC viewDidAppear")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    print("Tela01VC")
    view.backgroundColor = .white
  }

}
