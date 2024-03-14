//
//  ViewController.swift
//  Inspections
//
//  Created by Appnap Mahfuj on 27/2/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        //register the cell
        mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "mainCell")
        //hide scroll indicator
        mainTableView.showsVerticalScrollIndicator = false
        
        
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inspectionsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableViewCell
        cell.selectionStyle = .none
        cell.updateData(data: inspectionsData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = InspectionDetailsViewController()
        vc.inspactionItems = inspectionsData[indexPath.row].items
        vc.header.text = inspectionsData[indexPath.row].title
        vc.subHeader.text = inspectionsData[indexPath.row].subTitle
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.navigationBar.isHidden = true
        self.present(nav, animated: true)
    }
    
    
    
}
