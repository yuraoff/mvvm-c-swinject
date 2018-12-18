import UIKit
import RxSwift
import RxCocoa

class ItemDetailsViewController: UIViewController {

  var viewModel: ItemDetailsViewModel!
  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  let activityIndicator: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView()
    indicator.hidesWhenStopped = true
    indicator.style = .whiteLarge
    return indicator
  }()
  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Detail View"
    view.backgroundColor = .gray
    setupView()
    setupBinds()
  }

  private func setupView() {
    title = viewModel.item.title
    imageView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageView)
    imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    view.addSubview(activityIndicator)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }

  private func setupBinds() {
    viewModel.imageData
      .map { $0 == nil ? UIImage() : UIImage(data: $0!) }
      .bind(to: imageView.rx.image)
      .disposed(by: disposeBag)
    viewModel.executing
      .bind(to: activityIndicator.rx.isAnimating)
      .disposed(by: disposeBag)
  }
}
