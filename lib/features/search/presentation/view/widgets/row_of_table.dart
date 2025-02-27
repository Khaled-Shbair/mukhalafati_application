import '/config/all_imports.dart';

TableRow rowOfTable({
  required String nameRow,
  required String dataAr,
  String? dataEn,
  String? nameRowTwo,
  String? dataRowTwo,
  bool isRow = false,
  bool isName = false,
  required BuildContext context,
}) {
  return TableRow(
    children: [
      Padding(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w9,
          top: ManagerHeight.h9,
          bottom: ManagerHeight.h9,
          end: ManagerWidth.w42,
        ),
        child: isRow
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: _myTextSpan(
                      data: '$nameRow: ',
                      context: context,
                      children: [
                        _myTextSpan(
                          data: dataAr,
                          context: context,
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: _myTextSpan(
                      context: context,
                      data: '${nameRowTwo.onNull()}: ',
                      children: [
                        _myTextSpan(
                          data: dataRowTwo.onNull(),
                          context: context,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : isName
                ? Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: _myTextSpan(
                          data: '$nameRow: ',
                          context: context,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RichText(
                            text: _myTextSpan(
                              data: dataAr,
                              context: context,
                            ),
                          ),
                          RichText(
                            textDirection: TextDirection.ltr,
                            text: _myTextSpan(
                              data: ' ${dataEn.onNull()}',
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : RichText(
                    text: _myTextSpan(
                      data: '$nameRow: ',
                      context: context,
                      children: [
                        _myTextSpan(
                          data: dataAr,
                          context: context,
                        ),
                      ],
                    ),
                  ),
      ),
    ],
  );
}

TextSpan _myTextSpan({
  required String data,
  List<InlineSpan>? children,
  required BuildContext context,
}) {
  return customTextSpan(
    text: data,
    context: context,
    textStyle: TextStyle(
      color: ManagerColors.black,
      fontSize: ManagerFontsSizes.f9,
      fontWeight: ManagerFontWeight.regular,
    ),
    children: children,
  );
}
