//
//  UserViewModel.swift
//  RxSwift_practise
//
//  Created by Qian-Yu Du on 2022/4/8.
//

import Foundation
import RxSwift
import RxCocoa

class UserViewModel {

    
    var items = PublishSubject<[User]>.init()
    
    private var datas: [User] = []
    
    func add(_ user: User) {
        datas.append(user)
        items.onNext(datas)
    }
}
