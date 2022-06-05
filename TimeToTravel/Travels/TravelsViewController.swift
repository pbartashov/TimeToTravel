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




    /// Spinner shown during load the TableView
    private let spinner: UIActivityIndicatorView = {
        $0.style = .large
        $0.color = .wbMagenta

        return $0
    }(UIActivityIndicatorView())

    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
        setupNavigationBar()

        spinner.startAnimating()

        fetchTravels()

        addObservers()
    }

    deinit {
        removeObservers()
    }

    private func initialize() {

        tableView.backgroundView = spinner
        tableView.register(TravelsViewCell.self,
                           forCellReuseIdentifier: TravelsViewCell.identifier)

        //        tableView.dataSource = self
        //        tableView.delegate = self
        //        tableView.contentInset = .init(top: 8, left: 8, bottom: 8, right: -28)
        tableView.separatorStyle = .none


//        tableView.backgroundView = GradientView(colors: [.wbMagenta, .wbPurplish],
//                                                startPoint: .init(x: 0, y: 0.5),
//                                                endPoint: .init(x: 1, y: 0.5))

//        tableView.backgroundColor = .gradientColor(bounds: tableView.bounds, colors: [.wbMagenta, .wbPurplish])
//        let background = GradientView(colors: [.wbMagenta, .wbPurplish],
//                                      startPoint: .init(x: 0, y: 0.5),
//                                      endPoint: .init(x: 1, y: 0.5))
//        view.addSubview(background)
//        view.bringSubviewToFront(<#T##view: UIView##UIView#>)(background)
//
//        tableView.backgroundColor = .green
//        view.addSubview(spinner)
//        setupLayouts()
//        background.snp.makeConstraints { make in
//            make.top.leading.trailing.bottom.equalToSuperview()
//        }

    }

//    private func setupLayouts() {
//
//        spinner.snp.makeConstraints { make in
//            make.centerX.centerY.equalTo(view.safeAreaLayoutGuide)
//
//        }
//    }

//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        tableView.backgroundColor = .gradientColor(bounds: .init(origin: .zero, size: size), colors: [.wbMagenta, .wbPurplish])
//    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always

        title = "Пора в путешествие!"

        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithTransparentBackground()
        scrollEdgeAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        scrollEdgeAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarAppearance.backgroundColor = <insert your color here>
//        navigationController?.navigationBar.standardAppearance = navBarAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//        navigationController?.navigationBar.compactAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = scrollEdgeAppearance

        let standardAppearance = navigationController?.navigationBar.standardAppearance
        standardAppearance?.titleTextAttributes = [.foregroundColor: UIColor.wbMagenta]
        standardAppearance?.largeTitleTextAttributes = [.foregroundColor: UIColor.white]



//        navigationController?.navigationBar.scrollEdgeAppearance?.largeTitleTextAttributes = [.foregroundColor: UIColor.wbMagenta]
//        navigationController?.navigationBar.scrollEdgeAppearance?.titleTextAttributes = [.foregroundColor: UIColor.wbMagenta]

        navigationController?.navigationBar.tintColor = .wbMagenta
//        navigationController.colo
//        navigationController?.navigationBar.backgroundColor = .myHabitsColor(.mainBackground)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        super.viewWillTransition(to: size, with: coordinator)

        // Для корректной установке NavigationBarAppearance при повороте устройства
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

//        alert.addAction(UIAlertAction(title: "Закрыть",
//                                      style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)


        // retry
    }

    private func fetchTravels() {
        Task.init {
            do {
                try await travelController.fetchTravels()
                tableView.reloadData()
                spinner.stopAnimating()
                tableView.backgroundView = GradientView(colors: [.wbMagenta, .wbPurplish],
                                                        startPoint: .init(x: 0, y: 0.5),
                                                        endPoint: .init(x: 1, y: 0.5))
            } catch {
                displayError(error, title: "Не удалось получить список авиаперелетов")
            }

        }
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

            let indexPath =  IndexPath(item: index, section: 0)

            DispatchQueue.main.async {
                let cell = self.tableView.cellForRow(at: indexPath) as! TravelsViewCell
                cell.setup(with: travel)
            }
        }
    }
}

