/* data prep */
CREATE TABLE gpeople (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);

INSERT INTO gpeople (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

INSERT INTO gpeople (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');

SELECT * FROM gpeople;


/*-----------------------------------*/
/*
Date time functions
CURDATE()	- gives current date
CURTIME()	- gives current time
NOW()		- gives current datetime
Date time format
DAY()
DAYNAME()
DAYOFWEEK()
DAY OF YEAR()
*/


/*MM-dd-YY*/
select birthdate, DATE_FORMAT(birthdate,'%m-%d-%y at %h:%m') AS 'after formatted'
FROM gpeople;
/*
# birthdate, after formatted
'2020-03-01', '03-01-20 at 12:03'
'1943-12-25', '12-25-43 at 12:12'
'1943-12-25', '12-25-43 at 12:12'
*/

SELECT birthdate, DATEDIFF(NOW(), birthdate) AS 'number of days between today and birthdate'
FROM gpeople;

/*-----------------------------------*/

INSERT INTO gpeople (name, birthdate, birthtime, birthdt)
VALUES('Richard', CURDATE(), CURTIME(), NOW());

SELECT birthdate, DAYOFYEAR('2020-03-01')
FROM gpeople;

/*-----------------------------------*/


/*Date Time Specifier*/
/*Sunday October 2009*/
SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W %M %Y');

/*MM-dd-YY	=> '2020-03-01'	=> '03-01-20 at 12:03'*/
select birthdate, DATE_FORMAT(birthdate,'%m-%d-%y at %h:%m') AS 'after formatted'
FROM gpeople;


/*-----------------------------------*/
/*
** DATE Math / Arithmetic **
DATEDIFF()
DATE_ADD()
+ or -
*/

/* result : 1 */
SELECT DATEDIFF('2007-12-31 23:59:59','2007-12-30');

/* '2020-03-01 19:28:23' =>  '2020-03-31 19:28:23'*/
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 30 DAY) AS 'after adding 30days'
FROM gpeople;

/*'2020-03-01 19:28:23' => '2020-03-11 19:28:23'*/
SELECT birthdt, birthdt + INTERVAL 10 DAY AS 'after adding 10days'
FROM gpeople;

/*'2020-03-01 19:28:23' => '2020-02-01 19:28:23'*/
SELECT birthdt, birthdt - INTERVAL 1 MONTH AS 'after subtracting 1 month'
FROM gpeople;


/*-------------------------------------*/
/*--- Timestamp -----------*/

CREATE TABLE gcomments(
	comment VARCHAR(150) NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	change_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO gcomments(comment)
VALUES('I like cats'),
	('today is pretty hot'),
	('I can\'t stop watching movies :)');


UPDATE gcomments
SET comment = 'I like cats and dogs'
WHERE comment = 'I like cats';

/*-------------------------------------*/
