//
//  ViewController.swift
//  ios-examples
//
//  Created by Victor Baleeiro on 07/01/19.
//  Copyright © 2019 Victor Baleeiro. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: Date
}

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}

class ViewController: UITableViewController {

    fileprivate let cellId = "id"
//    fileprivate let chatMessages = [
//        [
//            ChatMessage(text: "My first short message", isIncoming: true, date: Date.dateFromCustomString(customString: "03/01/2019")),
//            ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date.dateFromCustomString(customString: "03/01/2019")),
//        ],
//        [
//            ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, Yo, how are you", isIncoming: false, date: Date.dateFromCustomString(customString: "05/01/2019")),
//            ChatMessage(text: "Yo, howwwww", isIncoming: false, date: Date.dateFromCustomString(customString: "05/01/2019")),
//            ChatMessage(text: "buble test sopokaoskokaoskoakoskoaok", isIncoming: true, date: Date.dateFromCustomString(customString: "05/01/2019")),
//        ],
//        [
//            ChatMessage(text: "Third section", isIncoming: true, date: Date.dateFromCustomString(customString: "08/01/2019")),
//        ]
//    ]
    fileprivate let messagesFromServer = [
        ChatMessage(text: "My first short message", isIncoming: true, date: Date.dateFromCustomString(customString: "03/01/2019")),
        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date.dateFromCustomString(customString: "03/01/2019")),
        ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, Yo, how are you", isIncoming: false, date: Date.dateFromCustomString(customString: "05/01/2019")),
        ChatMessage(text: "Yo, howwwww", isIncoming: false, date: Date.dateFromCustomString(customString: "05/01/2019")),
        ChatMessage(text: "buble test sopokaoskokaoskoakoskoaok", isIncoming: true, date: Date.dateFromCustomString(customString: "05/01/2019")),
        ChatMessage(text: "Third section", isIncoming: true, date: Date.dateFromCustomString(customString: "08/01/2019")),
    ]
    fileprivate var chatMessages = [[ChatMessage]]()
    fileprivate func attemptToAssembleGroupedMessages() {
        print("attemptToAssembleGroupedMessages")
        
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date
        }
        
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            let values = groupedMessages[key]
            chatMessages.append(values ?? [])
        }
        
//        groupedMessages.keys.forEach { (key) in
//            let values = groupedMessages[key]
//            chatMessages.append(values ?? [])
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        attemptToAssembleGroupedMessages()
        
        title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .black
            textColor = .white
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            font = .boldSystemFont(ofSize: 14)
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 16
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 16, height: height)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
        
            let label = DateHeaderLabel()
            label.text = dateString
            let containerView = UIView()
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            return containerView
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if let firstMessageInSection = chatMessages[section].first {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "dd/MM/yyyy"
//            let dateString = dateFormatter.string(from: firstMessageInSection.date)
//            return dateString
//        }
//        return "Section \(Date())"
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        cell.chatMessage = chatMessage
        return cell
    }
}

