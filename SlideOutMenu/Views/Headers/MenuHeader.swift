//
//  CustomMenuHeaderView.swift
//  SlideOutMenu
//
//  Created by Belal Samy on 23/06/2021.
//

import UIKit
import DesignX

class MenuHeader: UIView {
    
    //MARK:-  views
    let headerStackView = UIStackView()
    let nameLabel = UILabel()
    let usernameLabel = UILabel()
    let statsLabel = UILabel()
    let profileImageVeiw = UIImageView()

    //MARK:- init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- setupViews
    fileprivate func setupViews() {
        self.backgroundColor = .white
        
        // labels
        nameLabel.attributedText = nameLabel.magicText(string: ["Nancy Farid"], colors: [.black], sizes: [20], weights: [.bold], alignment: .left)
        usernameLabel.attributedText = usernameLabel.magicText(string: ["@wuzzuf_girl"], colors: [.darkGray], sizes: [16], weights: [.regular], alignment: .left)
        statsLabel.attributedText = usernameLabel.magicText(string: ["42", " Following  ", "7091", " Followers"], colors: [.black, .darkGray], sizes: [16], weights: [.bold, .regular], alignment: .left)

        // image
        let imageContainerView = fakeViews(1)[0]
        imageContainerView.addSubview(profileImageVeiw)
        profileImageVeiw.image = profileImageVeiw.magicImage(name: "girl-profile", scale: .scaleAspectFill, shape: .circle(size: 60))
        
        // views
        let views = [imageContainerView, nameLabel, usernameLabel, statsLabel]
        //let views = fakeViews(6)
        headerStackView.addSubviews(views)
        
        // header stackView 
        addSubview(headerStackView)
        headerStackView.layout(shortcut: .fillSuperView(20))
        headerStackView.magiCreate(subviews: views, colors: [.white], axis: .vertical, distribution: .custom([3, 1, 1, 2]))
    }
}
