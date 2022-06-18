//
//  CustomCell.swift
//  Luftborn‏‏Task
//
//  Created by Macintosh on 17/06/2022.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var taskTypeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCellWith(record: RecordModel) {
        dateLabel.text = record.creationDate?.formatted()
        taskTypeLabel.text = record.taskType?.rawValue.capitalized
    }
    
}
