//
//  MenuController.swift
//  SlideOutMenu
//
//  Created by Belal Samy on 20/06/2021.
//

import UIKit
import DesignX

struct MenuItem {
    let icon: String
    let title: String
}

extension MenuController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let slidingController =  UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController as? BaseSlidingController 
        slidingController?.didSelectMenuItem(indexPath: indexPath)
    }
}

class MenuController: UITableViewController {
    
    let menuItems = [
        MenuItem(icon: "profile", title: "Home"),
        MenuItem(icon: "lists", title: "Lists"),
        MenuItem(icon: "bookmarks", title: "Bookmarks"),
        MenuItem(icon: "moments", title: "Moments")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    }
    
    //MARK:- TableView Header
    
    // view for header in section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MenuHeader()
        return header
    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 200
//    }
    
    //MARK:- TableView Cells
    
    // 2 main method ( numberOfRowsInSection + cellForRowAt )
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuCell(style: .default, reuseIdentifier: "cellId")
        let menuItem = menuItems[indexPath.row]
        cell.titleLabel.text = menuItem.title
        cell.iconImageView.image = UIImage(named: menuItem.icon)
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
    

}
