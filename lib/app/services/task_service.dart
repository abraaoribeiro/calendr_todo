import 'package:calendr_todo/app/database/app_database.dart';
import 'package:calendr_todo/app/models/task.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sembast/sembast.dart';

@Injectable()
class TaskService extends Disposable {
  static const String folderName = "Calendr";
  final _calendrFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future<List<Task>> findAll() async {
    final recordSnapshot = await _calendrFolder.find(await _db);
    return recordSnapshot.map((snapshot) {
      final task = Task.fromJson(snapshot.value);
      return task;
    }).toList();
  }

  Future insert(Task task) async {
    await _calendrFolder.add(await _db, task.toJson());
    print("task insertd successfully!!");
  }

  Future update(Task task) async {
    final finder = Finder(filter: Filter.byKey(task.id));
    await _calendrFolder.update(await _db, task.toJson(), finder: finder);
  }

  Future delete(Task task) async {
    final finder = Finder(filter: Filter.byKey(task.id));
    await _calendrFolder.delete(await _db, finder: finder);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
