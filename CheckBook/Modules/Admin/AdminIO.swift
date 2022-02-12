//
//  AdminIO.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import Foundation

// MARK: - AdminOutput

protocol AdminOutput: AnyObject {
    func showListStudents()
    func showListLessons()
}

// MARK: - AdminInput

protocol AdminInput: AnyObject {
    
}
