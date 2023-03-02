import 'package:bakery/view/widgets/my_rounded_button.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    this.bottomsWithHeight = 75,
    this.bottomsPaddings = 25,
  }) : super(key: key);
  final double bottomsWithHeight;
  final double bottomsPaddings;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppConst.mainWhite,
      toolbarHeight: bottomsWithHeight,
      centerTitle: true,
      title: const Text("Cart", style: AppConst.normalDescriptionStyle),
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
      actions: [
        Container(
          width: bottomsWithHeight,
          padding:
              EdgeInsets.only(right: bottomsPaddings, top: bottomsPaddings),
          // color: Colors.red,
          child: MyRoundButton(
            icon: Icons.filter_alt_outlined,
            fillColor: AppConst.mainWhite,
            onTap: (bool isSelected) {},
            selectionStatus: false,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottomsWithHeight);
}