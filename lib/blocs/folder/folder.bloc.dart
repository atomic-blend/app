import 'package:app/entities/folder/folder.entity.dart';
import 'package:app/services/folder_service.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'folder.event.dart';
part 'folder.state.dart';

class FolderBloc extends HydratedBloc<FolderEvent, FolderState> {
  final FolderService _folderService = FolderService();

  FolderBloc() : super(const FolderInitial()) {
    on<LoadFolders>(_onLoadFolders);
    on<AddFolder>(_onAddFolder);
    on<EditFolder>(_onEditFolder);
    on<DeleteFolder>(_onDeleteFolder);
  }

  @override
  FolderState? fromJson(Map<String, dynamic> json) {
    if (json["folders"] != null) {
      return FolderLoaded(
        (json["folders"] as List).map((e) => Folder.fromJson(e)).toList(),
      );
    }
    return const FolderInitial();
  }

  @override
  Map<String, dynamic>? toJson(FolderState state) {
    if (state is FolderLoaded && state.folders != null) {
      return {"folders": state.folders!.map((e) => e.toJson()).toList()};
    }
    return null;
  }

  void _onLoadFolders(LoadFolders event, Emitter<FolderState> emit) async {
    final prevState = state;
    emit(const FolderLoading());
    try {
      final folders = await _folderService.getAllFolders();
      emit(FolderLoaded(folders));
    } catch (e) {
      emit(FolderLoadingError(prevState.folders ?? [], e.toString()));
    }
  }

  void _onAddFolder(AddFolder event, Emitter<FolderState> emit) async {
    final prevState = state;
    emit(FolderCreating(state.folders));
    try {
      await _folderService.createFolder(event.folder);
      emit(FolderCreated(state.folders));
      add(const LoadFolders());
    } catch (e) {
      emit(FolderLoadingError(prevState.folders ?? [], e.toString()));
      add(const LoadFolders());
    }
  }

  void _onEditFolder(EditFolder event, Emitter<FolderState> emit) async {
    final prevState = state;
    emit( FolderUpdating(state.folders));
    try {
      await _folderService.updateFolder(event.folder);
      emit(FolderUpdated(state.folders));
      add(const LoadFolders());
    } catch (e) {
      emit(FolderLoadingError(prevState.folders ?? [], e.toString()));
      add(const LoadFolders());
    }
  }

  void _onDeleteFolder(DeleteFolder event, Emitter<FolderState> emit) async {
    final prevState = state;
    emit(FolderDeleting(state.folders));
    try {
      await _folderService.deleteFolder(event.folder);
      emit(FolderDeleted(state.folders));
      add(const LoadFolders());
    } catch (e) {
      emit(FolderLoadingError(prevState.folders ?? [], e.toString()));
      add(const LoadFolders());
    }
  }
}
