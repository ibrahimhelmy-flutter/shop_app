
import 'package:flutter/material.dart';
import 'package:shop_app/data/models/boardig_model.dart';

class BuildOnBoardingItem extends StatelessWidget {
  const BuildOnBoardingItem({
    Key? key,
    required this.context,
    required this.model,
  }) : super(key: key);

  final BuildContext context;
  final BoardingModel model;

  @override
  Widget build(BuildContext context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage("${model.image}"),
            ),
          ),
          SizedBox(height: 30),
          Text(
            "${model.title}",
            style: Theme
                .of(context)
                .textTheme
                .headline5,
          ),
          Text("${model.body}", style: Theme
              .of(context)
              .textTheme
              .headline6),
          SizedBox(height:20),
        ],
      );
}
