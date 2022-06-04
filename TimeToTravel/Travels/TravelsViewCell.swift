//
//  TravelsViewCell.swift
//  TimeToTravel
//
//  Created by Павел Барташов on 04.06.2022.
//

import UIKit

class TravelsViewCell: UITableViewCell {

    private let startCity: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black

        return $0
    }(UILabel())

    private let endCity: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black

        return $0
    }(UILabel())

    private let startDate: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black

        return $0
    }(UILabel())

    private let endDate: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black

        return $0
    }(UILabel())

    private let price: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black

        return $0
    }(UILabel())

    private let isFavorite = UIImageView()




    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    private func initialize() {
        [authorLabel,
         postImageView,
         descriptionLabel,
         likesAndViewsStack].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        setupLayouts()
    }

    private func setupLayouts() {
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.padding),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.padding),

            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: Constants.padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),

            likesAndViewsStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.padding),
            likesAndViewsStack.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            likesAndViewsStack.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),

            contentView.bottomAnchor.constraint(equalTo: likesAndViewsStack.bottomAnchor)
        ])
    }

    func setup(with travel: Travel) {
        startCity.text = travel.startCity

        endCity.text = travel.endCity

        startDate.text = "\(travel.startDate)"
        endDate.text = "\(travel.endDate)"
        price.text = "\(travel.price)"

        isFavorite.image = UIImage(systemName: travel.isFavorite ? "heart" : "heart.fill")
    }
}
