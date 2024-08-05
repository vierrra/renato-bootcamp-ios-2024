//
//  Tela03VC.swift
//  TabBar
//
//  Created by Renato Vieira on 05/08/24.
//

import Foundation
import UIKit

class Tela03VC: UIViewController {

  // ciclo de vida que é disparado quando a tela VAI CARREGAR (futuro)
  override func viewWillAppear(_ animated: Bool) {
    print("Tela03VC viewWillAppear")
  }

  // ciclo de vida que é disparado quando a tela CARREGOU/APRESENTOU (presente)
  override func viewDidAppear(_ animated: Bool) {
    print("Tela03VC viewDidAppear")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    print("Tela03VC")
    view.backgroundColor = .orange
  }

}
