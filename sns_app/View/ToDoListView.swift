//
//  MyPageView.swift
//  sns_app
//
//  Created by t2023-m0067 on 2023/09/22.
//

import UIKit
import SnapKit

class ToDoListView: UIView {

    // 네비게이션 바
    private let customNavBar: UIView = {
        let navBar = UIView()
        navBar.backgroundColor = .white
        
        return navBar
    }()
    
    // 네비게이션 바 타이틀
    private let titleLabel: UILabel = {
        let tl = UILabel()
        tl.text = "To Do List"
        tl.textColor = .black
        tl.font = UIFont.boldSystemFont(ofSize: 18)
        tl.sizeToFit()
        
        return tl
    }()

    // 네비게이션 오른쪽 버튼
    let rightBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    //MARK: - 생성자 세팅
    
    override init(frame: CGRect) {
        super.init(frame: frame) // 질문하기
        
        backgroundColor = .white
        
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - autolayout 세팅
    
    private func setConstraints(){
        addSubview(customNavBar)
        customNavBar.addSubview(titleLabel)
        customNavBar.addSubview(rightBtn)
        
        // 네비게이션 바
        customNavBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide) // Safe Area의 상단에 오도록 설정
            $0.leading.trailing.equalToSuperview() // 왼쪽 및 오른쪽 경계를 슈퍼뷰와 일치시킵니다.
            $0.height.equalTo(35) // 원하는 높이 설정
        }
        
        // 네비게이션 타이틀
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        rightBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-15)
        }
    }
    

}
