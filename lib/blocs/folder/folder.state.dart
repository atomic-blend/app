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