//
//  ExercisesView.swift
//  FitnestX
//
//  Created by firecode id2 on 02.08.2022.
//

import UIKit

class ExercisesView : UIView {
    
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
        self.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 375)
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "ic_exercises_slice")
        
        let title = UILabel()
        self.addSubview(title)
        title.frame = .zero
        title.text = "Упражнения"
        title.textColor = .black
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        
        let colorTop = UIColor(red: 157.0 / 255.0, green: 206.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 146.0 / 255.0, green: 163.0 / 255.0, blue: 253.0 / 255.0, alpha: 1.0).cgColor
        
        let gr = CAGradientLayer()
        gr.cornerRadius = 40
        gr.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        gr.frame = UIScreen.main.bounds
        gr.colors = [colorTop, colorBottom]
        gr.locations = [0.0, 1.0]
        
        let listBackground = UIView()
        self.addSubview(listBackground)
        
        listBackground.layer.insertSublayer(gr, at: 0)
        listBackground.layer.cornerRadius = 40
        listBackground.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        listBackground.frame = .zero
        listBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listBackground.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            listBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            listBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            listBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let tableView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        self.addSubview(tableView)
        tableView.backgroundColor = nil
        tableView.showsVerticalScrollIndicator = false
        tableView.frame = .zero
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: listBackground.topAnchor, constant: 40),
            tableView.bottomAnchor.constraint(equalTo: listBackground.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: listBackground.trailingAnchor, constant: -16),
            tableView.leadingAnchor.constraint(equalTo: listBackground.leadingAnchor, constant: 16)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ExerciseCell.self, forCellWithReuseIdentifier: ExerciseCell.identifier)
    }
}

extension ExercisesView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: 70)
    }
}

extension ExercisesView : UICollectionViewDelegate {
    
}

extension ExercisesView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCell.identifier, for: indexPath) as! ExerciseCell
        cell.text = "Плечи"
        return cell
    }
    
    
}
