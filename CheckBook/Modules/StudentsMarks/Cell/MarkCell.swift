//
//  MarkCell.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import UIKit

struct MarkCellModel {
    let title: String
    let subtitle: String
}

private struct Constants {
    static var leftRightSpacing: CGFloat { 16 }
    static var topBottomSpacing: CGFloat { 8 }
    static var titleFont: UIFont { .boldSystemFont(ofSize: 16) }
    static var subtitleFont: UIFont { .systemFont(ofSize: 14) }
}

class MarkCell: UITableViewCell {
    
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let subtitleLabel  = UILabel()
    
    var model: MarkCellModel?
    
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
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        addSubview(stackView)
        stackView.axis = .horizontal
        titleLabel.font = Constants.titleFont
        subtitleLabel.font = Constants.subtitleFont
        subtitleLabel.textAlignment = .right
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leftRightSpacing),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.leftRightSpacing),
                stackView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topBottomSpacing),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.topBottomSpacing)
            ]
        )
    }
    
    func configure(with model: MarkCellModel) {
        self.model = model
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
}
