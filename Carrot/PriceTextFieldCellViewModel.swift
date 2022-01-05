//
//  PriceTextFieldCellViewModel.swift
//  Carrot
//
//  Created by 장기화 on 2022/01/05.
//

import RxSwift
import RxCocoa

class PriceTextFieldCellViewModel {
    //ViewModel -> View
    let showFreeShareButton: Signal<Bool>
    let resetPrice: Signal<Void>
    
    //View -> ViewModel
    let priceValue = PublishRelay<String?>()
    let tapFreeShareButton = PublishRelay<Void>()
    
    init() {
        showFreeShareButton = Observable
            .merge(
                priceValue.map { $0 ?? "" == "0" },
                tapFreeShareButton.map { _ in false }
            )
            .asSignal(onErrorJustReturn: false)
        
        resetPrice = tapFreeShareButton
            .asSignal(onErrorSignalWith: .empty())
    }
}
