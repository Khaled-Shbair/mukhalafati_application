import '/config/all_imports.dart';

TableRow rowOfTable({
  required String nameRow,
  required String dataAr,
  String? dataEn,
  String? nameRowTwo,
  String? dataRowTwo,
  bool isRow = false,
  bool isName = false,
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
                      children: [
                        _myTextSpan(data: dataAr),
                      ],
                    ),
                  ),
                  RichText(
                    text: _myTextSpan(
                      data: '${nameRowTwo.onNull()}: ',
                      children: [
                        _myTextSpan(data: dataRowTwo.onNull()),
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
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RichText(
                            text: _myTextSpan(data: dataAr),
                          ),
                          RichText(
                            textDirection: TextDirection.ltr,
                            text: _myTextSpan(data: ' ${dataEn.onNull()}'),
                          ),
                        ],
                      ),
                    ],
                  )
                : RichText(
                    text: _myTextSpan(
                      data: '$nameRow: ',
                      children: [
                        _myTextSpan(data: dataAr),
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
}) {
  return textSpan(
    text: data,
    color: ManagerColors.black,
    fontFamily: ManagerFontFamily.cairo,
    fontWeight: ManagerFontWeight.medium,
    fontSize: ManagerFontsSizes.f9,
    children: children,
  );
}
