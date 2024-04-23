import 'dart:io';

import 'package:daily_reminder/database/db_entities.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DBTools{

  static const String create_card = """
  CREATE TABLE Cards (  
    id INTEGER PRIMARY KEY,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    description TEXT,
    is_reversable INTEGER DEFAULT 0,
    last_reviewed_date TEXT,
    interval INTEGER DEFAULT 1,
    next_review_date TEXT
  );
  """;

  static const String create_review="""
  CREATE TABLE ReviewSchedule (
    id INTEGER PRIMARY KEY,
    card_id INTEGER NOT NULL,
    due_date TEXT NOT NULL,
    interval INTEGER NOT NULL,
    FOREIGN KEY (card_id) REFERENCES Cards (id)
  );
  """;

  static Future<void> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'my_database.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(create_card);
          await db.execute(create_review);
        },
        onOpen: (Database db) async {
          print('Database opened');
        },
        onConfigure: (Database db) async {

        }

    );

    print('Database initialized');
  }

  static getDatabase()  async {
    return openDatabase(join(await getDatabasesPath(), 'my_database.db'));
  }

  static Future<CardEntity> insertCard(CardEntity card) async {
    Database database = await DBTools.getDatabase();
    int id = await database.insert('Cards', card.toMap());
    // return card.copyWith(id: id);
    return card;
  }

  static Future<List> getAllCards() async {
    Database database = await DBTools.getDatabase();
    List<Map<String, Object?>> cards = await database.query('Cards');
    return cards.map((card) => CardEntity.fromMap(card)).toList();
  }

  static updateCard(CardEntity card) async {
    Database database = await DBTools.getDatabase();
    await database.update('Cards', card.toMap(), where: 'id = ?', whereArgs: [card.id]);
  }

  static deleteCard(CardEntity card) async {
    Database database = await DBTools.getDatabase();
    await database.delete('Cards', where: 'id = ?', whereArgs: [card.id]);
  }

  static deleteAllCards() async {
    Database database = await DBTools.getDatabase();
    await database.delete('Cards');
  }

  static insertReview(ReviewEntity review) async {
    Database database = await DBTools.getDatabase();
    int id = await database.insert('ReviewSchedule', review.toMap());
    // return review.copyWith(id: id);
    return review;
  }

  static updateReview(ReviewEntity review) async {
    Database database = await DBTools.getDatabase();
    await database.update('ReviewSchedule', review.toMap(), where: 'id = ?', whereArgs: [review.id]);
  }

  static deleteReview(ReviewEntity review) async {
    Database database = await DBTools.getDatabase();
    await database.delete('ReviewSchedule', where: 'id = ?', whereArgs: [review.id]);
  }

  static deleteAllReviews() async {
    Database database = await DBTools.getDatabase();
    await database.delete('ReviewSchedule');
  }

  static deleteAll() async {
    await DBTools.deleteAllCards();
    await DBTools.deleteAllReviews();
  }

  static getAllReviews() async {
    Database database = await DBTools.getDatabase();
    List<Map<String, Object?>> reviews = await database.query('ReviewSchedule');
    return reviews.map((review) => ReviewEntity.fromMap(review)).toList();
  }

  static getCard(int id) async {
    Database database = await DBTools.getDatabase();
    List<Map<String, Object?>> cards = await database.query('Cards', where: 'id = ?', whereArgs: [id]);
    return cards.map((card) => CardEntity.fromMap(card)).toList();
  }

  static getCardByQuestion(String question) async {
    Database database = await DBTools.getDatabase();
    List<Map<String, Object?>> cards = await database.query('Cards', where: 'question = ?', whereArgs: [question]);
    return cards.map((card) => CardEntity.fromMap(card)).toList();
  }

  //get cards radomly with the given number
  static getRandomCards(int count) async {
    Database database = await DBTools.getDatabase();
    List<Map<String, Object?>> cards = await database.query('Cards', limit: count);
    return cards.map((card) => CardEntity.fromMap(card)).toList();
  }

  //get card radomly with the given number and reviewCount==0
  static getReviewCards(int count) async {
    Database database = await DBTools.getDatabase();
    List<Map<String, Object?>> cards = await database.query('Cards', where: 'review_count = 0', limit: count);
    return cards.map((card) => CardEntity.fromMap(card)).toList();
  }





}

