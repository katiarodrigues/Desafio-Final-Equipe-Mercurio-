//
//  CoinCoordinator.swift
//  DesafioFinal
//
//  Created by Katia Cristina Rodrigues on 07/03/22.
//

import UIKit

class CoinCoordinator: Coordinator{
    var navigationController: UINavigationController
    init(navigationController:UINavigationController){
        self.navigationController = navigationController
        
    }
    func start() {
        let viewController = DetalhesAddViewController()
        self.navigationController.pushViewController(viewController, animated: true)

    }
}
