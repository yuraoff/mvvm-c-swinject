import RxSwift

class ItemDetailsViewModel {

  private let itemInteractor: ItemInteractor
  private let disposeBag = DisposeBag()
  var item: Item! {
    didSet {
      loadItemImage()
    }
  }

  var imageData = BehaviorSubject<Data?>(value: nil)
  var executing = BehaviorSubject<Bool>(value: false)

  init(itemInteractor: ItemInteractor) {
    self.itemInteractor = itemInteractor
  }

  private func loadItemImage() {
    itemInteractor.loadImage(for: item)
      .do(onNext: { (_) in
        self.executing.onNext(false)
      }, onSubscribe: {
        self.executing.onNext(true)
      })
      .subscribe(onSuccess: { (imageData) in
        self.imageData.onNext(imageData)
      }).disposed(by: disposeBag)
  }
}
