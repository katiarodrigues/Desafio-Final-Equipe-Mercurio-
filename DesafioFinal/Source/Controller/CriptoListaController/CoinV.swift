//
//  CoinV.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 08/03/22.
//

import UIKit

class CoinV: UIView {
    var onSelectCripto: ((_ criptoSelect: Cripto) -> Void)?
    var isSearch = false
    var dadosFiltrados = [Cripto]()
    private var viewModel = [Cripto]()
    
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        formatter.currencySymbol = "$"
        return formatter
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(ListaCriptoTableViewCell.self, forCellReuseIdentifier: ListaCriptoTableViewCell.identifier)
        tableView.backgroundColor = .black
        return tableView
    }()
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.contentMode = .scaleAspectFit
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.tintColor = .white
        searchBar.barTintColor = .black
        searchBar.placeholder = "Search..."
        searchBar.searchTextField.textColor = .white
        searchBar.delegate = self
        return searchBar
    }()
    
    //MARk: Inicializadores
    override init(frame: CGRect) {
        super.init(frame: .zero)
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
        searchBarSetup()
    }
    private func searchBarSetup(){
        self.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
            searchBar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            searchBar.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
    }
    private func setTableView(){
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
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
        
        if isSearch{
            onSelectCripto?(dadosFiltrados[indexPath.row])
        }else{
            onSelectCripto?(viewModel[indexPath.row])
        }
    }
}
extension CoinV: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearch{
            return  dadosFiltrados.count
        }else{
            return viewModel.count
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListaCriptoTableViewCell.identifier) as! ListaCriptoTableViewCell
        if isSearch{
            cell.configure(with: dadosFiltrados[indexPath.row])
        }else{
            cell.configure(with: viewModel[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
extension CoinV:UISearchBarDelegate{
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = true
    }
    
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            isSearch = false
            self.tableView.reloadData()
        } else {
            dadosFiltrados = self.viewModel.filter({(coin) -> Bool in
                let tmp: NSString = coin.title as NSString
                let range = tmp.range(of: searchText, options:NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
        }
        if(dadosFiltrados.count == 0){
            isSearch = false
        } else {
            isSearch = true
        }
        self.tableView.reloadData()
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
