//
//  TravelsViewCell.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 04.06.2022.
//

import UIKit
import SnapKit

class TravelsViewCell: UITableViewCell {

    private let startCity: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center

        return $0
    }(UILabel())

    private let endCity: UILabel = {
//        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .wbPurplish

        return $0
    }(UILabel())

    private let startDate: UILabel = {
//        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .wbPurplish

        return $0
    }(UILabel())

    private let endDate: UILabel = {
//        $0.font = .systemFont(ofSize: 20, weight: .bold)
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

    private let backGround: GradientView = {
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true

        return $0
    }(GradientView(colors: [.wbMagenta, .wbDarkViolet], startPoint: .init(x: 0, y: 0.5), endPoint: .init(x: 1, y: 0.5)))

    private let canva: UIView = {
        $0.layer.cornerRadius = 3
        $0.clipsToBounds = true
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.backgroundColor = .white

        return $0
    }(UIView())



//    private let gradient: CAGradientLayer = {
//        let layer = CAGradientLayer()
//        let startColor: UIColor = .wbMagenta
//        let endColor: UIColor = .wbPurplish
//        layer.colors = [startColor.cgColor, endColor.cgColor]
//        layer.locations = [0,1]
//        layer.startPoint = .init(x: 0, y: 0.5)
//        layer.endPoint = .init(x: 1, y: 0.5)
//
//        layer.cornerRadius = 5
//        layer.masksToBounds = true
//
//        return layer
//    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    private func initialize() {


//        contentView.layer.cornerRadius = 5
//        contentView.backgroundColor = .red
//        contentView.clipsToBounds = false

//        gradient.frame = frame
//        layer.insertSublayer(gradient, at: 0)

//        contentView.backgroundColor = .gradientColor(bounds: contentView.bounds, colors: [.systemBlue, .systemRed])




//        [
//         endCity,
//         startDate,
//
//         price,
//         isFavorite
//        ].forEach {
//            contentView.addSubview($0)
//        }
        contentView.addSubview(backGround)
        backGround.addSubview(canva)


        setupLayouts()


    }

    private func setupLayouts() {


        backGround.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.trailing.bottom.equalToSuperview().offset(-8)

        }



//        canva.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(0)
//            make.leading.equalToSuperview().offset(5)
//            make.trailing.bottom.equalToSuperview().offset(-5)
//        }



        let topStack = UIStackView()
//        topStack.axis = .horizontal
        topStack.alignment = .center

//let topGradient = GradientView(colors: [.wbMagenta, .wbDarkViolet], startPoint: .init(x: 0, y: 0.5), endPoint: .init(x: 1, y: 0.5))
//
//        topStack.addSubview(topGradient)
//        topGradient.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//

//        let cityStack = UIStackView()
//       //        cityStack.axis = .horizontal
//        cityStack.alignment = .center
//        cityStack.distribution = .fillProportionally
//
//        cityStack.backgroundColor = .white

        let plane = UIImageView(image: UIImage(systemName: "airplane"))

//        cityStack.addArrangedSubviews(startCity,
//                                      plane,
//                                      endCity)

        let chevron = UIImageView(image: UIImage(systemName: "chevron.right"))
        chevron.tintColor = .white
        chevron.setContentHuggingPriority(.init(rawValue: 999), for: .horizontal)

        topStack.addArrangedSubviews(startCity,
                                     chevron)

        let bottomStack = UIStackView()
        //        topStack.axis = .horizontal
        bottomStack.alignment = .center
        bottomStack.distribution = .fillProportionally
        bottomStack.spacing = 4
        bottomStack.backgroundColor = .white
//        bottomStack.layer.cornerRadius = 3
//        bottomStack.clipsToBounds = true
//        bottomStack.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]



        let labelStack = UIStackView()
        labelStack.axis = .vertical
        labelStack.alignment = .leading
//        labelStack.backgroundColor = .white

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
//        dateStack.backgroundColor = .white



        dateStack.addArrangedSubviews(startDate,
                                     endDate)

        bottomStack.addArrangedSubviews(labelStack,
                                        dateStack,
                                        price,
                                        isFavorite)

//        let mainStack = UIStackView()
//        mainStack.axis = .vertical
////        mainStack.alignment = .fill
////        mainStack.backgroundColor = .white
//
//        mainStack.addArrangedSubviews(topStack,
//                                      bottomStack)

//        canva.addSubview(mainStack)
//
//        mainStack.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(0)
//            make.leading.equalToSuperview().offset(8)
//            make.trailing.equalToSuperview().offset(-8)
//            make.bottom.equalToSuperview().offset(-0)
//
//        }

        backGround.addSubviews(topStack)
        canva.addSubviews(bottomStack)


        topStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
        }

        canva.snp.makeConstraints { make in
            make.top.equalTo(topStack.snp.bottom).offset(0)
            make.leading.equalToSuperview().offset(5)
            make.trailing.bottom.equalToSuperview().offset(-5)
        }

        bottomStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.trailing.bottom.equalToSuperview().offset(-5)
        }

//        cityStack.snp.makeConstraints { make in
//            make.width.equalToSuperview().multipliedBy(0.35)
//        }


    }

//    override func layoutSubviews() {
//        super.layoutSubviews()
//        gradient.frame = backGround.bounds
//
//    }

    




//    func setGradientBackground() {
//        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
//        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
//
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [colorTop, colorBottom]
//        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.frame = canva.bounds
//
//        self.view.layer.insertSublayer(gradientLayer, at:0)
//    }

    func setup(with travel: Travel) {
//        startCity.text = travel.startCity
        startCity.text = travel.startCity + " \u{2708} " + travel.endCity

        endCity.text = travel.endCity

        startDate.text = "\(format: travel.startDate)"
        endDate.text = "\(format: travel.endDate)"
        price.text = "\(format: travel.price) руб"
//        price.text = String(format: "%.2f", travel.price)

        isFavorite.image = UIImage(systemName: travel.isFavorite ? "heart.fill" : "heart")

//        contentView.layer.borderColor = UIColor.gradientColor(bounds: contentView.bounds, colors: [.systemBlue, .systemRed]).cgColor
//        contentView.layer.borderWidth = 3
    }
}


