//
//  DetailFormCellViewModel.swift
//  Carrot
//
//  Created by 장기화 on 2022/01/05.
//

import RxSwift
import RxCocoa

struct DetailFormCellViewModel {
    //View -> ViewModel
    let contentValue = PublishRelay<String?>()
}
