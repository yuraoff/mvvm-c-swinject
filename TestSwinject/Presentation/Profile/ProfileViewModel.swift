import RxSwift

class ProfileViewModel {
  private let userInfoInteractor: UserInfoInteractor
  let userName = BehaviorSubject<String>(value: "")
  private let disposeBag = DisposeBag()

  var dismissOnTouched: (() -> Void)?

  init(userInfoInteractor: UserInfoInteractor) {
    self.userInfoInteractor = userInfoInteractor
    loadUserInfo()
  }

  func dismissTouched() {
    dismissOnTouched?()
  }

  private func loadUserInfo() {
    userInfoInteractor.getUserInfo()
      .subscribe(onSuccess: { [unowned self] (userInfo) in
        self.userName.onNext(userInfo.name)
      }).disposed(by: disposeBag)
  }
}
