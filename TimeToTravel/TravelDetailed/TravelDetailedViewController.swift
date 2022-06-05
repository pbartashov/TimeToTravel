//
//  TravelDetailedViewController.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 05.06.2022.
//

import UIKit

final class TravelDetailedViewController: UIViewController {

    private let travel: Travel

    init(travel: Travel) {
        self.travel = travel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
    }
    
    private func initialize() {
        navigationItem.largeTitleDisplayMode = .never

        view.backgroundColor = .white

        let detailedView = TravelDetailedView()
        detailedView.setup(with: travel)

        view.addSubview(detailedView)

        detailedView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        let isFavoriteBarItem = UIBarButtonItem(image: travel.isFavoriteImage,
                                                style: .plain,
                                                target: self,
                                                action: #selector(isFavoriteButtonTapped))

        navigationItem.rightBarButtonItem = isFavoriteBarItem
    }

    @objc
    private func isFavoriteButtonTapped() {
        travel.isFavorite.toggle()
        navigationItem.rightBarButtonItem?.image = travel.isFavoriteImage

        NotificationCenter.default.post(name: .travelUpdated,
                                        object: TravelDetailedViewController.self,
                                        userInfo: ["travel": travel])
    }
}
