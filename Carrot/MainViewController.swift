//
//  MainViewController.swift
//  Carrot
//
//  Created by 장기화 on 2022/01/04.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class MainViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    let tableView = UITableView()
    let submitButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        layout()
    }

    func bind(_ viewModel: MainViewModel) {
        
    }
    
    private func configure() {
        navigationItem.title = "중고거래 글쓰기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "제출", style: .done, target: self, action: nil)
        
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        
        tableView.register(TitleTextFieldCell.self, forCellReuseIdentifier: "TitleTextFieldCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategorySelectCell")
        tableView.register(PriceTextFieldCell.self, forCellReuseIdentifier: "PriceTextFieldCell")
        tableView.register(DetailFormCell.self, forCellReuseIdentifier: "DetailFormCell")
    }
    
    private func layout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

typealias Alert = (title: String, message: String?)
extension Reactive where Base: MainViewController {
    var setAlert: Binder<(title: String, message: String?)> {
        return Binder(base) { base, data in
            let alertController = UIAlertController(title: data.title, message: data.message, preferredStyle: .alert)
            let alert = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alertController.addAction(alert)
            base.present(alertController, animated: true, completion: nil)
        }
    }
}
