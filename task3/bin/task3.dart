import 'payment.dart';
import 'dart:io';
void main(){

print("🍕 Welcome to the Pizza Ordering System 🍕");
while(true){
  print('Select an option:');
  print('1. Order Pizza');
  print('2. Pay Order');
  print('3. Exit');
  var option = int.parse(stdin.readLineSync()!);
  if(option == 1){
    print('Select a pizza:');
    print('1. Margherita');
    print('2. Pepperoni');
    print('3. Veggie Pizza');
    var pizzaOption = int.parse(stdin.readLineSync()!);
    print('Select a size:');
    print('1. Small');
    print('2. Medium');
    print('3. Large');
    var sizeOption = int.parse(stdin.readLineSync()!);
    Pizza? pizza;
    switch(pizzaOption){
      case 1:
        pizza = Margherita(PizzaSize.values[sizeOption]);
        break;
      case 2:
        pizza = Pepperoni(PizzaSize.values[sizeOption]);
        break;
      case 3:
        print('Enter additional toppings(If you need)separated by comma:');
        var toppings = stdin.readLineSync()!.split(',');
        pizza = VeggiePizza(PizzaSize.values[sizeOption ], additionalToppings: toppings);
        break;
      default:
        print('Invalid option');
        continue;
    }
    Pizza.DisplayPizza(pizza);
  }
  else if(option == 2){
    print('Enter Order ID:');
    var orderId = stdin.readLineSync();
    print('Enter Customer ID:');
    var customerId = stdin.readLineSync();
    print('Enter Total Price:');
    var totalPrice = double.parse(stdin.readLineSync()!);
    Order order = Order(orderId, customerId, totalPrice);
    order.PayOrder();
  }
  else if(option == 3){
    print("Thank you for using our system >3");
    break;
  }
  else{
    print('Invalid option');
  }
}


}

enum PizzaSize{
  small,
  medium,
  large
}

abstract class Pizza{
  String name;
  PizzaSize size;
  double price;
  List<String> toppings;
  Pizza(this.name, this.price, this.toppings,this.size);
  void show(){
    print('Name: $name');
    print('Price: $price');
    print('Ingredients: $toppings');
  }
  double calculatePrice();
  @override
  static DisplayPizza(Pizza pizza){
    pizza.show();
    print('Total Price: ${pizza.calculatePrice()}');
  }
}


class Margherita extends Pizza{
  Margherita(PizzaSize size):super('Margherita', 100, ['Cheese', 'Tomato'],size);
  @override
  double calculatePrice(){
    if(size == PizzaSize.small){
      return price;
    }
    else if(size == PizzaSize.medium){
      return price + 50;
    }
    else{
      return price + 100;
    }
    return price;
  }
}

class Pepperoni extends Pizza{
  Pepperoni(PizzaSize size):super('Pepperoni', 150, ['Cheese', 'Tomato', 'Pepperoni'],size);
  @override
  double calculatePrice(){
    if(size == PizzaSize.small){
      return price;
    }
    else if(size == PizzaSize.medium){
      return price + 50;
    }
    else{
      return price + 100;
    }
    return price;
  }
}

class VeggiePizza extends Pizza{
  VeggiePizza(PizzaSize size, {required List<String> additionalToppings}):super('Veggie Pizza', 200, ['Cheese', 'Tomato', 'Onion', 'Capsicum', 'Olives'],size);
  @override
  double calculatePrice(){
    
    price += 10 * toppings.length;
    if(size == PizzaSize.small){
      return price;
    }
    else if(size == PizzaSize.medium){
      return price + 50;
    }
    else{
      return price + 100;
    }
    return price;
  }
  
}


