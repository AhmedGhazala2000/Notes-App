import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/helper/show_snack_bar.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_text_form_field.dart';
import 'package:note_app/widgets/edit_colors_list_view.dart';

class EditView extends StatefulWidget {
  const EditView({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          CustomAppBar(
            text: 'Edit',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.description = content ?? widget.note.description;
              widget.note.save;
              showSnackBar(context, message: 'Note Edited Successfully');
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onChange: (data) {
              title = data;
            },
            hintText: widget.note.title,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onChange: (data) {
              content = data;
            },
            hintText: widget.note.description,
            maxLines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          EditColorsListView(
            note: widget.note,
          ),
        ],
      ),
    ));
  }
}
