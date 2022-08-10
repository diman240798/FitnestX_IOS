//
//  ProgramCell.swift
//  FitnestX
//
//  Created by firecode id2 on 04.08.2022.
//

import UIKit

class ProgramCell : UICollectionViewCell {
    
    public static let identifier = "ProgramCell"
    
    var data: ProgramItem? = nil {
        didSet {
            title.text = data!.name
            subtitle.text =  "\(data!.exercisesCount) упражнений | \(data!.time) минут"
        }
    }
    
    lazy var title: UILabel = {
        let view = UILabel()
        view.textColor = Colors.blackPrimary
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var subtitle: UILabel = {
        let view = UILabel()
        view.textColor = Colors.blackLight
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var whiteBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var moreText: UILabel = {
        let view = UILabel()
        view.text = "Больше"
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        let gr = CAGradientLayer()
        gr.cornerRadius = 20
        gr.frame = self.contentView.bounds
        gr.colors = [Colors.blueLight20.cgColor, Colors.blueDark20.cgColor]
        gr.locations = [0.0, 1.0]
        self.contentView.layer.insertSublayer(gr, at: 0)
        
        self.contentView.addSubview(title)
        self.contentView.addSubview(subtitle)
        self.contentView.addSubview(whiteBackground)
        self.contentView.addSubview(moreText)
        
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
            subtitle.leadingAnchor.constraint(equalTo: title.leadingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            whiteBackground.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 12),
            whiteBackground.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            whiteBackground.widthAnchor.constraint(equalToConstant: 90),
            whiteBackground.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            moreText.centerXAnchor.constraint(equalTo: whiteBackground.centerXAnchor),
            moreText.centerYAnchor.constraint(equalTo: whiteBackground.centerYAnchor)
        ])
    }
}
