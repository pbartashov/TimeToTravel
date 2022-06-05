//
//  ViewController.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 02.06.2022.
//

import UIKit
//import SnapKit

final class TravelsViewController: UITableViewController {

    private let travelController = TravelController()

    private var spinner: UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()

        fetchTravels()
    }

    deinit {
        removeObservers()
    }

    private func initialize() {
        tableView.register(TravelsViewCell.self,
                           forCellReuseIdentifier: TravelsViewCell.identifier)
        tableView.separatorStyle = .none

        setupNavigationBar()
        addObservers()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always

        title = "Пора в путешествие!"

        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithTransparentBackground()
        scrollEdgeAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        scrollEdgeAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.scrollEdgeAppearance = scrollEdgeAppearance

        let standardAppearance = navigationController?.navigationBar.standardAppearance
        standardAppearance?.titleTextAttributes = [.foregroundColor: UIColor.wbMagenta]
        standardAppearance?.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.tintColor = .wbMagenta
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        // For correct applying of NavigationBarAppearance on device rotation
        coordinator.animate(alongsideTransition: { _ in
            self.navigationController?.navigationBar.sizeToFit()
        }, completion: nil)
    }

    private func displayError(_ error: Error, title: String) {
        guard let _ = viewIfLoaded?.window else { return }

        let alert = UIAlertController(title: title,
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Повторить",
                                      style: .default,
                                      handler: { _ in self.fetchTravels() } ))

        self.present(alert, animated: true, completion: nil)
    }

    private func fetchTravels() {
        Task.init {
            do {
                showSpinner()

                try await travelController.fetchTravels()

                hideSpinner()
                tableView.reloadData()
            } catch {
                displayError(error, title: "Не удалось получить список авиаперелетов")
            }
        }
    }

    private func showSpinner() {
        spinner = UIActivityIndicatorView()
        spinner?.style = .large
        spinner?.color = .wbMagenta

        tableView.backgroundView = spinner

        spinner?.startAnimating()
    }

    private func hideSpinner() {
        spinner?.stopAnimating()
        spinner = nil

        tableView.backgroundView = GradientView(colors: [.wbMagenta, .wbPurplish],
                                                startPoint: .init(x: 0, y: 0.5),
                                                endPoint: .init(x: 1, y: 0.5))
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

// MARK: - UITableViewDelegate methods
//extension TravelsViewController: UITableViewDelegate {
extension TravelsViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let travel = travelController.travels[indexPath.row]
        let travelDetailedViewController = TravelDetailedViewController(travel: travel)

        navigationController?.pushViewController(travelDetailedViewController,
                                                 animated: true)
    }
}

// MARK: - NotificationCenter observers
extension TravelsViewController {
    private func addObservers() {
        let notificationCenter = NotificationCenter.default

        notificationCenter.addObserver(self,
                                       selector:#selector(onUpdateTravel(_:)),
                                       name: .travelUpdated,
                                       object: TravelDetailedViewController.self)
    }

    private func removeObservers() {
        let notificationCenter = NotificationCenter.default

        notificationCenter.removeObserver(self,
                                          name: .travelUpdated,
                                          object: TravelDetailedViewController.self)
    }

    @objc
    private func onUpdateTravel(_ notification: Notification) {
        if let userInfo = notification.userInfo,
           let travel = userInfo["travel"] as? Travel,
           let index = travelController.travels.firstIndex(where: { $0.searchToken == travel.searchToken }) {

            DispatchQueue.main.async {
                let indexPath =  IndexPath(item: index, section: 0)
                let cell = self.tableView.cellForRow(at: indexPath) as! TravelsViewCell

                cell.setup(with: travel)
            }
        }
    }
}

