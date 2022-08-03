//
//  ExerciseCell.swift
//  FitnestX
//
//  Created by firecode id2 on 03.08.2022.
//

import UIKit

class ExerciseCell : UICollectionViewCell {
    
    public static let identifier = "ExerciseCell"
    
    public var text: String = "" {
        didSet {
            nameText.text = text
        }
    }
    
    lazy var nameText: UILabel = {
        let textView = UILabel()
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 30
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.contentView.addSubview(nameText)
        NSLayoutConstraint.activate([
            nameText.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
