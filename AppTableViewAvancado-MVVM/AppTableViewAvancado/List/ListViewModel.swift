//
//  ListViewModel.swift
//  AppTableViewAvancado
//
//  Created by Renato Vieira on 07/08/24.
//

import Foundation

class ListViewModel {
    
    private var list: [Employee] = [
                                    Employee(name: "Caio Fabrini",age: 22,job: "empresario",salary: 10000,isSelectedHeart: false),
                                    Employee(name: "Bárbara Fabrini",age: 22,job: "empresario",salary: 10000,isSelectedHeart: true),
                                    Employee(name: "Jose Assis",age: 22,job: "empresario",salary: 10000,isSelectedHeart: true),
                                    Employee(name: "Fabio Lopes",age: 22,job: "empresario",salary: 10000,isSelectedHeart: false),
                                    Employee(name: "Eduardo Abido",age: 22,job: "empresario",salary: 10000,isSelectedHeart: true),
                                    Employee(name: "Alice Johnson", age: 30, job: "Software Engineer", salary: 120000, isSelectedHeart: false),
                                    Employee(name: "Bob Smith", age: 45, job: "Project Manager", salary: 95000, isSelectedHeart: true),
                                    Employee(name: "Carol White", age: 28, job: "Data Scientist", salary: 110000, isSelectedHeart: false),
                                    Employee(name: "David Brown", age: 35, job: "Product Owner", salary: 105000, isSelectedHeart: true),
                                    Employee(name: "Eve Davis", age: 40, job: "UX Designer", salary: 90000, isSelectedHeart: false),
                                    Employee(name: "Frank Wilson", age: 50, job: "CTO", salary: 150000, isSelectedHeart: true),
                                    Employee(name: "Grace Miller", age: 26, job: "Marketing Specialist", salary: 70000, isSelectedHeart: false),
                                    Employee(name: "Hank Taylor", age: 38, job: "DevOps Engineer", salary: 115000, isSelectedHeart: true),
                                    Employee(name: "Ivy Anderson", age: 32, job: "HR Manager", salary: 85000, isSelectedHeart: false),
                                    Employee(name: "Jack Thomas", age: 29, job: "Sales Executive", salary: 80000, isSelectedHeart: true)
                                  ]
    
    func validateFisrtAndSecondPosition(indexPath: IndexPath) -> Bool {
        return indexPath.row != 0 && indexPath.row != 1 
    }
    
    func loadCurrentList(indexPath: IndexPath) -> Employee {
        return list[indexPath.row - 2]
    }
    
    func selectHeart(employee: Employee) {
        if let index = list.firstIndex(of: employee) {
            list[index].isSelectedHeart.toggle()
        }
    }
    
    var numberOfRowsInSection: Int {
        return list.count + 2
    }
}
