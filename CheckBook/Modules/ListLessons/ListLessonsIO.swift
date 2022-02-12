//
//  ListLessonsIO.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import Foundation

// MARK: - ListLessonsOutput

protocol ListLessonsOutput: AnyObject {
    func showListMarks(_ lesson: Lesson)
}

// MARK: - ListLessonsInput

protocol ListLessonsInput: AnyObject {
    
}
