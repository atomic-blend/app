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