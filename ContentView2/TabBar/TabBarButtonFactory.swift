import UIKit

class TabBarButtonFactory {
    static func getButton(icon: String, tag: Int, action: UIAction) -> UIButton {
        let button = UIButton(primaryAction: action)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: icon)
        config.baseForegroundColor = .black
        config.title = nil

        let iconSize: CGFloat = 40
        config.preferredSymbolConfigurationForImage = .init(pointSize: iconSize, weight: .regular, scale: .default)

        button.configuration = config
        button.tag = tag

        return button
    }
}
