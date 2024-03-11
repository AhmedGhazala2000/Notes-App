import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/helper/show_snack_bar.dart';
import 'package:note_app/models/note_model.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        note.title,
        style: const TextStyle(color: Colors.black, fontSize: 28),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          note.description,
          style: TextStyle(color: Colors.black.withOpacity(.5), fontSize: 16),
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.scale,
            title: 'Deleting...',
            desc: 'Are you sure for delete this note ?',
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              note.delete();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              showSnackBar(context, message: 'Note Deleted Successfully');
            },
          ).show();
        },
        icon: const Icon(
          FontAwesomeIcons.trash,
          color: Colors.black,
        ),
      ),
    );
  }
}
