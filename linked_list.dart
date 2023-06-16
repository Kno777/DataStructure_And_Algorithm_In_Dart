class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;

  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;
  
  bool _firstPass = true;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;

    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }
    return _currentNode != null;
  }
}

class LinkedList<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;

  // head-first insertion
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  // tail-end insertion
  void append(E value) {
    if (isEmpty) {
      push(value);
      return; 
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }

    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  E? pop(){
    final value = head?.value;
    head = head?.next;

    if (isEmpty) {
      tail = null; 
    }

    return value;
  }

  E? removeLast(){
    if (head?.next == null) return pop();


    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }
    final value = tail?.value;
    tail = current;
    tail?.next = null;

    return value;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;

    if (node.next == tail) {
      tail = node; 
    }

    node.next = node.next?.next;
    return value;
  }

  void reverseLinkedList(){
    Node<E>? currentNode = head;
    Node<E>? prev;
    Node<E>? next;

    while (currentNode != null) {
      next = currentNode.next;
      currentNode.next = prev;
      prev = currentNode;
      currentNode = next;
    }
    head = prev;
  }

  E? findMiddleNode(){
    int count = 0;
    if(isEmpty){
      return head?.value;
    }
    Node<E>? current = head;
    while(current != null){
      count++;
      current = current.next;
    }

    Node<E>? mid = nodeAt(count ~/ 2);
    
    return mid?.value;
  }

  Node<E>? deleteValue(int x)
  {
    if (head == null){
      return head;
    }
    while (head != null && head?.value == x){
      head = head?.next;
      Node<E>? curr = head;
      Node<E>? prev;
  
      while (curr != null) {
        if (curr.value == x) {
          prev?.next = curr.next;
        } else {
          prev = curr;
        }
        curr = curr.next;
      }
    }
    return head;
  }

  @override
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);
}

void main() {
  // final node1 = Node(value: 1);
  // final node2 = Node(value: 2);
  // final node3 = Node(value: 3);

  // node1.next = node2;
  // node2.next = node3;

  // print(node1);

  // final list = LinkedList<int>();
  // list.push(3);
  // list.push(2);
  // list.push(1);
  // print(list);

  // final list = LinkedList<int>();
  // list.append(1);
  // list.push(99);
  // list.append(2);
  // list.append(3);
  // list.push(77);
  // print(list);

  // final list = LinkedList<int>();
  // list.push(3);
  // list.push(2);
  // list.push(1);
  // //list.pop();
  // //list.removeLast();
  // print('Before: $list');
  // var middleNode = list.nodeAt(0)!;
  // list.removeAfter(middleNode);
  // print('After:  $list');

  final list = LinkedList<int>();
  // list.push(5);
  // list.push(4);
  list.push(3);
  list.push(2);
  list.push(1);
  //list.reverseLinkedList();
  //print("The middle value is ${list.findMiddleNode()}");
  list.deleteValue(2);
  for (final element in list) {
    print(element);
  }
}