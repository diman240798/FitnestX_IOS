//
//  ViewPager.swift
//  FitnestX
//
//  Created by firecode id2 on 02.08.2022.
//

import UIKit

class ViewPager: UIView {
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public let pagedView = PagedView()
    
    // MARK: - UI Setup
    private func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(pagedView)
        
        NSLayoutConstraint.activate([
            pagedView.leftAnchor
                .constraint(equalTo: self.leftAnchor),
            pagedView.topAnchor
                .constraint(equalTo: self.topAnchor),
            pagedView.rightAnchor
                .constraint(equalTo: self.rightAnchor),
            pagedView.bottomAnchor
                .constraint(equalTo: self.bottomAnchor)
        ])
    }
}
