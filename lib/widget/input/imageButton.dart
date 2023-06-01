import 'package:flutter/material.dart';

class ImageButton extends StatefulWidget {
  final String title;
  final String assetImage;
  final void Function() onPressed;

  const ImageButton(
      {super.key,
      required this.title,
      required this.assetImage,
      required this.onPressed});

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                widget.assetImage,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.grey.shade200,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
