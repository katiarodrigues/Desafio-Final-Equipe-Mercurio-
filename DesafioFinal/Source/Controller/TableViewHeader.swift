//
//  TableViewHeader.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 08/03/22.
//

import UIKit

class TableViewHeader: UITableViewHeaderFooterView {

    static let identifier = "tableHeader"
      
      private let titleLabel: UILabel = {
          let titleLabel = UILabel()
          titleLabel.text = "Moeda Digital"
          titleLabel.translatesAutoresizingMaskIntoConstraints = false
          titleLabel.textColor = .white
          titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .regular)
          return titleLabel
      }()
      
      private let date: UILabel = {
          let date = UILabel()
          date.text = "8 mar 2022"
          date.translatesAutoresizingMaskIntoConstraints = false
          date.font = UIFont.systemFont(ofSize: 12, weight: .regular)
          date.textColor = .white
          return date
      }()
      
      private let searchBar: UISearchBar = {
         let searchBar = UISearchBar()
          searchBar.contentMode = .scaleAspectFit
          searchBar.translatesAutoresizingMaskIntoConstraints = false
          searchBar.tintColor = .white
          searchBar.barTintColor = .black
          searchBar.placeholder = "Search"
          searchBar.searchTextField.textColor = .white
          return searchBar
      }()
      override init(reuseIdentifier:String?){
          super.init(reuseIdentifier: reuseIdentifier)
          titleLabelSetup()
          dateSetup()
          searchBarSetup()
          
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
            date.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            date.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            date.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
    }
    private func searchBarSetup(){
        contentView.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            searchBar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            searchBar.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
    }

}
