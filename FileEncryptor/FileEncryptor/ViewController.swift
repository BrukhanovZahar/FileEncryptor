//
//  ViewController.swift
//  FileEncryptor
//
//  Created by Захар Брюханов on 27.02.2024.
//

import Cocoa

class ViewController: NSViewController {
    
    var textField1: NSTextField!
    var textField2: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    private func setupLayout() {
        configureTextField1()
        configureTextField2()
    }
    
    private func configureTextField1() {
        textField1 = NSTextField()
        view.addSubview(textField1)
        
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField1.textColor = .white
        textField1.placeholderString = "Введите абсолютный путь до файла"
        textField1.alignment = .center
        
        
        NSLayoutConstraint.activate([
            textField1.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5, constant: 0),
            textField1.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.08, constant: 0),
            textField1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textField1.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -20)
        ])
    }
    
    private func configureTextField2() {
        textField2 = NSTextField()
        view.addSubview(textField2)
        
        textField2.translatesAutoresizingMaskIntoConstraints = false
        textField2.textColor = .white
        textField2.placeholderString = "Введите ключ"
        textField2.alignment = .center
        
        NSLayoutConstraint.activate([
            textField2.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5, constant: 0),
            textField2.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.08, constant: 0),
            textField2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textField2.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 20)
        ])
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

