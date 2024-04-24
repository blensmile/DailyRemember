
class CardBookEntity {
  // int id;
  // String name;
  // int cardsCount = 0;

}

class CardEntity {
  int id;
  int cardBookId;
  String question;
  String answer;
  String description;
  bool isReversable;
  String lastReviewedDate;
  int interval;
  String nextReviewDate;
  int reviewCount = 0;


  CardEntity(this.id,this.cardBookId, this.question, this.answer, this.description, this.isReversable, this.lastReviewedDate, this.interval, this.nextReviewDate);

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'question': question,
    };
  }

  static fromMap(Map<String, Object?>? card) {
    if (card != null) {
      return CardEntity(
          card['id'] as int,
          card['cardbook_id'] as int,
          card['question'] as String,
          card['answer'] as String,
          card['description'] as String,
          card['is_reversable'] as bool,
          card['last_reviewed_date'] as String,
          card['interval'] as int,
          card['next_review_date'] as String
      );
    }
  }

}

class ReviewEntity {
  int id;
  int cardId;
  int cardbookId;
  String dueDate;
  int interval;

  ReviewEntity(this.id, this.cardId,this.cardbookId, this.dueDate, this.interval);

  Map<String, Object?> toMap() {
    return {

    };
  }

  static fromMap(Map<String, Object?>? review) {
    if (review != null) {
      return ReviewEntity(
          review['id'] as int,
          review['card_id'] as int,
          review['cardbook_id'] as int,
          review['due_date'] as String,
          review['interval'] as int,
      );
    }
  }
}