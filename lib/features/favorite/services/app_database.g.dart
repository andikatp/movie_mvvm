// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

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

  MovieDao? _movieDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `movies` (`Title` TEXT NOT NULL, `Year` TEXT NOT NULL, `Type` TEXT NOT NULL, `imdbID` TEXT NOT NULL, `Poster` TEXT NOT NULL, PRIMARY KEY (`imdbID`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieFavoriteInsertionAdapter = InsertionAdapter(
            database,
            'movies',
            (MovieFavorite item) => <String, Object?>{
                  'Title': item.Title,
                  'Year': item.Year,
                  'Type': item.Type,
                  'imdbID': item.imdbID,
                  'Poster': item.Poster
                }),
        _movieFavoriteDeletionAdapter = DeletionAdapter(
            database,
            'movies',
            ['imdbID'],
            (MovieFavorite item) => <String, Object?>{
                  'Title': item.Title,
                  'Year': item.Year,
                  'Type': item.Type,
                  'imdbID': item.imdbID,
                  'Poster': item.Poster
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieFavorite> _movieFavoriteInsertionAdapter;

  final DeletionAdapter<MovieFavorite> _movieFavoriteDeletionAdapter;

  @override
  Future<List<MovieFavorite>> getMovies() async {
    return _queryAdapter.queryList('SELECT * FROM movies',
        mapper: (Map<String, Object?> row) => MovieFavorite(
            Title: row['Title'] as String,
            Year: row['Year'] as String,
            Type: row['Type'] as String,
            imdbID: row['imdbID'] as String,
            Poster: row['Poster'] as String));
  }

  @override
  Future<void> saveMovie(MovieFavorite movie) async {
    await _movieFavoriteInsertionAdapter.insert(
        movie, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSavedMovie(MovieFavorite movie) async {
    await _movieFavoriteDeletionAdapter.delete(movie);
  }
}
