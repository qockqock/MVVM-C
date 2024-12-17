//
//  AppDiContainer.swift
//  Dependnecy
//
//  Created by 머성이 on 12/16/24.
//

import UIKit

import Swinject

class AppDIContainer {
    static let shared = AppDIContainer()
    public let container = Container()
    
    private init () {
        registerDependencies()
    }
    
    private func registerDependencies() {
        container.register(MainPageDataSource.self) { _ in
            MainPageDataSourceImpl()
        }
        
        container.register(MainPageUsecase.self) { resolver in
            MainPageUsecaseImpl(mainPageDataSource: resolver.resolve(MainPageDataSource.self)!)
        }
        
//        container.register(MainPageVM.self) { resolver in
//            MainPageVM(usecase: resolver.resolve(MainPageUsecase.self)!)
//        }
        
        container.register(MainPageVM.self) { resolver in
            MainPageVM(usecase: resolver.resolve(MainPageUsecase.self)!)
        }

        container.register(MainPageProtocol.self) { resolver in
            resolver.resolve(MainPageVM.self)! as MainPageProtocol
        }
        
        container.register(MainPageBuilder.self) { _ in
            MainPageBuilderImpl(container: self.container)
        }
        
        container.register(MainPageCoordinator.self) { resolver in
            let navigationController = UINavigationController()
            let builder = resolver.resolve(MainPageBuilder.self)!
            return MainPageCoordinator(navigationController: navigationController, builder: builder)
        }
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        return container.resolve(type)
    }
}
