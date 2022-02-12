//
//  StudentsMarksViewController.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import UIKit

// MARK: - Constants

private struct Constants {
    static var title = "Список оценок"
    static var backgroundColor: UIColor { .green }
}

// MARK: - StudentsMarksViewControllerInterface

protocol StudentsMarksViewControllerInterface: AnyObject {
    func setupTitle(_ title: String)
}

// MARK: - StudentsMarksViewController

class StudentsMarksViewController: UIViewController {

    private let viewModel: StudentsMarksViewModelInterface
    
    let tableView = UITableView()
    
    init(viewModel: StudentsMarksViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
        setupTable()
        setupConstraints()
        setupUI()
    }

    private func setupUI() {
//        title = Constants.title
    }
    
    private func setupTable() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MarkCell.self, forCellReuseIdentifier: AppConstants.markCellIdentifier)
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }
}

// MARK: - StudentsMarksViewControllerInterface

extension StudentsMarksViewController: StudentsMarksViewControllerInterface {
    func setupTitle(_ title: String) {
        self.title = title
    }
}

// MARK: - UITableViewDataSource

extension StudentsMarksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.markCellIdentifier, for: indexPath) as? MarkCell
        else { return UITableViewCell() }
        cell.configure(with: viewModel.tableData[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension StudentsMarksViewController: UITableViewDelegate {
    
}
