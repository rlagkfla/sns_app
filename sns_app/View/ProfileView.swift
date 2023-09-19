//
//  ProfileView.swift
//  sns_app
//
//  Created by t2023-m0067 on 2023/09/18.
//

import UIKit
import SnapKit

class ProfileView: UIView {

    //MARK: - ui 구현
    
    // 네비게이션 바 타이틀
    let titleLabel: UILabel = {
        let tl = UILabel()
        tl.text = "nabaecamp"
        tl.textColor = .black
        tl.font = UIFont.boldSystemFont(ofSize: 18)
        tl.sizeToFit()
        
        return tl
    }()
    
    // 네비게이션 바
    let customNavBar: UIView = {
        let navBar = UIView()
        navBar.backgroundColor = .blue
        
        return navBar
    }()
    
    
    //MARK: - 생성자 세팅
    
    override init(frame: CGRect) {
        super.init(frame: frame) // 질문하기 
        
        // UIView 는 View 자체니까 view 를 쓸 필요없음
        backgroundColor = .white
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - autolayout 세팅
    
    // 오토레이아웃 업데이트 -> 질문하기
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    func setConstraints(){
        // SnapKit을 사용하여 커스텀 네비게이션 바의 제약 조건을 설정합니다.
        customNavBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top) // Safe Area의 상단에 오도록 설정
            make.leading.trailing.equalToSuperview() // 왼쪽 및 오른쪽 경계를 슈퍼뷰와 일치시킵니다.
            make.height.equalTo(35) // 원하는 높이 설정
        }
        
        customNavBar.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        
    }
    
    
}
