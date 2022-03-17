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
        let viewController = TBViewController()
//        viewController.onSelectCripto = { cripto in
//            self.goDetails(viewModel: cripto)
//        }
//        let listaViewController = CoinVC()
//        listaViewController.onSelectCripto = { viewModel in
//            self.goDetails(viewModel: viewModel)
//        }
//
        self.navigationController.pushViewController(viewController, animated: false)

    }
    
//    private func goDetails(viewModel: Cripto){
//        let coordinator = DetaisFavCoordinator(navigationController: self.navigationController, criptoModel: viewModel)
//        coordinator.start()
//    }
}
