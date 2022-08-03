//
//  ViewController.swift
//  FitnestX
//
//  Created by firecode id2 on 02.08.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
        self.view.addSubview(viewPager)
        
        NSLayoutConstraint.activate([
            viewPager.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            viewPager.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            viewPager.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            viewPager.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.standardAppearance.backgroundColor = .systemBlue
        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    lazy var viewPager: ViewPager = {
        let viewPager = ViewPager()
        
        let view1 = ExercisesView()

        
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        
        let newImageView2 = UIImageView()
        newImageView2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 375)
        view2.addSubview(newImageView2)
        newImageView2.contentMode = .scaleToFill
        newImageView2.image = UIImage(named: "ic_men_program_slice")
        
        let view3 = UIView()
        view3.backgroundColor = .orange
        
        let newImageView3 = UIImageView()
        newImageView3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 375)
        view3.addSubview(newImageView3)
        newImageView3.contentMode = .scaleToFill
        newImageView3.image = UIImage(named: "ic_women_program_slice")
        
        viewPager.pagedView.pages = [
            view1,
            view2,
            view3
        ]
        viewPager.translatesAutoresizingMaskIntoConstraints = false
        return viewPager
    }()
}

