import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DeetailScreen extends StatefulWidget {
  const DeetailScreen({super.key});

  @override
  State<DeetailScreen> createState() => _DeetailScreenState();
}

class _DeetailScreenState extends State<DeetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    print(arguments['id']);
    return Container();
  }
}
