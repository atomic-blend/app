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

final class DeleteTag extends TagEvent {
  final String tagId;

  const DeleteTag(this.tagId);
}

final class EditTag extends TagEvent {
  final TagEntity tag;

  const EditTag(this.tag);
}