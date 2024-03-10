import UIKit
import SnapKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    private var elements: [(title: String, imageName: String, color: UIColor, detailText: String?)] = [
        ("Авиарежим", "airplane.circle.fill", .orange, nil),
        ("Wi-Fi", "wifi.circle.fill", .blue, "Не подключено"),
        ("Bluetooth", "bolt.horizontal.circle.fill", .blue, "Вкл."),
        ("Сотовая связь","antenna.radiowaves.left.and.right.circle.fill", .green, nil),
        ("Режим можема","personalhotspot.circle.fill", .green, nil),
        ("VPN","bolt.horizontal.circle.fill", .blue, nil)
    ]
    
    private var secondSectionElements: [(title: String, imageName: String, color: UIColor)] = [
        ("Уведомления", "bell.circle.fill", .red),
        ("Звуки, тактильные сигналы", "speaker.wave.2.circle.fill", .red),
        ("Не беспокоить", "moon.circle.fill", .systemPurple),
        ("Экранное время", "iphone.circle.fill", .systemPurple),
    ]
    
    private var additionalSectionElements: [(title: String, imageName: String, color: UIColor)] = [
        ("Основные", "gear.circle.fill", .gray),
        ("Пункт Управления", "slider.horizontal.3", .gray),
        ("Экран и Яркость", "sun.max.circle.fill", .blue),
        ("Экран <<Домой>>", "house.circle.fill", .blue),
        ("Универсальный доступ", "figure.walk", .blue),
    ]
    
    // MARK: - Adding Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
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
        titleLabel.textColor = .black
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
            make.top.equalTo(view.safeAreaLayoutGuide).offset(-175)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Table Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return elements.count
        case 1:
            return secondSectionElements.count
        case 2:
            return additionalSectionElements.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        switch indexPath.section {
        case 0:
            let element = elements[indexPath.row]
            cell.textLabel?.text = element.title
            cell.customImageView.image = UIImage(systemName: element.imageName)
            cell.customImageView.tintColor = element.color
            cell.customDetailTextLabel.text = element.detailText
            cell.showSwitch(element.title == "Авиарежим" || element.title == "VPN")
            cell.switchChanged = { [weak self] isOn in
                self?.handleSwitchChange(for: element.title, isOn: isOn)
            }
            if element.title != "Авиарежим" && element.title != "VPN" {
                cell.accessoryType = .disclosureIndicator
            } else {
                cell.accessoryType = .none
            }
        case 1:
            let element = secondSectionElements[indexPath.row]
            cell.textLabel?.text = element.title
            cell.customImageView.image = UIImage(systemName: element.imageName)
            cell.customImageView.tintColor = element.color
            cell.accessoryType = .disclosureIndicator
        case 2:
            let element = additionalSectionElements[indexPath.row]
            cell.textLabel?.text = element.title
            cell.customImageView.image = UIImage(systemName: element.imageName)
            cell.customImageView.tintColor = element.color
            cell.showSwitch(false)
            cell.accessoryType = .disclosureIndicator
        default:
            break
        }
        
        
        return cell
    }
    
    func handleSwitchChange(for title: String, isOn: Bool) {
        
        print("Switch state changed for element '\(title)': \(isOn)")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemGray5
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .systemGray5
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            let element = elements[indexPath.row]
            handleCellSelection(with: element.title)
        case 1:
            let element = secondSectionElements[indexPath.row]
            handleCellSelection(with: element.title)
        case 2:
            let element = additionalSectionElements[indexPath.row]
            handleCellSelection(with: element.title)
        default:
            break
        }
        
        func handleCellSelection(with title: String) {
            print("Вы нажали \(title)")
            
            switch title {
                   case "Не беспокоить":
                       let dndViewController = DoNotDisturbViewController()
                       navigationController?.pushViewController(dndViewController, animated: true)
                   default:
                       let emptyViewController = EmptyViewController()
                       let backButton = UIBarButtonItem()
                       backButton.title = "Назад"
                       navigationItem.backBarButtonItem = backButton
                       navigationController?.pushViewController(emptyViewController, animated: true)
                   }
        }
        
        func doNotDisturbSwitchChanged(isOn: Bool) {
                print("Состояние переключателя изменено для режима «Не беспокоить»: \(isOn)")
            }
    }
}
