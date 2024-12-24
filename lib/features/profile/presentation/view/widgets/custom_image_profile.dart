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
        child: Container(
          margin: EdgeInsetsDirectional.only(
            top: ManagerHeight.h3,
            bottom: ManagerHeight.h3,
            start: ManagerWidth.w3,
            end: ManagerWidth.w3,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: customCachedNetworkImageProvider(imagePath),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
/*
 CircleAvatar(
          child: CustomCachedNetworkImage(
            imageUrl: imagePath,
            fit: BoxFit.fill,
          ),
          radius: ManagerRadius.r60,
          // backgroundImage: customCachedNetworkImageProvider(imagePath),
        ),
 */
