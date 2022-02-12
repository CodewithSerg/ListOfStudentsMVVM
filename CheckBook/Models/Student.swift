//
//  Student.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import Foundation

struct Student {
    let id: String = UUID().uuidString
    let name: String
    let secondName: String
    let startDate : Date
    let evaluations: [Evaluation]
}
