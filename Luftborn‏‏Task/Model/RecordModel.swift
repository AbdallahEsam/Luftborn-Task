//
//  RecordModel.swift
//  Luftborn‏‏Task
//
//  Created by Macintosh on 17/06/2022.
//

import Foundation
enum TaskType: String {
    case task1
    case task2
    case task3
    case task4
}
struct RecordModel {
     init(creationDate: Date?, type: TaskType?) {
        self.creationDate = creationDate
        self.taskType = type
    }
    
  /// Request Creation Date
  ///
   let creationDate: Date?
  
  
  /// For StoringType.
  ///
   var taskType: TaskType?
}
