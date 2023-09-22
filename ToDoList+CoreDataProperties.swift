//
//  ToDoList+CoreDataProperties.swift
//  sns_app
//
//  Created by t2023-m0067 on 2023/09/22.
//
//

import Foundation
import CoreData


extension ToDoList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoList> {
        return NSFetchRequest<ToDoList>(entityName: "ToDoList")
    }

    @NSManaged public var content: String?
    @NSManaged public var isCompleted: Bool

}

extension ToDoList : Identifiable {

}
