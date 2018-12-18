import RxSwift

class UserInfoInteractor {
  private let userRepository: UserRepository

  init(userRepository: UserRepository) {
    self.userRepository = userRepository
  }

  func getUserInfo() -> Maybe<UserInfo> {
    return Maybe.create { (maybe) in
      let name = self.userRepository.name
      let userInfo = UserInfo(name: name)
      maybe(.success(userInfo))
      return Disposables.create()
    }
  }
}
