    DROP TABLE IF EXISTS catalogs;
    CREATE TABLE catalogs(
        id SERIAL NOT NULL PRIMARY KEY,
        title VARCHAR(100) DEFAULT NULL
    );

    DROP TABLE IF EXISTS books;
    CREATE TABLE books (
        id SERIAL NOT NULL PRIMARY KEY,
        title VARCHAR(100) DEFAULT NULL
    );

    DROP TABLE IF EXISTS authors;
    CREATE TABLE authors (
        id SERIAL NOT NULL PRIMARY KEY,
        name VARCHAR(80) DEFAULT NULL
    );

    DROP TABLE IF EXISTS books;
    CREATE TABLE books (
        id SERIAL NOT NULL PRIMARY KEY,
        title VARCHAR(100) DEFAULT NULL,
        author_id integer DEFAULT NULL,
        CONSTRAINT FK_name FOREIGN KEY (author_id) REFERENCES authors (id)
    );

    DROP TABLE IF EXISTS readers;
    CREATE TABLE readers (
        id SERIAL NOT NULL PRIMARY KEY,
        name VARCHAR(80) DEFAULT NULL
    );

    CREATE TABLE books_readers (
        book_id integer NOT NULL,
        reader_id integer NOT NULL,

        PRIMARY KEY (book_id, reader_id),

        CONSTRAINT FK_book FOREIGN KEY (book_id) REFERENCES books (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,

        CONSTRAINT FK_reader FOREIGN KEY (reader_id) REFERENCES readers (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
    );


    DROP TABLE IF EXISTS catalogs;
    DROP TABLE IF EXISTS books;
    DROP TABLE IF EXISTS readers;
    DROP TABLE IF EXISTS books_readers;
    DROP TABLE IF EXISTS authors;
