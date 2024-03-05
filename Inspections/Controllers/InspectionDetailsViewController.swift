//
//  InspectionDetailsViewController.swift
//  Inspections
//
//  Created by Appnap Mahfuj on 27/2/24.
//

import UIKit

class InspectionDetailsViewController: UIViewController {

    lazy var  detailsTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.white
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    //MARK: Header's Element
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(systemName: "chevron.backward"), for: .normal)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        button.contentHorizontalAlignment = .leading
        button.tintColor = .black
        return button
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(systemName: "info.circle.fill"), for: .normal)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        button.contentHorizontalAlignment = .trailing
        button.tintColor = UIColor.lightGray.withAlphaComponent(0.8)
        return button
    }()
    
    let header: UILabel = {
        let lable = UILabel()
        lable.text = "Header"
        lable.font = UIFont.boldSystemFont(ofSize: 18)
        lable.textAlignment = .center
        lable.textColor = .black
        return lable
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = .init(w: 10)
        return stack
    }()
    
    
    //MARK: SubHeader's Element
    let subHeaderStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    let subHeader: UILabel = {
        let lable = UILabel()
        lable.text = "subHeader"
        lable.font = UIFont.boldSystemFont(ofSize: 16)
        lable.textAlignment = .left
        lable.textColor = .black
        lable.layer.opacity = 0.5
        return lable
    }()
    
    lazy var detailsButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(systemName: "ellipsis"), for: .normal)
        btn.tintColor = .black
        btn.layer.opacity = 0.5
        btn.addTarget(self, action: #selector(details), for: .touchUpInside)
        return btn
    }()
    
    let headerDetailsStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        return stack
    }()
    
    let subHeaderTitle: UILabel = {
        let lable = UILabel()
        lable.text = "In Progress 18/04/23 at 11.30 AM by Devid."
        lable.font = UIFont.systemFont(ofSize: 12)
        lable.textAlignment = .left
        lable.textColor = .black
        lable.layer.opacity = 0.3
        lable.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return lable
    }()
    
    //MARK: Complete button
    lazy var completeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(systemName: "checkmark"), for: .normal)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = UIColor(hexString: "2C8ACC")
        button.setTitle("Complete", for: .normal)
        button.layer.cornerRadius = 15
        button.contentVerticalAlignment = .center
        return button
    }()
    
    //MARK: InspactionItem List
    var inspactionItems: [InspactionItem]!
    
    
    //MARK: Selections
    var selections: [Bool]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white//UIColor(hexString: "F1F0F0")
        
        view.addSubview(stackView)
        view.addSubview(subHeaderStackView)
        view.addSubview(completeButton)
        stackView.anchorView(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: .init(w: 15), paddingRight: .init(w: 15), height: .init(h: 120))
        stackView.addArrangedSubview(backButton)
        stackView.addArrangedSubview(header)
        stackView.addArrangedSubview(infoButton)
        
        headerDetailsStack.addArrangedSubview(subHeader)
        headerDetailsStack.addArrangedSubview(detailsButton)
        
        subHeaderStackView.addArrangedSubview(headerDetailsStack)
        subHeaderStackView.addArrangedSubview(subHeaderTitle)
        
        
        subHeaderStackView.anchorView(top: stackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: .init(h: 15), paddingLeft: .init(w: 20), paddingRight: .init(w: 20), height: .init(h: 40))
        
        
        //adding table view
        view.addSubview(detailsTableView)
        detailsTableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: "detailsCell")
        detailsTableView.anchorView(top: subHeaderStackView.bottomAnchor, left: view.leftAnchor, bottom: completeButton.topAnchor, right: view.rightAnchor, paddingTop: .init(h: 10), paddingLeft: .init(w: 0), paddingBottom: .init(h: 10), paddingRight: .init(w: 0))
        
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        
        self.detailsTableView.sectionHeaderTopPadding = 0
        selections = Array.init(repeating: false, count: inspactionItems.count)
        
        //Adding complete button
        completeButton.anchorView(top: detailsTableView.bottomAnchor, bottom: view.bottomAnchor, paddingTop: .init(h: 20), paddingBottom: .init(h: 20), width: .init(w: 150), height: .init(h: 35))
        completeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        

        // Do any additional setup after loading the view.
    }
    //MARK: Table Section Header view
    func sectionHeader(_ section: Int) -> UIView{
        let view = UIView(frame: CGRect(x: 0, y: 0, width: detailsTableView.frame.width, height: 40))
        view.backgroundColor =  UIColor(hexString: "F0F1F3")
        
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.text = inspactionItems[section].title
        lbl.textColor = .black
        view.addSubview(lbl)
        lbl.anchorView(left: view.leftAnchor, paddingLeft: .init(w: 20))
        lbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let arrow = UIImageView()
        arrow.image = UIImage.init(systemName: "chevron.down")
        arrow.tintColor = .black
        view.addSubview(arrow)
        arrow.anchorView(right: view.rightAnchor, paddingRight: .init(w: 20))
        arrow.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let gesture = CustomGesture(target: self, action: #selector(self.sectionTapped(_:)))
        gesture.section = section
        view.addGestureRecognizer(gesture)

        view.isUserInteractionEnabled = true

        view.layer.borderWidth = 0.3
        self.view.addSubview(view)

        // function which is triggered when handleTap is called
        return view
    }
    
    
    //MARK: Dismiss
    @objc func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: ellipsis details button
    @objc func details(_ sender: UIButton) {

    }
    
    //MARK: Swipe actions
    private func handleMarkAsCross(_ indexPath: IndexPath) {
        print("Marked as cross")
        inspactionItems[indexPath.section].subItems[indexPath.row].tag = 3
        detailsTableView.reloadRows(at: [indexPath], with: .automatic)
    }

    private func handleMarkAsMinus(_ indexPath: IndexPath) {
        print("Marked as minus")
        inspactionItems[indexPath.section].subItems[indexPath.row].tag = 2
        detailsTableView.reloadRows(at: [indexPath], with: .automatic)
    }

    private func handleMarkToNosign(_ indexPath: IndexPath) {
        print("Moved to nosign")
        inspactionItems[indexPath.section].subItems[indexPath.row].tag = 1
        detailsTableView.reloadRows(at: [indexPath], with: .automatic)
    }

    private func handleMarkToCheck(_ indexPath: IndexPath) {
        print("Mark to Check")
        inspactionItems[indexPath.section].subItems[indexPath.row].tag = 0
        detailsTableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
    
    //MARK: Section Tapped func
    @objc func sectionTapped(_ sender : CustomGesture) {
        print(sender.section)
        selections[sender.section] = !selections[sender.section]
        detailsTableView.reloadSections(IndexSet(integer: sender.section), with: .automatic)
        
    }

}

extension InspectionDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return inspactionItems.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionHeader(section)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .init(h: 40)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return inspactionItems[section].title
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selections[section]{
            return inspactionItems[section].subItems.count
        }
        else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! DetailsTableViewCell
        cell.selectionStyle = .none
        cell.updateData(subItem: inspactionItems[indexPath.section].subItems[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(h: 60)
    }
    //MARK: Did Select functionality
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ImageSliderViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: Texual Actions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // check action
        let check = UIContextualAction(style: .normal,
                                       title: "") { [weak self] (action, view, completionHandler) in
            self?.handleMarkToCheck(indexPath)
            completionHandler(true)
        }
        check.backgroundColor = .green
        check.image = UIImage.init(systemName: "checkmark")
        
        // nosign action
        let nosign = UIContextualAction(style: .destructive,
                                        title: "") { [weak self] (action, view, completionHandler) in
            self?.handleMarkToNosign(indexPath)
            completionHandler(true)
        }
        nosign.backgroundColor = .lightGray
        nosign.image = UIImage.init(systemName: "nosign")
        
        // minus action
        let minus = UIContextualAction(style: .normal,
                                       title: "") { [weak self] (action, view, completionHandler) in
            self?.handleMarkAsMinus(indexPath)
            completionHandler(true)
        }
        minus.backgroundColor = .orange
        minus.image = UIImage.init(systemName: "minus")
        
        // cross action
        let cross = UIContextualAction(style: .normal,
                                       title: "") { [weak self] (action, view, completionHandler) in
            self?.handleMarkAsCross(indexPath)
            completionHandler(true)
        }
        cross.backgroundColor = .red
        cross.image = UIImage.init(systemName: "xmark")
        
        let configuration = UISwipeActionsConfiguration(actions: [check, nosign, minus, cross].reversed())
        
        return configuration
    }
    
    
}

