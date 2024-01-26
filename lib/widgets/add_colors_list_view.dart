import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/widgets/color_item.dart';

class AddColorsListView extends StatefulWidget {
  const AddColorsListView({Key? key}) : super(key: key);

  @override
  State<AddColorsListView> createState() => _AddColorsListViewState();
}

class _AddColorsListViewState extends State<AddColorsListView> {
  int? currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
                BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
              },
              child: ColorItem(
                isActive: currentIndex == index,
                color: kColors[index],
              ),
            );
          }),
    );
  }
}
