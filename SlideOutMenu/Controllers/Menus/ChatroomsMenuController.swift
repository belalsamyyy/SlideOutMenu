//
//  ChatroomsMenuController.swift
//  SlideOutMenu
//
//  Created by Belal Samy on 26/06/2021.
//

import UIKit
import DesignX

extension ChatroomsMenuController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredResults = searchText.isEmpty ? chatroomsGroups : chatroomsGroups.map({ group in
            return group.filter {$0.lowercased().contains(searchText.lowercased())}
        })
        
        tableView.reloadData() // don't forget this

        // print(searchText)
//        var results = [[String]]()
//        chatroomsGroups.forEach { group in
//            //print(group)
//            let filteredGroup = group.filter { chatroomName in
//                return chatroomName.lowercased().contains(searchText.lowercased())
//            }
//            results.append(filteredGroup)
//        }
        
        //print(results)
        //filteredResults = searchText.isEmpty ? chatroomsGroups : results
        
    }
} // extension


class ChatroomsMenuController: UITableViewController {
    
    let chatroomsGroups = [
        ["general", "introductions"],
        ["jobs"],
        ["Belal Samy", "Steve Jobs", "Tim Cook", "Barack Obama"]
    ]
    
    var filteredResults = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.backgroundColor = .purple
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.2196078431, blue: 0.2862745098, alpha: 1)
        
        // search bar
        filteredResults = chatroomsGroups
    }
    
 
    
    
    //MARK:- Sections
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "UNREADS" : section == 1 ? "CHANNELS" : "DIRECT MESSAGES"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredResults.count
    }
    
    fileprivate class ChatroomHeaderLabel: UILabel {
        override func draw(_ rect: CGRect) {
            super.drawText(in: rect.insetBy(dx: 16, dy: 0))
        }
    }
    

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = ChatroomHeaderLabel()
        let text = section == 0 ? "UNREADS" : section == 1 ? "CHANNELS" : "DIRECT MESSAGES"
        label.text = text
        label.textColor = #colorLiteral(red: 0.47, green: 0.40, blue: 0.46, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.2196078431, blue: 0.2862745098, alpha: 1)
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
    
    //MARK:- Cells
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredResults[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatroomMenuCell(style: .default, reuseIdentifier: nil)
        let text = filteredResults[indexPath.section][indexPath.row]
        cell.textLabel?.attributedText = cell.textLabel?.magicText(string: ["#  ", "\(text)"], colors: [#colorLiteral(red: 0.47, green: 0.40, blue: 0.46, alpha: 1), #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)], sizes: [18], weights: [.regular], alignment: .left)
        cell.backgroundColor = .clear
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return cell
    }
}


