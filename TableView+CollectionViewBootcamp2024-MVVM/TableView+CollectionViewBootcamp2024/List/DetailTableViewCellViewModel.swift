//
//  DetailTableViewCellViewModel.swift
//  TableView+CollectionViewBootcamp2024
//
//  Created by Renato Vieira on 08/08/24.
//

import UIKit

class DetailTableViewCellViewModel {
    
    private var detail: Detail?
    
    var numberOfRowsInSection: Int {
        return detail?.list.count ?? 0
    }

    func loadCurrentList(indexPath: IndexPath) -> Item {
        return detail?.list[indexPath.row] ?? Item(text: "", image: "")
    }
    
    func setDetailList(detail: Detail) {
        self.detail = detail
    }
    
    func getTitle(indexPath: IndexPath) -> String {
        return loadCurrentList(indexPath: indexPath).text
    }
}
