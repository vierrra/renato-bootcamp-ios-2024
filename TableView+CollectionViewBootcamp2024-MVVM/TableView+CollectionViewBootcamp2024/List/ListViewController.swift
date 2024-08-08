//
//  ViewController.swift
//  TableView+CollectionViewBootcamp2024
//
//  Created by Caio Fabrini on 01/08/24.
//

import UIKit

// MARK: - Receita de bolo para TableView com CollectionView

// MARK: Configurando TableView

// Crie a tableView na SCREEN da tela e assine seus protocols na viewController
// Crie a CELULA da tableView -> UITableViewCell
// Registre a celula
// Configure a celula nos metodos do protocolo da tableView(numberOfRowsInSection/cellForRowAt)


// MARK: Passando informações

// No setup da célula da tableView, você precisa enviar uma LISTA para que na célula você consiga configurar a collectionView
// As informações ficam por HORA(quando aprendermos sobre arquitetura isso muda) na ViewController, sendo uma lista de itens que dentro dessa lista o objeto contem outra lista, segue exemplo:

//struct Detail {
//  var title: String
//  var list: [Item]
//}
//
//struct Item {
//  var text: String
//  var image: String
//}

// Conteúdo da ViewController

//var listDetail: [Detail] = [Detail(title: "Carros", list: [Item(text: "Corolla", image: "car"), Item(text: "Civic", image: "car")]),
//                            Detail(title: "Avião", list: [Item(text: "Boing1", image: "airplane")])]


// MARK: Configurando Celula da TableView para que a Collection funcione

// Na TableViewCell, ela precisa que no setup ela receba a lista de objeto. Com isso você vai precisar criar uma variável para RECEBER as informações do objeto PARA UTILIZAR NAS CONFIGURAÇÕES DA COLLECTION.

//  var list: [Item] = []

//func setupCell(detail: Detail) {
//  titleLabel.text = detail.title
//  list = detail.list
//}

// Depois disso utilize essa variável de lista no numberOfItemsInSection e no cellForItems para configurar a collection

//func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//  return list.count
//}


// MARK: Por fim HORA de criar a célula da collectionView

// Crie a celula da collectionView
// Registre a celula
// Crie o setupCell para receber o objeto
// Não se esqueça do height da célula!!
// O height dela, deve ser o mesmo da collection(quando é scroll na horizontal). Portanto, crie um static let height na própria célula
//static let heightCell: CGFloat = 80
// utilize essa constante para definir a altura da collection como também a altura de célula!

// MARK: Hora de rodar o projeto

// Verifique se assinou todos os protocolos, tanto da tableView como da collectionView
// Verifique se registrou todas as células
// Verifique o height da collectionView se está igual ao tamanho da célula
// Boa sorte ;)

class ListViewController: UIViewController {

  private var screen: ListScreen?
  private var viewModel: ListViewModel = ListViewModel()

  override func loadView() {
    screen = ListScreen()
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    screen?.configTableViewProtocols(delegate: self, dataSource: self)
  }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return viewModel.numberOfRowsInSection
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell
      cell?.setupCell(detail: viewModel.loadCurrentList(indexPath: indexPath))
    return cell ?? UITableViewCell()
  }
}

