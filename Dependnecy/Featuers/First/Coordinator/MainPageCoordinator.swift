//
//  MainPageCoordinator.swift
//  Dependnecy
//
//  Created by 머성이 on 12/16/24.
//

import UIKit

class MainPageCoordinator: Coordinator {
    var navigationController: UINavigationController
    let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let mainPageVC = buildMainPage()
        mainPageVC.coordinator = self
        navigationController.pushViewController(mainPageVC, animated: true)
    }
    
    private func buildMainPage() -> MainPageVC {
        guard let builder = appDIContainer.container.resolve(MainPageBuilder.self) else {
            fatalError("MainPageBuilder resolve 실패")
        }
        return builder.build()
    }
    
    func nextPageMove() {
        let secondPageCoordinator = SecondPageCoordinator(
            navigationController: navigationController,
            appDIContainer: appDIContainer
        )
        secondPageCoordinator.start()
    }
}
