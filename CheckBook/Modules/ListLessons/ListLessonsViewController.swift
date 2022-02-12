//
//  ListLessonsViewController.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import UIKit

// MARK: - Constants

private struct Constants {
    static var title = "Список уроков"
    static var backgroundColor: UIColor { .green }
}

// MARK: - ListLessonsViewControllerInterface

protocol ListLessonsViewControllerInterface: AnyObject {
    
}

// MARK: - ListLessonsViewController

class ListLessonsViewController: UIViewController {

    private let viewModel: ListLessonsViewModelInterface
    
    let tableView = UITableView()
    
    init(viewModel: ListLessonsViewModelInterface) {
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
        tableView.register(ListLessonCell.self, forCellReuseIdentifier: AppConstants.lessonCellIdentifier)
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

// MARK: - ListLessonsViewControllerInterface

extension ListLessonsViewController: ListLessonsViewControllerInterface {
    
}

// MARK: - UITableViewDataSource

extension ListLessonsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.lessonCellIdentifier, for: indexPath) as? ListLessonCell
        else { return UITableViewCell() }
        cell.configure(with: viewModel.tableData[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ListLessonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.rowTapped(indexPath.row)
    }
}
