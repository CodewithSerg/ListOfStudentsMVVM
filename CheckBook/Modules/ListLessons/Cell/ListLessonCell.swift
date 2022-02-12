//
//  ListLessonCell.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import UIKit

struct ListLessonCellModel {
    let title: String
}

private struct Constants {
    static var leftRightSpacing: CGFloat { 16 }
    static var topBottomSpacing: CGFloat { 8 }
    static var titleFont: UIFont { .boldSystemFont(ofSize: 16) }
}

class ListLessonCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    
    var model: ListLessonCellModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.font = Constants.titleFont

    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leftRightSpacing),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.leftRightSpacing),
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topBottomSpacing),
                titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.topBottomSpacing)
            ]
        )
    }
    
    func configure(with model: ListLessonCellModel) {
        self.model = model
        titleLabel.text = model.title
    }
}
