import '/config/all_imports.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomSearchDropDown extends StatelessWidget {
  const CustomSearchDropDown({
    required this.selectedItem,
    required this.items,
    required this.onChangedFunction,
    this.labelText,
    this.hintText,
    required this.labelStyle,
    this.validator,
    super.key,
  });

  final String? selectedItem;
  final String? labelText;
  final String? hintText;
  final List<String> items;
  final Function(String? v) onChangedFunction;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      validator: validator,
      autoValidateMode: AutovalidateMode.onUnfocus,
      items: (filter, loadProps) => items,
      itemAsString: (item) => item,
      compareFn: (item, selectedItem) => item == selectedItem,
      selectedItem: selectedItem,
      onChanged: (String? selectedReason) => onChangedFunction(selectedReason),
      suffixProps: DropdownSuffixProps(
        dropdownButtonProps: DropdownButtonProps(
          padding: EdgeInsetsDirectional.zero,
          iconOpened: Icon(Icons.keyboard_arrow_down_sharp),
          iconClosed: Icon(Icons.keyboard_arrow_down_sharp),
          iconSize: ManagerIconsSizes.i24,
        ),
      ),
      popupProps: PopupProps.menu(
        itemBuilder: (context, item, isDisabled, isSelected) {
          return Container(
            height: ManagerHeight.h36,
            alignment: AlignmentDirectional.centerStart,
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w10,
              end: ManagerWidth.w10,
            ),
            child: Text(
              item,
              textAlign: TextAlign.start,
              style: context.textTheme.textStyleOfInputTextFiled(context),
            ),
          );
        },
        fit: FlexFit.loose,
        menuProps: MenuProps(
          align: MenuAlign.bottomCenter,
          backgroundColor: context.theme.colorScheme.surface,
          margin: EdgeInsets.only(
            bottom: ManagerHeight.h20,
          ),
        ),
        cacheItems: true,
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          style: context.textTheme.textStyleOfInputTextFiled(context),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: ManagerStrings.search,
            hintStyle: context.theme.inputDecorationTheme.hintStyle,
            border: context.theme.inputDecorationTheme.border,
            focusedBorder: context.theme.inputDecorationTheme.border,
            enabledBorder: context.theme.inputDecorationTheme.border,
          ),
        ),
      ),
      dropdownBuilder: (context, selectedItem) {
        return Text(
          selectedItem ?? '',
          style: context.textTheme.textStyleOfInputTextFiled(context),
        );
      },
      decoratorProps: DropDownDecoratorProps(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: labelText,
          isDense: true,
          hintText: hintText,
          hintStyle: labelStyle,
          labelStyle: labelStyle,
          border: context.theme.inputDecorationTheme.border,
          focusedBorder: context.theme.inputDecorationTheme.border,
          enabledBorder: context.theme.inputDecorationTheme.border,
        ),
      ),
    );
  }
}
