//
//  SecondPageCoordinator.swift
//  Dependnecy
//
//  Created by 머성이 on 12/17/24.
//

import UIKit

class SecondPageCoordinator {
    let navigationController: UINavigationController
    let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let vc = SubPageVC()
        navigationController.pushViewController(vc, animated: true)
    }
}
