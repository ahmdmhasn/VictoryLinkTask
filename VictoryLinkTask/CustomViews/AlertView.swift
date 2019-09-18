//
//  AlertView.swift
//  Aflami
//
//  Created by Ahmed M. Hassan on 8/9/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

protocol AlertViewDelegate: class {
    func dismissButtonTapped(_ button: UIButton)
}

enum AlertImageType {
    case warning
}

class AlertView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!

    @IBOutlet weak var textBackgroundView: UIView!
    
    private weak var delegate: AlertViewDelegate?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    
    private func setupView() {
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        button.addTarget(self, action: #selector(buttonWasPressed(_:)), for: .touchUpInside)
        
        textBackgroundView.layer.cornerRadius = 10
        textBackgroundView.layer.masksToBounds = true
        
        button.layer.cornerRadius = button.bounds.height / 2
        button.layer.masksToBounds = true
        button.setTitle("Dismiss", for: .normal)
    }
 
    @objc func buttonWasPressed(_ sender: UIButton) {
        
        delegate?.dismissButtonTapped(sender)
        
        UIView.animate(withDuration: 0.3, animations: { 
            self.alpha = 0
        }) { (done) in
            self.removeFromSuperview()
        }
    }
    
    func setup(message: String?, button name: String?, delegate: AlertViewDelegate?) {
        
        if let message = message {
            textLabel.text = message
        }
        
        if let name = name {
            button.setTitle(name, for: .normal)
        }
        
        if let delegate = delegate {
            self.delegate = delegate
        }
    }
    
//    func changeAlertImage(to image: AlertImageType) {
//        switch image {
//        case .warning: break
//        }
//    }
}
