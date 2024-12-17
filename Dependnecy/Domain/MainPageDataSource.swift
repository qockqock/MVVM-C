//
//  MainPageDataSource.swift
//  Dependnecy
//
//  Created by 머성이 on 12/16/24.
//

import Foundation

protocol MainPageDataSource {
    func dependency() -> String
}

final class MainPageDataSourceImpl: MainPageDataSource {
    
    func dependency() -> String {
        return "쓸모없는 인젝션"
    }
}
