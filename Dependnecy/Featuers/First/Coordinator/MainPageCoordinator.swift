//
//  MainPageCoordinator.swift
//  Dependnecy
//
//  Created by 머성이 on 12/16/24.
//

import UIKit

class MainPageCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let builder: MainPageBuilder
    
    init (navigationController: UINavigationController, builder: MainPageBuilder) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func start() {
        let mainPageVC = builder.build()
        mainPageVC.coordinator = self
        navigationController.pushViewController(mainPageVC, animated: true)
    }
    
    func nextPageMove() {
        let nextVC = SubPageVC()
        navigationController.pushViewController(nextVC, animated: true)
    }
}
