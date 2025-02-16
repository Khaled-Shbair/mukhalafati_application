import '/config/all_imports.dart';

class CustomFilterViolationsButton extends StatelessWidget {
  const CustomFilterViolationsButton({
    required this.isPaid,
    required this.isUnPaid,
    required this.isMaximumAmount,
    required this.isMinimumAmount,
    required this.isLatestDate,
    required this.isOldestDate,
    required this.selectMinimumAmountFilter,
    required this.selectMaximumAmountFilter,
    required this.selectLatestDateFilter,
    required this.selectOldestDateFilter,
    required this.selectPaidFilter,
    required this.selectUnPaidFilter,
    required this.cancelFilterButton,
    super.key,
  });

  final bool isPaid;
  final bool isUnPaid;
  final bool isLatestDate;
  final bool isOldestDate;
  final bool isMaximumAmount;
  final bool isMinimumAmount;
  final Function() selectPaidFilter;
  final Function() selectUnPaidFilter;
  final Function() selectMaximumAmountFilter;
  final Function() selectMinimumAmountFilter;
  final Function() selectLatestDateFilter;
  final Function() selectOldestDateFilter;
  final Function() cancelFilterButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ManagerHeight.h40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Card(
              color: context.theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ManagerRadius.r5),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w4,
                  end: ManagerWidth.w4,
                ),
                child: DropdownButton<String>(
                  onChanged: (v) {},
                  isExpanded: true,
                  underline: SizedBox.shrink(),
                  iconSize: ManagerIconsSizes.i0,
                  itemHeight: ManagerHeight.h90,
                  menuWidth: ManagerWidth.w140,
                  padding: EdgeInsets.zero,
                  hint: Row(
                    children: [
                      Image.asset(
                        ManagerAssets.filterIcon,
                        height: ManagerHeight.h21,
                        width: ManagerWidth.w21,
                      ),
                      horizontalSpace(ManagerWidth.w8),
                      Text(
                        ManagerStrings.filter,
                        style: context.textTheme
                            .textStyleOfFilterAndUnFilterButtons(true),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: ManagerIconsSizes.i20,
                      ),
                    ],
                  ),
                  dropdownColor: context.theme.colorScheme.surface,
                  items: [
                    DropdownMenuItem(
                      value: ManagerStrings.status,
                      child: CustomFilterViolationsItem(
                        title: ManagerStrings.status,
                        onChangedCheckBoxFirst: selectPaidFilter,
                        onChangedCheckBoxSecond: selectUnPaidFilter,
                        titleCheckBoxFirst: ManagerStrings.paid,
                        titleCheckBoxSecond: ManagerStrings.unPaid,
                        valueCheckBoxFirst: isPaid,
                        valueCheckBoxSecond: isUnPaid,
                      ),
                    ),
                    DropdownMenuItem(
                      value: ManagerStrings.amount,
                      child: CustomFilterViolationsItem(
                        title: ManagerStrings.amount,
                        onChangedCheckBoxFirst: selectMaximumAmountFilter,
                        onChangedCheckBoxSecond: selectMinimumAmountFilter,
                        titleCheckBoxFirst: ManagerStrings.maximumAmount,
                        titleCheckBoxSecond: ManagerStrings.minimumAmount,
                        valueCheckBoxFirst: isMaximumAmount,
                        valueCheckBoxSecond: isMinimumAmount,
                      ),
                    ),
                    DropdownMenuItem(
                      value: ManagerStrings.date,
                      child: CustomFilterViolationsItem(
                        title: ManagerStrings.date,
                        onChangedCheckBoxFirst: selectLatestDateFilter,
                        onChangedCheckBoxSecond: selectOldestDateFilter,
                        titleCheckBoxFirst: ManagerStrings.latestDate,
                        titleCheckBoxSecond: ManagerStrings.oldestDate,
                        valueCheckBoxFirst: isLatestDate,
                        valueCheckBoxSecond: isOldestDate,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          horizontalSpace(ManagerWidth.w15),
          Expanded(
            child: ElevatedButton(
              onPressed: () => cancelFilterButton,
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size(
                  ManagerWidth.infinity,
                  ManagerHeight.h34,
                ),
                backgroundColor: context.theme.colorScheme.onPrimaryContainer,
                elevation: 0,
                alignment: AlignmentDirectional.center,
                shadowColor: context.theme.unselectedWidgetColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ManagerRadius.r5),
                ),
                padding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w11,
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsetsDirectional.zero,
                horizontalTitleGap: ManagerWidth.w3,
                minTileHeight: ManagerHeight.h0,
                minLeadingWidth: ManagerWidth.w0,
                minVerticalPadding: ManagerWidth.w0,
                leading: Image.asset(
                  ManagerAssets.cancelFilterIcon,
                  height: ManagerHeight.h24,
                  width: ManagerWidth.w24,
                ),
                title: Text(
                  ManagerStrings.cancelFilter,
                  style: context.textTheme
                      .textStyleOfFilterAndUnFilterButtons(false),
                ),
              ),
            ),
          ),
          horizontalSpace(ManagerWidth.w12),
        ],
      ),
    );
  }
}
