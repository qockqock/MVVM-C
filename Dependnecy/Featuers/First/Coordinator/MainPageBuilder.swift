//
//  MainPageBuilder.swift
//  Dependnecy
//
//  Created by 머성이 on 12/16/24.
//

import Foundation

import Swinject

protocol MainPageBuilder {
    func build() -> MainPageVC
}

class MainPageBuilderImpl: MainPageBuilder {
    let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func build() -> MainPageVC {
        let vc = MainPageVC()
        vc.viewModel = container.resolve(MainPageProtocol.self)
        return vc
    }
}
