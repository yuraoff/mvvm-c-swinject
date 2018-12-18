class ItemRepository {
  func getItems() -> [Item] {
    return [
      Item(id: 1, category: .first),
      Item(id: 2, category: .second),
      Item(id: 3, category: .first),
      Item(id: 4, category: .second),
      Item(id: 5, category: .first),
      Item(id: 6, category: .second),
      Item(id: 7, category: .first),
      Item(id: 8, category: .second),
      Item(id: 9, category: .first)
    ]
  }
}
