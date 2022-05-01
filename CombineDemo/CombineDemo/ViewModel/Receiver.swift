//
//  Receiver.swift
//  CombineDemo
//
//  Created by yuhyeonjae on 2022/05/01.
//

import Foundation
import Combine

/*
 final - 계승을 금지
 */
final class FirstReceiver {
    // AnyCancellable - Combine
    let firstSubScription: AnyCancellable
    let secondSubScription: AnyCancellable
    
    init(_ subject: PassthroughSubject<String,Never>) {
        /*
         두 가지 수신
         */
        
        // 1번 마
        self.firstSubScription = subject
            .sink(receiveCompletion: { completion in
                print("First Completion: ", completion)
            }, receiveValue: { value in
                print("First Value: ", value)
            })
        
        // 2번 마
        self.secondSubScription = subject
            .sink(receiveCompletion: { completion in
                print("Second Completion: ", completion)
            }, receiveValue: { value in
                print("Second Value: ", value)
            })
    }
}

final class SecondReceiver {
    // AnyCancellable - Combine
    var subScriptions = Set<AnyCancellable>()
    
    init(_ subject: PassthroughSubject<String,Never>) {
        /*
         두 가지 수신
         */
        
        // 1번 마
        subject
            .sink { completion in
                print("First Completion: ", completion)
            } receiveValue: { value in
                print("First Value: ", value)
            }
            .store(in: &self.subScriptions)
        
        // 2번 마
        subject
            .sink { completion in
                print("Second Completion: ", completion)
            } receiveValue: { value in
                print("Second Value: ", value)
            }
            .store(in: &self.subScriptions)
    }
}
