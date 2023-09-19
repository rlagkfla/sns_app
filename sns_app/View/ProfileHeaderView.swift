//
//  ProfileHeaderView.swift
//  sns_app
//
//  Created by t2023-m0067 on 2023/09/19.
//

import UIKit
import SnapKit

class ProfileHeaderView: UICollectionReusableView {
        
    // 네비게이션 바
    private let customNavBar: UIView = {
        let navBar = UIView()
        navBar.backgroundColor = .white
        
        return navBar
    }()
    
    // 네비게이션 바 타이틀
    private let titleLabel: UILabel = {
        let tl = UILabel()
        tl.text = "rim__kim"
        tl.textColor = .black
        tl.font = UIFont.boldSystemFont(ofSize: 18)
        tl.sizeToFit()
        
        return tl
    }()
    
    // 프로필 이미지
    private let imageView: UIImageView = {
        let img = UIImageView(image: UIImage(named: "Ellipse 1"))
        
        return img
    }()
    
    private lazy var postLabel: UILabel = { // 질문 - let 선언 시 에러났는데 lazy var 로 바꾸니까 에러 해결됨
        let lb = UILabel()
        lb.attributedText = attributedStatText(value: 30, label: "post")
        lb.textAlignment = .center
        lb.numberOfLines = 0
        
        return lb
    }()
    
    private lazy var followerLabel: UILabel = {
        let lb = UILabel()
        lb.attributedText = attributedStatText(value: 78, label: "follower")
        lb.textAlignment = .center
        lb.numberOfLines = 0
        
        return lb
    }()
    
    private lazy var followingLabel: UILabel = {
        let lb = UILabel()
        lb.attributedText = attributedStatText(value: 52, label: "following")
        lb.textAlignment = .center
        lb.numberOfLines = 0
        
        return lb
    }()
    
    private lazy var stackView: UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.distribution = .equalSpacing
        
        return st
    }()
    
    private let nickname: UILabel = {
        let lb = UILabel()
        lb.text = "💻 림 킴"
        lb.textColor = .black
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        
        return lb
    }()
    
    private let label1: UILabel = {
        let lb = UILabel()
        lb.text = "iOS Developer 🍎"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 14)
        
        return lb
    }()
    
    private let label2: UILabel = {
        let lb = UILabel()
        lb.text = "rimkim's Github"
        lb.textColor = .purple
        lb.font = UIFont.systemFont(ofSize: 14)
        
        return lb
    }()
    
    private let followBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Follow", for: .normal)
        btn.backgroundColor = UIColor(red: 56.0 / 255.0, green: 152.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)
        btn.layer.cornerRadius = 5
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return btn
    }()
    
    private let msgBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Message", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 5
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.lightGray.cgColor
        
        return btn
    }()
    
    private let moreBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        btn.tintColor = .black
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.lightGray.cgColor
        
        return btn
    }()
    
    private lazy var btnStackView: UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.distribution = .equalSpacing
        
        return st
    }()
    
    private let borderView: UIView = {
        let border = UIView()
        border.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        
        return border
    }()
    
    private let gridBtn1: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "squareshape.split.3x3")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch), for: .normal)
        btn.tintColor = .black
//        btn.addTarget(self , action: #selector(gridBtnTap), for: .touchUpInside)
        
        return btn
    }()
    
    private let gridBtn2: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "squareshape.split.3x3")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch), for: .normal)
        btn.tintColor = .black
//        btn.addTarget(self , action: #selector(gridBtnTap), for: .touchUpInside)
        
        return btn
    }()
    
    private let gridBtn3: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "squareshape.split.3x3")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch), for: .normal)
        btn.tintColor = .black
//        btn.addTarget(self , action: #selector(gridBtnTap), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var gridBtnStackView: UIStackView = {
        let stv = UIStackView()
        stv.axis = .horizontal
        stv.distribution = .fillEqually
        
        return stv
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
        addSubview(imageView)
        addSubview(stackView)
        stackView.addArrangedSubview(postLabel)
        stackView.addArrangedSubview(followerLabel)
        stackView.addArrangedSubview(followingLabel)
        addSubview(nickname)
        addSubview(label1)
        addSubview(label2)
        addSubview(btnStackView)
        btnStackView.addArrangedSubview(followBtn)
        btnStackView.addArrangedSubview(msgBtn)
        btnStackView.addArrangedSubview(moreBtn)
        addSubview(borderView)
        addSubview(gridBtnStackView)
        gridBtnStackView.addArrangedSubview(gridBtn1)
        gridBtnStackView.addArrangedSubview(gridBtn2)
        gridBtnStackView.addArrangedSubview(gridBtn3)
        
        // 네비게이션 바
        customNavBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide) // Safe Area의 상단에 오도록 설정
            make.leading.trailing.equalToSuperview() // 왼쪽 및 오른쪽 경계를 슈퍼뷰와 일치시킵니다.
            make.height.equalTo(35) // 원하는 높이 설정
        }
        
        // 네비게이션 타이틀
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        // 프로필 이미지
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(14) // 왼쪽에서 14만큼 떨어지게
            make.top.equalTo(customNavBar.snp.bottom).offset(14) // 네비게이션 바에서 14만큼 아래로
            make.width.equalTo(88) // 이미지 뷰의 폭 설정
            make.height.equalTo(88) // 이미지 뷰의 높이 설정
        }
        
        // 팔로우 라벨
        stackView.snp.makeConstraints { make in
            make.centerY.equalTo(imageView)
            make.leading.equalTo(imageView.snp.trailing).offset(38)
            make.trailing.equalTo(-33)
        }
        
        // description 라벨
        nickname.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(19)
        }
        // description 라벨
        label1.snp.makeConstraints {
            $0.top.equalTo(nickname.snp.bottom).offset(5)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(19)
        }
        // description 라벨
        label2.snp.makeConstraints {
            $0.top.equalTo(label1.snp.bottom).offset(5)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(19)
        }
        
        // 버튼
        followBtn.snp.makeConstraints {
            $0.width.equalTo(150)
        }
        msgBtn.snp.makeConstraints {
            $0.width.equalTo(150)
        }
        moreBtn.snp.makeConstraints {
            $0.width.equalTo(30)
        }
        // 버튼 스택뷰
        btnStackView.snp.makeConstraints {
            $0.top.equalTo(label2.snp.bottom).offset(15)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        
        // 경계선
        borderView.snp.makeConstraints {
            $0.top.equalTo(btnStackView.snp.bottom).offset(14)
            $0.leading.trailing.equalTo(self)
            $0.height.equalTo(0.5)
        }
        
        // 그리드 버튼
        gridBtnStackView.snp.makeConstraints {
            $0.top.equalTo(borderView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self)
            $0.height.equalTo(25)
        }
        
    }
    
    private func attributedStatText(value: Int, label: String) -> NSAttributedString {
            let attributedText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
            attributedText.append(NSAttributedString(string: label, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.black]))
            return attributedText
        }
    
    
}
