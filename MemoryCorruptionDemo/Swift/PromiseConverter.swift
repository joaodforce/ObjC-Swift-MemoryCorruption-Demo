//
//  PromiseConverter.swift
//  MemoryCorruptionDemo
//
//  Created by João Eduardo on 07/11/22.
//

import Foundation
import RxSwift
import Promises

extension Promise where Value: AnyObject {
    
    func toObservable() -> Observable<Value> {
        return Observable.create { observer in
            
            self.then { res in
                observer.onNext(res)
                observer.onCompleted()
            }.catch { err in
                observer.onError(err)
            };
            
            return Disposables.create {
//                self.
            }
            
        }
    }
    
}

extension Observable {
    
    func toPromise() -> Promise<Element> {

        let prom = Promise<Element>.pending()
        
        let subs = self.subscribe { res in
            prom.fulfill(res)
            subs.dispose()
        } onError: { obsError in
            prom.reject(obsError)
            subs.dispose()
        }
        
        return prom
        
//        return Promise<Element>(on: .main) { fulfill, reject in
//            let subs = self.subscribe { res in
//                fulfill(res)
//                subs.dispose()
//            } onError: { obsError in
//                reject(obsError)
//                subs.dispose()
//            }
//        }
    }
    
}
