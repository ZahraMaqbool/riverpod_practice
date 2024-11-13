
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorProvider extends StateNotifier<String> {
  CalculatorProvider() : super('');

  void setValues(String value) {
    if (value == "C") {
  
      state = '';
    } else if (value == "AC") {
      
      if (state.isNotEmpty) {
        state = state.substring(0, state.length - 1);
      }
    } else if (value == "=") {
     
      compute();
    } else if (value == "X") {
      
      state += '*';
    } else {
    
      state += value;
    }
  }

  void compute() {
    try {
      
      state = state.interpret().toString();
    } catch (e) {
     
      state = "Error";
    }
  }
}


