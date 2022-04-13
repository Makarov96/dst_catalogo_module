import 'package:dst_catalogo_module/base/basealerts/basedialog/alert_dialog_type.dart';
import 'package:dst_catalogo_module/base/basewidget/base_dialog.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({
    Key? key,
    required this.child,
    this.isLoading = false,
    this.backgroundColor = Colors.white,
    this.floatingActionButton,
  }) : super(key: key);
  final Widget child;
  final bool isLoading;
  final Color backgroundColor;
  final Widget? floatingActionButton;

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  void initState() {
    super.initState();
    ejectAlert();
  }

  void ejectAlert() {
    if (widget.isLoading) {
      BaseDialog.showAlertDialog(context, AlertDialogType.loading);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: Stack(
          children: [widget.child],
        ),
        floatingActionButton: widget.floatingActionButton,
      ),
    );
  }
}
