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
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController, builder: MainPageBuilder, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.builder = builder
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let mainPageVC = builder.build()
        mainPageVC.coordinator = self
        navigationController.pushViewController(mainPageVC, animated: true)
    }
    
    func nextPageMove() {
        guard let builder = appDIContainer.container.resolve(SecondPageBuilder.self) else {
            fatalError("SecondPageBuilder resolve 실패")
        }

        let secondPageCoordinator = SecondPageCoordinator(
            navigationController: navigationController,
            builder: builder
        )
        secondPageCoordinator.start()
    }
}
