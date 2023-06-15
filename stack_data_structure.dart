class Stack<E> {
  Stack() : _storage = <E>[];

  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);

  final List<E> _storage;

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  void clear(){
    _storage.clear();
  }

  void reverse(){
    _storage.reversed.toList();
  }

  // ignore: non_constant_identifier_names
  bool BalanceTheParentheses(){
    int count1 = 0;
    int count2 = 0;
    for(final x in _storage){
      if(x == '('){
        count1++;
      }
      if(x == ')'){
        count2++;
      }
    }
    if(count1 >= 1 && count2 >= 1){
      return true;
    } 
    return false;
  }

  E get top => _storage.last;

  E get front => _storage.first;

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

  @override
  String toString() {
    return '--- Top ---\n'
      '${_storage.reversed.join('\n')}'
      '\n-----------';
  }
}


void main() {
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  print(stack);
  stack.pop();
  print(stack);

  const list = ['S', 'M','(', 'O','(','(', 'K', 'E'];
  final smokeStack = Stack.of(list);
  print(smokeStack.BalanceTheParentheses());
  smokeStack.clear();
  print(smokeStack);
}