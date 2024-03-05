//
//  ImageSliderViewController.swift
//  Inspections
//
//  Created by Appnap Mahfuj on 28/2/24.
//

import UIKit

class ImageSliderViewController: UIViewController {
    
    let images = ["img1", "img2", "img3", "img1", "img2", "img3", "img1", "img2"]

    //MARK: Custom carousel collection view
    let sliderView: UICollectionView = {
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 0.5
        flowLayout.spacingMode = .fixed(spacing: 20.0)
        let hight = UIScreen.main.bounds.height*0.4977678571
        let width = UIScreen.main.bounds.width*0.7246376812
        flowLayout.itemSize = CGSize(width: width, height: hight)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = false
        cv.isScrollEnabled = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .black
        cv.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "imageCell")
        return cv
    }()
    
    //Cross button -> Dismiss the view
    lazy var crossButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.addTarget(self, action: #selector(crossTaped), for: .touchUpInside)
        button.tintColor = .white
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 40), forImageIn: .normal)
//        button.layer.borderColor = UIColor.white.cgColor
//        button.layer.borderWidth = 1
        return button
    }()
    
    //pageController for knowing the current page location
    lazy var pageController: UIPageControl = {
        let pager = UIPageControl()
        pager.numberOfPages = images.count
        pager.currentPage = 0
        pager.isUserInteractionEnabled = false
        pager.alpha = 0.3
        return pager
    }()
    
                      
    @objc func crossTaped(){
//        dismiss(animated: true, completion: nil)
//        UINavigationController?.popToRootViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
     
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(crossButton)
        view.addSubview(sliderView)
        view.addSubview(pageController)
        
        crossButton.anchorView(top: view.topAnchor, right: view.rightAnchor, paddingTop: .init(h: 40), paddingRight: .init(w: 40))
        
        sliderView.anchorView(top: crossButton.bottomAnchor, left: view.leftAnchor, bottom: pageController.topAnchor, right: view.rightAnchor, paddingTop: .init(h: 10), paddingRight: .init(w: 0))
        
        pageController.anchorView(top: sliderView.bottomAnchor, bottom: view.bottomAnchor ,right: view.rightAnchor, paddingTop: 20, paddingRight: .init(w: 25), height: .init(h: 50))
        pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //setup delegate of collectionView
        sliderView.delegate = self
        sliderView.dataSource = self
        
        

        // Do any additional setup after loading the view.
    }
    

}

extension ImageSliderViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
        cell.imageView.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //reduce 80 for the side gap
        return CGSize(width: collectionView.frame.width-80, height: collectionView.frame.height-20)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //adjusting left, right by 80 for side gap
        return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
    }
    
    //MARK: Finding the current page
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == sliderView else {return}
        let pageWidth = sliderView.frame.size.width-80
        pageController.currentPage = Int((sliderView.contentOffset.x / pageWidth).rounded())
    }
    
    
}
