import 'package:flutter/material.dart';

dynamic showLoadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 30,
          width: 30,
          child: const CircularProgressIndicator(),
        ),
      );
    },
  );
}
