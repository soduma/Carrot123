//
//  TitleTextFieldCell.swift
//  Carrot
//
//  Created by 장기화 on 2022/01/04.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class TitleTextFieldCell: UITableViewCell {
    let disposeBag = DisposeBag()
    let titleInputField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: TitleTextFieldCellViewModel) {
        titleInputField.rx.text
            .bind(to: viewModel.titleText)
            .disposed(by: disposeBag)
    }
    
    private func configure() {
        titleInputField.font = .systemFont(ofSize: 17)
    }
    
    private func layout() {
        contentView.addSubview(titleInputField)
//        addSubview(titleInputField)
        titleInputField.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
}
