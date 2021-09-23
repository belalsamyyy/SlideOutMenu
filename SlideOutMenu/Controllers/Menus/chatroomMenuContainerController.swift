//
//  chatroomMenuContainerController.swift
//  SlideOutMenu
//
//  Created by Belal Samy on 26/06/2021.
//

import UIKit
import DesignX

class chatroomMenuContainerController: UIViewController {
    // controllers
    let chatroomsMenuController = ChatroomsMenuController()
    // views
    let searchContainer = SearchContainerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        setupSearchBar()
    }
    
    fileprivate func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.2196078431, blue: 0.2862745098, alpha: 1)
        
        view.addSubview(searchContainer)
        searchContainer.layout(XW: .leadingAndCenter(nil, 0), YH: .TopAndBottomToSafeAreaAndHeight(nil, 0, view, -64, .fixed(0)))
        
        addSubViewController(chatroomsMenuController, inside: view)
        chatroomsMenuController.view.layout(XW: .leadingAndTrailingBothToSafeArea(nil, 0, nil, 0), YH: .TopAndBottom(searchContainer, 0, nil, 0))
    }
    
    
    fileprivate func setupSearchBar() {
        searchContainer.searchBar.delegate = chatroomsMenuController // conform >> UISearchBarDelegate
    }
}


//MARK:- Search Container View

class SearchContainerView: UIView {
    let searchBar = UISearchBar()
    let rocketImageView = UIImageView()
    
    //MARK:- init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Setup Views
    fileprivate func setupViews() {
        backgroundColor = #colorLiteral(red: 0.2379754241, green: 0.1719031702, blue: 0.2246094534, alpha: 1)
        
        addSubview(searchBar)
        addSubview(rocketImageView)

        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Enter some filter"
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = .white
        
        rocketImageView.image = UIImage(named: "girl-profile")
        rocketImageView.layer.cornerRadius = 3
        rocketImageView.clipsToBounds = true
        
        rocketImageView.layout(X: .leading(nil, 8), W: .fixed(40), Y: .bottom(nil, 14), H: .fixed(40))
        searchBar.layout(XW: .leadingAndTrailing(rocketImageView, 4, nil, 0), Y: .bottom(nil, 4), H: .wrapContent)
    }
    
}
