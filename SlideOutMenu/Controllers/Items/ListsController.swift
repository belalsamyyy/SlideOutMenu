//
//  ListsController.swift
//  SlideOutMenu
//
//  Created by Belal Samy on 25/06/2021.
//

import UIKit
import DesignX

class ListsController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.labelIt("Lists")
        // navigation bar
        navigationItem.title = "Lists"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
