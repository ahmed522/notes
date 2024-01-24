import 'package:notes/features/notes/model/note_type.dart';
import 'package:notes/global/constants/strings.dart';

class NoteModel {
  final int id;
  String? title;
  String? content;
  NoteType type = NoteType.note;
  DateTime? creationTime;
  DateTime? lastUpdateTime;
  int color = 0xFFFFFFFF;
  int fontColor = 0xFF000000;
  String? attachmentPath;

  NoteModel(this.id);

  Map<String, dynamic> get toJson => {
        'id': id,
        AppStrings.titleColumn: title,
        AppStrings.contentColumn: content,
        AppStrings.typeColumn: type.name,
        AppStrings.creationTimeColumn: creationTime?.toIso8601String(),
        AppStrings.lastUpdateTimeColumn: lastUpdateTime?.toIso8601String(),
        AppStrings.colorColumn: color,
        AppStrings.fontColorColumn: fontColor,
        AppStrings.attachmentColumn: attachmentPath,
      };

  // Named constructor to create a NoteModel from a Map
  NoteModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json[AppStrings.titleColumn],
        content = json[AppStrings.contentColumn],
        type = NoteType.values
            .firstWhere((e) => e.name == json[AppStrings.typeColumn]),
        creationTime = json[AppStrings.creationTimeColumn] != null
            ? DateTime.parse(json[AppStrings.creationTimeColumn])
            : null,
        lastUpdateTime = json[AppStrings.lastUpdateTimeColumn] != null
            ? DateTime.parse(json[AppStrings.lastUpdateTimeColumn])
            : null,
        color = json[AppStrings.colorColumn],
        fontColor = json[AppStrings.fontColorColumn],
        attachmentPath = json[AppStrings.attachmentColumn];
}
