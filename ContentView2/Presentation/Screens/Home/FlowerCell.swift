import UIKit

class FlowerCell: UICollectionViewCell {
    
    static let identifier = "FlowerCell"
 
    weak var delegate: FlowerCellDelegate?
    
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
        //$0.addTarget(self, action: #selector(openDetails), for: .touchUpInside)
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
        setupTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(flower: Flower) {
        flowerCellImage.image = UIImage(named: flower.imageName)
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
    
    private func setupTapped() {
        flowerCellButton.removeTarget(self, action: #selector(tapToBy), for: .touchUpInside) // нужна на время, чтобы кнопка не реагировала ни на что
        addTapGesture()
    }
    
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openDetails))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func openDetails() {
        delegate?.openDetails(for: self)
    }
    
    @objc private func tapToBy() {
        
    }
}

