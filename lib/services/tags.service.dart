import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:app/entities/tag/tag.entity.dart';
import 'package:app/utils/get_it.dart';

class TagService {
  late final ApiClient globalApiClient;
  late final EncryptionService encryptionService;
  TagService() {
    globalApiClient = getIt<ApiClient>();
    encryptionService = getIt<EncryptionService>();
  }

  Future<List<TagEntity>> getAllTags() async {
    final result = await globalApiClient.get('/tags');
    if (result.statusCode == 200) {
      final List<TagEntity> tags = [];
      for (var i = 0; i < (result.data as List).length; i++) {
        tags.add(await TagEntity.decrypt(result.data[i], encryptionService));
      }
      return tags;
    } else {
      throw Exception('tags_fetch_failed');
    }
  }

  Future<bool> createTag(TagEntity tag) async {
    final result = await globalApiClient.post('/tags',
        data: await tag.encrypt(encryptionService: encryptionService));
    if (result.statusCode == 201) {
      return true;
    } else {
      throw Exception('tag_create_failed');
    }
  }

  Future<bool> deleteTag(String tagId) async {
    final result = await globalApiClient.delete('/tags/$tagId');
    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception('tag_delete_failed');
    }
  }

  Future<bool> editTag(TagEntity tag) async {
    final result = await globalApiClient.put('/tags/${tag.id}',
        data: await tag.encrypt(encryptionService: encryptionService));
    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception('tag_update_failed');
    }
  }
}
