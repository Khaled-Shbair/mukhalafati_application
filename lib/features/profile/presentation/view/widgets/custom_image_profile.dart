import '/config/all_imports.dart';

class CustomImageProfile extends StatelessWidget {
  const CustomImageProfile({
    required this.imagePath,
    super.key,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: ManagerRadius.r66,
      backgroundColor: context.theme.primaryColor,
      child: CircleAvatar(
        radius: ManagerRadius.r64,
        backgroundColor: context.theme.colorScheme.surface,
        child: CircleAvatar(
          radius: ManagerRadius.r60,
          backgroundImage: customCachedNetworkImageProvider(imagePath),
        ),
      ),
    );
  }
}
