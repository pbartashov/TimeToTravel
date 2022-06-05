//
//  TravelDetailedView.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 05.06.2022.
//

import UIKit

final class TravelDetailedView: UIScrollView {
    
    private let startCity = TravelDetailedBlockView(title: "Город отправления")
    
    private let endCity = TravelDetailedBlockView(title: "Город прибытия")
    
    private let startDate = TravelDetailedBlockView(title: "Дата отправления")
    
    private let endDate = TravelDetailedBlockView(title: "Дата возвращения")
    
    private let price = TravelDetailedBlockView(title: "Цена")
    
    private let mainStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = Constants.spacing
        
        return $0
    }(UIStackView())
    
    init() {
        super.init(frame: .zero)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        backgroundColor = .white
        contentInset = .init(top: Constants.spacing,
                             left: Constants.spacing,
                             bottom: Constants.spacing,
                             right: Constants.spacing)
        
        addSubview(mainStack)
        
        mainStack.addArrangedSubviews(startCity,
                                      endCity,
                                      startDate,
                                      endDate,
                                      price)
        setupLayouts()
    }
    
    private func setupLayouts() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview().offset(-2 * Constants.spacing)
        }
    }
    
    func setup(with travel: Travel) {
        startCity.text = travel.startCity
        endCity.text = travel.endCity
        startDate.text = "\(format: travel.startDate)"
        endDate.text = "\(format: travel.endDate)"
        price.text = "\(format: travel.price) руб"
    }
}
