//
//  DetaisFavCoordinator.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 15/03/22.
//

import UIKit

class DetaisFavCoordinator: Coordinator{

    var navigationController: UINavigationController
    var criptModel: Cripto
    
    init(navigationController:UINavigationController, criptoModel: Cripto ){
        self.navigationController = navigationController
        self.criptModel = criptoModel
    }
    func start() {
        let viewController = DetalhesAddViewController()
        viewController.navigationItem.title = criptModel.subTitle
        viewController.viewAddFav.valueLabel.text = criptModel.value
        viewController.viewAmountByDate.hourValueLabel.text = criptModel.valueOneHourUsd
        viewController.viewAmountByDate.monthValueLabel.text = criptModel.valueOneDayUsd
        viewController.viewAmountByDate.yearValueLabel.text = criptModel.valueOneMonthUsd
        
        let iconURL = URL(
            string :
                ApiService.shared.icons.filter({ icon in
                    icon.asset_id == criptModel.subTitle
                }).first?.url ?? "")
        
        if let url = iconURL{
            let task = URLSession.shared.dataTask(with: url){ data, _, _ in
                if let data = data{
                    DispatchQueue.main.async {
                        viewController.viewAddFav.iconImage.image = UIImage(data: data)
                    }
                }
        }
        task.resume()
    }
       
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
