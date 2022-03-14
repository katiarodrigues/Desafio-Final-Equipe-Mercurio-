//
//  ErrorView.swift
//  DesafioFinal
//
//  Created by Katia Cristina Rodrigues on 10/03/22.
//

import UIKit

class ErrorView: UIViewController {
  
  
  lazy var button: UIButton! = {
    
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .black
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(didTaped(_:)), for: .touchUpInside)
    button.tag = 1
    button.setTitle("tentar novamente", for: .normal)
    return button
    
  }()
  
  lazy var label: UILabel! = {
    
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = .systemFont(ofSize: 17)
    label.textAlignment = .center
    return label
    
  }()
    
  override var preferredStatusBarStyle: UIStatusBarStyle{
    return .darkContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .greenBackgroundColor
    self.setConstraint()
    
  }
  
  @objc func didTaped(_ sender: UIButton){
    
    self.label.text = "Numero de tentativas: \(sender.tag)"
    self.button.tag += 1
    
  }
  
  func setConstraint(){
    
    self.view.addSubview(self.button)
    self.view.addSubview(self.label)
    
    NSLayoutConstraint.activate([
    
      self.button.heightAnchor.constraint(equalToConstant: 60),
      self.button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.66),
      self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      
      self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      self.label.topAnchor.constraint(equalTo: self.button.topAnchor, constant: UIScreen.main.bounds.height * 0.12),
      self.label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),

    ])

  }
  
}

