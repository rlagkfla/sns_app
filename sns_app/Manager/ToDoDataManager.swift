////
////  ToDoDataManager.swift
////  sns_app
////
////  Created by t2023-m0067 on 2023/09/22.
////
//import CoreData
//import UIKit
//
//class TaskDataManager {
//    static let shared: TaskDataManager = TaskDataManager()
//    // Core Data를 초기화합니다.
//    let appDelegate = UIApplication.shared.delegate as? AppDelegate
//    lazy var context = appDelegate?.persistentContainer.viewContext
//
//    let modelName: String = "TaskData"
//
//    func getTaskDatas(ascending: Bool = false) -> [TaskData] {
//        var models: [TaskData] = [TaskData]()
//
//        if let context = context {
//            let idSort: NSSortDescriptor = NSSortDescriptor(key: "createDate", ascending: ascending)
//            let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: modelName)
//            fetchRequest.sortDescriptors = [idSort]
//            do {
//                if let fetchResult: [TaskData] = try context.fetch(fetchRequest) as? [TaskData] {
//                    models = fetchResult
//                }
//            } catch let error as NSError {
//                print("Could not fetch🥺: \(error), \(error.userInfo)")
//            }
//        }
//        return models
//    }
//
//    func getCompletedTaskDatas(ascending: Bool = false) -> [TaskData] {
//        var models: [TaskData] = [TaskData]()
//
//        if let context = context {
//            let idSort: NSSortDescriptor = NSSortDescriptor(key: "createDate", ascending: ascending)
//            let filterCompleted = NSPredicate(format: "isCompleted == %@", NSNumber(value: true))
//            let fetchRequest: NSFetchRequest<NSManagedObject>
//                = NSFetchRequest<NSManagedObject>(entityName: modelName)
//            fetchRequest.sortDescriptors = [idSort]
//            fetchRequest.predicate = filterCompleted
//
//            do {
//                if let fetchResult: [TaskData] = try context.fetch(fetchRequest) as? [TaskData] {
//                    models = fetchResult
//                }
//            } catch let error as NSError {
//                print("Could not fetch🥺: \(error), \(error.userInfo)")
//            }
//        }
//        return models
//    }
//
//
//    func saveTaskData(title: String,
//                      createDate: Date,
//                      isCompleted: Bool = false,
//                      onSuccess: ((Bool) -> Void)? = nil) {
//        if let context = context,
//            let entity: NSEntityDescription = NSEntityDescription.entity(forEntityName: modelName, in: context) {
//            if let taskData: TaskData = NSManagedObject(entity: entity, insertInto: context) as? TaskData {
//                taskData.id = UUID()
//                taskData.title = title
//                taskData.createDate = createDate
//                taskData.modifyDate = createDate
//                taskData.isCompleted = isCompleted
//                contextSave { success in
//                    onSuccess?(success)
//                }
//            }
//        }
//    }
//
//    func deleteTaskData(id: UUID, onSuccess: ((Bool) -> Void)? = nil) {
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = filteredRequest(id: id)
//
//        do {
//            if let results: [TaskData] = try context?.fetch(fetchRequest) as? [TaskData] {
//                if results.count != 0 {
//                    context?.delete(results[0])
//                }
//            }
//        } catch let error as NSError {
//            print("Could not fatch🥺: \(error), \(error.userInfo)")
//            onSuccess?(false)
//        }
//
//        contextSave { success in
//            onSuccess?(success)
//        }
//    }
//
//    func modifyTaskData(id: UUID, title: String, isCompleted: Bool, modifyDate: Date = Date(), onSuccess: ((Bool) -> Void)? = nil) {
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = filteredRequest(id: id)
//
//        do {
//            if let results: [TaskData] = try context?.fetch(fetchRequest) as? [TaskData] {
//                if results.count != 0 {
//                    let result = results[0]
//                    result.modifyDate = modifyDate
//                    result.title = title
//                    result.isCompleted = isCompleted
//
//                    contextSave { success in
//                        onSuccess?(success)
//                    }
//                }
//            }
//        } catch let error as NSError {
//            print("Could not fatch🥺: \(error), \(error.userInfo)")
//            onSuccess?(false)
//        }
//    }
//}
//extension TaskDataManager {
//    fileprivate func filteredRequest(id: UUID) -> NSFetchRequest<NSFetchRequestResult> {
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
//            = NSFetchRequest<NSFetchRequestResult>(entityName: modelName)
//        fetchRequest.predicate = NSPredicate(format: "id = %@", id as CVarArg)
//        return fetchRequest
//    }
//
//    fileprivate func contextSave(onSuccess: ((Bool) -> Void)) {
//        do {
//            try context?.save()
//            onSuccess(true)
//        } catch let error as NSError {
//            print("Could not save🥶: \(error), \(error.userInfo)")
//            onSuccess(false)
//        }
//    }
//}
