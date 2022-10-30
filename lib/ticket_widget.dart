import 'package:flutter/material.dart';

class TicketWidget extends StatefulWidget {
  final double width;
  final double height;
  final double area;
  final Widget child;
  final Color color;
  final bool isCornerRounded;

  const TicketWidget(
      {super.key, required this.width,
        required this.height,
        required this.child,
        required this.area,
        this.color = Colors.white,
        this.isCornerRounded = false});

  @override
  TicketWidgetState createState() => TicketWidgetState();
}

class TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipBehavior: Clip.hardEdge,

      clipper: TicketClipper(area: widget.area),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: widget.isCornerRounded
                ? BorderRadius.circular(20.0)
                : BorderRadius.circular(0.0)
        ),
        child: widget.child,
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  final double area;

  TicketClipper(
      {required this.area});

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

   path.addOval(Rect.fromCircle(
       center: Offset( size.width/2 - area, 0.0), radius: 25.0));
    path.addOval(Rect.fromCircle(
        center: Offset( size.width/2 - area, size.height), radius: 25.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
