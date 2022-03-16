//
//  ListaCriptoTableViewCell.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 08/03/22.
//

import UIKit

class ListaCriptoTableViewCell: UITableViewCell {
    static let identifier = "ListaCriptoTableViewCell"
    
    lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.image = UIImage(named: "bitcoin")
        iconImage.contentMode = .left
        iconImage.clipsToBounds = true
        return iconImage
    }()
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "BitCoin"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return titleLabel
    }()
    lazy var iconFavImage: UIImageView = {
        let iconFavImage = UIImageView()
        iconFavImage.image = UIImage(systemName: "star.fill")
        iconFavImage.tintColor = .white
        iconFavImage.contentMode = .scaleAspectFit
        iconFavImage.translatesAutoresizingMaskIntoConstraints = false
        return iconFavImage
    }()
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.text = "BTC"
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        subTitleLabel.textColor = .white
        
        return subTitleLabel
    }()
    
    lazy var valueLabel: UILabel = {
        let  valueLabel = UILabel()
        valueLabel.text = "$ 31,010.20"
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        valueLabel.textColor = .white
        valueLabel.contentMode = .left
        return valueLabel
    }()
    
    func set(cripto: Cripto){
        iconImage.image = cripto.iconImg
        titleLabel.text = cripto.titleLabl
        subTitleLabel.text = cripto.subTitleLabel
        valueLabel.text = cripto.valueLabel
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        iconImageSetup()
        titleLabelSetup()
        subTitleLabelSetup()
        iconFavImageSetup()
        valueLabelSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        private func iconImageSetup(){
            contentView.addSubview(iconImage)
            NSLayoutConstraint.activate([
                iconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                iconImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
                iconImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
                iconImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)])
        }
        private func titleLabelSetup(){
            contentView.addSubview(titleLabel)
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                titleLabel.leftAnchor.constraint(equalTo: iconImage.leftAnchor, constant: 50)])
//                titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
            
        }
        private func subTitleLabelSetup(){
            contentView.addSubview(subTitleLabel)
            NSLayoutConstraint.activate([
                subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                subTitleLabel.leftAnchor.constraint(equalTo: iconImage.leftAnchor, constant: 50),
                subTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
        }
        private func iconFavImageSetup(){
            contentView.addSubview(iconFavImage)
            NSLayoutConstraint.activate([
                iconFavImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                iconFavImage.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant:10),
//                iconFavImage.rightAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0),
                iconFavImage.widthAnchor.constraint(equalToConstant: 20),
                iconFavImage.heightAnchor.constraint(equalToConstant: 20)])
        }
        private func valueLabelSetup(){
            contentView.addSubview(valueLabel)
            NSLayoutConstraint.activate([
                valueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)])
               
        }


}
