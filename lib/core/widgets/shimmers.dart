import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipes/core/core.dart';
import 'package:shimmer/shimmer.dart';

import '../../configs/configs.dart';

class ShimmerHorizontalList extends StatelessWidget {
  const ShimmerHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.normalize(50),
      child: Shimmer.fromColors(
        baseColor: AppColors.lemonadaColor,
        highlightColor: Colors.white,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(left: AppDimensions.normalize(8)),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: AppDimensions.normalize(43),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  AppDimensions.normalize(7),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Space.xf(1.2);
          },
        ),
      ),
    );
  }
}

class ShimmerGridView extends StatelessWidget {
  const ShimmerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.normalize(6.3)),
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Shimmer.fromColors(
        baseColor: AppColors.lemonadaColor,
        highlightColor: Colors.white,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppDimensions.normalize(6.3),
            mainAxisSpacing: AppDimensions.normalize(6.3),
            childAspectRatio: 3 / 4,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  AppDimensions.normalize(3),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
