//
//  UIViewController.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 25/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

fileprivate struct AssociatedObjectKeys {
    static var progress : UInt8 = 0
}

extension UIViewController {
    
    fileprivate var hud : MBProgressHUD? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectKeys.progress) as? MBProgressHUD
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKeys.progress, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func showLoading() {
        hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud?.label.text = "Carregando"
        hud?.mode = .annularDeterminate
    }
    
    func dismissLoading() {
        hud?.hide(animated: true)
    }
}
