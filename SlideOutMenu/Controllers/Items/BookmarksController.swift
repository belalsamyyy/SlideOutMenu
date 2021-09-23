//
//  BookmarksController.swift
//  SlideOutMenu
//
//  Created by Belal Samy on 25/06/2021.
//

import UIKit

class BookmarksController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        //view.justLabelIt("Bookmarks", 50)

    }
    
    //MARK:- numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    //MARK:- cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)
        
        // this is easier for recording lessons because i dont have to register a cell onto my tableview
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Bookmark: \(indexPath.row)"
        return cell
    }

}
