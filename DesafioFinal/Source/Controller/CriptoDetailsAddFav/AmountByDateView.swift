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
        hourLabel.text = "volumes negociados"
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
        hourLabel.font = UIFont.systemFont(ofSize: 25, weight: .light)
        hourLabel.textAlignment = .center
        hourLabel.textColor = .white
        return hourLabel
    }()
    lazy var monthLabel: UILabel = {
        let  monthLabel = UILabel()
        monthLabel.text = "volumes negociados"
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        monthLabel.font = UIFont.systemFont(ofSize: 25, weight: .light)
        monthLabel.textAlignment = .center
        monthLabel.textColor = .white
        return monthLabel
    }()
    lazy var yearLabel: UILabel = {
        let  yearLabel = UILabel()
        yearLabel.text = "volumes negociados"
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.font = UIFont.systemFont(ofSize: 25, weight: .light)
        yearLabel.textAlignment = .center
        yearLabel.textColor = .white
        return yearLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        subTitleLabelSetup()
        
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
}
