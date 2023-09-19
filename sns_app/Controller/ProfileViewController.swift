//
//  ViewController.swift
//  sns_app
//
//  Created by t2023-m0067 on 2023/09/18.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    
//    let headerView = ProfileHeaderView()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        setupLayout()
        
        // 컬렉션 뷰 설정 (예를 들어, 레이아웃 및 데이터 소스 설정)
        //       collectionView.dataSource = self
        collectionView.register(ProfileHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileHeaderView")
        // 다른 컬렉션 뷰 설정 코드를 추가해야 할 수도 있습니다.
        
        view.addSubview(collectionView)
        

    }
    
    private func setupLayout() {
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view)
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .lightGray
        return cell
    }
    
    
    // UICollectionViewDelegateFlowLayout 메서드 구현
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileHeaderView", for: indexPath) as! ProfileHeaderView
            // 필요한 설정을 여기에서 수행합니다.
            return headerView
        } else {
            // 다른 종류의 보조 요소가 있다면 처리합니다.
            return UICollectionReusableView()
        }
    }
    
    
}
    
    




//    func setUpProfileView(){
//        view.addSubview(profileView)
//
//        // autolayout 제약조건 설정
//        profileView.snp.makeConstraints { make in
//            make.edges.equalToSuperview() // 뷰의 네 가장자리가 슈퍼뷰와 일치하도록 설정
//        }
//
//        // 프로필 이미지
//        profileView.addSubview(profileImage)
//        profileImage.snp.makeConstraints { make in
//            make.leading.equalTo(14) // 왼쪽에서 14만큼 떨어지게
//            make.top.equalTo(customNavBar.snp.bottom).offset(14) // 네비게이션 바에서 14만큼 아래로
//            make.width.equalTo(88) // 이미지 뷰의 폭 설정
//            make.height.equalTo(88) // 이미지 뷰의 높이 설정
//        }
//
//        // 이미지 뷰에 이미지를 설정합니다.
//        if let image = UIImage(named: "Ellipse 1"){
//            profileImage.image = image
//        }
//
//        // 게시글수, 팔로워, 팔로우 뷰(스택뷰)
//        profileView.addSubview(followView)
//        followView.axis = .horizontal
//        followView.alignment = .fill
//        followView.distribution = .equalSpacing
//
//        followView.snp.makeConstraints { make in
//            make.top.equalTo(customNavBar.snp.bottom).offset(25) // 네비게이션 바에서 14만큼 아래로
//            make.leading.equalTo(143)
//            make.width.equalTo(204)
//            make.height.equalTo(41)
//        }
//
//        // UILabel을 생성하여 UIStackView에 추가합니다.
//        let label1 = UILabel()
//        label1.text = "10"
//        followView.addArrangedSubview(label1)
//
//        let label2 = UILabel()
//        label2.text = "25"
//        followView.addArrangedSubview(label2)
//
//        let label3 = UILabel()
//        label3.text = "36"
//        followView.addArrangedSubview(label3)
//
//    }
//
//    func setUpNavBar(){
//        // 커스텀 네비게이션 바를 뷰에 추가합니다.
//        view.addSubview(customNavBar)
//
//        // SnapKit을 사용하여 커스텀 네비게이션 바의 제약 조건을 설정합니다.
//        customNavBar.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top) // Safe Area의 상단에 오도록 설정
//            make.leading.trailing.equalToSuperview() // 왼쪽 및 오른쪽 경계를 슈퍼뷰와 일치시킵니다.
//            make.height.equalTo(35) // 원하는 높이 설정
//        }
//
//        // 커스텀 네비게이션 바의 배경색을 설정합니다.
//        customNavBar.backgroundColor = .white
//
//        // 중앙 타이틀 레이블을 생성합니다.
//        let titleLabel = UILabel()
//        titleLabel.text = "nabaecamp"
//        titleLabel.textColor = .black
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
//        titleLabel.sizeToFit()
//
//        // 타이틀 레이블을 커스텀 네비게이션 바에 추가하고 Auto Layout 제약 조건을 설정합니다.
//        customNavBar.addSubview(titleLabel)
//        titleLabel.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//        }
//
//        // 네비게이션 바 오른쪽에 버튼을 생성합니다.
//        let rightButton = UIButton(type: .system)
//
//        // 이미지를 버튼에 설정합니다.
//        if let image = UIImage(named: "Menu") {
//            // 이미지 색상을 변경
//            let tintedImage = image.withTintColor(.black, renderingMode: .alwaysOriginal)
//            rightButton.setImage(tintedImage, for: .normal)
//        }
//
//        // 버튼을 커스텀 네비게이션 바에 추가하고 Auto Layout 제약 조건을 설정합니다.
//        customNavBar.addSubview(rightButton)
//        rightButton.snp.makeConstraints { make in
//            make.centerY.equalToSuperview() // 세로 중앙 정렬
//            make.trailing.equalToSuperview().inset(16) // 오른쪽 여백 설정
//        }
//
//        // 버튼을 탭했을 때의 동작을 추가합니다.
//        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
//    }
//
//
//
//    @objc private func rightButtonTapped() {
//        // 오른쪽 버튼을 탭했을 때 필요한 동작을 수행합니다.
//    }
//
    


