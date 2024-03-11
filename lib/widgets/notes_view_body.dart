import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 24,right: 24,bottom: 16),
      child: Column(
        children: [
          CustomAppBar(text: 'Notes', icon: Icons.search),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
