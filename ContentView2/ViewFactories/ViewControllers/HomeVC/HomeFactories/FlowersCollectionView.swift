import UIKit

final class FlowersCollectionView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let source: [Flower] = Flower.mockData()
    
    private var colletctionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        
        colletctionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletctionView.translatesAutoresizingMaskIntoConstraints = false
        colletctionView.backgroundColor = .clear
        colletctionView.dataSource = self
        colletctionView.delegate = self
        colletctionView.register(FlowerCell.self, forCellWithReuseIdentifier: FlowerCell.identifier)
        
        view.addSubview(colletctionView)
        
        NSLayoutConstraint.activate([
            colletctionView.topAnchor.constraint(equalTo: view.topAnchor),
            colletctionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            colletctionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colletctionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlowerCell.identifier, for: indexPath) as? FlowerCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(flower: source[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 15
        let availableWidht = collectionView.frame.width - (padding * 3)
        let itemWidht = availableWidht / 2
        let itemHeight: CGFloat = itemWidht * 1.5
        return CGSize(width: itemWidht, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
}


