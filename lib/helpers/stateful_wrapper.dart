import 'package:flutter/material.dart';

class StatefulWrapper extends StatefulWidget {
  final Widget child;
  final Function onInit;
  const StatefulWrapper({Key? key, required this.child, required this.onInit})
      : super(key: key);

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
