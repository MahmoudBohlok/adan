import 'package:flutter/material.dart';

Widget buildActionDialog({BuildContext? context, Function? fun}) {
  return WillPopScope(
    onWillPop: () {
      return Future.value(false);
    },
    child: Dialog(
      insetPadding: EdgeInsets.only(right: 16, left: 16),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsets.only(
                        top: 15, right: 15, left: 15, bottom: 15),
                    child: Text(
                        textAlign: TextAlign.center,
                        "لم تقم بتفعيل الموقع الجغرافي "),
                  ),
                ),
              ],
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 10),
                  // زرار التفعيل
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context!);
                      fun!();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('تفعيل'),
                  ),

                  // المسافة بين الزرين
                  SizedBox(width: 10),

                  // زرار ليس الآن
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context!);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('ليس الآن'),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
