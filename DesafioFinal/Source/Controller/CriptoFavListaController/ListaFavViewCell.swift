//
//  ListaFavViewCell.swift
//  DesafioFinal
//
//  Created by Katia Cristina Rodrigues on 10/03/22.
//

import UIKit

class ListaFavViewCell: UICollectionViewCell {
    static let identifier = "ListaFavViewCell"
    
    lazy var iconImage: UIImageView = {

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
    
    private let titleBtc: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "BTC"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return titleLabel
    }()
    
    private let titleValueBtc: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "$ 31.010.20"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return titleLabel
    }()
    
    
    
    override init(frame:CGRect) {

            super.init(frame: frame)
            iconImageSetup()
            titleLabelSetup()
            titleLabelBtc()
            titleLabelValueBtc()
}

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")

        }
    
    
    
    private func titleLabelSetup(){
        
      addSubview(titleLabel)
        titleLabel.textAlignment = .center
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
        
    }
    
    private func titleLabelBtc(){
        
      addSubview(titleBtc)
        titleBtc.textAlignment = .center
        NSLayoutConstraint.activate([
            titleBtc.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            titleBtc.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            titleBtc.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
        
    }
    
    private func titleLabelValueBtc(){
        
      addSubview(titleValueBtc)
        titleValueBtc.textAlignment = .center
        NSLayoutConstraint.activate([
            titleValueBtc.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            titleValueBtc.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            titleValueBtc.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
        
    }
    private func iconImageSetup(){
            contentView.addSubview(iconImage)
            NSLayoutConstraint.activate([
                iconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: -15),
                iconImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 118),
                iconImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 9)])

        }
}
    

