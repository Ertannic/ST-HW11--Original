//
//  ViewController.swift
//  ST-HW11-Саралаев ЕржанOriginal
//
//  Created by Ertannic Saralay on 09.03.2024.
//

import UIKit
import SnapKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    private var elements = ["Авиарежим", "Wi-Fi", "Blotooth", "Сотовая связь", "Режим можема", "VPN"]
    
    private var elements: [(title: String, imageName: String, color: UIColor)] = [
        ("Авиарежим", "airplane.circle.fill", .orange),
        ("Wi-Fi", "wifi.circle.fill", .blue),
        ("Bluetooth", "bolt.horizontal.circle.fill", .blue),
        ("Сотовая связь","antenna.radiowaves.left.and.right.circle.fill", .green),
        ("Режим можема","personalhotspot.circle.fill", .green),
        ("VPN","bolt.horizontal.circle.fill", .blue)
    ]
   
    // MARK: - Adding Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
        
    }()
    
    // MARK: - Main screen Settings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleLabel = UILabel()
        titleLabel.text = "Настройки"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black // Устанавливаем желаемый цвет
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20) //
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
                make.top.equalTo(view.safeAreaLayoutGuide).offset(-200) // Adjust the top offset as needed
                make.leading.trailing.bottom.equalToSuperview()
            }
}
    
    // MARK: - Table Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell

        let element = elements[indexPath.row]
        cell.textLabel?.text = element.title
        cell.customImageView.image = UIImage(systemName: element.imageName)
        cell.customImageView.tintColor = element.color

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemGray6
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25 // Устанавливаем высоту заголовка
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .systemGray6
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40 // Устанавливаем высоту подвала
    }
}

