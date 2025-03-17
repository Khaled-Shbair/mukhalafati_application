import 'dart:async';

import '/config/all_imports.dart';

class BoxOfNotification extends StatelessWidget {
  const BoxOfNotification({
    required this.text,
    required this.id,
    required this.delete,
    required this.time,
    required this.isRead,
    super.key,
  });

  final String text;
  final int id;
  final String time;
  final bool isRead;
  final void Function() delete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id.toString()),
      confirmDismiss: (direction) async {
        final completer = Completer<bool>();
        await customConfirmInformationDialog(
          context: context,
          title: ManagerStrings.doYouWantToDeleteNotification,
          textConfirmButton: ManagerStrings.yes,
          textCancelButton: ManagerStrings.no,
          confirmButton: () async {
            delete();
            completer.complete(true);
          },
          closeButton: () {
            context.pop();
            completer.complete(false);
          },
        );
        return await completer.future;
      },
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ManagerRadius.r5),
          color: ManagerColors.error,
        ),
        child: Image.asset(
          ManagerAssets.deleteIcon,
          color: ManagerColors.primaryColor,
          height: ManagerHeight.h22,
          width: ManagerWidth.w22,
        ),
      ),
      child: Container(
        height: ManagerHeight.h98,
        width: ManagerWidth.infinity,
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w10,
          top: ManagerHeight.h10,
          bottom: ManagerHeight.h10,
          end: ManagerWidth.w10,
        ),
        decoration: BoxDecoration(
          color: isRead ? ManagerColors.lotion2 : context.theme.primaryColor,
          borderRadius: BorderRadius.circular(ManagerRadius.r5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                end: ManagerWidth.w15,
              ),
              child: Text(
                text,
                textAlign: TextAlign.start,
                style: context.textTheme
                    .textStyleOfContentOfNotificationMessage(context, isRead),
              ),
            ),
            verticalSpace(ManagerHeight.h6),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Text(
                '${time.replaceFirst('قبل', 'منذ')}',
                textAlign: TextAlign.end,
                style: context.textTheme
                    .textStyleOfTimeOfNotificationMessage(context, isRead),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
