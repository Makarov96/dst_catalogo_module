import 'dart:io';

import 'package:dst_catalogo_module/base/basealerts/basedialog/alert_dialog_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseDialog {
  static Future<void> showAlertDialog(
    BuildContext context,
    AlertDialogType alertType, {
    Function()? callback,
  }) async {
    switch (alertType) {
      case AlertDialogType.error:
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Ha sucedido un error'),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '''Ups al parecer ha ocurrido un error, vuelve a intentarlo mas tarde''',
                  ),
                  Center(
                    child: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            );
          },
        );
        break;
      case AlertDialogType.success:
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                '¡Super!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
              ),
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.symmetric(
                vertical: 260.h,
                horizontal: 70,
              ),
              content: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Text(
                    'Has agregado un producto a favoritos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              actionsPadding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: callback,
                  child: const Text(
                    'Ir a verlo',
                  ),
                )
              ],
            );
          },
        );
        break;
      case AlertDialogType.warning:
    
        break;
      case AlertDialogType.loading:
        await showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Cargando ...'),
              insetPadding: EdgeInsets.symmetric(vertical: 260.h),
              content: Stack(
                children: [
                  Center(
                    child: Platform.isIOS
                        ? const CupertinoActivityIndicator()
                        : const CircularProgressIndicator(),
                  )
                ],
              ),
            );
          },
        );
        break;
    }

    // show the dialog
  }
}
