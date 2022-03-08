//
//  ListaCriptoTableViewCell.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 08/03/22.
//

import UIKit

class ListaCriptoTableViewCell: UITableViewCell {
    static let identifier = "ListaCriptoTableViewCell"
    
    private let iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.image = UIImage(named: "bitcoin")
        iconImage.contentMode = .left
        iconImage.clipsToBounds = true
        return iconImage
    }()
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "BitCoin"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return titleLabel
    }()
    private let iconFavLabel: UILabel = {
        let iconFavLabel = UILabel()
        iconFavLabel.text = "BitCoin"
        iconFavLabel.translatesAutoresizingMaskIntoConstraints = false
        iconFavLabel.textColor = .white
        iconFavLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return iconFavLabel
    }()
    private let subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.text = "BTC"
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        subTitleLabel.textColor = .white
        return subTitleLabel
    }()
    
    private let valueLabel: UILabel = {
        let  valueLabel = UILabel()
        valueLabel.text = "$ 31,010.20"
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        valueLabel.textColor = .white
        return valueLabel
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        iconImageSetup()
        titleLabelSetup()
        subTitleLabelSetup()
        valueLabelSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func iconImageSetup(){
        contentView.addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            iconImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            iconImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
    }
    private func titleLabelSetup(){
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
        
    }
    private func subTitleLabelSetup(){
        contentView.addSubview(subTitleLabel)
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            subTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50),
            subTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
        
    }
    private func valueLabelSetup(){
        contentView.addSubview(valueLabel)
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            valueLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 220),
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
        
    }

}
