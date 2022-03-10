//
//  AmountByDateView.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 09/03/22.
//

import UIKit

class AmountByDateView: UIView {

    lazy var subTitleLabel: UILabel = {
        let  subTitleLabel = UILabel()
        subTitleLabel.text = "volumes negociados"
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.font = UIFont.systemFont(ofSize: 25, weight: .light)
        subTitleLabel.textAlignment = .center
        subTitleLabel.textColor = .white
        return subTitleLabel
    }()
    lazy var hourLabel: UILabel = {
        let  hourLabel = UILabel()
        hourLabel.text = "última hora"
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
        hourLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        hourLabel.textAlignment = .left
        hourLabel.textColor = .white
        return hourLabel
    }()
    lazy var monthLabel: UILabel = {
        let  monthLabel = UILabel()
        monthLabel.text = "último mês"
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        monthLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        monthLabel.textAlignment = .left
        monthLabel.textColor = .white
        return monthLabel
    }()
    lazy var yearLabel: UILabel = {
        let  yearLabel = UILabel()
        yearLabel.text = "último ano"
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        yearLabel.textAlignment = .left
        yearLabel.textColor = .white
        return yearLabel
    }()
    lazy var hourValueLabel: UILabel = {
        let  hourValueLabel = UILabel()
        hourValueLabel.text = "$ 31,010.20"
        hourValueLabel.translatesAutoresizingMaskIntoConstraints = false
        hourValueLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        hourValueLabel.textAlignment = .right
        hourValueLabel.textColor = .white
        return hourValueLabel
    }()
    lazy var monthValueLabel: UILabel = {
        let  monthValueLabel = UILabel()
        monthValueLabel.text = "$ 31,010.20"
        monthValueLabel.translatesAutoresizingMaskIntoConstraints = false
        monthValueLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        monthValueLabel.textAlignment = .left
        monthValueLabel.textColor = .white
        return monthValueLabel
    }()
    lazy var yearValueLabel: UILabel = {
        let  yearValueLabel = UILabel()
        yearValueLabel.text = "$ 31,010.20"
        yearValueLabel.translatesAutoresizingMaskIntoConstraints = false
        yearValueLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        yearValueLabel.textAlignment = .left
        yearValueLabel.textColor = .white
        return yearValueLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        //MARK: label setup
        subTitleLabelSetup()
        hourLabelSetup()
        monthLabelSetup()
        yearLabelSetup()
        
        //MARK: label valores setup
        hourValueLabelSetup()
        monthValueLabelSetup()
        yearValueLabelSetup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func subTitleLabelSetup(){
        self.addSubview(subTitleLabel)
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            subTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
            subTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30)])
    }
    private func hourLabelSetup(){
        self.addSubview(hourLabel)
        NSLayoutConstraint.activate([
            hourLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 40),
            hourLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16)])
    }
    private func monthLabelSetup(){
        self.addSubview(monthLabel)
        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: 40),
            monthLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16)])
    }
    private func yearLabelSetup(){
        self.addSubview(yearLabel)
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 40),
            yearLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16)])
    }
    
    
    private func hourValueLabelSetup(){
        self.addSubview(hourValueLabel)
        NSLayoutConstraint.activate([
            hourValueLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 40),
            hourValueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)])
    }
    private func monthValueLabelSetup(){
        self.addSubview(monthValueLabel)
        NSLayoutConstraint.activate([
            monthValueLabel.topAnchor.constraint(equalTo: hourValueLabel.bottomAnchor, constant: 40),
            monthValueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)])
    }
    private func yearValueLabelSetup(){
        self.addSubview(yearValueLabel)
        NSLayoutConstraint.activate([
            yearValueLabel.topAnchor.constraint(equalTo: monthValueLabel.bottomAnchor, constant: 40),
            yearValueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)])
    }
}
