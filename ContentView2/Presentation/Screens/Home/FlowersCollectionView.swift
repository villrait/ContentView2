import UIKit

final class FlowersCollectionView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, FlowerCellDelegate {

    // зависимость закрыта абстракцией (протоколом), соблюдается SOLID + возможность передать разные реализации, напр. для тестирования MockFlowersServiсe, для реальных данных - FlowersServiсe; передаем через инициализатор или свойство
    
    var service: FlowersServiceInterface? = MockFlowersServiсe()
    
    private var source: [Flower] = []//Flower.mockData()
    
    private var colletctionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let service = service else {
            fatalError("FlowersService не установлен") // на случай если вдруг забуду поменять функцию
        }
        source = service.fetchFlowers()
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
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 15
        let availableWidht = collectionView.frame.width - (padding * 3)
        let itemWidht = availableWidht / 2
        
        let screenWidht = UIScreen.main.bounds.size.width
        
        let itemHeight: CGFloat
        
        if screenWidht > 400 { // пока самое рабочее что пришло в голову
            itemHeight = itemWidht * 1.42
        } else {
            itemHeight = itemWidht * 1.5

        }
        
        return CGSize(width: itemWidht, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func openDetails(for flowerCell: FlowerCell) {
        if let indexPath = colletctionView.indexPath(for: flowerCell) {
            
            let detailsVC = DetailsViewController()
            
            detailsVC.flower = source[indexPath.item]
            
            navigationController?.pushViewController(detailsVC, animated: true)
            
        }
    }
}


