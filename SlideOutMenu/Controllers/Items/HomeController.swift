//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by Belal Samy on 20/06/2021.
//
// notes >>> -------------------------------------------
// stackOverFlow - blog Posts - Open Source Projects
// quick rename = cmd + ctrl + E

import UIKit
import DesignX

class HomeController: UITableViewController {
    
//     let slidingController =  UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController as? BaseSlidingController
//    let menuController = MenuController()
//    let menuWidth: CGFloat = 300
//    fileprivate var isMenuOpened = false
//    fileprivate var velocityOpenThreshold: CGFloat = 500


    //MARK:- ViewDidLoad & ViewWillAppear
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        // setupPanGesture()
    }
    
    
    //MARK:- Setup Navigation Bar
    fileprivate func setupNavigationBar() {
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        setupCircularNavigationButton()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
        navigationItem.title = "Home"
    }
    
    fileprivate func setupCircularNavigationButton() {
        let image = #imageLiteral(resourceName: "girl-profile").withRenderingMode(.alwaysOriginal)
        
        let customView = UIButton(type: .system)
        //customView.backgroundColor = .orange
        customView.addTarget(self, action: #selector(handleOpen), for: .touchUpInside)
        //customView.imageView?.image // this is not what you wnat
        customView.setImage(image, for: .normal)
        customView.imageView?.contentMode = .scaleAspectFit
        
        // customView.frame = CGRect(x: 0, y: 0, width: 40, height: 40) // when this is doesnt work then the system use autolayout
        customView.constraint(W: .fixed(40), H: .fixed(40))
        customView.layer.cornerRadius = 20
        customView.clipsToBounds = true
        
        
        let barButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.leftBarButtonItem = barButtonItem
    }
    
    //MARK:- Selectors Funcs
    @objc func handleOpen() {
//        isMenuOpened = true
//        menuController.view.magicAnimation(views: [navigationController?.view], duration: 0.5, velocity: 1, animation: .curveEaseOut, transform: .animate(X: menuWidth, Y: 0))
        //slidingController?.openMenu()
        (UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController as? BaseSlidingController)?.openMenu()
    }

    @objc func handleHide() {
//        isMenuOpened = false
//        menuController.view.magicAnimation(views: [navigationController?.view], duration: 0.5, velocity: 1, animation: .curveEaseOut, transform: .original)
        //slidingController?.closeMenu()
        (UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController as? BaseSlidingController)?.closeMenu()
    }
    
    //MARK:- TableView Cells
    
    // (1) - number of rows in section + cell for row at
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        setupMenuController()
//        setupDarkCoverView()
//    }
    
    
//    fileprivate func setupPanGesture() {
//        // pan gesture
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
//        view.addGestureRecognizer(panGesture)
//    }
    
//    let darkCoverView = UIView()
//
//    fileprivate func setupDarkCoverView() {
//        darkCoverView.isUserInteractionEnabled = false
//        navigationController?.view.addSubview(darkCoverView)
//        darkCoverView.frame = view.frame
//    }
    
    
//
    //MARK:- Handle Pan
//    @objc func handlePan(gesture: UIPanGestureRecognizer) {
//        let velocity = gesture.velocity(in: view)
//        let translation = gesture.translation(in: view)
//        var x = translation.x
//
//        darkCoverView.backgroundColor = UIColor(white: 0, alpha: x / 500)
//
//        if isMenuOpened {
//            x += menuWidth
//        }
//
//        x = min(menuWidth, x)
//        x = max(0, x)
//
//        switch gesture.state {
//        case .changed:
//            handleChanged(x: x)
//        case .ended:
//            handleEnded(x: x, velocity: velocity)
//        default:
//            ()
//        }
//
//    }
//
//    fileprivate func handleChanged(x: CGFloat) {
//        menuController.view.magicAnimation(views: [navigationController?.view], duration: 0.5, velocity: 1, animation: .curveEaseOut, transform: .animate(X: x, Y: 0))
//    }
//
//    fileprivate func handleEnded(x: CGFloat, velocity: CGPoint) {
//        if x > menuWidth / 2 {
//            handleOpen()
//        } else {
//            handleHide()
//        }
//
//        if !isMenuOpened {
//            if velocity.x > velocityOpenThreshold {
//                handleOpen()
//            } else if velocity.x < -velocityOpenThreshold {
//                handleHide()
//            }
//        }
//    }
    
    //MARK:- Setup Menu Controller
//    fileprivate func setupMenuController() {
//        // initial position
//        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: view.frame.height)
//        let mainWindow =  UIApplication.shared.windows.filter {$0.isKeyWindow}.first // Singleton Syntax
//        mainWindow?.addSubview(menuController.view)
//        self.addChild(menuController) // when you embed second viewController inside your viewController use "addChild"
//    }
    

    

}

