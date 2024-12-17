//
//  SecondPageBuilder.swift
//  Dependnecy
//
//  Created by 머성이 on 12/17/24.
//

import Foundation

import Swinject

protocol SecondPageBuilder {
    func build() -> SubPageVC
}

class SecondPageBuilderImpl: SecondPageBuilder {

    let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func build() -> SubPageVC {
        let vc = SubPageVC()
        vc.viewModel = container.resolve(SubPageProtocol.self)
        return vc
    }
}
