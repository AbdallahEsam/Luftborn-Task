//
//  ViewControllerPresenter.swift
//  Luftborn‏‏Task
//
//  Created by Macintosh on 17/06/2022.
//

import Foundation
protocol ViewControllerPresenterProtocol {
    func fetchRecords()
    func addNewTaskWith(_ type: TaskType)
    func getRecordModelByIndex(_ index: Int) -> RecordModel
    var numberOfRecords: Int {get}
}

class ViewControllerPresenter {
    private weak var view: ViewControllerViewProtocol?
    private let recordStack: RecordStorageStackProtocol
    private var records: [Record] = [] {
        didSet{
            print(records)
            view?.reloadData()
        }
    }
    init(view: ViewControllerViewProtocol, recordStack: RecordStorageStackProtocol){
        self.view = view
        self.recordStack = recordStack
    }
}

extension ViewControllerPresenter: ViewControllerPresenterProtocol {
    
    
    func getRecordModelByIndex(_ index: Int) -> RecordModel {
        return .init(creationDate: records[index].createAt, type: .init(rawValue: records[index].name ?? ""))
    }
    
    var numberOfRecords: Int {
        return records.count
    }
    
    func fetchRecords() {
        recordStack.fetchRecords { [weak self] result in
            guard let self = self else{return}
            switch result {
                
            case .success(let records):
                guard let records = records else {
                    return
                }
                self.records = records
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func addNewTaskWith(_ type: TaskType) {
        recordStack.pushRecord(with: RecordModel(creationDate: Date(), type: type)) { [weak self] result in
            guard let self = self else{return}
            switch result {
                
            case .success(let record):
                self.records.append(record)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}

