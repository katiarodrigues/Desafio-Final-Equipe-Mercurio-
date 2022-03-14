//
//  CoinV.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 08/03/22.
//

import UIKit

class CoinV: UIView {
    
    var criptos: [Cripto] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(ListaCriptoTableViewCell.self, forCellReuseIdentifier: ListaCriptoTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        return tableView
    }()
    //MARk: Inicializadores
    override init(frame: CGRect) {
        super.init(frame: .zero)
        fetchDataData()
        loadUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func loadUIElements(){
        setTableView()
    
    }
    private func setTableView(){
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func fetchDataData(){
        criptos = fetchData()
    }
}
extension CoinV: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
}
extension CoinV: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return criptos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListaCriptoTableViewCell.identifier) as! ListaCriptoTableViewCell
        let cripto = criptos[indexPath.row]
        
        cell.set(cripto: cripto)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}


extension CoinV{
    
    func fetchData() -> [Cripto]{
        let cripto1 = Cripto(iconImage: UIImage(named: "bitcoin")!, title: "Bitcoin", subTitle: "BTC", value: "32.050,21")
        let cripto2 = Cripto(iconImage: UIImage(named: "bitcoin")!, title: "Etherium", subTitle: "ETH", value: "54.050,21")
        let cripto3 = Cripto(iconImage: UIImage(named: "bitcoin")!, title: "DogeCoing", subTitle: "DGC", value: "10.050,21")
        let cripto4 = Cripto(iconImage: UIImage(named: "bitcoin")!, title: "SeilaCoin", subTitle: "SLC", value: "25.050,21")
        
        return [cripto1, cripto2, cripto3, cripto4]
    }
}
