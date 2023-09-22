//
//  TabBarController.swift
//  sns_app
//
//  Created by t2023-m0067 on 2023/09/22.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.barTintColor = UIColor.white // TabBar 의 배경 색
        tabBar.tintColor = UIColor.purple // TabBar Item 이 선택되었을때의 색
        tabBar.unselectedItemTintColor = UIColor.black // TabBar Item 의 기본 색
        
        setUpTabBar()
        
    }
    
    
    func setUpTabBar(){
        // Tab Bar에 표시될 각각의 ViewController를 생성합니다.
        let profileViewController = ProfileViewController()
        profileViewController.view.backgroundColor = UIColor.white
        profileViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 0)

        let myPageViewController = MyPageViewController()
        myPageViewController.view.backgroundColor = UIColor.white
        myPageViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person.fill"), tag: 1)

        // 생성한 ViewController들을 Tab Bar에 추가합니다.
        viewControllers = [profileViewController, myPageViewController]

    }

}
