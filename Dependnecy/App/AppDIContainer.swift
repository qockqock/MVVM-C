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
        
        container.register(MainPageBuilder.self) { resolver in
            MainPageBuilderImpl(container: self.container)
        }
        
        container.register(MainPageProtocol.self) { resolver in
            resolver.resolve(MainPageVM.self)! as MainPageProtocol
        }
        
        container.register(MainPageVM.self) { resolver in
            MainPageVM(usecase: resolver.resolve(MainPageUsecase.self)!)
        }
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        return container.resolve(type)
    }
}
