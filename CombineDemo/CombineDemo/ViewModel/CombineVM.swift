//
//  CombineVM.swift
//  CombineDemo
//
//  Created by yuhyeonjae on 2022/05/01.
//

import Foundation
import Combine

/*
 Combine 활용 모델
 */
class CombineVM {
    // String - 수신형
    // Never - 반환형
    // subject를 전역으로 설정 시 한번 해제 되면 send 해도 receiveValue 가 다시 불리지 않는다
    // send(completion) 때문에...
    private let subject = PassthroughSubject<String,Never>()
    
    /// 하나의 Sink
    func oneSinkCombine() {
        let subject = PassthroughSubject<String,Never>()
        
        // _ 로 설정하면 해당 프로세스가 진행되지 않는다...
        let cancel = subject
            .sink { completion in
                print("Receive Completion: ", completion)
            } receiveValue: { value in
                print("Receive Value: ", value)
            }
        
        // 이벤트 전송
        subject.send("A")
        subject.send("B")
        subject.send("C")
        subject.send("D")
        subject.send("E")
        // 퍼블리셔가 완료된다
        subject.send(completion: .finished)
    }
    
    /// 두 가지의 Sink
    func secondSinkCombine() {
        let subject = PassthroughSubject<String,Never>()
        
        // 두개가 동시에 수신 시 First 와 Second 의 순서는 보장되지 않는다
        
        let receiver = FirstReceiver(subject)
        // 이벤트 전송
        subject.send("A")
        subject.send("B")
        // 첫번째 구독 해제
        receiver.firstSubScription.cancel()
        subject.send("C")
        subject.send("D")
        subject.send("E")
        subject.send(completion: .finished)
    }
    
    /// 구독 공통 처리
    func thirdSinkCombine() {
        let subject = PassthroughSubject<String,Never>()
        
        // 두개가 동시에 수신 시 First 와 Second 의 순서는 보장되지 않는다
        
        let receiver = SecondReceiver(subject)
        // 이벤트 전송
        subject.send("A")
        subject.send("B")
        subject.send("C")
        subject.send("D")
        subject.send("E")
        subject.send(completion: .finished)
    }
    
    /// 구독 공통 처리
    func forthSinkCombine() {
        let subject = PassthroughSubject<String,Never>()
        
        // 두개가 동시에 수신 시 First 와 Second 의 순서는 보장되지 않는다
        
        let receiver = ThirdReceiver(subject)
        // 이벤트 전송
        subject.send("A")
        subject.send("B")
        subject.send("C")
        subject.send("D")
        subject.send("E")
        subject.send(completion: .finished)
    }
}
