import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/calculator_provider.dart';

final calProvider = StateNotifierProvider<CalculatorProvider, String>((ref) {
  return CalculatorProvider();
});

