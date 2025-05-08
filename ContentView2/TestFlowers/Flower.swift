import UIKit

struct Flower {
    let id: Int
    let image: UIImage?
    let price: Double
    let name: String
    
    static func mockData() -> [Flower] {
        
        [
            Flower(id: 1, image: UIImage(named: "buket1"), price: 2990, name: "Розовый рассвет"),
            Flower(id: 2, image: UIImage(named: "buket2"), price: 2490, name: "Летний ветер"),
            Flower(id: 3, image: UIImage(named: "buket3"), price: 1990, name: "Нежность"),
            Flower(id: 4, image: UIImage(named: "buket4"), price: 3990, name: "Элегантность"),
            Flower(id: 5, image: UIImage(named: "buket5"), price: 2990, name: "Солнечный день"),
            Flower(id: 6, image: UIImage(named: "buket6"), price: 3490, name: "Сияние"),
            Flower(id: 7, image: UIImage(named: "buket7"), price: 1990, name: "Миниатюра"),
            Flower(id: 8, image: UIImage(named: "buket8"), price: 3990, name: "Премиум")
        ]
    }
}
