import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_text_form_field.dart';
import 'package:note_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  bool isSearching = false;

  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      child: Column(
        children: [
          CustomAppBar(
            text: 'Notes',
            icon: isSearching ? Icons.search_off : Icons.search,
            onPressed: () {
              isSearching = !isSearching;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 16,
          ),
          isSearching
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CustomTextFormField(
                    hintText: 'Search Notes',
                    onChange: (data) {
                      BlocProvider.of<NotesCubit>(context)
                          .fetchNotesBySearch(data);
                    },
                  ),
                )
              : const SizedBox(),
          const Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
