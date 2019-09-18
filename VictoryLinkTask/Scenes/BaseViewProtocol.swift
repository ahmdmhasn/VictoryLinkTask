//
//  BaseViewProtocol.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/18/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import Foundation

protocol BaseViewProtocol {
    func showAlert(message: String?, button text: String?, delegate: CustomAlertViewDelegate?)
    func showSVSuccess(message: String)
    func showLoading()
    func hideLoading()
}
