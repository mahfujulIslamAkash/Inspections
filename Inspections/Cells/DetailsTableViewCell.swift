//
//  DetailsTableViewCell.swift
//  Inspections
//
//  Created by Appnap Mahfuj on 28/2/24.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    let icons = [("star", "3"), ("paperclip", "1"), ("text.bubble", "5")]

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = .init(h: 5)
        return stack
    }()
    
    var title: UILabel = {
        let lable = UILabel()
        lable.text = "hello"
        lable.font = UIFont.systemFont(ofSize: 12)
        lable.textColor = .black
        return lable
    }()
    
    //This func will return icon cells
    func iconCell(_ index: Int) -> UIView{
        lazy var view = UIView()
        
        lazy var image = UIImageView()
        image.image = UIImage.init(systemName: icons[index].0)
        image.heightAnchor.constraint(equalToConstant: 15).isActive = true
        image.widthAnchor.constraint(equalToConstant: 15).isActive = true
        image.tintColor = UIColor.lightGray.withAlphaComponent(0.8)
        
        view.addSubview(image)
        image.anchorView(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, width: .init(w: 15), height: .init(h: 15))
        lazy var lable = UILabel()
        lable.text = icons[index].1
        lable.font = UIFont.systemFont(ofSize: 12)
        lable.textColor = .black
        
        view.addSubview(lable)
        lable.anchorView(top: view.topAnchor, left: image.rightAnchor, bottom: view.bottomAnchor, paddingLeft: .init(w: 2), height: .init(h: 15))
        return view
    }
    
    //Define all icon cell
    lazy var starButton: UIView = {
        return iconCell(0)
    }()
    
    lazy var clipButton: UIView = {
        return iconCell(1)
    }()
    
    lazy var textButton: UIView = {
        return iconCell(2)
    }()
    
    let iconCellStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.widthAnchor.constraint(equalToConstant: 90).isActive = true
        return stack
    }()
    
    let colorCode: UIView = {
        let view = UIView()
        return view
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        contentView.addSubview(colorCode)
        contentView.addSubview(stackView)
        
        //stackView arrangement
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(iconCellStackView)
        
        //iconCellStackView arrangement
        iconCellStackView.addArrangedSubview(starButton)
        iconCellStackView.addArrangedSubview(clipButton)
        iconCellStackView.addArrangedSubview(textButton)
        
        stackView.anchorView(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: .init(h: 10), paddingLeft: .init(w: 15), paddingBottom: .init(h: 10), paddingRight: .init(w: 15))
        colorCode.anchorView(top: contentView.topAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, width: .init(w: 5))
    }
    
    func updateData(subItem: SubItem){
        
        title.text = subItem.title
        if subItem.tag == 0{
            colorCode.backgroundColor = .green
        }
        else if subItem.tag == 1{
            colorCode.backgroundColor = .clear
        }
        else if subItem.tag == 2{
            colorCode.backgroundColor = .orange
        }
        else{
            colorCode.backgroundColor = .red
        }
        
    }

}
