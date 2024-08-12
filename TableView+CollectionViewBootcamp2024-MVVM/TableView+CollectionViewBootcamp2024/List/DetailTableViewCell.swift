//
//  DetailTableViewCell.swift
//  TableView+CollectionViewBootcamp2024
//
//  Created by Caio Fabrini on 01/08/24.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

  static let identifier: String = String(describing: DetailTableViewCell.self)
    
  private var viewModel: DetailTableViewCellViewModel = DetailTableViewCellViewModel()

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 24)
    return label
  }()

  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = .green
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: ContentCollectionViewCell.identifier)
    return collectionView
  }()

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
    contentView.addSubview(titleLabel)
    contentView.addSubview(collectionView)
  }

  func configConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

      collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
      collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      collectionView.heightAnchor.constraint(equalToConstant: ContentCollectionViewCell.heightCell),
      collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }

  func setupCell(detail: Detail) {
    titleLabel.text = detail.title
    viewModel.setDetailList(detail: detail)
  }
    
}

extension DetailTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return viewModel.numberOfRowsInSection
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCollectionViewCell.identifier, for: indexPath) as? ContentCollectionViewCell
      cell?.setupCell(item: viewModel.loadCurrentList(indexPath: indexPath))
    return cell ?? UICollectionViewCell()
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return ContentCollectionViewCell.calculateSize(title: viewModel.getTitle(indexPath: indexPath))
  }
}
