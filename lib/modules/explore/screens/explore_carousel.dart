import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/modules/explore/bloc/explore_bloc.dart';

class ExploreCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) => ListView.separated(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(
          indent: 20,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              width: maxWidth * 0.8,
              color: Colors.transparent,
            );
          }
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: maxWidth * 0.8,
              color: index % 2 == 0 ? Colors.blue : Colors.red,
            ),
          );
        },
      ),
    );
  }
}
