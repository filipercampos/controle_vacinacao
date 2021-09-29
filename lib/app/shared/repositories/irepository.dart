abstract class IRepository<T> {
  Future<void> update(String id, Map<String, dynamic> json);
  Future<void> save(Map<String, dynamic> json, {String? id});
  Future<void> delete(String id);
  Future<T> getById(String id);
  Future<T> getAll();
  Future<T> getAllChildCollection(String did, String collectionPathFather);
}
