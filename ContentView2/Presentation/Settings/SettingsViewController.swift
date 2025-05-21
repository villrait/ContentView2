import UIKit

final class SettingsViewController: UIViewController {
    
    let settingsTitle = "Настройки"
    let notificationTitle = "Уведомления"
    let appearanceTitle = "Внешний вид"
    let securityTitle = "Безопасность"
    
    
    enum Constants {
        static let padding: CGFloat = 20
    }
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = settingsTitle
        
        [notificationTitle, appearanceTitle, securityTitle].forEach { title in
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 18)
            stackView.addArrangedSubview(button)
        }
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
        ])
    }
    
    func calculateContentHeight() -> CGFloat {
        view.layoutIfNeeded()
        
        let topPadding = view.safeAreaLayoutGuide.layoutFrame.origin.y + Constants.padding
        let stackViewHeight = stackView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        let bottomPadding = Constants.padding
        let navBarHeight = navigationController?.navigationBar.frame.height ?? 0
        let contentHeight = topPadding + stackViewHeight + bottomPadding + navBarHeight
        
        return contentHeight
        
    }
    
}


