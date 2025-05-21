import UIKit

// Используем SOA (сервисно-ориентированный) подход

final class MockFlowersServiсe: FlowersServiceInterface {
    func fetchFlowers() -> [Flower] {
        [
            Flower(id: 1, imageName: "buket1", price: 2990, name: "Розовый рассвет"),
            Flower(id: 2, imageName: "buket2", price: 2490, name: "Летний ветер"),
            Flower(id: 3, imageName: "buket3", price: 1990, name: "Нежность"),
            Flower(id: 4, imageName: "buket4", price: 3990, name: "Элегантность"),
            Flower(id: 5, imageName: "buket5", price: 2990, name: "Солнечный день"),
            Flower(id: 6, imageName: "buket6", price: 3490, name: "Сияние"),
            Flower(id: 7, imageName: "buket7", price: 1990, name: "Миниатюра"),
            Flower(id: 8, imageName: "buket8", price: 3990, name: "Премиум")
        ]
    }
}


