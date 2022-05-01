//
//  Objects.swift
//  CombineDemo
//
//  Created by yuhyeonjae on 2022/05/01.
//

import Foundation

/*
 확인용 오브젝트
 */
final class SomeObject {
    /// 값
    var value: String = "" {
        didSet {
            print("SomeObject value : ", self.value)
        }
    }
}
