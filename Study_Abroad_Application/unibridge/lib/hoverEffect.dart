import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const HoverText({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          decoration: BoxDecoration(
            color: isHover
                ? const Color(0xFF1D3557) // hover background
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: isHover ? Colors.white : Color(0xFF1D3557),
              ),)
            ,
          ),
        ),
    );
  }
}
