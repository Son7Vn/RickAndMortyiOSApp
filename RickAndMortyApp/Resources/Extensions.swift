//
//  Extensions.swift
//  RickAndMortyApp
//
//  Created by SonGoku on 15/03/2023.
//

import UIKit

//MARK: extension UIView
extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
