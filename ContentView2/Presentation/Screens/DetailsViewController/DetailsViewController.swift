import UIKit

class DetailsViewController: UIViewController {
    
    var flower: Flower?
    
    var titleView = "Подробности"
    
    private let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsVerticalScrollIndicator = true
        return $0
    }(UIScrollView())
    
    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let flowerImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
        return $0
    }(UIImageView())
    
    private let nameLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private let priceLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = .systemBlue
        return $0
    }(UILabel())
    
    private let addToCartButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Добавить в корзину", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 12
        $0.addTarget(self, action: #selector(addToCartTapped), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var stackView: UIStackView = {
        $0.addArrangedSubview(flowerImageView)
        $0.addArrangedSubview(nameLabel)
        $0.addArrangedSubview(priceLabel)
        $0.addArrangedSubview(addToCartButton)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 16
        $0.alignment = .leading
        return $0
    }(UIStackView())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureWithFlower()
    }
    
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = titleView
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            flowerImageView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            flowerImageView.heightAnchor.constraint(equalTo: flowerImageView.widthAnchor, multiplier: 0.9),
            
            addToCartButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            addToCartButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureWithFlower() {
        guard let flower = flower else { return }
        
        flowerImageView.image = UIImage(named: flower.imageName)
        nameLabel.text = flower.name
        priceLabel.text = "\(Int(flower.price)) ₽"
    }
    
    @objc private func addToCartTapped() {
        print("Проверка добавления в корзину: \(flower?.name ?? "Не найдено")")
    }
    
}
