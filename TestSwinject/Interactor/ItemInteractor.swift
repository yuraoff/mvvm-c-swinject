import RxSwift

class ItemInteractor {
  private let itemRepository: ItemRepository

  init(itemRepository: ItemRepository) {
    self.itemRepository = itemRepository
  }

  func getItems(for category: Item.Category) -> Single<[Item]> {
    switch category {
    case .first: return getFirstItems()
    case .second: return getSecondItems()
    }
  }

  private func getFirstItems() -> Single<[Item]> {
    return Single.create { (single) in
      let items = self.itemRepository.getItems().filter{ $0.category == .first }
      single(.success(items))
      return Disposables.create()
    }
  }

  private func getSecondItems() -> Single<[Item]> {
    return Single.create { (single) in
      let items = self.itemRepository.getItems().filter{ $0.category == .second }
      single(.success(items))
      return Disposables.create()
    }
  }

  func loadImage(for item: Item) -> Maybe<Data> {
    return Maybe.create { (maybe) in
      URLSession.shared.dataTask(with: URL(string: "https://hsto.org/webt/ta/ub/t6/taubt6cqzz4_lviz88jbgih3jf4.jpeg")!) { (data, _, _) in
        if let data = data {
          sleep(2)
          maybe(.success(data))
        } else {
          maybe(.completed)
        }
      }.resume()
      return Disposables.create()
    }
  }

}
