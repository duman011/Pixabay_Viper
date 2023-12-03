//
//  UIStackView+Ext.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//

import UIKit

extension UIStackView {
    // MARK: - Adding Arranged Subviews
    func addArrangedSubviewsExt(_ views: UIView...) {
        for view in views { addArrangedSubview(view) }
    }
}
