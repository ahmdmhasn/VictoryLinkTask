//
//  ImagesViewController.swift
//  VictoryLinkTask
//
//  Created by Ahmed M. Hassan on 9/18/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

class ImagesViewController: BaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }

    // MARK: Handlers
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "\(ImageCollectionViewCell.self)")
    }
    
    private var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let insetLeft: CGFloat = 5.0
        let insetRight: CGFloat = 5.0
        layout.sectionInset = UIEdgeInsets(top: 10.0, left: insetLeft, bottom: 5.0, right: insetRight)
        let itemWidth = UIScreen.main.bounds.width / 2 - (insetLeft + insetRight)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 9 / 16)
        return layout
    }
    
    func loadImages() {
        
        showLoading()
        
        // TODO: - Complete loading of photos
        
    }

}


extension ImagesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ImageCollectionViewCell.self)", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        
        cell.delegate = self
        
        return cell
        
    }
    
    
    
    
    
}

extension ImagesViewController: ImageCollectionViewCellDelegate {
    
    func didPressOn(imageView: UIImageView) {
        
    }
    
    
}
