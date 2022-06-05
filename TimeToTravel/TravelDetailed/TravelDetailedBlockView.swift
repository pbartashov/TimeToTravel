//
//  TravelDetailedBlockView.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 06.06.2022.
//

import UIKit

class TravelDetailedBlockView: GradientView {

    private lazy var titleLabel: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .wbMagenta
//        $0.textAlignment = .center

        return $0
    }(UILabel())

    private let textLabel: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .wbMagenta
        $0.textAlignment = .right

        return $0
    }(UILabel())

    var label: String {
        get {
            titleLabel.text ?? ""
        }
        set {
            titleLabel.text = newValue
        }
    }

    var text: String {
        get {
            textLabel.text ?? ""
        }
        set {
            textLabel.text = newValue
        }
    }

    private let mainStack: UIStackView = {
        $0.spacing = Constants.spacing
        return $0
    }(UIStackView())

    private let canva: UIView = {
        $0.layer.cornerRadius = Constants.cornerRadius - Constants.borderWidth
        $0.clipsToBounds = true
        $0.backgroundColor = .white

        return $0
    }(UIView())
    
    init(title: String) {
        super.init(colors: [.wbMagenta, .wbPurplish],
                   startPoint: .init(x: 0, y: 0.5),
                   endPoint: .init(x: 1, y: 0.5))

        self.titleLabel.text = title

        initialize()
    }

    private func initialize() {
        layer.cornerRadius = Constants.cornerRadius
        clipsToBounds = true

        addSubview(canva)
        canva.addSubview(mainStack)
        mainStack.addArrangedSubviews(self.titleLabel,
                                      self.textLabel)

        setupLayouts()
    }

    private func setupLayouts() {
        canva.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(Constants.borderWidth)
            make.trailing.bottom.equalToSuperview().offset(-Constants.borderWidth)
        }

        mainStack.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(Constants.spacing)
            make.trailing.bottom.equalToSuperview().offset(-Constants.spacing)
        }




    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
