/*
data preparation
*/

DROP TABLE gcats; 

CREATE TABLE gcats 
  ( 
     cat_id INT NOT NULL AUTO_INCREMENT, 
     name   VARCHAR(100), 
     breed  VARCHAR(100), 
     age    INT, 
     PRIMARY KEY (cat_id) 
  ); 

DESC gcats; 

INSERT INTO gcats(name, breed, age) 
VALUES ('Ringa', 'Tabby', 4),
       ('Candy', 'Maine Coon', 10),
       ('Dumbo', 'Maine Coon', 11),
       ('Chicki', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

#--------------------------#

#id only
SELECT cat_id FROM gcats;

#name,breed columns
SELECT name,breed FROM gcats;

#just Tabby breed cats only
SELECT name,age FROM gcats WHERE breed LIKE 'Tabby';

#cat id same as age
SELECT cat_id,age FROM gcats WHERE cat_id = age;

#Change Jackson's name to "Jack"
UPDATE gcats SET name = 'Jack' WHERE name ='Jackson';

#Change Ringo's breed to "British Shorthair"
UPDATE gcats SET breed = 'British Shorthair' WHERE name = 'Ringo';

#Update both Maine Coons' ages to be 12
UPDATE gcats SET age = 12 WHERE breed = 'Maine Coon';

#DELETE all 4 year old cats
DELETE FROM gcats WHERE age = 4;

#DELETE cats whose age is the same as their cat_id
DELETE FROM gcats WHERE cat_id = age;

#DELETE all cats
DELETE FROM gcats;
