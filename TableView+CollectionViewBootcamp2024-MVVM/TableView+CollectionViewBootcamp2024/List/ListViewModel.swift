//
//  ListViewModel.swift
//  TableView+CollectionViewBootcamp2024
//
//  Created by Renato Vieira on 08/08/24.
//

import UIKit

class ListViewModel {
    
    private var listDetail: [Detail] = [Detail(title: "Carros", 
                                               list: [Item(text: "Corolla", image: "car"), Item(text: "Civic", image: "car"),
                                                      Item(text: "Ferrari", image: "car"), Item(text: "Fusca", image: "car"),
                                                      Item(text: "Opala", image: "car")
                                                     ]),
                                        Detail(title: "Avião",
                                               list: [Item(text: "Boing1", image: "airplane"), 
                                                      Item(text: "Boing2", image: "airplane"),
                                                      Item(text: "Boing3", image: "airplane"), Item(text: "Boing4", image: "airplane"),
                                                      Item(text: "Boing5", image: "airplane")
                                                     ]),
                                        Detail(title: "Barco",
                                               list: [Item(text: "Barco1", image: "sailboat"), 
                                                      Item(text: "Barco2", image: "sailboat"),
                                                      Item(text: "Barco3", image: "sailboat")
                                                     ]),
                                        Detail(title: "Moto",
                                               list: [Item(text: "Moto1", image: "figure.outdoor.cycle"), 
                                                      Item(text: "Mot2", image: "figure.outdoor.cycle"
                                                          )])
                            ]
    
    var numberOfRowsInSection: Int {
        return listDetail.count
    }
    
    func loadCurrentList(indexPath: IndexPath) -> Detail {
        return listDetail[indexPath.row]
    }
}
