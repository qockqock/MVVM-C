//
//  AppCoordinator.swift
//  Dependnecy
//
//  Created by 머성이 on 12/16/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

final class AppCoordinator: Coordinator {
    
    public var navigationController: UINavigationController
    public var childCoordinator: [Coordinator] = []
    public let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let mainPageBuilder = MainPageBuilderImpl(container: appDIContainer.container)
        
        let mainPageCoordinator = MainPageCoordinator(
            navigationController: navigationController,
            builder: mainPageBuilder
        )
        
        childCoordinator.append(mainPageCoordinator)
        
        mainPageCoordinator.start()
    }
}
