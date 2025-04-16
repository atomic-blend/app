part of 'tag.bloc.dart';

sealed class TagEvent {
  const TagEvent();
}

final class LoadTags extends TagEvent {
  const LoadTags();
}