//
//  Assembly.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import UIKit

class Assembly {
    
    lazy var studentAssembly: StudentsUseCase = {
        StudentsUseCaseImpl()
    }()
    
    func makeAdmin(output: AdminOutput) -> UIViewController {
        let viewModel = AdminViewModel(output: output)
        let view = AdminViewController(viewModel: viewModel)
        viewModel.view = view
        return view
    }
    
    func makeListStudents(output: ListStudentsOutput) -> UIViewController {
        let viewModel = ListStudentsViewModel(output: output, useCase: studentAssembly)
        let view = ListStudentsViewController(viewModel: viewModel)
        viewModel.view = view
        return view
    }
    
    func makeListLessons(output: ListLessonsOutput) -> UIViewController {
        let viewModel = ListLessonsViewModel(output: output, useCase: studentAssembly)
        let view = ListLessonsViewController(viewModel: viewModel)
        viewModel.view = view
        return view
    }
    
    func makeStudentsMarks(output: StudentsMarksOutput, lesson: Lesson) -> UIViewController {
        let viewModel = StudentsMarksViewModel(output: output, useCase: studentAssembly, lesson: lesson)
        let view = StudentsMarksViewController(viewModel: viewModel)
        viewModel.view = view
        return view
    }
}
