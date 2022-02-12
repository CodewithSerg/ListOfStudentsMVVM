//
//  AdminViewModel.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import Foundation

// MARK: - AdminViewModelInterface

protocol AdminViewModelInterface {
    func listButtonTapped()
    func marksButtonTapped()
    func visitsButtonTapped()
}

// MARK: - AdminViewModel

class AdminViewModel {
    
    weak var view: AdminViewControllerInterface?
    private weak var output: AdminOutput?
    
    init(output: AdminOutput) {
        self.output = output
    }
    
}

// MARK: - AdminViewModelInterface

extension AdminViewModel: AdminViewModelInterface {
    func listButtonTapped() {
        output?.showListStudents()
    }
    
    func marksButtonTapped() {
        output?.showListLessons()
    }
    
    func visitsButtonTapped() {
        
    }
}
