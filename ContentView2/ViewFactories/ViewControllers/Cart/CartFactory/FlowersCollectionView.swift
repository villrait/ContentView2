import UIKit

final class FlowersCollectionView: UIViewController {
    
    private var collectionView: UICollectionView!
    private let source: [Flower] = Flower.mockData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FlowerCell.self, forCellWithReuseIdentifier: FlowerCell.identifier)
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let padding: CGFloat = 15
        let availableWidth = view.bounds.width - (padding * 2)
        let itemWidth = availableWidth / 2 - 10
        
        layout.itemSize = CGSize(width: itemWidth, height: CGFloat(310))
       // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        return layout
    }
    
}

extension FlowersCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlowerCell.identifier, for: indexPath) as? FlowerCell else {
            return UICollectionViewCell()
        }
        
        cell.setupCell(flower: source[indexPath.item])

        return cell
    }
}
