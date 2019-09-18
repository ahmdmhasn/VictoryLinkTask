//
//  PhotoCollectionViewCell.swift
//  Etadweer
//
//  Created by Ahmed M. Hassan on 9/15/19.
//  Copyright © 2019 Kegham Karsian. All rights reserved.
//

import UIKit

protocol ImageCollectionViewCellDelegate {
    func didPressOn(imageView: UIImageView)
}

class ImageCollectionViewCell: UICollectionViewCell {
    
    lazy var imgView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10.0
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    var delegate: ImageCollectionViewCellDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commitInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commitInit()
    }
    
    func commitInit() {
        contentView.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        imgView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        imgView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

    func setImage(_ stringURL: String) {
        guard let url = URL(string: stringURL) else { return }
        
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        delegate?.didPressOn(imageView: imageView)
    }
    
}
