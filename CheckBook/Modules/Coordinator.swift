//
//  Coordinator.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import UIKit

class Coordinator {
    
    private let assembly: Assembly
    private var navigationViewController: UINavigationController?
    
    init(assembly: Assembly) {
        self.assembly = assembly
    }
    
    func start(window: UIWindow) {
        let adminView = assembly.makeAdmin(output: self)
        navigationViewController = UINavigationController(rootViewController: adminView)
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
    }
}

// MARK: - AdminOutput

extension Coordinator: AdminOutput {
    func showListStudents() {
        let listStudentsView = assembly.makeListStudents(output: self)
        navigationViewController?.pushViewController(listStudentsView, animated: true)
    }
    
    func showListLessons() {
        let listLessonssView = assembly.makeListLessons(output: self)
        navigationViewController?.pushViewController(listLessonssView, animated: true)
    }
}

// MARK: - ListStudentsOutput

extension Coordinator: ListStudentsOutput {
    
}

// MARK: - ListLessonsOutput

extension Coordinator: ListLessonsOutput {
    func showListMarks(_ lesson: Lesson) {
        let listMarksView = assembly.makeStudentsMarks(output: self, lesson: lesson)
        navigationViewController?.pushViewController(listMarksView, animated: true)
    }
}

extension Coordinator: StudentsMarksOutput { }
