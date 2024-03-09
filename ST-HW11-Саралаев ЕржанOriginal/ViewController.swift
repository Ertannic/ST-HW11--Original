//
//  ViewController.swift
//  ST-HW11-Саралаев ЕржанOriginal
//
//  Created by Ertannic Saralay on 09.03.2024.
//

import UIKit
import SnapKit


class ViewController: UIViewController, UITableViewDataSource {
    
    private var elements = ["Авиарежим", "Wi-Fi", "Blotooth", "Сотовая связь", "Режим можема", "VPN"]
   
    // MARK: - Adding Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        return tableView
        
    }()
    
    // MARK: - Main screen Settings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleLabel = UILabel()
        titleLabel.text = "Настройки"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black // Устанавливаем желаемый цвет
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24) //
        navigationItem.titleView = titleLabel
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupElements()
        setupConstraints()
        
    }
    
    // MARK: - Add setups

    func setupElements() {
        view.addSubview(tableView)
    }

    func setupConstraints() {

        tableView.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(-180) // Adjust the top offset as needed
                make.leading.trailing.bottom.equalToSuperview()
            }
}
    
    // MARK: - Table Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = elements[indexPath.row]
        return cell
    }
}

