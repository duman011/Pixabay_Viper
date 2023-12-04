//
//  UIViewController+Ext.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 4.12.2023.
//

import UIKit

extension UIViewController {
    
    // MARK: - Loading Indicator
    func indicatorViewExt(animate: Bool) {
        let loadingViewController = UIViewController()
        let containerView = UIView(frame: loadingViewController.view.bounds)
        
        loadingViewController.view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        UIView.animate(withDuration: 0.05) { containerView.alpha = 0.8 }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        
        containerView.addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
        activityIndicator.startAnimating()
        loadingViewController.modalPresentationStyle  = .overFullScreen
        loadingViewController.modalTransitionStyle    = .crossDissolve
        
        if animate {
            self.present(loadingViewController, animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
