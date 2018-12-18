import UIKit

class ProfileView: UIView {

  @IBOutlet weak var nameLabel: UILabel!

  static func getView() -> ProfileView {
    return UINib(nibName: "ProfileView", bundle: nil)
      .instantiate(withOwner: self, options: nil).first as! ProfileView
  }

}
