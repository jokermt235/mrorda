abstract class CartState{}
class CartAddState extends CartState{
  int count;
  CartAddState(this.count);
}

class CartInitState extends CartState{
  int count;
  CartInitState(this.count);
}


class CartInitialState extends CartState{
  int count;
  CartInitialState(this.count);
}