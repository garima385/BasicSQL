/*
Shirt table
*/
shirt_id	article			color	shirt_size	last_worn
---------------------------------------------------------
1			t-shirt			white	S			10
2			t-shirt			green	S			200
3			polo shirt		black	M			10
4			tank top		blue	S			50
5			t-shirt			pink	S			0
6			polo shirt		red		M			5
7			tank top		white	S			200
8			tank top		blue	M			15

/*create table shirts*/
CREATE TABLE gshirts(
	shirt_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	article VARCHAR(50),
	color VARCHAR(50),
	shirt_size VARCHAR(1),
	last_worn INT
);

SHOW TABLES;

DESC gshirts;

/*add values*/
INSERT INTO gshirts(article,color,shirt_size,last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);


/*Get All That Data In There With a single line*/
SELECT * FROM gshirts;


/*Add A New Shirt
Purple polo shirt, size M last worn 50 days ago*/
INSERT INTO gshirts(article,color,shirt_size,last_worn)
VALUES('polo shirt','purple','M',50);


/*SELECT all shirts
But Only Print Out Article and Color*/
SELECT article,color
FROM gshirts;


/*SELECT all medium shirts
Print Out Everything But shirt_id*/
SELECT article,color,shirt_size,last_worn FROM gshirts
WHERE shirt_size = 'M';


/*Update all polo shirts
Change their size to L*/
UPDATE gshirts
SET shirt_size = 'L'
WHERE article = 'polo shirt';


/*Update the shirt last worn 15 days ago
Change last_worn to 0*/
UPDATE gshirts
SET last_worn = 0
WHERE last_worn = 15;


/*alter table of shirtsize*/
ALTER TABLE gshirts
MODIFY COLUMN shirt_size VARCHAR(2);


/*Update all white shirts
Change size to 'XS' and color to 'off white'*/
UPDATE gshirts
SET color = 'off white',
	shirt_size = 'XS'
WHERE color = 'white';


/*Delete all old shirts
Last worn 200 days ago*/
DELETE FROM gshirts
WHERE last_worn = 200;


/*Delete all tank tops
Your tastes have changed...*/
DELETE FROM gshirts
WHERE article = 'tank top';


/*Delete all shirts*/
DELETE FROM gshirts;
