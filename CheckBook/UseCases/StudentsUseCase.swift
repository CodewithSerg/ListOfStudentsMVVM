//
//  StudentsUseCase.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import Foundation

// MARK: - StudentsUseCase

protocol StudentsUseCase {
    func getAllStudents() -> [Student]
    func getAllLessons() -> [Lesson]
}

// MARK: - StudentsUseCaseImpl

class StudentsUseCaseImpl {
    let mathematic = Lesson(title: "Математика")
    let language = Lesson(title: "Русс язык")
    let geometry = Lesson(title: "Геометрия")
    
    init() {
    }
}

// MARK: - StudentsUseCase

extension StudentsUseCaseImpl: StudentsUseCase {
    func getAllLessons() -> [Lesson] {
        [ mathematic, language, geometry]
    }
    
    func getAllStudents() -> [Student] {
        let students = [
            Student(
                name: "Иван",
                secondName: "Иванов",
                startDate: Date(),
                evaluations: [
                    Evaluation(lesson: mathematic, mark: 8),
                    Evaluation(lesson: language, mark: 5),
                    Evaluation(lesson: geometry, mark: 7)
                ]),
            Student(
                name: "Петя",
                secondName: "Петров",
                startDate: Date(),
                evaluations: [
                Evaluation(lesson: mathematic, mark: 10),
                Evaluation(lesson: language, mark: 9),
                Evaluation(lesson: geometry, mark: 9)
            ]),
            Student(
                name: "Ваня",
                secondName: "Сидоров",
                startDate: Date(),
                evaluations: [
                Evaluation(lesson: mathematic, mark: 6),
                Evaluation(lesson: language, mark: 5),
                Evaluation(lesson: geometry, mark: 8)
            ]),
        ]
        return students
    }
}
