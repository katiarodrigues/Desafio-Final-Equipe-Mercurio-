//
//  TableViewHeader.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 08/03/22.
//

import UIKit

class TableViewHeader: UITableViewHeaderFooterView, UISearchBarDelegate {
    
    static let identifier = "tableHeader"
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Moeda Digital"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        return titleLabel
    }()
    
    lazy var date: UILabel = {
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
  
    override init(reuseIdentifier:String?){
        super.init(  reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        titleLabelSetup()
        dateSetup()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func titleLabelSetup(){
        contentView.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
        
    }
    private func dateSetup(){
        contentView.addSubview(date)
        date.textAlignment = .center
        NSLayoutConstraint.activate([
            date.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            date.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            date.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
    }

}
