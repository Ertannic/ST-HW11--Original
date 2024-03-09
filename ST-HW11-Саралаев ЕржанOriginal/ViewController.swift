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
    
    private lazy var mainLabel: UILabel = {
        let titleText = UILabel()
        titleText.text = "Настройки"
        titleText.textAlignment = .center
        titleText.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleText.textColor = UIColor.black
        
        return titleText
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
        
    }()
    
    // MARK: - Main screen Settings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupElements()
        setupConstraints()
        
    }
    
    // MARK: - Add setups

    func setupElements() {
        view.addSubview(mainLabel)
        view.addSubview(tableView)
    }

    func setupConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(200)
            make.centerX.equalToSuperview()
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(-200)
            make.right.bottom.left.equalToSuperview()
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

// MARK: - Extensions

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.systemGray6

        let headerLabel = UILabel()
        headerLabel.text = " "
        headerView.addSubview(headerLabel)

        headerLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
        }

        return headerView
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.systemGray6

        let footerLabel = UILabel()
        footerLabel.text = " "
        footerView.addSubview(footerLabel)

        footerLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
        }

        return footerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
}
