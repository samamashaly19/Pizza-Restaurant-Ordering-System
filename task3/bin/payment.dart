import 'dart:ffi';

import 'task3.dart';

void main(){


}
class Order{
  String? OrderId;
  String? CustomerId;
  List<String>? Pizza;
  double? totalPrice;

  void _ProcessPayment(double amount){
    print('Processing payment of $amount');
    print('Payment processed successfully');
  }

   Order(String? orderId, String? customerId, double totalPrice, {
     this.OrderId,
     this.CustomerId,
     this.Pizza,
  }) : totalPrice = _calculateTotalPrice(Pizza ?? []); // Calculate total price automatically

  // Helper method to calculate the total price of the order
  static double _calculateTotalPrice(List<String> pizzas) {
    double total = 0.0;
    for (var pizza in pizzas) {
      total += pizza.calculatePrice(); // Use the pizza's calculatePrice method
    }
    return total;
  }

  Void? ConfirmOrder(){
    print('Order Confirmed');
  }
   
  Void? PayOrder(){
    _ProcessPayment(totalPrice!);
    print('Order Confirmed');
  }

  @override
  String DisplayPizza(){
    return 'Order ID: $OrderId, Customer ID: $CustomerId, Total Price: $totalPrice';
  }

  
}

extension on String {
  num calculatePrice() {
    return 0; // Replace with actual price calculation logic
  }
}