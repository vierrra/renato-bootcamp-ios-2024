//
//  ViewController.swift
//  PrimeiroAppTableViewBootcamp
//
//  Created by Caio Fabrini on 22/07/24.
//

import UIKit

// Receita de bolo para TableView
// Assinar os protocols da tableView na VIEWCONTROLLER (delegate e o dataSource)
// Criar a celula do tipo UITableViewCell
// Registre sua celula na tableView!!! (tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.identifier))
// Configure o numberOfRowsInSection e o cellForRowAt

class ListViewController: UIViewController {

    var screen: ListScreen?
    var viewModel: ListViewModel = ListViewModel()

  override func loadView() {
    screen = ListScreen()
    self.view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    screen?.tableView.delegate = self
    screen?.tableView.dataSource = self
  }

}

extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let person = viewModel.cellForRowAtPerson(indexPath: indexPath)
  }
}

extension ListViewController: UITableViewDataSource {

  // retornar para tableView quantas LINHAS teremos na tabela
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return viewModel.numberOfRowsInSection
  }

  // onde configuramos a nossa celula!!
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
    cell?.delegate = self
      cell?.setupCell(person: viewModel.cellForRowAtPerson(indexPath: indexPath))
    return cell ?? UITableViewCell()
  }

}

extension ListViewController: PersonTableViewCellProtocol {
  func tappedDeletePerson(person: Person?) {
    guard let person else { return }
      viewModel.deletePerson(person: person)
      screen?.tableView.reloadData()

    // Opção 1
    //    for (index, value) in listPerson.enumerated() {
    //      if value == person {
    //        listPerson.remove(at: index)
    //        screen?.tableView.reloadData()
    //      }
    //    }

    // Opção 2 -> remove todos que são iguais
    //    listPerson.removeAll { $0 == person }
    //    screen?.tableView.reloadData()

    // Opção 3 -> pega o primeiro da lista, SE CASO EXISTIR!!
    //    if let index = listPerson.firstIndex(of: person) {
    //      listPerson.remove(at: index)
    //      screen?.tableView.reloadData()
    //    }



  }
}
