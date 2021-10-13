import 'package:flutter/material.dart';
import 'package:notes_provider_sqlite/helper/note_provider.dart';
import 'package:notes_provider_sqlite/models/note.dart';
import 'package:provider/provider.dart';

class DeletePopUp extends StatelessWidget {
  const DeletePopUp({
    Key key,
    @required this.selectedNote,
  }) : super(key: key);
  final Note selectedNote;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      title: Text('Delete?'),
      content: Text('Do you want to delete the note?'),
      actions: [
        FlatButton(
          child: Text('Yes'),
          onPressed: () {
            Provider.of<NoteProvider>(context, listen: false)
                .deleteNote(selectedNote.id);
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
        FlatButton(
          child: Text('No'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
