class AppStrings {
  static const String appName = 'Notes';
  static const String errorPageText =
      'Error occured, please check internet connection and try again';
  static const String errorWidgetText = 'Error occured, please try again';

  /*----------------------------------------------------------------------------
   *                                 Database                                  -
   *----------------------------------------------------------------------------*/

  static const String databaseName = 'notes_database.db';
  static const String notesTableName = 'notes';
  static const String titleColumn = 'title';
  static const String contentColumn = 'content';
  static const String typeColumn = 'type';
  static const String creationTimeColumn = 'creation_time';
  static const String lastUpdateTimeColumn = 'last_update_time';
  static const String colorColumn = 'color';
  static const String fontColorColumn = 'text_color';
  static const String attachmentColumn = 'attachment';

  static const String insertErrorText = 'Error happend while storing note';
}
