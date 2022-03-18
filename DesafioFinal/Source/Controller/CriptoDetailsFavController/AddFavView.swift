//
//  AddFavView.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 09/03/22.
//

import UIKit

class AddFavView: UIView {
//    lazy var backButton: UIButton = {
//        let backButton = UIButton()
//        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
//        backButton.translatesAutoresizingMaskIntoConstraints = false
//        backButton.tintColor = .white
//        backButton.contentMode = .scaleAspectFill
//        backButton.setTitle("Voltar", for: .normal)
//        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
//        return backButton
//    }()
//    lazy var subTitleLable: UILabel = {
//        let  subTitleLable = UILabel()
//        subTitleLable.text = "BTC"
//        subTitleLable.translatesAutoresizingMaskIntoConstraints = false
//        subTitleLable.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
//        subTitleLable.textAlignment = .center
//        subTitleLable.textColor = .white
//        return subTitleLable
//    }()
    lazy var iconFavImage: UIImageView = {
        let iconFavImage = UIImageView()
        iconFavImage.translatesAutoresizingMaskIntoConstraints = false
        iconFavImage.image = UIImage(systemName: "star.fill")
        iconFavImage.contentMode = .right
        iconFavImage.tintColor = .white
        iconFavImage.clipsToBounds = true
        iconFavImage.isHidden = true
        return iconFavImage
    }()

    lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.image = UIImage(named: "bitcoin")
        iconImage.contentMode = .left
        iconImage.clipsToBounds = true
        iconImage.contentMode = .scaleAspectFill
        return iconImage
    }()
    lazy var valueLabel: UILabel = {
        let  valueLabel = UILabel()
        valueLabel.text = "$ 31,010.20"
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = UIFont.systemFont(ofSize: 25, weight: .light)
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
        addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        addButton.isHidden = false
        return addButton
    }()
    lazy var rmvButton: UIButton = {
        let rmvButton = UIButton()
        rmvButton.setTitle("REMOVER", for: .normal)
        rmvButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        rmvButton.translatesAutoresizingMaskIntoConstraints = false
        rmvButton.backgroundColor = .greenBackgroundColor
        rmvButton.contentMode = .scaleAspectFill
        rmvButton.layer.cornerRadius = 10
        rmvButton.layer.borderWidth = 2
        rmvButton.layer.borderColor = UIColor.white.cgColor
        rmvButton.addTarget(self, action: #selector(rmvButtonTap), for: .touchUpInside)
        rmvButton.isHidden = true
        return rmvButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
//        backButtonSetup()
//        subTitleLableSetup()
        iconFavImageSetup()
        iconImageSetup()
        valueLabelSetup()
        addButtonSetup()
        rmvButtonSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func addButtonTap(){
        addButton.isHidden = true
        rmvButton.isHidden = false
        iconFavImage.isHidden = false
    }
    @objc func rmvButtonTap(){
        addButton.isHidden = false
        rmvButton.isHidden = true
        iconFavImage.isHidden = true
    }
    
//    private func backButtonSetup(){
//        self.addSubview(backButton)
//        NSLayoutConstraint.activate([
//            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
//            backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3),
//            backButton.widthAnchor.constraint(equalToConstant: 70),
//            backButton.heightAnchor.constraint(equalToConstant: 50)])
//    }
//    private func subTitleLableSetup(){
//        self.addSubview(subTitleLable)
//        NSLayoutConstraint.activate([
//            subTitleLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 62),
//            subTitleLable.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
//            subTitleLable.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30)])
//    }
    private func iconFavImageSetup(){
        self.addSubview(iconFavImage)
        NSLayoutConstraint.activate([
            iconFavImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            iconFavImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            iconFavImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -50)])
            
    }
    private func iconImageSetup(){
        self.addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: self.centerYAnchor, constant: -70),
            iconImage.leftAnchor.constraint(equalTo: self.centerXAnchor, constant: -20),
            iconImage.widthAnchor.constraint(equalToConstant: 40),
            iconImage.heightAnchor.constraint(equalToConstant: 40)])
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
            addButton.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 50),
            addButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            addButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            addButton.widthAnchor.constraint(equalToConstant: 250),
            addButton.heightAnchor.constraint(equalToConstant: 70)])
    }
    private func rmvButtonSetup(){
        self.addSubview(rmvButton)
        NSLayoutConstraint.activate([
            rmvButton.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 60),
            rmvButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            rmvButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            rmvButton.widthAnchor.constraint(equalToConstant: 250),
            rmvButton.heightAnchor.constraint(equalToConstant: 70)])
    }
    
}
