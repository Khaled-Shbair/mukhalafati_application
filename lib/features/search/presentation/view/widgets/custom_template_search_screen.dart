import '/config/all_imports.dart';

class CustomTemplateSearchScreen extends StatelessWidget {
  const CustomTemplateSearchScreen({
    required this.scaffoldKey,
    required this.endDrawer,
    required this.titleAppBar,
    required this.menuButtonControl,
    required this.textController,
    required this.hintTextFiled,
    required this.maxLengthInput,
    required this.searchButton,
    required this.loading,
    required this.resultStatus,
    required this.resultWidget,
    required this.textOfEmptyResult,
    this.focusNode,
    super.key,
  });

  final FocusNode? focusNode;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget endDrawer;
  final String titleAppBar;
  final TextEditingController textController;
  final int maxLengthInput;
  final String hintTextFiled;
  final String textOfEmptyResult;
  final void Function(BuildContext context) menuButtonControl;
  final void Function(BuildContext context) searchButton;
  final bool loading;
  final bool resultStatus;
  final Widget resultWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      endDrawer: endDrawer,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(titleAppBar),
        actions: [
          CustomMenuButton(() => menuButtonControl(context)),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w20,
          end: ManagerWidth.w20,
          top: ManagerHeight.h30,
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: ManagerHeight.h48,
                  child: Card(
                    color: context.theme.colorScheme.onPrimaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ManagerRadius.r5),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: ManagerWidth.w5,
                        top: ManagerHeight.h4,
                        bottom: ManagerHeight.h4,
                      ),
                      child: Row(
                        children: [
                          CustomButton(
                            onPressed: () => searchButton(context),
                            minWidth: ManagerWidth.w24,
                            height: ManagerHeight.h24,
                            backgroundColor:
                                context.theme.unselectedWidgetColor,
                            highlightColor: context.theme.unselectedWidgetColor,
                            side: BorderSide.none,
                            padding: EdgeInsetsDirectional.zero,
                            child: SvgPicture.asset(ManagerAssets.searchIcon),
                          ),
                          Expanded(
                            child: CustomTextField(
                              focusNode: focusNode,
                              onEditingComplete: () => searchButton(context),
                              contentPadding: EdgeInsetsDirectional.zero,
                              controller: textController,
                              hintText: hintTextFiled,
                              color: context.theme.unselectedWidgetColor,
                              borderColor: context.theme.unselectedWidgetColor,
                              maxLength: maxLengthInput,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (loading == true) ...{
                  Spacer(),
                  CustomLoading(),
                  Spacer(),
                } else if (resultStatus == true && loading == false) ...{
                  verticalSpace(ManagerHeight.h24),
                  resultWidget,
                } else ...{
                  CustomEmptyResultSearch(text: textOfEmptyResult),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
