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
    var buttonStack: NSStackView!
    var encryptButton: NSButton!
    var decryptButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    private func setupLayout() {
        configureTextField1()
        configureTextField2()
        configureButtonStack()
        configureEncryptButton()
        configureDecryptButton()
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
    
    private func configureButtonStack() {
        buttonStack = NSStackView()
        view.addSubview(buttonStack)
        
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.orientation = .horizontal
        
        NSLayoutConstraint.activate([
            buttonStack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            buttonStack.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.08),
            buttonStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            buttonStack.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20)
        ])
    }
    
    private func configureEncryptButton() {
        encryptButton = NSButton()
        buttonStack.addArrangedSubview(encryptButton)
        
        encryptButton.translatesAutoresizingMaskIntoConstraints = false
        encryptButton.title = "Зашифровать"
        encryptButton.contentTintColor = .white
        
        NSLayoutConstraint.activate([
            encryptButton.widthAnchor.constraint(equalTo: buttonStack.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3),
            encryptButton.leadingAnchor.constraint(equalTo: buttonStack.leadingAnchor)
        ])
    }

    private func configureDecryptButton() {
        decryptButton = NSButton()
        buttonStack.addArrangedSubview(decryptButton)
        
        decryptButton.translatesAutoresizingMaskIntoConstraints = false
        decryptButton.title = "Расшифровать"
        decryptButton.contentTintColor = .white
        
        NSLayoutConstraint.activate([
            decryptButton.widthAnchor.constraint(equalTo: buttonStack.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3),
            decryptButton.trailingAnchor.constraint(equalTo: buttonStack.trailingAnchor)
        ])
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

