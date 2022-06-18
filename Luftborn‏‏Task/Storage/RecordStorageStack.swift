//
//  RecordStorageStack.swift
//  Luftborn‏‏Task
//
//  Created by Macintosh on 17/06/2022.
//

import Foundation
protocol RecordStorageStackProtocol {
    func pushRecord(with record: RecordModel, completion: @escaping (Result<Record, Error>) -> Void)
    func fetchRecords(completion: @escaping (Result<[Record]?, Error>) -> Void)
}

class RecordStorageStack{
    private let recordManager: RecordManagerProtocol
    public static let shared = RecordStorageStack()
    private let dispatchGroup = DispatchGroup()
    private let rootQueue: DispatchQueue = DispatchQueue(label: "com.Luftborn.session.RecordStorageStack", qos: .background)
    
    
    init(recordManager: RecordManagerProtocol) {
        self.recordManager = recordManager
    }
    
    private convenience init() {
        self.init(recordManager: RecordManager())
    }
    
    
}

extension RecordStorageStack: RecordStorageStackProtocol{
   
    
    private func insertRecord(_ record: RecordModel, completion: @escaping (Record) -> Void){
        rootQueue.async { [weak self] in
            guard let self = self else{return}
            self.recordManager.createRecord(record, completion: completion)
        }
    }
    
    
    
    func pushRecord(with record: RecordModel, completion: @escaping (Result<Record, Error>) -> Void) {
        insertRecord(record) { record in
            DispatchQueue.main.async {
                completion(.success(record))
            }
        }
        
    }
    
    func fetchRecords(completion: @escaping (Result<[Record]?, Error>) -> Void) {
        rootQueue.async { [weak self] in
            guard let self = self else{return}
            DispatchQueue.main.async {
                completion(.success(self.recordManager.fetchRecords()))
            }
        }
    }
    
    
}
