import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_model.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> initDB() async {
    if (_database != null) return _database!;
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app.db');
    _database = await openDatabase(path, version: 1, onCreate: _createDB);
    return _database!;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        username TEXT PRIMARY KEY,
        full_name TEXT,
        email TEXT UNIQUE,
        password TEXT
      )
    ''');
  }

  Future<int> insertUser(UserModel user) async {
    final db = await initDB();
    return await db.insert('users', user.toMap());
  }

  Future<UserModel?> getUserByEmailAndPassword(
      String email, String password) async {
    final db = await initDB();
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (result.isNotEmpty) return UserModel.fromMap(result.first);
    return null;
  }

  // Test database connection and create a test user
  Future<bool> testConnection() async {
    try {
      final db = await initDB();
      // Try to create a test user
      final testUser = UserModel(
          username: 'test_user',
          fullName: 'Test User',
          email: 'test@example.com',
          password: 'test123');

      // First, check if test user exists
      final existingUser = await db
          .query('users', where: 'email = ?', whereArgs: [testUser.email]);

      if (existingUser.isEmpty) {
        await insertUser(testUser);
        print('✅ Test user created successfully');
      } else {
        print('✅ Test user already exists');
      }

      print('✅ Database connection successful');
      return true;
    } catch (e) {
      print('❌ Database connection failed: $e');
      return false;
    }
  }
}
