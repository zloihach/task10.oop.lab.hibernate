CREATE USER 'geek'@'localhost' IDENTIFIED BY 'geek';
GRANT ALL PRIVILEGES ON * . * TO 'geek'@'localhost';

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
	id int(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB CHARSET=utf8;

DROP TABLE IF EXISTS books;
CREATE TABLE books (
	id int(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB CHARSET=utf8;

DROP TABLE IF EXISTS authors;
CREATE TABLE authors (
	id int(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(80) DEFAULT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB CHARSET=utf8;

DROP TABLE IF EXISTS books;
CREATE TABLE books (
	id int(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) DEFAULT NULL,
    author_id int(11) DEFAULT NULL,
    PRIMARY KEY(id),
    CONSTRAINT FK_AUTH_ID FOREIGN KEY (author_id)
    REFERENCES authors (id)
) ENGINE=InnoDB CHARSET=utf8;

DROP TABLE IF EXISTS readers;
CREATE TABLE readers (
	id int(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(80) DEFAULT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE books_readers (
	book_id int(11) NOT NULL,
    reader_id int(11) NOT NULL,

    PRIMARY KEY (book_id, reader_id),

    CONSTRAINT FK_BOOK FOREIGN KEY (book_id)
    REFERENCES books (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,

    CONSTRAINT FK_READER FOREIGN KEY (reader_id)
    REFERENCES readers (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB CHARSET=utf8;