part of 'tag.bloc.dart';

sealed class TagEvent {
  const TagEvent();
}

final class LoadTags extends TagEvent {
  const LoadTags();
}

final class CreateTag extends TagEvent {
  final TagEntity tag;

  const CreateTag(this.tag);
}