import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/edit_view_body.dart';

class EditView extends StatelessWidget {
  const EditView({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditViewBody(
        note: note,
      ),
    );
  }
}
