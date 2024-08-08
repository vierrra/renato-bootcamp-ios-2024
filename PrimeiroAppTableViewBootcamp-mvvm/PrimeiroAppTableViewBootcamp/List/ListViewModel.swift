//
//  ListViewModel.swift
//  PrimeiroAppTableViewBootcamp
//
//  Created by Renato Vieira on 07/08/24.
//

import Foundation

//Para acessar as informações da ViewModel podemos colocar no private(set) ou podemos criar um método ou uma variavél computada

class ListViewModel {
    
    private var listPerson: [Person] = [Person(name: "Caio", lastName: "Fabrini", age: 22, image: "person.circle"),
                                        Person(name: "Bárbara", lastName: "Fabrini", age: 21, image: "star.fill"),
                                        Person(name: "Bárbara", lastName: "Brigolin", age: 21, image: "star.fill"),
                                        Person(name: "Thiago", lastName: "Teves", age: 30, image: "person.circle"),
                                        Person(name: "Matheus", lastName: "Humbro", age: 28, image: "medal.star"),
                                        Person(name: "Lucas", lastName: "Costa", age: 26, image: "folder.circle"),
                                        Person(name: "Alice", lastName: "Pereira", age: 20, image: "staroflife.fill")]
    
    func getListPerson() -> [Person] {
        return listPerson
    }
    
    func cellForRowAtPerson(indexPath: IndexPath) -> Person {
        return listPerson[indexPath.row]
    }
    
    func deletePerson(person: Person) {
        listPerson.removeAll { $0 == person }
    }
    
    var getComputedListPerson: [Person] {
        return listPerson
    }
    
    var numberOfRowsInSection: Int {
        return listPerson.count
    }
    
    
}
