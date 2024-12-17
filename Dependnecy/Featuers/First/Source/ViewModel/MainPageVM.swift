//
//  MainPageVM.swift
//  Dependnecy
//
//  Created by 머성이 on 12/16/24.
//

import UIKit

import RxCocoa
import RxSwift

protocol MainPageProtocol {
    func transform(input: MainPageVM.Input) -> MainPageVM.Output
}

class MainPageVM: MainPageProtocol {
    private let usecase: MainPageUsecase
    
    init(usecase: MainPageUsecase) {
        self.usecase = usecase
    }
    
    struct Input {
        let pageButtonEvent: Observable<Void>
    }
    
    struct Output {
        let nextPageButtonEvent: Observable<Void>
    }
    
    func loadMainPageData() -> String {
        return usecase.injection()
    }
    
    func transform(input: Input) -> Output {
        let nextPageButtonEvent = input.pageButtonEvent
        return Output(nextPageButtonEvent: nextPageButtonEvent)
    }
}
