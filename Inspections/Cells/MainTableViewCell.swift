//
//  MainTableViewCell.swift
//  Inspections
//
//  Created by Appnap Mahfuj on 27/2/24.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    var title: UILabel = {
        let lable = UILabel()
        lable.text = "hello"
        lable.font = UIFont.boldSystemFont(ofSize: 22)
        return lable
    }()
    var subTitle: UILabel = {
        let lable = UILabel()
        lable.text = "this is a dummy text"
        lable.font = UIFont.systemFont(ofSize: 12)
        lable.layer.opacity = 0.5
        return lable
    }()
    
    let backView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.init(hexString: "F9F9FB")
        view.layer.cornerRadius = .init(w: 12)
        return view
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()
    
    let createddate: UILabel = {
        let lable = UILabel()
        lable.text = "18, Dec"
        lable.font = UIFont.boldSystemFont(ofSize: 14)
        lable.layer.opacity = 0.4
        return lable
    }()
    
    var data: Inspaction!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        contentView.addSubview(backView)
        contentView.addSubview(stackView)
        contentView.addSubview(createddate)
        
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subTitle)
        
        
        backView.anchorView(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: .init(h: 10), paddingLeft: .init(w: 10), paddingBottom: .init(h: 10), paddingRight: .init(w: 10))
        
        createddate.anchorView(right: backView.rightAnchor, paddingRight: .init(w: 15), width: .init(w: 60))
        createddate.centerYAnchor.constraint(equalTo: backView.centerYAnchor).isActive = true
        
        stackView.anchorView(top: backView.topAnchor, left: backView.leftAnchor, bottom: backView.bottomAnchor, right: createddate.leftAnchor, paddingTop: .init(h: 10), paddingLeft: .init(w: 15), paddingBottom: .init(h: 10), paddingRight: .init(w: 15))
        
        
        
    }
    
    func updateData(data: Inspaction){
        title.text = data.title
        subTitle.text = data.subTitle
        createddate.text = data.createdDate
        
    }

}
