//
//  MenuCellTableViewCell.swift
//  SlideOutMenu
//
//  Created by Belal Samy on 24/06/2021.
//

import UIKit

class MenuCell: UITableViewCell {
    // views
    let stackView = UIStackView()
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    
    
    //MARK:- init with Style
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Setup Views
    fileprivate func setupViews() {
        backgroundColor = .yellow
        stackView.backgroundColor = .yellow
        
        // image Container
        let imageContainerView = fakeViews(1)[0]
        imageContainerView.addSubview(iconImageView)
        
        
        // image
        iconImageView.image = iconImageView.magicImage(name: "profile", scale: .scaleAspectFit, shape: .circle(size: 44))
        iconImageView.layout(X: .center(nil), Y: .center(nil))
        
        // title
        titleLabel.attributedText = titleLabel.magicText(string: ["Profile"], colors: [.black], sizes: [20], weights: [.medium], alignment: .left)
        titleLabel.constraints(H: .fixed(80))
        
        let views = [imageContainerView, titleLabel]
        //let views = fakeViews(2)
        
        addSubview(stackView)
        stackView.layout(shortcut: .fillSuperView(0))
        stackView.magiCreate(subviews: views, colors: [.white], axis: .horizontal, distribution: .custom([30, 70]))
    }
}
