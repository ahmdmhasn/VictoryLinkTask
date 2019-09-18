//
//  RoundedTextField.swift
//  dryv
//
//  Created by Ahmed M. Hassan on 7/15/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

class RoundedTextField: UITextField {
    
    let textRectOffset: CGFloat = 20

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.bounds.height / 2
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: textRectOffset, y: bounds.origin.y, width: self.frame.width -  textRectOffset, height: bounds.size.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: textRectOffset, y: 0, width: self.frame.width -  textRectOffset, height: self.frame.height)
    }
    
}
