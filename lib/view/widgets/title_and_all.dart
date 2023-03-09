import 'package:flutter/material.dart';

import '../../consts.dart';

class TitleAndAll extends StatelessWidget {
  final String title;
  final Function onPressAll;
  const TitleAndAll({
    Key? key,
    required this.title,
    required this.onPressAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.only(top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: AppConst.sectionTitleStyle)),
          TextButton(
              onPressed: () {
                print("asas");
                onPressAll();
              },
              child: Text("View All",
                  style: AppConst.chipTextStyle.copyWith(
                    color: AppConst.burnedOrange,
                  )))
        ],
      ),
    );
  }
}
