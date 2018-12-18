import Swinject
import UIKit

class CommonAssembly: Assembly {
  func assemble(container: Container) {
    container.register(ItemRepository.self) { _ in ItemRepository() }
      .inObjectScope(.container)
    container.register(ItemInteractor.self) { (r) in ItemInteractor(itemRepository: r.resolve(ItemRepository.self)!) }
      .inObjectScope(.container)
    container.register(UserRepository.self) { (r) in UserRepository() }
      .inObjectScope(.container)
    container.register(UserInfoInteractor.self) { (r) in
      UserInfoInteractor(userRepository: r.resolve(UserRepository.self)!)
    }.inObjectScope(.container)
  }
}
