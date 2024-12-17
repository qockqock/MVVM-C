//
//  MainPageUsecase.swift
//  Dependnecy
//
//  Created by 머성이 on 12/16/24.
//

import Foundation

protocol MainPageUsecase {
    func injection() -> String
}

struct MainPageUsecaseImpl: MainPageUsecase {
    private let mainPageDataSource: MainPageDataSource
    
    init(mainPageDataSource: MainPageDataSource) {
        self.mainPageDataSource = mainPageDataSource
    }
    
    func injection() -> String {
        return "흑흑"
    }
}
