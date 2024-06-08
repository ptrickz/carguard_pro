import 'package:carguard_pro/globals/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final String title;
  final bool isGhost;
  final VoidCallback callback;
  final bool enabled;
  const CustomElevatedButton({
    super.key,
    required this.isGhost,
    required this.callback,
    required this.title,
    required this.enabled,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: widget.isGhost ? white : primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: widget.isGhost ? primary : transparent,
              width: 1,
            ),
          ),
        ),
        onPressed: widget.enabled ? widget.callback : null,
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.isGhost ? primary : white,
          ),
        ),
      ),
    );
  }
}
