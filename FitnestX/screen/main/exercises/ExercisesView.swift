//
//  ExercisesView.swift
//  FitnestX
//
//  Created by firecode id2 on 02.08.2022.
//

import UIKit

class ExercisesView : UIView {
    
    let exercises = Exercises.values()
    
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
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        let boldString = NSMutableAttributedString(string: "Упражнения", attributes:attrs)
        title.attributedText = boldString
        title.textColor = Colors.blackPrimary
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        
        let gr = CAGradientLayer()
        gr.cornerRadius = 40
        gr.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        gr.frame = UIScreen.main.bounds
        gr.colors = [Colors.blueLight.cgColor, Colors.blueDark.cgColor]
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
        
        let whiteLineView = UIView()
        self.addSubview(whiteLineView)
        //        whiteLineView.frame = CGRect(x: 0, y: 0, width: 50, height: 5)
        whiteLineView.translatesAutoresizingMaskIntoConstraints = false
        whiteLineView.backgroundColor = .white
        whiteLineView.layer.cornerRadius = 2
        whiteLineView.alpha = 0.5
        NSLayoutConstraint.activate([
            whiteLineView.widthAnchor.constraint(equalToConstant: 50),
            whiteLineView.heightAnchor.constraint(equalToConstant: 5),
            whiteLineView.topAnchor.constraint(equalTo: listBackground.topAnchor, constant: 12),
            whiteLineView.centerXAnchor.constraint(equalTo: listBackground.centerXAnchor)
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
        return exercises.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCell.identifier, for: indexPath) as! ExerciseCell
        cell.data = exercises[indexPath.row]
        return cell
    }
}
