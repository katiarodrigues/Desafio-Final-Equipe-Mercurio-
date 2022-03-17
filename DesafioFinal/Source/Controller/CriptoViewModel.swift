////
////  CriptoViewModel.swift
////  DesafioFinal
////
////  Created by Luiz Mendes Silva on 16/03/22.
////
//
//import Foundation
//
//
//class CriptoViewModel {
//    
//    private var apiService = ApiService()
////    private var criptoDataList = [CriptoData]()
//    private var viewModels = [Cripto]()
//
//    static let numberFormatter: NumberFormatter = {
//        let formatter = NumberFormatter()
//        formatter.locale = .current
//        formatter.allowsFloats = true
//        formatter.numberStyle = .currency
//        formatter.formatterBehavior = .default
//        
//        return formatter
//    }()
//    
//    func fetchCriptoData(completion: @escaping () -> ()) {
//     
//        apiService.getCriptoCoins { [weak self] result in
//            
//            switch result {
//            case .success(let models):
//                self?.viewModels = models.compactMap({ model in
//                    let price = model.price_usd ?? 0
//                    let formatter = CriptoViewModel.numberFormatter
//                    let priceString = formatter.string(from: NSNumber(value: price))
//                    
//                    let iconURL = URL(
//                        string :
//                            self?.apiService.icons.filter({ icon in
//                                icon.asset_id == model.asset_id
//                            }).first?.url ?? "")
//                   return Cripto(
//                    titleLabl: model.name ?? "N/A",
//                    subTitleLabel: model.asset_id!,
//                    valueLabel: priceString ?? "N/A",
//                    iconImg: iconURL
//                    )
//                })
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }
//    }
//    func numberOfRowsInSection(section: Int) -> Int {
//
//            return viewModels.count
//    
//    }
//
//    func cellForRowAt (indexPath: IndexPath) -> Cripto {
//        return viewModels[indexPath.row]
//    }
//}
