//
//  MainPageVC.swift
//  Dependnecy
//
//  Created by 머성이 on 12/16/24.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

class MainPageVC: UIViewController {
    private let disposeBag = DisposeBag()
    internal var coordinator: MainPageCoordinator!
    internal var viewModel: MainPageProtocol!
    
    private let nextPageButton: UIButton = {
       let button = UIButton()
        button.setTitle("두 번째 페이지 넘어가기", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        pageSwapBind()
    }
    
    private func setLayout() {
        view.backgroundColor = .yellow
        
        view.addSubview(nextPageButton)
        
        nextPageButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    private func pageSwapBind() {
        let input = MainPageVM.Input(
            pageButtonEvent: nextPageButton.rx.tap.asObservable()
        )
        let output = viewModel.transform(input: input)
        
        output.nextPageButtonEvent
            .subscribe(onNext: { [weak self] in
                self?.coordinator.nextPageMove()
            })
            .disposed(by: disposeBag)
    }
}

