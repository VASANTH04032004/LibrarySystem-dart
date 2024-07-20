import 'dart:math';

class Book {
  String title;
  String author;
  bool isBorrowed;

  Book(this.title, this.author) : isBorrowed = false;

  void borrow() {
    if (!isBorrowed) {
      isBorrowed = true;
      print('You have borrowed "$title".');
    } else {
      print('"$title" is already borrowed.');
    }
  }

  void returnBook() {
    if (isBorrowed) {
      isBorrowed = false;
      print('You have returned "$title".');
    } else {
      print('"$title" was not borrowed.');
    }
  }

  @override
  String toString() {
    return 'Title: $title, Author: $author, Borrowed: $isBorrowed';
  }
}

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
    print('Added "${book.title}" by ${book.author}.');
  }

  void listBooks() {
    if (books.isEmpty) {
      print('No books in the library.');
    } else {
      print('Books in the library:');
      for (var book in books) {
        print(book);
      }
    }
  }

  Book? getRandomBook() {
    if (books.isEmpty) {
      print('No books available in the library.');
      return null;
    }
    final random = Random();
    return books[random.nextInt(books.length)];
  }
}

void main() {
  var library = Library();
  var random = Random();

  List<String> titles = [
    'Alices Adventures in Wonderland',
    'The Chronicles of Narnia',
    'Matilda',
    'Charlotte s Web'
  ];
  List<String> authors = [
    'Lewis Carroll',
    'C.S. Lewis',
    'Roald Dahl',
    'E.B. White'
  ];

  for (int i = 0; i < 4; i++) {
    var book = Book(titles[random.nextInt(titles.length)],
        authors[random.nextInt(authors.length)]);
    library.addBook(book);
  }

  List<String> actions = ['list', 'borrow', 'return', 'exit'];
  bool exit = false;

  while (!exit) {
    print('\nLibrary Management System');
    print('1. List all books');
    print('2. Borrow a book');
    print('3. Return a book');
    print('4. Exit');

    String action = actions[random.nextInt(actions.length)];
    print('Simulated user action: $action');

    if (action == 'list') {
      library.listBooks();
    } else if (action == 'borrow') {
      var book = library.getRandomBook();
      if (book != null) {
        book.borrow();
      }
    } else if (action == 'return') {
      var book = library.getRandomBook();
      if (book != null) {
        book.returnBook();
      }
    } else if (action == 'exit') {
      print('Exiting...');
      exit = true;
    }
  }
}
