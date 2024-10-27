import 'package:emo_task/home/view_model/astro/astro_view_model.dart';
import 'package:flutter/material.dart';
import 'package:emo_task/core/font_manager.dart';
import 'package:emo_task/core/styles_manager.dart';
import 'package:emo_task/core/values_manager.dart';

class AstroView extends StatelessWidget {
  final AstroViewModel viewModel;

  const AstroView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
      child: Row(
        children: [
          AstroViewComponent(
            date: viewModel.sunrise,
            title: viewModel.getTitle(true),
            image: viewModel.getSunImage(true),
          ),
          Spacer(),
          AstroViewComponent(
            date: viewModel.sunset,
            title: viewModel.getTitle(false),
            image: viewModel.getSunImage(false),
          ),
        ],
      ),
    );
  }
}


class AstroViewComponent extends StatelessWidget {
  final String date;
  final String title;
  final String image;

  const AstroViewComponent({
    Key? key,
    required this.date,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: getRegularStyle(fontSize: FontSize.s14),
        ),
        SizedBox(height: 3),
        Text(
          date,
          style: getSemiBoldStyle(color: Colors.white, fontSize: FontSize.s14),
        ),
        Image.asset(
          image,
          height: AppSize.s120,
        ),
      ],
    );
  }
}
