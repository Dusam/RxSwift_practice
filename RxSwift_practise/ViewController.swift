//
//  ViewController.swift
//  RxSwift_practise
//
//  Created by Qian-Yu Du on 2022/4/8.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    
    private let disposeBag = DisposeBag()
    private let userModel: UserViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(addUser), userInfo: nil, repeats: true)
    }


    @objc private func addUser() {
        userModel.add(User(name: "sam", lastName: "Du", age: Int.random(in: 10...78)))
    }
}

extension ViewController {
    private func initView() {
        userModel.items.bind(to: userTableView.rx.items(cellIdentifier: "UserCell", cellType: UserCell.self)) { _, data, cell in
            cell.nameLabel.text = "\(data.name) \(data.lastName)"
            cell.ageLabel.text = "\(data.age)"
        }
        .disposed(by: disposeBag)
    }
}


class UserCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
