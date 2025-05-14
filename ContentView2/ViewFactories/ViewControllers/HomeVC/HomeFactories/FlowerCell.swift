import UIKit

class FlowerCell: UICollectionViewCell {
    
    static let identifier = "FlowerCell"
 
    private let flowerCellImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        return $0
    }(UIImageView())
    
    
    private let flowerCellText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return $0
    }(UILabel())
    
    
    private let flowerCellPrice: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textAlignment = .right
        return $0
    }(UILabel())
    
    
    private let flowerCellButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("В корзину", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 20
        return $0
    }(UIButton())
    
    
    private lazy var flowerStackView: UIStackView = {
        $0.addArrangedSubview(flowerCellText)
        $0.addArrangedSubview(flowerCellPrice)
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = 8
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(flower: Flower) {
        flowerCellImage.image = flower.image
        flowerCellText.text = flower.name
        flowerCellPrice.text = String(format: "%.0f ₽", flower.price)
    }
    
    private func setupViews() {
        contentView.backgroundColor = .systemGray5
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        
        contentView.addSubview(flowerCellImage)
        contentView.addSubview(flowerStackView)
        contentView.addSubview(flowerCellButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            flowerCellImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            flowerCellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            flowerCellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            flowerCellImage.heightAnchor.constraint(equalTo: flowerCellImage.widthAnchor),
            
            flowerStackView.topAnchor.constraint(equalTo: flowerCellImage.bottomAnchor, constant: 8),
            flowerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            flowerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            flowerCellButton.topAnchor.constraint(equalTo: flowerStackView.bottomAnchor, constant: 8),
            flowerCellButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            flowerCellButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            flowerCellButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -8),
            flowerCellButton.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
}
    
    
    
    
//    private var flowerCellStackView: UIStackView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.backgroundColor = .systemMint
//        $0.layer.cornerRadius = 20
//        $0.clipsToBounds = true
//        $0.axis = .vertical
//        $0.distribution = .fill
//        $0.alignment = .fill
//        $0.spacing = 10
//        return $0
//    }(UIStackView())
//    
//    private var flowerCellImage: UIImageView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.layer.cornerRadius = 20
//        $0.contentMode = .scaleAspectFill
//        $0.clipsToBounds = true
//        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
//        return $0
//    }(UIImageView())
//    
//    private var flowerCellText: UILabel = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.numberOfLines = 0
//        $0.setContentHuggingPriority(.required, for: .vertical)
//        $0.font = .systemFont(ofSize: 14, weight: .medium)
//        return $0
//    }(UILabel())
//    
//    private var flowerCellPrice: UILabel = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.numberOfLines = 0
//        $0.setContentHuggingPriority(.required, for: .vertical)
//        $0.font = .systemFont(ofSize: 16, weight: .bold)
//        return $0
//    }(UILabel())
//    
//    private var flowerCellButton: UIButton = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        $0.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
//        $0.backgroundColor = .systemBlue
//        $0.layer.cornerRadius = 20
//        $0.setTitle("В корзину", for: .normal)
//        $0.setTitleColor(.white, for: .normal)
//        $0.setContentHuggingPriority(.required, for: .vertical)
//        return $0
//    }(UIButton())
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        contentView.addSubview(flowerCellStackView)
//        flowerCellStackView.addArrangedSubview(flowerCellImage)
//        flowerCellStackView.addArrangedSubview(flowerCellText)
//        flowerCellStackView.addArrangedSubview(flowerCellPrice)
//        flowerCellStackView.addArrangedSubview(flowerCellButton)
//        
//        setupConstraints()
//        
//        contentView.backgroundColor = .systemRed
//        contentView.layer.cornerRadius = 20
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setupCell(flower: Flower) {
//        flowerCellImage.image = flower.image
//        flowerCellText.text = flower.name
//        flowerCellPrice.text = String(format: "%.0f ₽", flower.price)
//    }
//    
//    private func setupConstraints() {
//        
//        NSLayoutConstraint.activate([
//            flowerCellStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            flowerCellStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
//            flowerCellStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
//            flowerCellStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
//        ])
//        contentView.clipsToBounds = true
//    }
//}
