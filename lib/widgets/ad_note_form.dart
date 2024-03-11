import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/add_colors_list_view.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 32,
          bottom: 32 + MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'Title',
              onSaved: (data) {
                title = data;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              hintText: 'Description',
              maxLines: 5,
              onSaved: (data) {
                content = data;
              },
            ),
            const SizedBox(
              height: 32,
            ),
            const AddColorsListView(),
            const SizedBox(
              height: 32,
            ),
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      NoteModel note = NoteModel(
                        title: title!,
                        description: content!,
                        date: DateFormat.yMd().add_jm().format(DateTime.now()),
                        color:
                            BlocProvider.of<AddNoteCubit>(context).color.value,
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(note);
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
