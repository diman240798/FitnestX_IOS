//
//  ProgramView.swift
//  FitnestX
//
//  Created by firecode id2 on 04.08.2022.
//

import UIKit

class ProgramView : UIView {
    
    let programs = [
        ProgramItem("1. Программа на плечи", 15, 32)
    ]
    
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
        
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        let table = UICollectionView(
            frame: .zero,
            collectionViewLayout: flow
        )
        table.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(table)

        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 24),
            table.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            table.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            table.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        table.delegate = self
        table.dataSource = self
        table.register(ProgramCell.self, forCellWithReuseIdentifier: ProgramCell.identifier)
    }
}

extension ProgramView : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: 116)
    }
}

extension ProgramView : UICollectionViewDelegate {
    
    
}

extension ProgramView : UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return programs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgramCell.identifier, for: indexPath) as! ProgramCell
        cell.data = programs[indexPath.row]
        return cell
    }
}
