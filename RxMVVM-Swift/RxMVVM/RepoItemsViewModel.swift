//
//  ViewModel.swift
//  RxMVVM
//
//  Created by Lucas on 2017. 12. 23..
//  Copyright © 2017년 Lucas. All rights reserved.
//

import Foundation
import RxSwift

class ListViewModel {
    
    private let _repoService: Service
    private var _disposeBag: DisposeBag
    private let _repoItems: PublishSubject<[RepoItemViewModel]>
    
    var repoItems: Observable<[RepoItemViewModel]> {
            return _repoItems
    }
    
    init (repoService: Service) {
        self._repoService = repoService
        self._disposeBag = DisposeBag()
        self._repoItems = PublishSubject<[RepoItemViewModel]>()
    }
    
    func loadRepoItems() {
        repoService
            .getRepoItems()
            .map {
                RepoItemViewModel()
            }
            .subscribe(_repoItems)
            .disposed(by: disposeBag)
    }
    
}
