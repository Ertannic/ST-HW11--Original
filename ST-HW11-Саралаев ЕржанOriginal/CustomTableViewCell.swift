
import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let customImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.tintColor = .black // Начальный цвет изображения
            return imageView
        }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           
           // Добавляем UIImageView к ячейке
           contentView.addSubview(customImageView)
           
           // Устанавливаем constraints для изображения
           customImageView.snp.makeConstraints { make in
               make.centerY.equalToSuperview()
               make.leading.equalToSuperview().offset(16)
               make.width.height.equalTo(30) // Устанавливаем размер изображения
           }
        
        // Настраиваем порядок отображения текста и изображения
           textLabel?.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalTo(customImageView.snp.trailing).offset(16)
            }
       }

       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
   }
