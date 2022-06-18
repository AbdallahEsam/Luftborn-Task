//
//  MockRecordModel.swift
//  Luftborn‏‏TaskTests
//
//  Created by Macintosh on 17/06/2022.
//

import Foundation
@testable import Luftborn__Task
class MockRecordModel {
    private static func createRecord(type: TaskType) -> RecordModel {
        return .init(creationDate: Date(), type: type)
    }
    
    static func createATask1Record() -> RecordModel {
        return .init(creationDate: Date(), type: .task1)
    }
    
    static func createATask2Record() -> RecordModel {
        return .init(creationDate: Date(), type: .task2)
    }
    
    static func createATask3Record() -> RecordModel {
        return .init(creationDate: Date(), type: .task3)
    }
    
    static func createATask4Record() -> RecordModel {
        return .init(creationDate: Date(), type: .task4)
    }
}

