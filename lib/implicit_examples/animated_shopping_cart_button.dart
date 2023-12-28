import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() {
            isExpanded = !isExpanded;
          }),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: isExpanded ? 80.0 : 200.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: isExpanded ? Colors.blue : Colors.purple,
              borderRadius: BorderRadius.circular(isExpanded ? 10.0 : 30.0),
            ),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isExpanded
                      ? const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                  if (!isExpanded)
                    AnimatedOpacity(
                      opacity: isExpanded ? 0 : 1,
                      duration: const Duration(milliseconds: 1000),
                      child: const Text(
                        'Added to Cart',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.white),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
