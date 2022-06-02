//
//  ViewController.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 02.06.2022.
//

import UIKit

final class TravelTableViewController: UIViewController {
    private let travelController = TravelController()
    private var travels: [Travel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        Task.init {
            do {
                travels = try await travelController.fetchTravels()
            } catch {
                displayError(error, title: "Не удалось получить список авиаперелетов")
            }
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

