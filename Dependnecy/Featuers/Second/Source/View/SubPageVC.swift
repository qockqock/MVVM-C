//
//  SubPageVC.swift
//  Dependnecy
//
//  Created by 머성이 on 12/16/24.
//

import UIKit

import SnapKit
import RxCocoa
import RxSwift

class SubPageVC: UIViewController {
    private let disposeBag = DisposeBag()
    var viewModel: SubPageProtocol!
    var coordinator: SecondPageCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        buttonEventBind()
    }
    
    private let pageMoveButton: UIButton = {
       let button = UIButton()
        button.setTitle("세 번째 페이지 넘어가기", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    
    private func setLayout() {
        view.backgroundColor = UIColor.red
        
        view.addSubview(pageMoveButton)
        
        pageMoveButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    private func buttonEventBind() {
        let input = SubPageVM.Input(
            pageButtonEvent: pageMoveButton.rx.tap.asObservable()
        )
        let output = viewModel.transform(input: input)
        
        output.nextPageButtonEvent
            .subscribe(onNext: { [weak self] in
                self?.coordinator.thirdPageMove()
            })
            .disposed(by: disposeBag)
    }
}
