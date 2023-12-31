// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WeatherDao? _weatherDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WeatherFromDB` (`id` TEXT NOT NULL, `city` TEXT NOT NULL, `temperature` REAL NOT NULL, `windSpeed` REAL NOT NULL, `windDirection` INTEGER NOT NULL, `weatherCode` INTEGER NOT NULL, `isDay` INTEGER NOT NULL, `time` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WeatherDao get weatherDao {
    return _weatherDaoInstance ??= _$WeatherDao(database, changeListener);
  }
}

class _$WeatherDao extends WeatherDao {
  _$WeatherDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _weatherFromDBInsertionAdapter = InsertionAdapter(
            database,
            'WeatherFromDB',
            (WeatherFromDB item) => <String, Object?>{
                  'id': item.id,
                  'city': item.city,
                  'temperature': item.temperature,
                  'windSpeed': item.windSpeed,
                  'windDirection': item.windDirection,
                  'weatherCode': item.weatherCode,
                  'isDay': item.isDay,
                  'time': item.time
                },
            changeListener),
        _weatherFromDBUpdateAdapter = UpdateAdapter(
            database,
            'WeatherFromDB',
            ['id'],
            (WeatherFromDB item) => <String, Object?>{
                  'id': item.id,
                  'city': item.city,
                  'temperature': item.temperature,
                  'windSpeed': item.windSpeed,
                  'windDirection': item.windDirection,
                  'weatherCode': item.weatherCode,
                  'isDay': item.isDay,
                  'time': item.time
                },
            changeListener),
        _weatherFromDBDeletionAdapter = DeletionAdapter(
            database,
            'WeatherFromDB',
            ['id'],
            (WeatherFromDB item) => <String, Object?>{
                  'id': item.id,
                  'city': item.city,
                  'temperature': item.temperature,
                  'windSpeed': item.windSpeed,
                  'windDirection': item.windDirection,
                  'weatherCode': item.weatherCode,
                  'isDay': item.isDay,
                  'time': item.time
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WeatherFromDB> _weatherFromDBInsertionAdapter;

  final UpdateAdapter<WeatherFromDB> _weatherFromDBUpdateAdapter;

  final DeletionAdapter<WeatherFromDB> _weatherFromDBDeletionAdapter;

  @override
  Stream<List<WeatherFromDB>> getAllWeathers() {
    return _queryAdapter.queryListStream('SELECT * FROM WeatherFromDB',
        mapper: (Map<String, Object?> row) => WeatherFromDB(
            city: row['city'] as String,
            temperature: row['temperature'] as double,
            windSpeed: row['windSpeed'] as double,
            windDirection: row['windDirection'] as int,
            weatherCode: row['weatherCode'] as int,
            isDay: row['isDay'] as int,
            time: row['time'] as String),
        queryableName: 'WeatherFromDB',
        isView: false);
  }

  @override
  Future<List<WeatherFromDB>> getAllWeathersInList() async {
    return _queryAdapter.queryList('SELECT * FROM WeatherFromDB',
        mapper: (Map<String, Object?> row) => WeatherFromDB(
            city: row['city'] as String,
            temperature: row['temperature'] as double,
            windSpeed: row['windSpeed'] as double,
            windDirection: row['windDirection'] as int,
            weatherCode: row['weatherCode'] as int,
            isDay: row['isDay'] as int,
            time: row['time'] as String));
  }

  @override
  Future<WeatherFromDB?> getWeatherById(String id) async {
    return _queryAdapter.query('SELECT * FROM WeatherFromDB WHERE id = ?1',
        mapper: (Map<String, Object?> row) => WeatherFromDB(
            city: row['city'] as String,
            temperature: row['temperature'] as double,
            windSpeed: row['windSpeed'] as double,
            windDirection: row['windDirection'] as int,
            weatherCode: row['weatherCode'] as int,
            isDay: row['isDay'] as int,
            time: row['time'] as String),
        arguments: [id]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM WeatherFromDB');
  }

  @override
  Future<void> deleteWeatherById(String id) async {
    await _queryAdapter.queryNoReturn('DELETE FROM WeatherFromDB WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertWeather(WeatherFromDB weather) async {
    await _weatherFromDBInsertionAdapter.insert(
        weather, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateWeather(WeatherFromDB weather) async {
    await _weatherFromDBUpdateAdapter.update(weather, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteWeather(WeatherFromDB weather) async {
    await _weatherFromDBDeletionAdapter.delete(weather);
  }
}
