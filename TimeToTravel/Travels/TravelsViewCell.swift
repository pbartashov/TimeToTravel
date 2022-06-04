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
//        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .wbPurplish

        return $0
    }(UILabel())

    private let endCity: UILabel = {
//        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .wbPurplish

        return $0
    }(UILabel())

    private let startDate: UILabel = {
//        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .wbMagenta

        return $0
    }(UILabel())

    private let endDate: UILabel = {
//        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .wbMagenta

        return $0
    }(UILabel())

    private let price: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .wbDarkViolet

        return $0
    }(UILabel())

    private let isFavorite = UIImageView()

    private let backGround: GradientView = {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true

        return $0
    }(GradientView(colors: [.wbMagenta, .wbDarkViolet], startPoint: .init(x: 0, y: 0.5), endPoint: .init(x: 1, y: 0.5)))

    private let canva: UIView = {
        $0.layer.cornerRadius = 5
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

        let cityStack = UIStackView()

        backGround.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.trailing.bottom.equalToSuperview().offset(-8)

        }

        canva.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(5)
            make.trailing.bottom.equalToSuperview().offset(-5)
        }



        cityStack.alignment = .center
        cityStack.axis = .vertical
        cityStack.backgroundColor = .white

        let plane = UIImageView(image: UIImage(systemName: "airplane"))

        cityStack.addArrangedSubviews(startCity,
                                      plane,
                                      endCity)

        let startStack = UIStackView()
        startStack.alignment = .center
        startStack.axis = .vertical
        startStack.backgroundColor = .white

        let startLabel = UILabel()
        startLabel.text = "Туда"

        startStack.addArrangedSubviews(startLabel,
                                      startDate)

        let endStack = UIStackView()
        endStack.alignment = .center
        endStack.axis = .vertical
        endStack.backgroundColor = .white

        let endLabel = UILabel()
        endLabel.text = "Обратно"

        endStack.addArrangedSubviews(endLabel,
                                     endDate)



        let mainStack = UIStackView()
        mainStack.alignment = .center
        mainStack.axis = .horizontal
        mainStack.backgroundColor = .white

        mainStack.addArrangedSubviews(cityStack,
                                      startStack,
                                      endStack,
                                      price,
                                      isFavorite)

        canva.addSubview(mainStack)

        mainStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(-0)
            make.bottom.equalToSuperview().offset(-0)

        }

        cityStack.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.35)
        }


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
        startCity.text = travel.startCity

        endCity.text = travel.endCity

        startDate.text = "\(travel.startDate)"
        endDate.text = "\(travel.endDate)"
        price.text = "\(travel.price)"

        isFavorite.image = UIImage(systemName: travel.isFavorite ? "heart" : "heart.fill")

//        contentView.layer.borderColor = UIColor.gradientColor(bounds: contentView.bounds, colors: [.systemBlue, .systemRed]).cgColor
//        contentView.layer.borderWidth = 3
    }
}


