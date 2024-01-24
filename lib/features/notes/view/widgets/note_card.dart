import 'package:flutter/material.dart';
import 'package:notes/features/notes/model/note_model.dart';
import 'package:notes/global/colors/app_colors.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.pushNamed(
      //   context,
      //   ProductScreen.route,
      //   arguments: product,
      // ),
      child: Card(
        margin: EdgeInsets.zero,
        color: Color(note.color),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                // Container(
                //   width: double.infinity,
                //   height: 100,
                //   decoration: const BoxDecoration(
                //     shape: BoxShape.rectangle,
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(15),
                //       topRight: Radius.circular(15),
                //     ),
                //   ),
                //   margin: const EdgeInsets.all(10.0),
                //   child: Image.file(
                //     Fil(note.attachmentPath),
                //   ),
                // ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 0.3,
                          blurRadius: 1,
                          offset: Offset(0, 0.3),
                        ),
                      ],
                      color: AppColors.secondryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 4.0,
                        top: 3.0,
                        bottom: 1.0,
                        left: 8.0,
                      ),
                      child: Text(
                        note.type.name,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (note.title != null)
                      Text(
                        note.title!,
                        style: const TextStyle(fontSize: 18),
                      ),
                    if (note.content != null)
                      Text(
                        note.content!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black38,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
