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


//        let addBarItem = UIBarButtonItem(image: UIImage(systemName: "plus"),
//                                         style: .plain,
//                                         target: self,
//                                         action: #selector(plusButtonTapped))
//
//        navigationItem.rightBarButtonItem = addBarItem
    }
    
    private func initialize() {

//        view = GradientView(colors: [.wbMagenta, .wbPurplish],
//                            startPoint: .init(x: 0, y: 0.5),
//                            endPoint: .init(x: 1, y: 0.5))
        view.backgroundColor = .white

        let detailedView = TravelDetailedView()
        detailedView.setup(with: travel)

        view.addSubview(detailedView)

        detailedView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

}
