import 'package:notes/features/notes/model/note_model.dart';
import 'package:notes/features/notes/view/widgets/note_card.dart';
import 'package:notes/global/colors/app_colors.dart';
import 'package:notes/global/constants/images_assets.dart';
import 'package:notes/global/constants/strings.dart';
import 'package:notes/global/functions/common_functions.dart';

import 'package:notes/global/widgets/screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});
  static const String route = 'allProductsScreen';
  @override
  Widget build(BuildContext context) {
    // var cubit = AllProductsCubit.get(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (CommonFunctions.isLightMode(context))
            ? Colors.white
            : AppColors.darkThemeBackgroundColor,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            const ScreenTitle(title: 'Products'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.count(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  childAspectRatio: 1 / 1.32,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 5.0,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    NoteCard(
                        note: NoteModel(0)
                          ..title = 'gfdgdfg'
                          ..content = 'hulji;okpljipjopjpippppi'),
                    NoteCard(
                        note: NoteModel(1)
                          ..title = 'gfdgdfg'
                          ..content = 'hulji;okpljipjopjpippppi'),
                    NoteCard(
                        note: NoteModel(2)
                          ..title = 'gfdgdfg'
                          ..content = 'hulji;okpljipjopjpippppi'),
                    NoteCard(
                        note: NoteModel(3)
                          ..title = 'gfdgdfg'
                          ..content = 'hulji;okpljipjopjpippppi'),
                    NoteCard(
                        note: NoteModel(4)
                          ..title = 'gfdgdfg'
                          ..content = 'hulji;okpljipjopjpippppi'),
                    NoteCard(
                        note: NoteModel(5)
                          ..title = 'gfdgdfg'
                          ..content = 'hulji;okpljipjopjpippppi'),
                    NoteCard(
                        note: NoteModel(6)
                          ..title = 'gfdgdfg'
                          ..content = 'hulji;okpljipjopjpippppi'),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
