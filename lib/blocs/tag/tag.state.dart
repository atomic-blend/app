part of 'tag.bloc.dart';

sealed class TagState extends Equatable {
  final List<TagEntity>? tags;
  const TagState(this.tags);

  @override
  List<Object?> get props => [tags];
}

class TagInitial extends TagState {
  const TagInitial() : super(null);
}

class TagLoading extends TagState {
  const TagLoading(List<TagEntity> super.tags);
}

class TagsLoaded extends TagState {
  const TagsLoaded(List<TagEntity> super.tags);

  @override
  List<Object?> get props => [tags];
}

class TagError extends TagState {
  const TagError(List<TagEntity> super.tags, this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}

final class TagCreateLoading extends TagState {
  const TagCreateLoading(List<TagEntity> super.tags);
}

final class TagCreateSuccess extends TagState {
  const TagCreateSuccess(List<TagEntity> super.tags);
}

final class TagDeleteLoading extends TagState {
  const TagDeleteLoading(List<TagEntity> super.tags);
}

final class TagDeleteSuccess extends TagState {
  const TagDeleteSuccess(List<TagEntity> super.tags);
}

final class TagEditLoading extends TagState {
  const TagEditLoading(List<TagEntity> super.tags);
}

final class TagEditSuccess extends TagState {
  const TagEditSuccess(List<TagEntity> super.tags);
}