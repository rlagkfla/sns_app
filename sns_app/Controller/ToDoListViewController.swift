//
//  MyPageViewController.swift
//  sns_app
//
//  Created by t2023-m0067 on 2023/09/22.
//

import UIKit
import SnapKit
import CoreData

class ToDoListViewController: UIViewController {

    let toDoListView = ToDoListView()
    var tableView = UITableView()
    
    let dataArr = ["1","2","3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = toDoListView
        
        setUpTable()
        attribute()
        setUpAction()
        
    }
    

    
    func setUpTable(){
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.top.equalTo(95)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    func attribute(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setUpAction(){
        toDoListView.rightBtn.addTarget(self, action: #selector(tapPlusBtn), for: .touchUpInside)

    }

    // 등록 버튼
    @objc func tapPlusBtn(){
        print("click")
        
        let alert = UIAlertController(title: "등록", message: nil, preferredStyle: .alert)
        
        alert.addTextField {(textField) in
            textField.placeholder = "할 일을 입력하세요"
        }
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "추가", style: .default, handler: { action in
            if let toDo = alert.textFields?.first?.text{
                ToDoStore.data.append(ToDo(content: toDo))
                // 등록 시 저장, encoded는 Data형
//                self.memoManager.saveData()
                self.tableView.reloadData()
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoStore.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = ToDoStore.data[indexPath.row].content
        
        return cell
    }
    
    
}


