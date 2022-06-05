//
//  TravelDetailedBlockView.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 06.06.2022.
//

import UIKit

class TravelDetailedBlockView: GradientView {

    private lazy var titleLabel: UILabel = {
//        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .wbMagenta
//        $0.textAlignment = .center

        return $0
    }(UILabel())

    private let textLabel: UILabel = {
//        $0.font = .systemFont(ofSize: 20, weight: .bold)
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

    init(title: String) {
        super.init(colors: [.wbMagenta, .wbPurplish],
                   startPoint: .init(x: 0, y: 0.5),
                   endPoint: .init(x: 1, y: 0.5))

        layer.cornerRadius = Constants.cornerRadius
        clipsToBounds = true

        let stack = UIStackView()
        //        stack.alignment
        stack.layer.cornerRadius = Constants.cornerRadius - Constants.borderWidth
        stack.clipsToBounds = true
        stack.backgroundColor = .white

        addSubview(stack)

        stack.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(Constants.spacing)
            make.trailing.bottom.equalToSuperview().offset(-Constants.spacing)
        }


        self.titleLabel.text = title

        stack.addArrangedSubviews(self.titleLabel,
                                  self.textLabel)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
