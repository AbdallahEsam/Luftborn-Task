//
//  StorageManagerTest.swift
//  Luftborn‏‏TaskTests
//
//  Created by Macintosh on 17/06/2022.
//

import XCTest
import CoreData
@testable import Luftborn__Task

class StorageManagerTest: XCTestCase {

    var sut: RecordStorageStack!
    var maxCount = 5
    override func setUpWithError() throws {
        let recordManager = RecordManager(mainContext: CoreDataTestStack().mainContext)
        sut = RecordStorageStack(recordManager: recordManager)
    }
    
    override func tearDownWithError() throws {
      sut = nil
    }
    
   //    Test Save Task1 Record
    func testStorageManager_SaveATask1Record_RecordTypeEqualTask1() {
        let promise = expectation(description: "Test Save Record")
        let record = MockRecordModel.createATask1Record()
        sut.pushRecord(with: record) { result in
            switch result {
            case .success(let record):
                XCTAssertEqual(record.name, TaskType.task1.rawValue)
            case .failure(_):
                print("")
            }
            promise.fulfill()
        }
        waitForExpectations(timeout: Double(20), handler: nil)
       
    }
    
    //    Test Save Task2 Record
     func testStorageManager_SaveATask2Record_RecordTypeEqualTask2() {
         let promise = expectation(description: "Test Save Record")
         let record = MockRecordModel.createATask2Record()
         sut.pushRecord(with: record) { result in
             switch result {
             case .success(let record):
                 XCTAssertEqual(record.name, TaskType.task2.rawValue)
             case .failure(_):
                 print("")
             }
             promise.fulfill()
         }
         waitForExpectations(timeout: Double(20), handler: nil)
        
     }
    
    
    //    Test Save Task3 Record
     func testStorageManager_SaveATask3Record_RecordTypeEqualTask3() {
         let promise = expectation(description: "Test Save Record")
         let record = MockRecordModel.createATask3Record()
         sut.pushRecord(with: record) { result in
             switch result {
             case .success(let record):
                 XCTAssertEqual(record.name, TaskType.task3.rawValue)
             case .failure(_):
                 print("")
             }
             promise.fulfill()
         }
         waitForExpectations(timeout: Double(20), handler: nil)
        
     }
    


}
