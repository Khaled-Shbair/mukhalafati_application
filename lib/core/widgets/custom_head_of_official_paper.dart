import '/config/all_imports.dart';

class CustomHeadOfOfficialPaper extends StatelessWidget {
  const CustomHeadOfOfficialPaper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _textOfHeadOfficialPaper(ManagerStrings.titleHeadViolationAr, context),
        Image.asset(
          ManagerAssets.palestineLogo,
          height: ManagerHeight.h53,
          width: ManagerWidth.w42,
        ),
        _textOfHeadOfficialPaper(ManagerStrings.titleHeadViolationEn, context),
      ],
    );
  }
}

Widget _textOfHeadOfficialPaper(String text, BuildContext context) {
  return Expanded(
    child: Text(
      text,
      textAlign: TextAlign.center,
      textScaler: const TextScaler.linear(0.9),
      style: context.textTheme.textStyleOfTextOfHeadOfOfficialPaper(context),
    ),
  );
}
