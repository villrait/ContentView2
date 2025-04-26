import UIKit

class TabBarFactory {
    static func createTabBar(actionHandler: TabBarActionHandler) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 35
        stackView.layer.opacity = 0.75
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let сartView = TabBarButtonFactory.getButton(icon: "cart", tag: 0, action: actionHandler.action)
        let heart = TabBarButtonFactory.getButton(icon: "heart", tag: 1, action: actionHandler.action)
        let creditCard = TabBarButtonFactory.getButton(icon: "creditcard", tag: 2, action: actionHandler.action)

        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(сartView)
        stackView.addArrangedSubview(heart)
        stackView.addArrangedSubview(creditCard)
        stackView.addArrangedSubview(UIView())

        return stackView
    }
}
