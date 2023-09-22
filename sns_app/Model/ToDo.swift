//
//  ToDo.swift
//  sns_app
//
//  Created by t2023-m0067 on 2023/09/22.
//

import Foundation

// 등록 데이터
struct ToDo {
    var content: String
    var isCompleted: Bool = false
}
// 클래스 생성, static변수 선언해서 데이터 받아오기, 싱글톤패턴
class ToDoStore {
    static var data: Array<ToDo> = []
}

