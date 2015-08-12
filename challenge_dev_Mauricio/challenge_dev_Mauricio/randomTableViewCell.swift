//
//  randomTableViewCell.swift
//  challenge_dev_Mauricio
//
//  Created by mauriciopf on 8/12/15.
//  Copyright (c) 2015 mauriciopf. All rights reserved.
//

import UIKit

class randomTableViewCell: UITableViewCell {
    
    
    var studentLabel1: UILabel!
     var studentLabel2: UILabel!

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: "cell")
        
        
        studentLabel1 = UILabel(frame: CGRectMake(0, 30, 70, 15))
        self.contentView.addSubview(studentLabel1)
        
        studentLabel2 = UILabel(frame: CGRectMake(100, 30, 70, 15))
        self.contentView.addSubview(studentLabel2)
        
    }
    
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
}


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}