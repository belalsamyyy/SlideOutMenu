//
//  ChatroomMenuCell.swift
//  SlideOutMenu
//
//  Created by Belal Samy on 26/06/2021.
//

import UIKit
import DesignX

class ChatroomMenuCell: UITableViewCell {
    var bgView = UIView()

    //MARK:- Views
//    let bgView = UIView()
//
//    let bgView: UIView = {
//        let v = UIView()
//        v.backgroundColor = #colorLiteral(red: 0.2196078431, green: 0.6274509804, blue: 0.5411764706, alpha: 1)
//        return v
//    }()
    
    //MARK:- init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        // viewsFactory + magiCreate -> addSubview -> magiConstraints = do everything in 3 lines
        bgView = fakeViews(1)[0].magiCreate(color: #colorLiteral(red: 0.2196078431, green: 0.6274509804, blue: 0.5411764706, alpha: 1), shape: .custom(H: 0, W: 0, cornerRadius: 5))
        addSubview(bgView)
        bgView.layout(XW: .leadingAndCenter(nil, 8), YH: .topAndCenter(nil, 0))
        sendSubviewToBack(bgView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        bgView.isHidden = !selected
        // contentView.backgroundColor = selected ? .green : .clear
    }

}
