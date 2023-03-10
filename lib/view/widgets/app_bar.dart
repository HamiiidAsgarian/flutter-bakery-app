import 'package:bakery/view/widgets/my_rounded_button.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double bottomsWithHeight;
  final double bottomsPaddings;
  final String? title;
  final Widget? action;

  const CustomAppbar({
    Key? key,
    this.bottomsWithHeight = 75,
    this.bottomsPaddings = 25,
    this.title,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppConst.mainWhite,
      toolbarHeight: bottomsWithHeight,
      centerTitle: true,
      title: title != null
          ? Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(title!, style: AppConst.normalDescriptionStyle),
            )
          : null,
      leadingWidth: bottomsWithHeight,
      leading: Container(
        // color: Colors.red,
        padding: EdgeInsets.only(left: bottomsPaddings, top: bottomsPaddings),
        child: FractionallySizedBox(
          alignment: Alignment.centerRight,
          widthFactor: 1,
          child: MyRoundButton(
            icon: Icons.arrow_back_ios_outlined,
            fillColor: AppConst.mainWhite,
            onTap: (bool isSelected) {
              Navigator.pop(context);
            },
            selectionStatus: false,
          ),
        ),
      ),
      actions: [action ?? const SizedBox()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottomsWithHeight);
}
