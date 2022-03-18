//
//  CoinV.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 08/03/22.
//

import UIKit

class CoinV: UIView {
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        formatter.currencySymbol = "$"
        return formatter
    }()
    
//    var criptos: [Cripto] = []
    var onSelectCripto: ((_ criptoSelect: Cripto) -> Void)?
    
    private var viewModel = [Cripto]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(ListaCriptoTableViewCell.self, forCellReuseIdentifier: ListaCriptoTableViewCell.identifier)
        
        tableView.backgroundColor = .black
        
        return tableView
    }()
    //MARk: Inicializadores
    override init(frame: CGRect) {
        super.init(frame: .zero)
//        fetchDataData()
        
        apiData()
        tableView.dataSource = self
        tableView.delegate = self
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
//    private func setData(){
//        viewModel.fetchCriptoData { [weak self] in
//            self?.tableView.delegate = self
//            self?.tableView.reloadData()
//        }
//    }
//
//    func fetchDataData(){
//        criptos = fetchData()
//    }
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
       
        onSelectCripto?(viewModel[indexPath.row])
        
    }
}
extension CoinV: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListaCriptoTableViewCell.identifier) as! ListaCriptoTableViewCell
//        let cripto = viewModel.cellForRowAt(indexPath: indexPath)
        cell.configure(with: viewModel[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
extension CoinV{
    
    func apiData(){
        
        
        ApiService.shared.getCriptoCoins{ [weak self] result in
            switch result {
            case .success(let models):
                
                self?.viewModel = models.compactMap({
                    
                    let price = $0.price_usd ?? 0
                    let formatter = CoinV.numberFormatter
                    let priceString = formatter.string(from: NSNumber(value: price))
                    
                    let value1Hour = $0.volume_1hrs_usd ?? 0
                    let value1HourString = formatter.string(from: NSNumber(value: value1Hour))
                    
                    let value1day = $0.volume_1day_usd ?? 0
                    let value1dayString = formatter.string(from: NSNumber(value: value1day))
                    
                    let value1Mth = $0.volume_1mth_usd ?? 0
                    let value1MthString = formatter.string(from: NSNumber(value: value1Mth))
                    
                   return Cripto(title: $0.name ?? "N/A",
                           subTitle: $0.asset_id,
                           value: priceString ?? "N/A",
                           valueOneHourUsd: value1HourString ?? "N/A",
                           valueOneDayUsd: value1dayString ?? "N/A",
                           valueOneMonthUsd: value1MthString ?? "N/A"
                    )
                    
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Erro:\(error)")
            }
        }
    }
}


//extension CoinV{
//
//    func fetchData() -> [Cripto]{
//        let cripto1 = Cripto(iconImg: UIImage(named: "bitcoin")!, titleLabl: "Bitcoin", subTitleLabel: "BTC", valueLabel: "32.050,21")
//        let cripto2 = Cripto(iconImg: UIImage(named: "bitcoin")!, titleLabl: "Etherium", subTitleLabel: "ETH", valueLabel: "54.050,21")
//        let cripto3 = Cripto(iconImg: UIImage(named: "bitcoin")!, titleLabl: "DogeCoing", subTitleLabel: "DGC", valueLabel: "10.050,21")
//        let cripto4 = Cripto(iconImg: UIImage(named: "bitcoin")!, titleLabl: "SeilaCoin", subTitleLabel: "SLC", valueLabel: "25.050,21")
//
//        return [cripto1, cripto2, cripto3, cripto4]
//    }
//}
