import UIKit

class FlowerCell: UICollectionViewCell {
    
    static let identifier = "FlowerCell"
    
    private var flowerCellView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 30
        $0.backgroundColor = .systemGray5
        return $0
    }(UIView())
    
    private var flowerCellImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 20
      //  $0.heightAnchor.constraint(equalToConstant: 200).isActive = true
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return $0
    }(UIImageView())
    
    private var flowerCellText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.setContentHuggingPriority(.required, for: .vertical)
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        return $0
    }(UILabel())
    
    private var flowerCellPrice: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.setContentHuggingPriority(.required, for: .vertical)
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        return $0
    }(UILabel())
    
    private var flowerCellButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
     //   $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        $0.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 20
        $0.setTitle("В корзину", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.setContentHuggingPriority(.required, for: .vertical)
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(flowerCellView)
        flowerCellView.addSubview(flowerCellImage)
        flowerCellView.addSubview(flowerCellText)
        flowerCellView.addSubview(flowerCellPrice)
        flowerCellView.addSubview(flowerCellButton)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(flower: Flower) {
        flowerCellImage.image = flower.image
        flowerCellText.text = flower.name
        flowerCellPrice.text = String(format: "%.0f ₽", flower.price)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            flowerCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            flowerCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            flowerCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            flowerCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            flowerCellImage.topAnchor.constraint(equalTo: flowerCellView.topAnchor, constant: 10),
            flowerCellImage.leadingAnchor.constraint(equalTo: flowerCellView.leadingAnchor, constant: 10),
            flowerCellImage.trailingAnchor.constraint(equalTo: flowerCellView.trailingAnchor, constant: -10),
            flowerCellImage.heightAnchor.constraint(equalTo: flowerCellImage.widthAnchor),
            
            flowerCellText.topAnchor.constraint(equalTo: flowerCellImage.bottomAnchor, constant: 10),
            flowerCellText.leadingAnchor.constraint(equalTo: flowerCellView.leadingAnchor, constant: 10),
            flowerCellText.trailingAnchor.constraint(equalTo: flowerCellView.trailingAnchor, constant: -10),
            
            flowerCellPrice.topAnchor.constraint(equalTo: flowerCellText.bottomAnchor, constant: 10),
            flowerCellPrice.leadingAnchor.constraint(equalTo: flowerCellView.leadingAnchor, constant: 20),
            flowerCellPrice.trailingAnchor.constraint(equalTo: flowerCellView.trailingAnchor, constant: -20),
            
            
            flowerCellButton.topAnchor.constraint(equalTo: flowerCellPrice.bottomAnchor, constant: 10),
            flowerCellButton.leadingAnchor.constraint(equalTo: flowerCellView.leadingAnchor, constant: 10),
            flowerCellButton.trailingAnchor.constraint(equalTo: flowerCellView.trailingAnchor, constant: -10),
            flowerCellButton.bottomAnchor.constraint(equalTo: flowerCellView.bottomAnchor, constant: -10),
            flowerCellButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
}
