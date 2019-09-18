//
//  UIView+Extension.swift
//  dryv
//
//  Created by Ahmed M. Hassan on 7/15/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

extension UIView {
    
    func bindToKeyboard(withTapGesture: Bool = false) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        if withTapGesture {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
            self.addGestureRecognizer(tapGesture)
        }
    }
    
    @objc private func keyboardWillChange(_ notification: Notification) {
        
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let cutFrame = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue
        let targetFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        let deltaY = ((targetFrame?.cgRectValue.origin.y)! - (cutFrame?.cgRectValue.origin.y)!)
        
        UIView.animateKeyframes(withDuration: duration!, delay: 0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            
            self.frame.size.height += deltaY
            
        }, completion: nil)
    }
    
    @objc private func handleScreenTap (sender: UITapGestureRecognizer) {
        self.endEditing(true)
    }
    
    func fadeTo(alpha: CGFloat, duration: Double) {
        UIView.animate(withDuration: duration) { 
            self.alpha = alpha
        }
    }
    
    func shakeAnimation() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.transform = CGAffineTransform(rotationAngle: .pi / 10)
            }, completion: { [weak self] (finish) in
                UIView.animate(withDuration: 1, animations: {
                    self?.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
                }, completion: { [weak self] (finishh) in
                    UIView.animate(withDuration: 1, animations: {
                        self?.transform = CGAffineTransform.identity
                    })
                })
        })
    }
    
}
