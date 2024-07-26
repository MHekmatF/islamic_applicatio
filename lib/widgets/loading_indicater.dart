import 'package:flutter/material.dart';

class LoadingIndecater extends StatelessWidget {
  const LoadingIndecater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
