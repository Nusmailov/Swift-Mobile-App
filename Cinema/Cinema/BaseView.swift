//
//  BaseView.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/8/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation

public protocol BaseView : class{
    func showLoading()
    func hideLoading()
    func showError(message : String)
}
