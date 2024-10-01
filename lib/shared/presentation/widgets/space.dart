import 'package:flutter/widgets.dart';

class Space extends StatelessWidget {
  final Widget space;
  const Space._({
    Key? key,
    required this.space,
  }) : super(key: key);

  factory Space.horizontal({double? width}) => Space._(
        space: SizedBox(
          width: width ?? 8,
        ),
      );

  factory Space.vertical({double? height}) => Space._(
        space: SizedBox(
          height: height ?? 8,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return space;
  }
}
