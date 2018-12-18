import UIKit
import RxSwift

class ProfileViewController: UIViewController {

  private let disposeBag = DisposeBag()

  var viewModel: ProfileViewModel!

  let profileView = ProfileView.getView()

  override func loadView() {
    view = profileView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Закрыть", style: .done, target: self, action: #selector(dismissTouched))
    setupBinds()
  }

  private func setupBinds() {
    viewModel.userName
      .bind(to: profileView.nameLabel.rx.text)
      .disposed(by: disposeBag)
  }

  @objc private func dismissTouched() {
    viewModel.dismissTouched()
  }
}
