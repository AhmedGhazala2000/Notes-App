import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> notes = [];

  fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    notes = noteBox.values.toList();
    emit(NotesSuccess());
  }

  fetchNotesBySearch(String data) {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    List<NoteModel> dataList = [];
    for (var note in notes) {
      if (note.title.toLowerCase().contains(data.toLowerCase()) ||
          note.description.toLowerCase().contains(data.toLowerCase())) {
        dataList.add(note);
      }
    }
    notes = dataList;
    emit(NotesSuccess());
  }
}
