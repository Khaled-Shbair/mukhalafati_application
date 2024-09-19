import '/config/all_imports.dart';

class SearchForDriverScreen extends StatelessWidget {
  const SearchForDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ManagerColors.white,
        centerTitle: true,
        surfaceTintColor: ManagerColors.transparent,
        title: Text(
          ManagerStrings.vehicleDrivers,
          style: TextStyle(
            color: ManagerColors.black,
            fontFamily: ManagerFontFamily.cairo,
            fontWeight: ManagerFontWeight.bold,
            fontSize: ManagerFontsSizes.f17,
          ),
        ),
        actions: [
          mainButton(
            onPressed: () {},
            minWidth: ManagerWidth.w30,
            height: ManagerHeight.h30,
            color: ManagerColors.transparent,
            highlightColor: ManagerColors.transparent,
            splashColor: ManagerColors.transparent,
            side: BorderSide.none,
            child: const Icon(
              Icons.menu,
              color: ManagerColors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: GetBuilder<SearchForDriverController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w20,
              end: ManagerWidth.w20,
              top: ManagerHeight.h30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsetsDirectional.only(
                    start: ManagerWidth.w5,
                    top: ManagerHeight.h4,
                    bottom: ManagerHeight.h4,
                  ),
                  decoration: BoxDecoration(
                    color: ManagerColors.lotion,
                    borderRadius: BorderRadius.circular(ManagerRadius.r5),
                  ),
                  child: Row(
                    children: [
                      mainButton(
                        onPressed: () => controller.searchButton(),
                        minWidth: ManagerWidth.w24,
                        height: ManagerHeight.h24,
                        color: ManagerColors.transparent,
                        highlightColor: ManagerColors.transparent,
                        side: BorderSide.none,
                        child: SvgPicture.asset(ManagerAssets.searchIcon),
                        padding: EdgeInsetsDirectional.zero,
                      ),
                      Expanded(
                        child: mainTextField(
                          contentPadding: EdgeInsetsDirectional.zero,
                          controller: controller.licenseNumberController,
                          hintText: ManagerStrings.licenseNumber,
                          color: ManagerColors.lotion,
                          borderColor: ManagerColors.lotion,
                          maxLength: AppConstants.maxLengthOfLicenseNumber,
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.loading == true) ...{
                  myLoading(),
                } else if (controller.result) ...{
                  resultOfDriver(),
                } else ...{
                  emptyResult(
                    text: ManagerStrings
                        .searchForASpecificDriverUsingTheLicenseNumber,
                  ),
                },
              ],
            ),
          );
        },
      ),
    );
  }
}
