part of 'folder.bloc.dart';

sealed class FolderState extends Equatable {
  final List<Folder>? folders;
  const FolderState(this.folders);

  @override
  List<Object?> get props => [folders];
}

class FolderInitial extends FolderState {
  const FolderInitial() : super(null);
}

class FolderLoading extends FolderState {
  const FolderLoading(): super(null);
}

class FolderLoaded extends FolderState {
  const FolderLoaded(List<Folder> super.folders);

  @override
  List<Object?> get props => [folders];
}
class FolderLoadingError extends FolderState {
  const FolderLoadingError(super.folders, this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}

class FolderCreating extends FolderState {
  const FolderCreating(super.folders);
}

class FolderCreated extends FolderState {
  const FolderCreated(super.folders);
}

class FolderUpdating extends FolderState {
  const FolderUpdating(super.folders);
}

class FolderUpdated extends FolderState {
  const FolderUpdated(super.folders);
}

class FolderDeleting extends FolderState {
  const FolderDeleting(super.folders);
}

class FolderDeleted extends FolderState {
  const FolderDeleted(super.folders);
}
