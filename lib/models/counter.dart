class Counter {
  int count = 0;

  void increment() {
    count++;
  }

  void decrement(int number) {
    count >= number ? count -= number : count;
  }

  Counter();
}