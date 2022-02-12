//
//  ListStudentsViewModel.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import Foundation

// MARK: - ListStudentsViewModelInterface

protocol ListStudentsViewModelInterface {
    var tableData: [(section: String, rows: [StudentCellModel])] { get }
    func loadData()
}

// MARK: - ListStudentsViewModel

class ListStudentsViewModel {
    
    weak var view: ListStudentsViewControllerInterface?
    private weak var output: ListStudentsOutput?
    private let useCase: StudentsUseCase
    
    var tableData = [(section: String, rows: [StudentCellModel])]()
    
    init(output: ListStudentsOutput, useCase: StudentsUseCase) {
        self.output = output
        self.useCase = useCase
    }
    
}

// MARK: - ListStudentsViewModelInterface

extension ListStudentsViewModel: ListStudentsViewModelInterface {
    func loadData() {
       tableData = Dictionary(grouping: useCase.getAllStudents()) { $0.secondName.first ?? "*" }
            .compactMap {
                (
                    section: String($0.key),
                    rows: $0.value.compactMap { student in
                        let diff = Calendar.current.dateComponents([.year], from: student.startDate, to: Date()).day ?? 0
                        return StudentCellModel(
                            title: "\(student.secondName) \(student.name)",
                            subtitle: "\(diff + 1) курс"
                        )
                    }
                )
            }
        tableData = tableData.sorted { $0.section < $1.section }
    }
}
