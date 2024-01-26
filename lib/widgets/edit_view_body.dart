import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/helper/show_snack_bar.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_text_form_field.dart';
import 'package:note_app/widgets/edit_colors_list_view.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({
    required this.note,
    super.key,
  });

  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          CustomAppBar(
            text: 'Edit',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save;
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              showSnackBar(context, message: 'Note Edited Successfully');
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 30,
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
            hintText: widget.note.subTitle,
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
    );
  }
}
