//
//  RatingControl.swift
//  Tea Master
//
//  Created by Luis Flores on 4/10/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    private func setupButtons() {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 25.0).isActive = true
        
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        addArrangedSubview(button)
    }
    
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed")
    }
}
