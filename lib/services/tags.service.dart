import 'package:app/entities/tag/tag.entity.dart';
import 'package:app/utils/api_client.dart';

class TagService {
  TagService();

  Future<List<TagEntity>> getAllTags() async {
    final result = await globalApiClient.get('/tags');
    if (result.statusCode == 200) {
      final List<TagEntity> tags = [];
      for (var i = 0; i < (result.data as List).length; i++) {
        tags.add(TagEntity.fromJson(result.data[i]));
      }
      return tags;
    } else {
      throw Exception('tags_fetch_failed');
    }
  }
}
