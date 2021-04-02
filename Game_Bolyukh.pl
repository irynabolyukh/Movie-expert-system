movie('Parasite', 2019, 'comedy', 'drama', 132, 'usa', 'song', 8.6).
movie('Titanic', 1997, 'drama', 'romance', 194, 'uk', 'dicaprio', 7.8).
movie('Casablanca', 1942, 'drama', 'romance', 102, 'usa', 'bogart', 8.5).
movie('Spirited Away', 2001, 'animation', 'adventure', 125, 'japan', 'chase', 8.6).
movie('The Devil Wears Prada', 2006, 'comedy', 'drama', 109, 'uk', 'hathaway', 6.9).
movie('Dilwale Dulhania Le Jayenge', 1995, 'romance', 'others', 189, 'india', 'khan', 8.1).
movie('Scream', 1996, 'horror', 'mystery', 101, 'uk', 'campbell', 7.3).
movie('Grease', 1978, 'music', 'others', 110, 'uk', 'travolta', 7.2).

movie('Lost In Translation', 2003, 'comedy', 'drama', 102, 'uk', 'murray', 7.7).
movie('Rebel Without a Cause', 1955, 'drama', 'others', 111, 'usa', 'dean', 7.7).
movie('Y Tu Mamá También', 2001, 'drama', 'others', 106, 'uk', 'garcia', 7.6).
movie('The Grand Budapest Hotel', 2014, 'adventure', 'comedy', 99, 'uk', 'fiennes', 8.1).
movie('Carmen Jones', 1954, 'music', 'romance', 105, 'uk', 'belafonte', 6.8).
movie('Daughters of the Dust', 1978, 'history', 'drama', 112, 'uk', 'rogers', 6.6).
movie('Butch Cassidy and the Sundance Kid', 1969, 'biography', 'crime', 110, 'uk', 'redford', 8.0).
movie('Coming to America', 1988, 'comedy', 'romance', 117, 'uk', 'murphy', 7.1).
movie('Rocky', 1978, 'sport', 'drama', 120, 'uk', 'stallone', 8.1).
movie('Schindlers List ', 1993, 'biography', 'history', 195, 'uk', 'neeson', 8.9).

movie('The Shining', 1980, 'horror', 'drama', 146, 'uk', 'duvall', 8.4).
movie('Annihilation', 2018, 'adventure', 'horror', 115, 'uk', 'portman', 6.8).
movie('Dead Poets Society', 1989, 'comedy', 'drama', 128, 'uk', 'hawke', 8.1).
movie('Jurassic Park', 1993, 'action', 'scifi', 127, 'uk', 'dern', 8.1).
movie('Call Me By Your Name', 2017, 'drama', 'romance', 132, 'uk', 'chalamet', 7.9).
movie('Roman Holiday', 1953, 'comedy', 'romance', 118, 'usa', 'hepburn', 8.0).
movie('His Girl Friday', 1940, 'comedy', 'romance', 92, 'uk', 'grant', 7.9).
movie('Carrie', 1976, 'horror', 'others', 98, 'uk', 'spacek', 7.4).
movie('To Kill a Mockingbird', 1962, 'crime', 'drama', 129, 'uk', 'megna', 8.2).
movie('The Sound of Music', 1965, 'biography', 'family', 110, 'uk', 'plummer', 8.0).

movie('Her', 2013, 'romance', 'scifi', 126, 'uk', 'phoenix', 8.0).
movie('12 Angry Men', 1957, 'crime', 'drama', 96, 'usa', 'fonda', 9.0).
movie('Mean Girls', 2004, 'comedy', 'others', 97, 'uk', 'lohan', 7.0).
movie('Little Women', 2019, 'drama', 'romance', 135, 'uk', 'watson', 7.8).
movie('Do the Right Thing', 1989, 'comedy', 'drama', 120, 'uk', 'davis', 8.0).
movie('In the Mood for Love', 2000, 'drama', 'romance', 98, 'japan', 'cheung', 8.1).
movie('A Star Is Born', 2018, 'music', 'romance', 126, 'uk', 'gaga', 7.6).
movie('The Matrix', 1999, 'action', 'scifi', 136, 'uk', 'reeves', 8.7).
movie('Rear Window', 1954, 'mystery', 'thriller', 112, 'uk', 'corey', 8.4).
movie('The Truman Show', 1998, 'comedy', 'drama', 103, 'uk', 'carrey', 8.1).

movie('The Graduate', 1967, 'comedy', 'drama', 106, 'uk', 'hoffman', 8.0).
movie('Clueless', 1995, 'comedy', 'romance', 110, 'uk', 'silverstone', 6.8).
movie('Heathers', 1989, 'comedy', 'crime', 103, 'uk', 'ryder', 7.2).
movie('Blue Velvet', 1986, 'mystery', 'thriller', 120, 'uk', 'maclachlan', 7.7).
movie('Back to the Future', 1985, 'adventure', 'scifi', 116, 'uk', 'fox', 8.5).
movie('Apocalypse Now', 1979, 'mystery', 'drama', 147, 'uk', 'brando', 8.4).
movie('The Rocky Horror Picture Show', 1975, 'music', 'comedy', 100, 'italy', 'curry', 7.4).
movie('2001: A Space Odyssey', 1968, 'adventure', 'scifi', 149, 'uk', 'lockwood', 8.3).
movie('Some Like it Hot', 1959, 'music', 'comedy', 121, 'usa', 'monroe', 8.2).
movie('1776', 1972, 'family', 'history', 141, 'uk', 'daniels', 7.6).


start(MovieName) :-	
      write('This test will help you to find the best movie to watch.'),nl,
                write('Kindly answer the questions below.'),nl,nl,

				write('   What is your gender?'),nl,
				write('1. male'),nl,
				write('2. female'),nl,
				write('Type 1-2: '),
				read(Sex),nl,

				write('   How do you feel now?'),nl,
				write('1. sad'),nl,
				write('2. happy'),nl,
				write('3. angry'),nl,
				write('4. normal'),nl,
				write('Type 1-4: '),
				read(Mood),nl,

        write('According to your previous answers we would recommend you to choose:  '),
				basedOnMood(Sex, Mood, Res),
				write(Res),nl,nl,
				write('* animation'),nl,
				write('* drama'),nl,
				write('* horror'),nl,
				write('* comedy'),nl,
				write('* romance'),nl,
				write('* thriller'),nl,
				write('* adventure'),nl,
				write('* music'),nl,
				write('* scifi'),nl,
				write('* crime'),nl,
				write('* others'),nl,		
				write('Type prefered genre: '),
				read(Genre),nl,
				
	      write('What decade do you prefer?'),nl,
				write('* 2010'),nl,
				write('* 2000'),nl,
				write('* 1990'),nl,
				write('* 1980'),nl,
				write('* 1970'),nl,
				write('* 1960'),nl,
				write('* 1950'),nl,
				write('* 1940'),nl,
				write('* skip'),nl,
				write('Type selected year: '),
        read(Age),nl,
				(Age == 'skip' -> Decade = 1; Decade = Age),

		  	write('How much time do you have? (1-2)'),nl,
				write('1. little'),nl,
				write('2. lots'),nl,
				write('Type 1-2: '),
				read(Time),nl, (Time == 2 -> write('How many hours exactly? '),nl,
			          	     read(TimeExact),nl,
											 (TimeExact < 3 -> Duration = 'm'; Duration = 'l');
											  Duration = 's'),nl,
			
				write('Do you have favourite actor?'),nl,
				write('1. yes'),nl,
				write('2. no'),nl,
				write('Type 1-2: '),
				read(Ans1),nl, (Ans1 == 1 -> write('What is actors lastname? '),nl,
			          	     Ans1 == 1 -> read(Actor); Actor = 'skip'),nl,

				write('Movies of what country do you prefer?'),nl,
				write('* usa'),nl,
				write('* japan'),nl,
				write('* france'),nl,
				write('* uk'),nl,
				write('* skip'),nl,
				write('Type prefered country: '),
				read(Country),nl,

			write('What imdb rating is good enough for you?(1-10)'),nl,
			read(Rate),nl,(search(MovieName,Decade,Genre,Duration,Rate,Country,Actor); 

					write('No such movie found in our database. Please reduce one of your preferences.'),nl,
						write('What is not that important to you? (1-3) '),nl,nl,
						write('1. decade'),nl,write('2. duration'),nl,write('3. imdb'),nl,nl,
						write('Type 1-3: '),
						read(Ignore1),nl,(Ignore1 == 1 -> (searchWoYear(MovieName,Genre,Duration,Rate,Country,Actor);
																								write('What else is not that important? (1-2) '),nl,nl,
																								write('1. country'),nl,write('2. actor'),nl,read(Ignore2),nl,
																								(Ignore2 == 1 -> searchWoYearCountry(MovieName,Genre,Duration,Rate,Actor);
														                		searchWoYearActor(MovieName,Genre,Duration,Rate,Country)));
												    (Ignore1 == 2 -> (searchWoDuration(MovieName,Decade,Genre,Rate,Country,Actor);
																								write('What else is not that important? (1-2) '),nl,nl,
																								write('1. country'),nl,write('2. actor'),nl,read(Ignore2),nl,
																								(Ignore2 == 1 -> searchWoDurationCountry(MovieName,Decade,Genre,Rate,Actor);
																								searchWoDurationActor(MovieName,Decade,Genre,Rate,Country))); 
														(searchWoImdb(MovieName,Decade,Genre,Duration,Country,Actor);
															write('What else is not that important? (1-2) '),nl,nl,
															write('1. country'),nl,write('2. actor'),nl,read(Ignore2),nl,
															(Ignore2 == 1 -> searchWoImdbCountry(MovieName,Decade,Genre,Duration,Actor);
															searchWoImdbActor(MovieName,Decade,Genre,Duration,Country)))
														));

														defaultSelected(MovieName,Genre)),

			write('Thank you for participation! Best movie for you has been found!').



imdb(MovieName,Rating):- movie(MovieName,_,_,_,_,_,_,R), Rating < R.
actor(MovieName,Actor):- movie(MovieName,_,_,_,_,_,Actor,_).
country(MovieName,Country):- movie(MovieName,_,_,_,_,Country,_,_).
year(MovieName,Year):- movie(MovieName,Y,_,_,_,_,_,_), Year < Y, Year1 is Year + 10, Y < Year1.
genre(MovieName,Genre):- movie(MovieName,_,G1,G2,_,_,_,_), (G1 == Genre; G2 == Genre).

duration(MovieName,'s'):- movie(MovieName,_,_,_,Minutes,_,_,_), 5 < Minutes, Minutes < 100. % 1,5
duration(MovieName,'m'):- movie(MovieName,_,_,_,Minutes,_,_,_), 99 < Minutes, Minutes < 170. % 2 
duration(MovieName,'l'):- movie(MovieName,_,_,_,Minutes,_,_,_), 169 < Minutes. % 3+

basedOnMood(2, 2, 'comedy, adventure, romance'). 
basedOnMood(X, 1, 'drama, animation'):- (X == 2; X == 1). 
basedOnMood(X, 3, 'horror, thriller'):- (X == 2; X == 1). 
basedOnMood(2, 4, 'adventure, romance').
basedOnMood(1, 2, 'comedy, adventure, thriller').
basedOnMood(1, 4, 'adventure, animation, thriller').

search(MovieName,Decade,Genre,Hours,Rate,Country,Actor):-
				(Decade == 1; year(MovieName,Decade)),
				(Country == 'skip'; country(MovieName,Country)),
				(Actor == 'skip'; actor(MovieName,Actor)),
				genre(MovieName,Genre),
				imdb(MovieName,Rate),
				duration(MovieName,Hours), !.

defaultSelected(MovieName,Genre):-genre(MovieName, Genre).
defaultSelected(MovieName,_):-movie(MovieName,_,_,_,_,_,_,_).


% Search for movie without considering year
searchWoYear(MovieName,Genre,Hours,Rate,Country,Actor):-
	                      (Country == 'skip'; country(MovieName,Country)),
	                      (Actor == 'skip'; actor(MovieName,Actor)),
                        genre(MovieName,Genre),
                        imdb(MovieName,Rate),
												duration(MovieName,Hours), !.

% Search for movie without considering year	& country		 				
searchWoYearCountry(MovieName,Genre,Hours,Rate,Actor):-
	                      (Actor == 'skip'; actor(MovieName,Actor)),
                        genre(MovieName,Genre),
                        imdb(MovieName,Rate),
												duration(MovieName,Hours), !.

% Search for movie without considering year & actor
searchWoYearActor(MovieName,Genre,Hours,Rate,Country):-
	                      (Country == 'skip'; country(MovieName,Country)),
                        genre(MovieName,Genre),
                        imdb(MovieName,Rate),
												duration(MovieName,Hours), !.


% Search for movie without considering duration
searchWoDuration(MovieName,Decade,Genre,Rate,Country,Actor):- 
	                      (Decade == 1; year(MovieName,Decade)),
                        (Country == 'skip'; country(MovieName,Country)),
                        (Actor == 'skip'; actor(MovieName,Actor)),
                        genre(MovieName,Genre),
												imdb(MovieName,Rate), !.

% Search for movie without considering duration & country
searchWoDurationCountry(MovieName,Decade,Genre,Rate,Actor):- 
	                      (Decade == 1; year(MovieName,Decade)),
                        (Actor == 'skip'; actor(MovieName,Actor)),
                        genre(MovieName,Genre),
												imdb(MovieName,Rate), !.

% Search for movie without considering duration & actor
searchWoDurationActor(MovieName,Decade,Genre,Rate,Country):- 
	                      (Decade == 1; year(MovieName,Decade)),
                        (Country == 'skip'; country(MovieName,Country)),
                        genre(MovieName,Genre),
												imdb(MovieName,Rate), !.


% Search for movie without considering imdb
searchWoImdb(MovieName,Decade,Genre,Hours,Country,Actor):-
                        (Decade == 1; year(MovieName,Decade)),
                        (Country == 'skip'; country(MovieName,Country)),
                        (Actor == 'skip'; actor(MovieName,Actor)),
                        genre(MovieName,Genre),
												duration(MovieName,Hours), !.

% Search for movie without considering imdb & actor
searchWoImdbActor(MovieName,Decade,Genre,Hours,Country):-
                        (Decade == 1; year(MovieName,Decade)),
                        (Country == 'skip'; country(MovieName,Country)),
                        genre(MovieName,Genre),
												duration(MovieName,Hours), !.

% Search for movie without considering imdb & country
searchWoImdbCountry(MovieName,Decade,Genre,Hours,Actor):-
                        (Decade == 1; year(MovieName,Decade)),
                        (Actor == 'skip'; actor(MovieName,Actor)),
                        genre(MovieName,Genre),
												duration(MovieName,Hours), !.