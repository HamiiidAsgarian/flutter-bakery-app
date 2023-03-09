import 'package:bakery/view/screens/details_screen.dart';
import 'package:bakery/view/widgets/heart_button.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';
import '../../model/core_models/product_model.dart';
import 'my_rounded_button.dart';

class HorizontalCard extends StatelessWidget {
  final HorizontalCardStyle? style;
  final Product data;
  const HorizontalCard({
    Key? key,
    this.style = HorizontalCardStyle.show,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // NOTE may cause problem
      // margin: const EdgeInsets.only(
      //     right: 15, bottom: 5, top: 5), //Margin to show shadow
      width: style == HorizontalCardStyle.show
          ? MediaQuery.of(context).size.width - 50
          : double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      // margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          // color: Colors.red,
          boxShadow: const [
            BoxShadow(
                blurRadius: 5,
                color: Color.fromARGB(110, 180, 180, 180),
                spreadRadius: 2)
          ]),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AspectRatio(
                    // widthFactor: 1,
                    aspectRatio: 1,
                    child: Container(
                        color: Colors.white,
                        child: Image.network(data.imageUrl)),
                  ),
                ),
                style == HorizontalCardStyle.counter
                    ? const SizedBox(height: 40, child: RoundConter())
                    : const SizedBox()
              ],
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //data title
                Text(data.title, style: AppConst.productTitleStyle),
                Row(
                  children: [
                    //data left
                    Text(data.left.toString(),
                        style: AppConst.productSubtitleStyle),
                    const Text("  |  ", style: AppConst.productSubtitleStyle),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: AppConst.mainOrange,
                          size: 20,
                        ),
                        //data rate
                        Text(data.rate.toString(),
                            style: AppConst.productSubtitleStyle)
                      ],
                    )
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: '${data.price} ',
                    style: AppConst.productTitleStyle,
                    children: const <TextSpan>[
                      TextSpan(
                        text: '/a piece',
                        style: AppConst.productSubtitleStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              style == HorizontalCardStyle.show
                  ? HeartButton(
                      onTap: (isActive) {},
                    )
                  : MyRoundButton(
                      onTap: (e) {},
                      type: CutomRoundedButtonType.pusher,
                      icon: Icons.delete_outline,
                    ),
              style == HorizontalCardStyle.show
                  ? SizedBox(
                      width: 40,
                      height: 40,
                      child: MyRoundButton(
                          icon: Icons.shopping_bag_outlined,
                          iconSize: 20,
                          onTap: (isSelected) {},
                          selectionStatus: false))
                  : const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}

enum HorizontalCardStyle { counter, show }
