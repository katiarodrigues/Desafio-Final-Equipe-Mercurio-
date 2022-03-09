//
//  AddFavView.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 09/03/22.
//

import UIKit

class AddFavView: UIView {

    lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.image = UIImage(named: "bitcoin")
        iconImage.contentMode = .left
        iconImage.clipsToBounds = true
        return iconImage
    }()
    lazy var valueLabel: UILabel = {
        let  valueLabel = UILabel()
        valueLabel.text = "$ 31,010.20"
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = UIFont.systemFont(ofSize: 40, weight: .light)
        valueLabel.textAlignment = .center
        valueLabel.textColor = .white
        return valueLabel
    }()
    lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("ADICIONAR", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.backgroundColor = .greenBackgroundColor
        addButton.contentMode = .scaleAspectFill
        addButton.layer.cornerRadius = 10
        addButton.layer.borderWidth = 2
        addButton.layer.borderColor = UIColor.white.cgColor
        return addButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        iconImageSetup()
        valueLabelSetup()
        addButtonSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func iconImageSetup(){
        self.addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: self.centerYAnchor, constant: -90),
            iconImage.leftAnchor.constraint(equalTo: self.centerXAnchor, constant: -20),
            iconImage.rightAnchor.constraint(equalTo: self.rightAnchor)])
            
    }
    private func valueLabelSetup(){
        self.addSubview(valueLabel)
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 10),
            valueLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30)])
    }
    private func addButtonSetup(){
        self.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 60),
            addButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            addButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            addButton.widthAnchor.constraint(equalToConstant: 250),
            addButton.heightAnchor.constraint(equalToConstant: 70)])
    }
    
}
