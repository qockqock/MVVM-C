//
//  SecondPageCoordinator.swift
//  Dependnecy
//
//  Created by 머성이 on 12/17/24.
//

import UIKit

class SecondPageCoordinator {
    let navigationController: UINavigationController
    let builder: SecondPageBuilder
    
    init (navigationController: UINavigationController, builder: SecondPageBuilder) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func start() {
        let subPageVC = builder.build()
        subPageVC.coordinator = self
        navigationController.pushViewController(subPageVC, animated: true)
    }
    
    func thirdPageMove() {
        let vc = ThirdPageVC()
        navigationController.pushViewController(vc, animated: true)
    }
}
