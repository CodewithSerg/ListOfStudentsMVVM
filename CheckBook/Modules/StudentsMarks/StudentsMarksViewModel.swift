//
//  StudentsMarksViewModel.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import Foundation

// MARK: - StudentsMarksViewModelInterface

protocol StudentsMarksViewModelInterface {
    var tableData: [MarkCellModel] { get }
    func loadData()
}

// MARK: - StudentsMarksViewModel

class StudentsMarksViewModel {
    
    weak var view: StudentsMarksViewControllerInterface?
    private weak var output: StudentsMarksOutput?
    private let useCase: StudentsUseCase
    private let lesson: Lesson
    
    var tableData = [MarkCellModel]()
    
    init(output: StudentsMarksOutput, useCase: StudentsUseCase, lesson: Lesson) {
        self.output = output
        self.useCase = useCase
        self.lesson = lesson
    }
    
}

// MARK: - StudentsMarksViewModelInterface

extension StudentsMarksViewModel: StudentsMarksViewModelInterface {
    func loadData() {
        tableData = useCase.getAllStudents().compactMap { student in
            guard let mark = student.evaluations.first(where: { $0.lesson.id == lesson.id }) else { return nil }
            return MarkCellModel(title: "\(student.secondName) \(student.name)", subtitle: "\(mark.mark)")
        }
        view?.setupTitle("Оценки по \(lesson.title)")
    }
}
