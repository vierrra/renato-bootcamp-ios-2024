//
//  MainTabBarViewController.swift
//  TabBar
//
//  Created by Renato Vieira on 05/08/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

      override func viewDidLoad() {
        super.viewDidLoad()

        let tela01 = createNavController(viewController: Tela01VC(), title: "Tela 01", imageName: "magnifyingglass")
        let tela02 = createNavController(viewController: Tela02VC(), title: "Tela 02", imageName: "heart")
        let tela03 = createNavController(viewController: Tela03VC(), title: "Tela 03", imageName: "star")

        viewControllers = [tela01, tela02, tela03]
        customizeTabBarAppearance()
      }

      private func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        return navController
      }

      private func customizeTabBarAppearance() {
        tabBar.tintColor = .black // cor dos itens fica black quando selecionado
        tabBar.unselectedItemTintColor = .lightGray // cor dos itens fica lightGray quando não está selecionado
        tabBar.backgroundColor = .white // cor de fundo
        tabBar.isTranslucent = false // serve para não deixar transparente o fundo quando trabalhamos com lista
        tabBar.layer.borderColor = UIColor.lightGray.cgColor // cor da borda
        tabBar.layer.borderWidth = 0.5 // espessura da borda
      }
}

