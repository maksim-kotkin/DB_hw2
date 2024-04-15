CREATE TABLE IF NOT EXISTS Genres(
	id serial PRIMARY  KEY,
	name varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Performers(
	id serial PRIMARY KEY,
	nickname varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres_Performers(
	genres_id integer REFERENCES Genres(id),
	performers_id integer REFERENCES Performers(id),
	CONSTRAINT pk1 PRIMARY KEY (genres_id, performers_id)
);

CREATE TABLE IF NOT EXISTS Albums(
	id serial PRIMARY KEY,
	name varchar(60) NOT NULL,
	year_of_release integer NOT NULL 
);

CREATE TABLE IF NOT EXISTS Albums_Performers(
	albums_id integer REFERENCES Albums(id),
	performers_id integer REFERENCES Performers(id),
	CONSTRAINT pk2 PRIMARY KEY (albums_id, performers_id)
);

CREATE TABLE IF NOT EXISTS Songs(
	id serial PRIMARY KEY,
	name varchar(60) NOT NULL,
	duration integer NOT NULL,
	albums_id integer  REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collections(
	id serial PRIMARY KEY,
	name varchar(60) NOT NULL,
	year_of_release integer NOT null
);

CREATE TABLE IF NOT EXISTS Collections_Songs(
	songs_id integer REFERENCES Songs(id),
	collections_id integer REFERENCES Collections(id),
	CONSTRAINT pk3 PRIMARY KEY (songs_id, collections_id)
);