//
//  Service.swift
//  RxMVVM
//
//  Created by Lucas on 2017. 12. 23..
//  Copyright © 2017년 Lucas. All rights reserved.
//

import Foundation
import RxSwift

class Service {
    
    func getRepoItems() -> Observable<[Model]> {
        let toReturn: [Model] = [
            //TODO: 모델 값을 반환한다.
        ]
        
        return Observable.just(toReturn)
    }
}
