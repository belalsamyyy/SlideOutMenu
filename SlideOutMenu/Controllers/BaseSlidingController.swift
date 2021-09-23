//
//  BaseSlidingController.swift
//  SlideOutMenu
//
//  Created by Belal Samy on 21/06/2021.
//

import UIKit

// typealias
typealias MainContainerView = UIView
typealias MenuContainerView = UIView
typealias DarkCoverView = UIView


class BaseSlidingController: UIViewController {
    
    //Mark: - Controllers
    var menuItemViewController: UIViewController?
    var menuController = chatroomMenuContainerController()  //MenuController()

    //MARK: - Views
    let mainContainerView = MainContainerView()
    let menuContainerView = MenuContainerView()
    let darkCoverView = DarkCoverView()

//    let redView: UIView = {
//        let v = UIView()
//        v.backgroundColor = .red
//        return v
//    }()
    
    //MARK:- Vars & Lets
    var mainContainerLeading: NSLayoutConstraint!
    var mainContainerTrailing: NSLayoutConstraint!

    fileprivate let menuWidth: CGFloat = 300
    fileprivate var isMenuOpened = false
    fileprivate var velocityOpenThreshold: CGFloat = 500
    

    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        setupViews()
        
        // pan gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
        
        // tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        mainContainerView.addGestureRecognizer(tapGesture)
    }
    
    //MARK:- HandleTap
    @objc func handleTap(gesture: UITapGestureRecognizer) {
        closeMenu()
    }

    
    //MARK:- HandlePan
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let velocity = gesture.velocity(in: view)
        let translation = gesture.translation(in: view)
        var x = translation.x
        x = isMenuOpened ? x + menuWidth : x
        x = min(menuWidth, x)
        x = max(0, x)
        
        // pan states
        switch gesture.state {
        case .changed:
            handleChanged(x: x)
        case .ended:
            handleEnded(x: x, velocity: velocity)
        default:
            ()
        }
    }
    
    
    fileprivate func handleChanged(x: CGFloat) {
        //mainContainerLeadingConstraint.constant = x
        //mainContainerTrailingConstraint.constant = x
        mainContainerLeading.constant = x
        mainContainerTrailing.constant = x
        darkCoverView.backgroundColor = UIColor(white: 0, alpha: min(x / 500, 0.75))
        performAnimation()
    }
    
    
    fileprivate func handleEnded(x: CGFloat, velocity: CGPoint) {
        if (x > menuWidth / 2) || (velocity.x > velocityOpenThreshold) {
            openMenu()
        } else {
           closeMenu()
        }
    }
    
    func openMenu() {
        isMenuOpened = true
        mainContainerLeading.constant = menuWidth
        mainContainerTrailing.constant = menuWidth
        darkCoverView.backgroundColor = UIColor(white: 0, alpha: 0.75)
        performAnimation()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func closeMenu() {
        isMenuOpened = false
        mainContainerLeading.constant = 0
        mainContainerTrailing.constant = 0
        darkCoverView.backgroundColor = UIColor(white: 0, alpha: 0)
        performAnimation()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    //MARK:- Status Bar Style
    override var preferredStatusBarStyle: UIStatusBarStyle {
        // you will need to add this function >> setNeedsStatusBarAppearanceUpdate()
        return isMenuOpened ? .lightContent : .default
    }
    
    
    func didSelectMenuItem(indexPath: IndexPath) {
        self.removeSubViewController(menuItemViewController!)
        closeMenu()

        switch indexPath.row {
        case 0:
            menuItemViewController = UINavigationController(rootViewController: HomeController()) // with navigation bar
        case 1:
            menuItemViewController = UINavigationController(rootViewController: ListsController()) // with navigation bar
        case 2:
            menuItemViewController = BookmarksController()
        case 3:
            menuItemViewController = MomentsController()
        default:
            ()
        }
        
        addSubViewController(menuItemViewController!, inside: mainContainerView)
        menuItemViewController!.view.layout(shortcut: .fillSuperView(0))

        mainContainerView.bringSubviewToFront(darkCoverView)
    }
    
    fileprivate func performAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
            self.view.layoutIfNeeded()
        }
    }
    
    //MARK:- Setup Views
    fileprivate func setupViews() {
        mainContainerView.backgroundColor = .red
        menuContainerView.backgroundColor = .blue
        darkCoverView.backgroundColor = UIColor(white: 0, alpha: 0)

        view.addSubviews([mainContainerView, menuContainerView])
        // red view
        mainContainerView.constraint(YH: .TopAndBottom(nil, 0, nil, 0))
        mainContainerLeading = mainContainerView.returnMagiConstraint(X: .leading(nil, 0)) // return constraint
        mainContainerTrailing = mainContainerView.returnMagiConstraint(X: .trailing(nil, 0)) // return constraint

        // blue view
        menuContainerView.layout(X: .trailing(mainContainerView, 0), W: .fixed(menuWidth), YH: .TopAndBottom(nil, 0, nil, 0)) // .trailingToSafeArea(mainContainerView, 0)
        setupViewControllers()
        // dark view
        mainContainerView.addSubview(darkCoverView)
        darkCoverView.isUserInteractionEnabled = false
        darkCoverView.layout(shortcut: .fillSuperView(0))
    }
    
    //MARK:- Setup ViewControllers
    fileprivate func setupViewControllers() {
        
        // lets add our HomeController into the main container view
        menuItemViewController = UINavigationController(rootViewController: HomeController()) // with navigation bar
        addSubViewController(menuItemViewController!, inside: mainContainerView)

        // add menu Controller into the menu container view
        addSubViewController(menuController, inside: menuContainerView)

        menuItemViewController!.view.layout(shortcut: .fillSuperView(0))
        menuController.view.layout(XW: .leadingAndTrailing(nil, 0, nil, 0), YH: .TopAndBottom(nil, 0, nil, 0))

    }
    
}
    
    
  
