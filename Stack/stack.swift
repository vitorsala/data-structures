// 4.0

internal final class Stack<T> {

  private var items: Array<T?>
  private var index: Int

  internal init(length: Int) {
    self.items = [T?](repeating: nil, count: length)
    self.index = 0
  }

  internal func isEmpty() -> Bool {
    return self.index == 0
  }

  internal func isFull() -> Bool {
    return self.index == self.items.count
  }

  internal func peek() throws -> T? {

    guard !self.isEmpty() else {
      throw StackError.emptyStack(reason: "Cannot peek at an empty stack!")
    }

    return self.items[self.index - 1]
  }

  internal func pop() throws -> T? {

    guard !self.isEmpty() else {
      throw StackError.emptyStack(reason: "Cannot pop from an empty stack!")
    }

    self.index -= 1
    let item: T? = self.items[self.index]
    self.items[self.index] = nil
    return item
  }

  internal func push(item: T?) throws -> Void {

    guard !self.isFull() else {
      throw StackError.fullStack(reason: "Cannot push into a full stack!")
    }

    self.items[self.index] = item
    self.index += 1
  }

  internal func size() -> Int {
    return self.index
  }

}

internal enum StackError: Error {
  case emptyStack(reason: String)
  case fullStack(reason: String)
}
