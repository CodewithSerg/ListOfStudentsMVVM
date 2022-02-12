//
//  ListStudentsViewController.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import UIKit

// MARK: - Constants

private struct Constants {
    static var title = "Список студентов"
    static var backgroundColor: UIColor { .green }
}

// MARK: - ListStudentsViewControllerInterface

protocol ListStudentsViewControllerInterface: AnyObject {
    
}

// MARK: - ListStudentsViewController

class ListStudentsViewController: UIViewController {

    private let viewModel: ListStudentsViewModelInterface
    
    let tableView = UITableView()
    
    init(viewModel: ListStudentsViewModelInterface) {
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
        title = Constants.title
    }
    
    private func setupTable() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(StudentCell.self, forCellReuseIdentifier: AppConstants.studentCellIdentifier)
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

// MARK: - ListStudentsViewControllerInterface

extension ListStudentsViewController: ListStudentsViewControllerInterface {
    
}

// MARK: - UITableViewDataSource

extension ListStudentsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.tableData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tableData[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.tableData[section].section
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.studentCellIdentifier, for: indexPath) as? StudentCell
        else { return UITableViewCell() }
        cell.configure(with: viewModel.tableData[indexPath.section].rows[indexPath.row])
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate

extension ListStudentsViewController: UITableViewDelegate {
    
}
