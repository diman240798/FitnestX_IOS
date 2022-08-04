//
//  ExerciseCell.swift
//  FitnestX
//
//  Created by firecode id2 on 03.08.2022.
//

import UIKit

class ExerciseCell : UICollectionViewCell {
    
    public static let identifier = "ExerciseCell"
    
    public var data: ExerciseItem? = nil {
        didSet {
            icon.image = UIImage(named: data!.icon)
            nameText.text = data!.text
        }
    }
    
    lazy var icon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameText: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var imageNext: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ic_next")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        self.contentView.addSubview(icon)
        self.contentView.addSubview(nameText)
        self.contentView.addSubview(imageNext)
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameText.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageNext.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            imageNext.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
