CREATE TABLE users(
id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(255) NOT NULL,
email VARCHAR(255)UNIQUE NOT NULL,
password VARCHAR(255) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE categories(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE films (
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
description TEXT,
release_date DATE,
category_id INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (category_id) REFERENCES categories(id)
);


CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    film_id INT,
    user_id INT,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE wishlist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    film_id INT,
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


           INSERT INTO users(username, email,password) VALUES
           ('jale','jale@gmail.com','900131Ks'),
           ('ruhi', 'ruhi@gmail.com','SJ900044');


           INSERT INTO categories (name) VALUES
           ('Aksiyon'),
           ('Qorxu Gerilim');


           INSERT INTO films(title, description, release_date, category_id) VALUES
           ('Action Movie', 'An exciting action film.', '2024-01-15', 1),
           ('Comedy Movie', 'A funny comedy film.', '2024-02-20', 2);


           INSERT INTO comments (film_id, user_id, comment) VALUES
           (1, 1, 'Əla film idi, yenidən izləməyə dəyər.'),
           (2, 2, 'Qorxu filmlərini sevənlər üçün mükəmməl filmdir.');

           INSERT INTO wishlist (id, film_id, user_id, created_at)
           VALUES
           (1, 1, 1, NOW()),
           (2, 2, 2, NOW());

           SELECT users.username, films.title AS film_title, comments.comment, comments.created_at
           FROM comments
           JOIN users ON comments.user_id = users.id
           JOIN films ON comments.film_id = films.id
           LIMIT 0, 25;

