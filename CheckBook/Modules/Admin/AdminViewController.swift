//
//  AdminViewController.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import UIKit

// MARK: - Constants

private struct Constants {
    static var stackViewSpacing: CGFloat { 16 }
    static var listButtonTitle: String { "Список студентов" }
    static var marksButtonTitle: String { "Оценки студентов" }
    static var lessonsButtonTitle: String { "Уроки студентов" }
    static var buttonCornerRadius: CGFloat { 8 }
    static var stackViewWidth: CGFloat { 200 }
    static var buttonBackgroundColor: UIColor { .green }
    static var buttonTextColor: UIColor { .gray }
}

// MARK: - AdminViewControllerInterface

protocol AdminViewControllerInterface: AnyObject {
    
}

// MARK: - AdminViewController

class AdminViewController: UIViewController {

    private let viewModel: AdminViewModelInterface
    
    private let stackView = UIStackView()
    private let studentsListButton = UIButton(type: .system)
    private let studentsMarksButton = UIButton(type: .system)
    private let studentsVisitsButton = UIButton(type: .system)
    
    
    init(viewModel: AdminViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupStackView()

        setupButton(studentsListButton, title: Constants.listButtonTitle, action: #selector(listButtonTapped))
        setupButton(studentsMarksButton, title: Constants.marksButtonTitle, action: #selector(marksButtonTapped))
        setupButton(studentsVisitsButton, title: Constants.lessonsButtonTitle, action: #selector(visitsButtonTapped))
        
        setupConstraints()
    }
    
    private func setupButton(_ button: UIButton, title: String, action : Selector) {
        view.addSubview(button)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.setTitleColor(Constants.buttonTextColor, for: .normal)
        button.layer.cornerRadius = Constants.buttonCornerRadius
        button.backgroundColor = Constants.buttonBackgroundColor
        stackView.addArrangedSubview(button)
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = Constants.stackViewSpacing
        
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                stackView.widthAnchor.constraint(equalToConstant: Constants.stackViewWidth)
            ]
        )
    }
    
    // MARK: - Actions
    
    @objc
    func listButtonTapped() {
        viewModel.listButtonTapped()
    }
    
    @objc
    func marksButtonTapped() {
        viewModel.marksButtonTapped()
    }
    
    @objc
    func visitsButtonTapped() {
        viewModel.visitsButtonTapped()
    }
}

// MARK: - AdminViewControllerInterface


extension AdminViewController: AdminViewControllerInterface {
    
}
