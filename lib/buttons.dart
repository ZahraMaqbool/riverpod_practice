import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/custom_button.dart';
import 'package:riverpod_practice/provider.dart';

class CalculatorPage extends ConsumerWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String displayText = ref.watch(calProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
        
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20),
                child: Text(
                  displayText.isEmpty ? "0" : displayText,
                  style: const TextStyle(color: Colors.white, fontSize: 50),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
           
            Expanded(
              flex: 7,
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButtonRow(ref, ["7", "8", "9", "/"]),
                    _buildButtonRow(ref, ["4", "5", "6", "X"]),
                    _buildButtonRow(ref, ["1", "2", "3", "-"]),
                    _buildButtonRow(ref, ["C", "0", ".", "+"]),
                    _buildButtonRow(ref, ["AC", "="]),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _buildButtonRow(WidgetRef ref, List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((button) {
        return CustomButton(
          child: Text(
            button,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          onTap: () => ref.read(calProvider.notifier).setValues(button),
        );
      }).toList(),
    );
  }
}
