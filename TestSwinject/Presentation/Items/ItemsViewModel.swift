import RxSwift

class ItemsViewModel {

  private let itemInteractor: ItemInteractor
  private let disposeBag = DisposeBag()
  let items = BehaviorSubject<[Item]>(value: [])
  var category: Item.Category! {
    didSet {
      self.loadItems()
    }
  }

  var onItemSelected: ((Item) -> Void)?
  var onProfileTouched: (() -> Void)?

  init(itemInteractor: ItemInteractor) {
    self.itemInteractor = itemInteractor
  }

  private func loadItems() {
    itemInteractor.getItems(for: category)
      .subscribe(onSuccess: { (items) in
        self.items.onNext(items)
      }).disposed(by: disposeBag)
  }

  func showItemDetail(_ item: Item) {
    onItemSelected?(item)
  }

  func showProfile() {
    onProfileTouched?()
  }
}
