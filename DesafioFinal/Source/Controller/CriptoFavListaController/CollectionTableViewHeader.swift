//
//  TableViewHeader.swift
//  DesafioFinal
//
//  Created by Katia Cristina Rodrigues on 10/03/22.
//

import UIKit

class CollectionTableViewHeader: UICollectionReusableView {

    static let identifier = "collectionheader"
      
      private let titleLabel: UILabel = {
          let titleLabel = UILabel()
          titleLabel.text = "Moeda Digital"
          titleLabel.translatesAutoresizingMaskIntoConstraints = false
          titleLabel.textColor = .white
          titleLabel.font = UIFont.systemFont(ofSize: 35, weight: .regular)
          return titleLabel
      }()
      
      private let date: UILabel = {
          let date = UILabel()
          let dateFormated = DateFormatter()
          dateFormated.dateFormat = "dd MMM yyyy"
          let exactlyCurrentTime: Date = Date()
          date.text = "\(dateFormated.string(from: exactlyCurrentTime))"
          date.translatesAutoresizingMaskIntoConstraints = false
          date.font = UIFont.systemFont(ofSize: 12, weight: .regular)
          date.textColor = .white
          return date
      }()
    
    public func configure(){
        titleLabelSetup()
        dateSetup()
        
    }
    override func layoutSubviews() {
            super.layoutSubviews()
    }
    
    private func titleLabelSetup(){
      addSubview(titleLabel)
        titleLabel.textAlignment = .center
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
        
    }
    private func dateSetup(){
        addSubview(date)
        date.textAlignment = .center
        NSLayoutConstraint.activate([
            date.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            date.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            date.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
    }
  
}
