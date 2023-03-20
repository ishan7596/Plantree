import 'package:flutter/material.dart';

import '../../../../constant.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.green.shade900),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}