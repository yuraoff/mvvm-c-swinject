struct Item {
  enum Category {
    case first, second
  }
  let id: Int
  let category: Category
  var title: String {
    return "Item \(id)"
  }
}
