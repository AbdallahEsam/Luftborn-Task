//
//  ViewController.swift
//  Luftborn‏‏Task
//
//  Created by Macintosh on 17/06/2022.
//

import UIKit
protocol ViewControllerViewProtocol: AnyObject {
    func reloadData()
}

class ViewController: UIViewController {
    @IBOutlet private var backgroundViews: [UIView]! {
        didSet {
            backgroundViews.forEach({
                $0.layer.cornerRadius = 7.5
                $0.layer.borderWidth = 1
                $0.layer.borderColor = UIColor.init(red: 230/255, green: 231/255, blue: 231/255, alpha: 1).cgColor
            })
        }
    }
    
    @IBOutlet private var buttons: [UIButton]! {
        didSet {
            buttons.forEach({
                $0.layer.cornerRadius = 7.5
                $0.setTitleColor(.black, for: .normal)
                $0.backgroundColor = .white
            })
        }
    }
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        }
    }
    
    var presenter: ViewControllerPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter = ViewControllerPresenter(view: self, recordStack: RecordStorageStack.shared)
        presenter.fetchRecords()
    }
    private func setUnSelected(){
        buttons.forEach({
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = .white
        })
    }
    private func setSelectedButton(_ sender: UIButton) {
        setUnSelected()
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = .black
    }

    
    @IBAction private func taskOneTapped(_ sender: UIButton) {
        setSelectedButton(sender)
        presenter.addNewTaskWith(.task1)
    }
    
    @IBAction private func taskTwoTapped(_ sender: UIButton) {
        setSelectedButton(sender)
        presenter.addNewTaskWith(.task2)
    }
    
    @IBAction private func taskThreeTapped(_ sender: UIButton) {
        setSelectedButton(sender)
        presenter.addNewTaskWith(.task3)
    }
    
    @IBAction private func taskFourTapped(_ sender: UIButton) {
        setSelectedButton(sender)
        presenter.addNewTaskWith(.task4)
    }
  
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRecords
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.configCellWith(record: presenter.getRecordModelByIndex(indexPath.row))
        
        return cell
    }
    
    
}


extension ViewController: ViewControllerViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
    
    
}
