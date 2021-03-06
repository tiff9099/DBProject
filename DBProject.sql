SET SESSION sql_mode = 'STRICT_ALL_TABLES';

DROP DATABASE IF EXISTS MemeGenerator;
CREATE DATABASE MemeGenerator;

USE MemeGenerator;


CREATE Table Tag (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(32) NOT NULL
);

CREATE TABLE Template (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
image VARCHAR(256) NOT NULL,
name VARCHAR(64) NOT NULL
);

CREATE TABLE Text (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
top VARCHAR(128) NOT NULL,
bottom VARCHAR(128) NOT NULL
);

CREATE TABLE User (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
login VARCHAR(32) NOT NULL
);

CREATE TABLE Meme (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
templateid INT UNSIGNED NOT NULL,
textid INT UNSIGNED NOT NULL,
image VARCHAR(256) NOT NULL,
userid INT UNSIGNED,

FOREIGN KEY (templateid) REFERENCES Template (id),
FOREIGN KEY (textid) REFERENCES Text (id),
FOREIGN KEY (userid) REFERENCES User (id)
);

CREATE TABLE Comment (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
userid INT UNSIGNED NOT NULL,
memeid INT UNSIGNED NOT NULL,
comment VARCHAR(512) NOT NULL,

FOREIGN KEY (userid) REFERENCES User (id),
FOREIGN KEY (memeid) REFERENCES Meme (id)
);

CREATE TABLE MemeTag (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
memeid INT UNSIGNED NOT NULL,
tagid INT UNSIGNED NOT NULL,

FOREIGN KEY (memeid) REFERENCES Meme (id),
FOREIGN KEY (tagid) REFERENCES Tag (id)
);

CREATE TABLE TagUser (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
userid INT UNSIGNED NOT NULL,
tagid INT UNSIGNED NOT NULL,

FOREIGN KEY (userid) REFERENCES User (id),
FOREIGN KEY (tagid) REFERENCES Tag (id)
);



-- BASE INSERTS TO MAKE SITE WORK

INSERT INTO Template (image, name) VALUES
('static/MemeGenerator/grumpyCat.jpg', 'Grumpy Cat'),
('static/MemeGenerator/rickAstley.jpg', 'Rick Astley'),
('static/MemeGenerator/sociallyAwkwardPenguin.jpg', 'Socially Awkward Penguin'),
('static/MemeGenerator/oneDoesNotSimply.jpg', 'One Does Not Simply'),
('static/MemeGenerator/obama.jpg', 'Obama'),
('static/MemeGenerator/willyWonka.jpg', 'Willy Wonka');

INSERT INTO User (login) VALUES
('Admin'),
('Anonymous'),
('Jack'),
('Tiffany'),
('Michelle');

INSERT INTO Text (top, bottom) VALUES
("Hey, what's up?", "Good, you?"),
("Never Gonna Give You Up",""),
("You have finals coming up?", "Tell me about how well you're balancing your time"),
("When you see your replacement...", "");

INSERT INTO Meme (templateid, textid, image, userid) VALUES 
(3, 1, '/media/MemeGenerator/admin1.jpg', 1),
(2, 2, '/media/MemeGenerator/admin2.jpg', 1),
(6, 3, '/media/MemeGenerator/admin3.jpg', 1),
(5, 4, '/media/MemeGenerator/admin4.jpg', 1);

INSERT INTO Tag (name) VALUES 
('Funny'),
('Edgy'),
('Standard'),
('True'),
('Spicy');

INSERT INTO MemeTag (memeid, tagid) VALUES
(1, 1),
(1, 4),
(2, 3),
(3, 2),
(3, 1),
(3, 3),
(4, 5);

INSERT INTO TagUser (userid, tagid) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

INSERT INTO Comment (userid, memeid, comment) VALUES
(1, 1, 'Only good meme on this site'),
(1, 1, 'Old but gold'),
(1, 2, 'Weak effort'),
(3, 3, '@me');


