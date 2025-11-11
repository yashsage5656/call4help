import 'package:flutter/material.dart';

class CardHelper extends StatelessWidget {
  final String title;
  final String sub;
  final Color? color;
  final String icon;
  final CrossAxisAlignment align;

  const CardHelper({
    super.key,
    required this.title,
    required this.sub,
    required this.icon,
    required this.align,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxWidth < 160;

        return AnimatedContainer(
          // curve:Curves.linearToEaseOut,
          duration: const Duration(seconds: 500),
          decoration: BoxDecoration(
            color:  Colors.transparent,
            borderRadius: BorderRadius.circular(16),


          ),
          child:
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: isSmall ? 32 : 36,
                height: isSmall ? 32 : 36,
                fit: BoxFit.contain,
              ),
              SizedBox(height: isSmall ? 6 : 8),
              Text(
                title,
                textAlign: align == CrossAxisAlignment.center
                    ? TextAlign.center
                    : (align == CrossAxisAlignment.start
                    ? TextAlign.start
                    : TextAlign.end),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: isSmall ? 14 : 16,
                  // color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: isSmall ? 2 : 4),
              Text(
                sub,
                textAlign: align == CrossAxisAlignment.center
                    ? TextAlign.center
                    : (align == CrossAxisAlignment.start
                    ? TextAlign.start
                    : TextAlign.end),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: isSmall ? 12 : 14,
                  // color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
