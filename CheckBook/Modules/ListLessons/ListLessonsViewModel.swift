//
//  ListLessonsViewModel.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import Foundation

// MARK: - ListLessonsViewModelInterface

protocol ListLessonsViewModelInterface {
    var tableData: [ListLessonCellModel] { get }
    func loadData()
    func rowTapped(_ row: Int)
}

// MARK: - ListLessonsViewModel

class ListLessonsViewModel {
    
    weak var view: ListLessonsViewControllerInterface?
    private weak var output: ListLessonsOutput?
    private let useCase: StudentsUseCase
    private var lessons: [Lesson] = []
    
    var tableData = [ListLessonCellModel]()
    
    init(output: ListLessonsOutput, useCase: StudentsUseCase) {
        self.output = output
        self.useCase = useCase
    }
    
}

// MARK: - ListLessonsViewModelInterface

extension ListLessonsViewModel: ListLessonsViewModelInterface {
    
    func loadData() {
        lessons = useCase.getAllLessons()
        tableData = lessons.compactMap { ListLessonCellModel(title: $0.title) }
    }
    
    func rowTapped(_ row: Int) {
        output?.showListMarks(lessons[row])
    }
}
