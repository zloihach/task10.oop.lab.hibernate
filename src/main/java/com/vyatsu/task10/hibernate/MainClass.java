package com.vyatsu.task10.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;


public class MainClass {
    public static void main(String[] args) {
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Book.class)
                .addAnnotatedClass(Author.class)
                .addAnnotatedClass(Reader.class)
                .addAnnotatedClass(Catalog.class)
                .buildSessionFactory();

        // CRUD
        Session session = factory.getCurrentSession();

        try {
/*
            session = factory.getCurrentSession();
            Author author = new Author();
            author.setName("Rowling");
            session.beginTransaction();
            session.save(author);
            session.getTransaction().commit();
*/

/*
            session = factory.getCurrentSession();
            session.beginTransaction();
            Reader reader = session.get(Reader.class, 1);
            Book book = session.get(Book.class, 6);
//            reader.getBooks().add(book);
            reader.getBooks().clear();
            session.getTransaction().commit();
*/


//            CREATE
/*
            session = factory.getCurrentSession();
            Catalog catalog = new Catalog("Fantasy #15");
            session.beginTransaction();
            session.save(catalog);
            session.getTransaction().commit();
*/

/*
            session = factory.getCurrentSession();
            session.beginTransaction();
            Catalog catalog = session.get(Catalog.class, 1L);
            catalog.setTitle("Fantasy #8");
            session.getTransaction().commit();
            System.out.println(catalog);
*/

/*
            session = factory.getCurrentSession();
            session.beginTransaction();
            Catalog catalog2 = session.get(Catalog.class, 2L);
            session.getTransaction().commit();
            System.out.println(catalog2);
*/


//            READ
/*
            session = factory.getCurrentSession();
            session.beginTransaction();
            Book harryPotterBook = session.get(Book.class, 1);
            session.getTransaction().commit();
            System.out.println(harryPotterBook);
*/


//            UPDATE
            session = factory.getCurrentSession();
            session.beginTransaction();
            Book bookJava1 = session.get(Book.class, 3);
            bookJava1.setTitle("Java 1 Advanced");
            session.getTransaction().commit();
            System.out.println(bookJava1);

/*
            session = factory.getCurrentSession();
            session.beginTransaction();
            Book bookJava1 = session.get(Book.class, 4);
            session.delete(bookJava1);
            session.getTransaction().commit();
*/

            session = factory.getCurrentSession();
            session.beginTransaction();
//             List<Book> allBooks = session.createQuery("from Book").getResultList();
//             from Book b where b.title = 'Harry Potter' or b.authorName = 'Rowling'
//             from Book b where b.title LIKE 'Harry%'
//             from Book b where b.title = :title
            List<Book> allBooks = session.createQuery("from Book b where b.title = :title").setParameter("title", "Java 1").getResultList();
            System.out.println(allBooks);
            session.getTransaction().commit();

            session = factory.getCurrentSession();
            session.beginTransaction();
            session.createQuery("update Book set title = 'A'").executeUpdate();
            session.createQuery("delete from Book where id = 3").executeUpdate();
            session.getTransaction().commit();

/*
            session = factory.getCurrentSession();
            session.beginTransaction();
            Book book = session.get(Book.class, 1);
            System.out.println(book);
            session.getTransaction().commit();
*/

/*
            session = factory.getCurrentSession();
            session.beginTransaction();
            Author author = session.get(Author.class, 1);
            System.out.println(author);
            session.getTransaction().commit();
*/

/*
            session = factory.getCurrentSession();
            session.beginTransaction();
            List<Reader> readers = session.createQuery("from Reader").getResultList();
            System.out.println(readers);
            session.getTransaction().commit();
*/

/*
            session = factory.getCurrentSession();
            session.beginTransaction();
            Author author = session.get(Author.class, 1);
            session.delete(author);
            session.getTransaction().commit();
*/
        } finally {
            factory.close();
            session.close();
        }
    }
}
