//
//  EmptyViewController.swift
//  ST-HW11-Саралаев ЕржанOriginal
//
//  Created by Ertannic Saralay on 10.03.2024.
//

import UIKit

class EmptyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let backButton = UIBarButtonItem()
        backButton.title = "Назад"
        navigationItem.backBarButtonItem = backButton
        
        let titleLabel = UILabel()
        titleLabel.text = "Error!"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
    }
}
