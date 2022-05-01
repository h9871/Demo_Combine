//
//  ViewController.swift
//  CombineDemo
//
//  Created by yuhyeonjae on 2022/05/01.
//

import UIKit
import Combine

class ViewController: UIViewController {
    // MARK: - 뷰
    /// 스클롤 뷰
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// 메인 스택 뷰
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// 버튼1
    private lazy var firstButton: UIButton = {
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            // 1. 문자 출력
            self.combineVM.oneSinkCombine()
        }))
        button.setTitle("One Sink", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    /// 버튼2
    private lazy var secondButton: UIButton = {
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            // 2. 두 개의 문자 출력
            self.combineVM.secondSinkCombine()
        }))
        button.setTitle("Two Sink", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    /// 버튼3
    private lazy var thirdButton: UIButton = {
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            // 2. 두 개의 문자 출력
            self.combineVM.thirdSinkCombine()
        }))
        button.setTitle("Third Sink", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    /// 버튼3
    private lazy var forthButton: UIButton = {
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            // 2. 두 개의 문자 출력
            self.combineVM.forthSinkCombine()
        }))
        button.setTitle("Forth Sink", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    /// Combine 뷰 모델
    let combineVM = CombineVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 뷰 생성
        self.initView()
    }
    
    private func initView() {
        // 스크롤 뷰 생성
        self.view.addSubview(self.scrollView)
        // 메인 스택 뷰 생성
        self.scrollView.addSubview(self.mainStackView)
        // 첫번째 버튼 생성
        self.mainStackView.addArrangedSubview(self.firstButton)
        // 두번째 버튼 생성
        self.mainStackView.addArrangedSubview(self.secondButton)
        // 세번째 버튼 생성
        self.mainStackView.addArrangedSubview(self.thirdButton)
        // 네번째 버튼 생성
        self.mainStackView.addArrangedSubview(self.forthButton)
        
        // 레이아웃 설정
        self.updateLayout()
    }
    
    /// 레이아웃 업데이트
    private func updateLayout() {
        var layoutList: Array<NSLayoutConstraint> = []
        
        // 스크롤 뷰
        let scrollViewLayout: Array<NSLayoutConstraint> = [
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor,
                                                 constant: self.view.safeAreaInsets.top),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                                    constant: self.view.safeAreaInsets.bottom)
        ]
        layoutList.append(contentsOf: scrollViewLayout)
        
        // 메인 스택 뷰
        let mainStackViewLayout: Array<NSLayoutConstraint> = [
            self.mainStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.mainStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.mainStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.mainStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.mainStackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor,
                                                      multiplier: 1.0)
        ]
        layoutList.append(contentsOf: mainStackViewLayout)
        
        // 버튼들
        let buttonLayout: Array<NSLayoutConstraint> = [
            // 첫번째 버튼
            self.firstButton.heightAnchor.constraint(equalToConstant: 50),
            // 두번째 버튼
            self.secondButton.heightAnchor.constraint(equalToConstant: 50),
            // 세번째 버튼
            self.thirdButton.heightAnchor.constraint(equalToConstant: 50),
            // 네번째 버튼
            self.forthButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        layoutList.append(contentsOf: buttonLayout)
        
        // 레이아웃 진행
        NSLayoutConstraint.activate(layoutList)
    }
}

