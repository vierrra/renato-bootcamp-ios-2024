//
//  PersonTableViewCell.swift
//  PrimeiroAppTableViewBootcamp
//
//  Created by Caio Fabrini on 22/07/24.
//

import UIKit

// MARK: - Receita de bola da celula!!!!!
// 1- Com viewCode, utilize o construtor override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
// 2- TODOS OS ELEMENTOS DEVEM SER ADICIONADOS COM O contentView.addSubview(nomeDoElemento)
// 3- Nas suas constraints NÃO SE ESQUECE DE SEMPRE QUE SE FOR BASEAR NA SUPERVIEW(que é a celula),VOCÊ PRECISA UTILIZAR O CONTENTVIEW!!!
// 4- Cuidado com as constraints!! Para que você possa trabalhar com tableView, você precisa ter uma AMARRAÇÃO DO TOPO COM A PARTE INFERIOR DA CELULA, CASO CONTRARIO, SEU LAYOUT NÃO VAI SE MONTAR DA FORMA CORRETA!!
// 5- Criar o identifier da celula! Ele deve ser do mesmo nome da classe e de SEU ARQUIVO!!!
// 6- Depois de configurar toda a celula, crie o metodo de setup!!! Ele será o responsavel para montar toda a sua celula!

protocol PersonTableViewCellProtocol: AnyObject {
  func tappedDeletePerson(person: Person?)
}

class PersonTableViewCell: UITableViewCell {

//  static var identifier = "PersonTableViewCell"
  static var identifier = String(describing: PersonTableViewCell.self)
  var person: Person?
  weak var delegate: PersonTableViewCellProtocol?

  lazy var personImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.numberOfLines = 2
    label.textAlignment = .left
    return label
  }()

  lazy var lastNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.textAlignment = .left
    return label
  }()

  lazy var ageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.textAlignment = .left
    return label
  }()

  lazy var deleteButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Deletar Usuario", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.clipsToBounds = true
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(tappedDeleteButton), for: .touchUpInside)
    return button
  }()

  @objc func tappedDeleteButton() {
    delegate?.tappedDeletePerson(person: person)
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    addElements()
    configConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addElements() {
    contentView.addSubview(nameLabel)
    contentView.addSubview(personImageView)
    contentView.addSubview(lastNameLabel)
    contentView.addSubview(ageLabel)
    contentView.addSubview(deleteButton)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([

      personImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      personImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      personImageView.heightAnchor.constraint(equalToConstant: 100),
      personImageView.widthAnchor.constraint(equalToConstant: 100),

      nameLabel.topAnchor.constraint(equalTo: personImageView.topAnchor, constant: 5),
      nameLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 20),
      nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

      lastNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
      lastNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
      lastNameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

      ageLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 5),
      ageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
      ageLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

      deleteButton.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 5),
      deleteButton.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
      deleteButton.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
      deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
    ])
  }

  func setupCell(person: Person) {
    self.person = person
    nameLabel.text = "Nome: \(person.name)"
    personImageView.image = UIImage(systemName: person.image)
    lastNameLabel.text = "Sobrenome: \(person.lastName)"
    ageLabel.text = "Idade: \(person.age) anos"
  }
}
