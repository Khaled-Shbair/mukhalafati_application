import '/config/all_imports.dart';

class CustomVerificationImage extends StatelessWidget {
  const CustomVerificationImage({
    required this.isIncorrect,
    super.key,
  });

  final bool isIncorrect;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isIncorrect,
      replacement: SvgPicture.asset(
        ManagerAssets.verificationImage,
        height: ManagerHeight.h203,
        width: ManagerWidth.w290,
      ),
      child: Image.asset(
        ManagerAssets.inputIncorrect,
        height: ManagerHeight.h185,
        width: ManagerWidth.w187,
      ),
    );
  }
}
