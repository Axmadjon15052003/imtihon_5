import 'package:flutter/material.dart';

class Sales extends StatefulWidget {
  bool isDisable = false;
  final Function() onTap;
  final Widget child;
  Sales({
    Key? key,
    required this.child,
    required this.isDisable,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Sales> createState() => _SaleState();
}

class _SaleState extends State<Sales> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animatedController;
  


  @override
  void initState() {
    animatedController = AnimationController(
      vsync: this, duration: Duration(milliseconds: 250)
      );
    animation = Tween(begin: 1.0, end: 0.95).animate(animatedController);  
    super.initState();
  }
  @override
  void dispose() {
    animatedController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(!widget.isDisable){
           widget.onTap;
        }
      },
      onPanDown: (details) {
        animatedController.forward();
        setState(() {
          
        });
      },
      onPanCancel: () {
        animatedController.reverse();
        setState(() {
          
        });
      },
      onPanEnd: (details) {
        animatedController.reverse();
        setState(() {
          
        });
      },
      child: ScaleTransition(
        scale: animation,
        child: widget.child,
      ),
    );
  }
}