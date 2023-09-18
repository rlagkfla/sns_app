//
//  ViewController.swift
//  sns_app
//
//  Created by t2023-m0067 on 2023/09/18.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    // 커스텀 네비게이션 바를 생성합니다.
    let customNavBar = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setUpNavBar()
        
        
    }
    
    func setUpNavBar(){
        // 커스텀 네비게이션 바를 뷰에 추가합니다.
        view.addSubview(customNavBar)

        // SnapKit을 사용하여 커스텀 네비게이션 바의 제약 조건을 설정합니다.
        customNavBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top) // Safe Area의 상단에 오도록 설정
            make.leading.trailing.equalToSuperview() // 왼쪽 및 오른쪽 경계를 슈퍼뷰와 일치시킵니다.
            make.height.equalTo(44) // 원하는 높이 설정
        }

        // 커스텀 네비게이션 바의 배경색을 설정합니다.
        customNavBar.backgroundColor = .white

        // 중앙 타이틀 레이블을 생성합니다.
        let titleLabel = UILabel()
        titleLabel.text = "nabaecamp"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.sizeToFit()

        // 타이틀 레이블을 커스텀 네비게이션 바에 추가하고 Auto Layout 제약 조건을 설정합니다.
        customNavBar.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        // 네비게이션 바 오른쪽에 버튼을 생성합니다.
        let rightButton = UIButton(type: .system)

        // 이미지를 버튼에 설정합니다.
        if let image = UIImage(named: "Menu") {
            // 이미지 색상을 변경
            let tintedImage = image.withTintColor(.black, renderingMode: .alwaysOriginal)
            rightButton.setImage(tintedImage, for: .normal)
        }
        
        // 버튼을 커스텀 네비게이션 바에 추가하고 Auto Layout 제약 조건을 설정합니다.
        customNavBar.addSubview(rightButton)
        rightButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview() // 세로 중앙 정렬
            make.trailing.equalToSuperview().inset(16) // 오른쪽 여백 설정
        }

        // 버튼을 탭했을 때의 동작을 추가합니다.
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
    }
    
    @objc private func rightButtonTapped() {
        // 오른쪽 버튼을 탭했을 때 필요한 동작을 수행합니다.
    }
    
    
}

