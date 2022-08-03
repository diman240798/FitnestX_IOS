//
//  WebViewViewController.swift
//  FitnestX
//
//  Created by firecode id2 on 02.08.2022.
//


import UIKit

class WebViewViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let webView = UIWebView()
        self.view.addSubview(webView)
        
        webView.frame = .zero
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            webView.topAnchor.constraint(equalTo: self.view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let url = URL(fileURLWithPath: htmlPath!)
        let request = URLRequest(url: url)
        webView.loadRequest(request)
    }

}
