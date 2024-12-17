//
//  SubPageVM.swift
//  Dependnecy
//
//  Created by 머성이 on 12/17/24.
//

import UIKit

import RxCocoa
import RxSwift

protocol SubPageProtocol {
    func transform(input: SubPageVM.Input) -> SubPageVM.Output
}

class SubPageVM: SubPageProtocol {
    
    struct Input {
        let pageButtonEvent: Observable<Void>
    }
    
    struct Output {
        let nextPageButtonEvent: Observable<Void>
    }
    
    func transform(input: Input) -> Output {
        let nextPageButtonEvent = input.pageButtonEvent
        return Output(nextPageButtonEvent: nextPageButtonEvent)
    }
}
