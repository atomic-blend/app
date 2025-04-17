import 'dart:async';

import 'package:app/entities/tag/tag.entity.dart';
import 'package:app/services/tags.service.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'tag.event.dart';
part 'tag.state.dart';

class TagBloc extends HydratedBloc<TagEvent, TagState> {
  final TagService _tagService = TagService();
  TagBloc() : super(const TagInitial()) {
    on<LoadTags>(_onLoadTags);
    on<CreateTag>(_onCreateTag);
    on<DeleteTag>(_onDeleteTag);
    on<EditTag>(_onEditTag);
  }

  FutureOr<void> _onLoadTags(LoadTags event, Emitter<TagState> emit) async {
    final prevState = state;
    emit(TagLoading(prevState.tags ?? []));
    try {
      final tags = await _tagService.getAllTags();
      emit(TagsLoaded(tags));
    } catch (e) {
      emit(TagError(prevState.tags ?? [], e.toString()));
    }
  }

  @override
  TagState? fromJson(Map<String, dynamic> json) {
    if (json["tags"] != null) {
      return TagsLoaded(
        (json["tags"] as List).map((e) => TagEntity.fromJson(e)).toList(),
      );
    }
    return const TagInitial();
  }

  @override
  Map<String, dynamic>? toJson(TagState state) {
    if (state is TagsLoaded && state.tags != null) {
      return {"tags": state.tags!.map((e) => e.toJson()).toList()};
    }
    return null;
  }

  FutureOr<void> _onCreateTag(CreateTag event, Emitter<TagState> emit) async {
    final prevState = state;
    emit(TagCreateLoading(prevState.tags ?? []));
    try {
      await _tagService.createTag(event.tag);
      emit(TagCreateSuccess(prevState.tags ?? []));
      add(const LoadTags());
    } catch (e) {
      emit(TagError(prevState.tags ?? [], e.toString()));
    }
  }

  FutureOr<void> _onDeleteTag(DeleteTag event, Emitter<TagState> emit) async {
    final prevState = state;
    emit(TagDeleteLoading(prevState.tags ?? []));
    try {
      await _tagService.deleteTag(event.tagId);
      emit(TagDeleteSuccess(prevState.tags ?? []));
      add(const LoadTags());
    } catch (e) {
      emit(TagError(prevState.tags ?? [], e.toString()));
    }
  }

  FutureOr<void> _onEditTag(EditTag event, Emitter<TagState> emit) async {
    final prevState = state;
    emit(TagEditLoading(prevState.tags ?? []));
    try {
      await _tagService.editTag(event.tag);
      emit(TagEditSuccess(prevState.tags ?? []));
      add(const LoadTags());
    } catch (e) {
      emit(TagError(prevState.tags ?? [], e.toString()));
    }
  }
}
