//
//  ViewController.swift
//  StarFinderWebNavigation
//
//  Created by Aloc SP11602 on 28/03/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let web = WKWebView(frame: .zero, configuration: webConfiguration)
//        web.navigationDelegate = self
        web.translatesAutoresizingMaskIntoConstraints = false
        return web
    }()

    lazy var contentStackView: UIStackView = {
        
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = 10
        stack.contentMode = .top
        stack.backgroundColor = .systemBackground
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
//        button.tintColor = .systemBackground
//        button.setImage(UIImage(named: "magnifyingglass.circle"), for: .selected)
        button.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        title = "StarFinder"
        view.addSubview(contentStackView)
        view.addSubview(webView)
        configureButton()
        configureContentStackView()
        configureWebView()
    }
    
    @objc
    func handleSearch() {
        let url = URL(string: searchTextField.text!)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    func configureButton() {
        NSLayoutConstraint.activate([
            searchButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureContentStackView() {
        contentStackView.addArrangedSubview(searchTextField)
        contentStackView.addArrangedSubview(searchButton)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentStackView.heightAnchor.constraint(equalToConstant: 40),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureWebView() {
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: contentStackView.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

