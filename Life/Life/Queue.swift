//
//  Queue.swift
//  Life
//
//  Created by Prabhash Singh on 19/08/17.
//  Copyright © 2017 automationlog. All rights reserved.
//

public struct Queue<T> {
  fileprivate var array = [T]()
  fileprivate var maxSize:Int!

  init(size:Int) {
    maxSize=size
  }

  public var isEmpty: Bool {
    return array.isEmpty
  }

  public var count: Int {
    return array.count
  }


  public mutating func enqueue(_ element: T) -> T?{
    if count<maxSize{
      array.append(element)
    }else{
      let item = dequeue()
      array.append( element)
      return item
    }
    return nil
  }

  private mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }

  public nonmutating func getAllItem() -> [T]{
    return array
  }

}
