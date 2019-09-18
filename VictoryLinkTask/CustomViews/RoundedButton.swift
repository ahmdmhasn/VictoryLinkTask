//
//  RoundedButton.swift
//  dryv
//
//  Created by Ahmed M. Hassan on 7/17/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    /*
    @IBInspectable var isRounded = false {
        didSet {
            setupView()
        }
    }
    */
    @IBInspectable var _backgroundColor: UIColor? {
        didSet {
            layer.backgroundColor = _backgroundColor?.cgColor
        }
    }
    
    @IBInspectable var _textColor: UIColor? {
        didSet {
            setTitleColor(_textColor, for: .normal)
        }
    }

    override func awakeFromNib() {
        setupView()
    }
        
    func setupView() {
        self.layer.cornerRadius = self.layer.bounds.height / 2
        self.layer.shadowRadius = 5.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.15
        self.layer.shadowOffset = CGSize.zero
    }

}
