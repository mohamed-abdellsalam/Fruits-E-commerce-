abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentid,
  });
  Future<dynamic> getData({
    required String path,
    String? documentId,
  });

  Future<bool> ifDataExists({
    required String path,
    required String documentId,
  });
}
