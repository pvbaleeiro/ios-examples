//
//  ChatMessageCell.swift
//  ios-examples
//
//  Created by Victor Baleeiro on 07/01/19.
//  Copyright © 2019 Victor Baleeiro. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    let messageLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(messageLabel)
        messageLabel.backgroundColor = .green
        messageLabel.text = "some message"
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let contraints = [ messageLabel.topAnchor.constraint(equalTo: topAnchor),
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor)]
        
        NSLayoutConstraint.activate(contraints)
        //messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
