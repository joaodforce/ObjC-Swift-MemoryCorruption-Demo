//
//  ObservableMocks.swift
//  MemoryCorruptionDemo
//
//  Created by João Eduardo on 07/11/22.
//

import Foundation
import RxSwift
import Promises

@objc class ObsMocks: NSObject {
    
    @objc public static func asyncTask() -> FBLPromise<NSString> {
        
        return ObsMocks.asyncParentTasks().toPromise().asObjCPromise()
        
    }
    
    private static func asyncParentTasks() -> Observable<String> {
        
        return Observable.create { observer in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                observer.onNext("Task Finished")
                observer.onCompleted()
            }
            
            return Disposables.create {
            }
        }
        
    }
    
}
