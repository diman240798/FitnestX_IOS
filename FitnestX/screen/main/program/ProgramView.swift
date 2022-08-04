//
//  ProgramView.swift
//  FitnestX
//
//  Created by firecode id2 on 04.08.2022.
//

import UIKit

class ProgramView : UIView {
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUi() {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 375)
        self.addSubview(imageView)
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "ic_men_program_slice")
        
        
        let title = UILabel()
        self.addSubview(title)
        title.frame = .zero
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        let boldString = NSMutableAttributedString(string: "Программы тренировок для мужчин", attributes:attrs)
        title.attributedText = boldString

        title.textColor = Colors.blackPrimary
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
