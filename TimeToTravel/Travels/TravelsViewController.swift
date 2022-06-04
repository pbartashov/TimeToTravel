//
//  ViewController.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 02.06.2022.
//

import UIKit

final class TravelsViewController: UITableViewController {

    private let travelController = TravelController()




    /// Spinner shown during load the TableView
    private let spinner: UIActivityIndicatorView = {
        $0.style = .medium
        $0.color = .wbPurplish

        return $0
    }(UIActivityIndicatorView())

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundView = spinner
        tableView.register(TravelsViewCell.self,
                           forCellReuseIdentifier: TravelsViewCell.identifier)

//        tableView.dataSource = self
//        tableView.delegate = self


        spinner.startAnimating()

        Task.init {
            do {
                try await travelController.fetchTravels()
                tableView.reloadData()
            } catch {
                displayError(error, title: "Не удалось получить список авиаперелетов")
            }

            spinner.stopAnimating()
        }

    }

    private func displayError(_ error: Error, title: String) {
        guard let _ = viewIfLoaded?.window else { return }

        let alert = UIAlertController(title: title,
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Закрыть",
                                      style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource methods
//extension TravelsViewController: UITableViewDataSource {
extension TravelsViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travelController.travels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelsViewCell.identifier,
                                                 for: indexPath)
        as! TravelsViewCell

        cell.setup(with: travelController.travels[indexPath.row])

        return cell
    }
}

//// MARK: - UITableViewDelegate methods
//extension HabitViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        if habit == nil {
//            return 0
//        } else {
//            let contentHeight = modelView.cells.reduce(0) { partialResult, cell in
//                partialResult + cell.bounds.height
//            }
//
//            let height = view.safeAreaLayoutGuide.layoutFrame.height - contentHeight - tableView.contentInset.top
//
//            return max(height, deleteButton.bounds.height + Constants.bottomPadding)
//        }
//    }
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        habit == nil ? nil : footerView
//    }
//}

