import UIKit
import RxCocoa
import RxSwift

class ItemsViewController: UITableViewController {

  var viewModel: ItemsViewModel!
  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    tableView.dataSource = nil
    tableView.delegate = nil
    setupBinds()
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .done, target: self, action: #selector(profileTouched))
  }

  private func setupBinds() {
    viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "reuseIdentifier", cellType: UITableViewCell.self)) { (row, element, cell) in
      cell.textLabel?.text = element.title
      }.disposed(by: disposeBag)
    tableView.rx
      .modelSelected(Item.self)
      .subscribe(onNext: { (item) in
        self.viewModel.showItemDetail(item)
      }).disposed(by: disposeBag)
  }

  @objc private func profileTouched() {
    viewModel.showProfile()
  }
}
