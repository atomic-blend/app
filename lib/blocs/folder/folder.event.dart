part of 'folder.bloc.dart';

sealed class FolderEvent {
  const FolderEvent();
}

final class LoadFolders extends FolderEvent {
  const LoadFolders();
}

final class AddFolder extends FolderEvent {
  const AddFolder(this.folder);
  final Folder folder;
}

final class EditFolder extends FolderEvent {
  const EditFolder(this.folder);
  final Folder folder;
}

final class DeleteFolder extends FolderEvent {
  const DeleteFolder(this.folder);
  final Folder folder;
}
