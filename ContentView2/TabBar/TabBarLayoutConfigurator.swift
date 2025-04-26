import UIKit

class TabBarLayoutConfigurator {
    static func configureLayout(for tabBar: UIStackView, in view: UIView) {
        tabBar.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            tabBar.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
