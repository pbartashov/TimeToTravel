//
//  TravelsViewCell.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 04.06.2022.
//

import UIKit
import SnapKit

final class TravelsViewCell: UITableViewCell {

    private let cities: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center

        return $0
    }(UILabel())

    private let startDate: UILabel = {
        $0.textColor = .wbPurplish

        return $0
    }(UILabel())

    private let endDate: UILabel = {
        $0.textColor = .wbPurplish

        return $0
    }(UILabel())

    private let price: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .wbDarkViolet

        return $0
    }(UILabel())

    private let isFavorite: UIImageView = {
        $0.setContentHuggingPriority(.init(rawValue: 999), for: .horizontal)
        $0.tintColor = .wbDarkViolet

        return $0
    }(UIImageView())

    private let background: GradientView = {
        $0.layer.cornerRadius = Constants.borderRadius
        $0.clipsToBounds = true

        return $0
    }(GradientView(colors: [.wbMagenta, .wbDarkViolet], startPoint: .init(x: 0, y: 0.5), endPoint: .init(x: 1, y: 0.5)))

    private let canva: UIView = {
        $0.layer.cornerRadius = Constants.borderRadius - Constants.borderWidth
        $0.clipsToBounds = true
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.backgroundColor = .white

        return $0
    }(UIView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialize() {
        contentView.addSubview(background)
        background.addSubview(canva)
        setupLayouts()
    }

    private func setupLayouts() {
        background.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.trailing.bottom.equalToSuperview().offset(-8)

        }

        let topStack = UIStackView()
        topStack.alignment = .center

        let chevron = UIImageView(image: UIImage(systemName: "chevron.right"))
        chevron.tintColor = .white
        chevron.setContentHuggingPriority(.init(rawValue: 999), for: .horizontal)

        topStack.addArrangedSubviews(cities,
                                     chevron)

        let bottomStack = UIStackView()
        bottomStack.alignment = .center
        bottomStack.distribution = .fillProportionally
        bottomStack.spacing = 4
        bottomStack.backgroundColor = .white

        let labelStack = UIStackView()
        labelStack.axis = .vertical
        labelStack.alignment = .leading

        let startLabel = UILabel()
        startLabel.textColor = .wbMagenta
        startLabel.text = "Туда"

        let endLabel = UILabel()
        endLabel.textColor = .wbMagenta
        endLabel.text = "Обратно"

        labelStack.addArrangedSubviews(startLabel,
                                       endLabel)

        let dateStack = UIStackView()
        dateStack.axis = .vertical
        dateStack.alignment = .leading

        dateStack.addArrangedSubviews(startDate,
                                      endDate)

        bottomStack.addArrangedSubviews(labelStack,
                                        dateStack,
                                        price,
                                        isFavorite)

        background.addSubview(topStack)
        canva.addSubview(bottomStack)

        topStack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(2 * Constants.borderWidth)
            make.trailing.equalToSuperview().offset(-2 * Constants.borderWidth)
        }

        canva.snp.makeConstraints { make in
            make.top.equalTo(topStack.snp.bottom)
            make.leading.equalToSuperview().offset(Constants.borderWidth)
            make.trailing.bottom.equalToSuperview().offset(-Constants.borderWidth)
        }

        bottomStack.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(Constants.borderWidth)
            make.trailing.bottom.equalToSuperview().offset(-Constants.borderWidth)
        }
    }

    func setup(with travel: Travel) {
        cities.text = "\(travel.startCity) \u{2708} \(travel.endCity)"
        startDate.text = "\(format: travel.startDate)"
        endDate.text = "\(format: travel.endDate)"
        price.text = "\(format: travel.price) руб"
        isFavorite.image = travel.isFavoriteImage
    }
}


