import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipes/configs/configs.dart';
import 'package:recipes/core/core.dart';

PreferredSizeWidget customAppBar({
  required GlobalKey<ScaffoldState> scaffoldKey,
}) {
  return PreferredSize(
    preferredSize: Size(
      double.infinity,
      AppDimensions.normalize(35),
    ),
    child: Padding(
      padding: Space.all(1.5, 2.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              log("drawer tapped");
              scaffoldKey.currentState?.openDrawer();
            },
            child: Image.asset(
              AppAssets.menu,
              width: AppDimensions.normalize(10),
            ),
          ),
          Image.asset(
            AppAssets.appBar,
            width: AppDimensions.normalize(27),
          ),
          Image.asset(
            AppAssets.profile,
            width: AppDimensions.normalize(14),
          ),
        ],
      ),
    ),
  );
}
