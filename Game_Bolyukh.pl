/** Назва, Рік випуску, жанр1, жанр2, країна, головний герой-актор, рейтинг*/

movie('Parasite', 2019, 'comedy', 'drama', 132, 'usa', 'song', 8.6).
movie('Titanic', 1997, 'drama', 'romance', 194, 'uk', 'dicaprio', 7.8).
movie('Casablanca', 1942, 'drama', 'romance', 102, 'usa', 'bogart', 8.5).
movie('Spirited Away', 2001, 'animation', 'adventure', 125, 'japan', 'chase', 8.6).
movie('The Devil Wears Prada', 2006, 'comedy', 'drama', 109, 'uk', 'hathaway', 6.9)
movie('Dilwale Dulhania Le Jayenge', 1995, 'romance', 'others', 189, 'india', 'khan', 8.1).
movie('Scream', 1996, 'horror', 'mystery', 101, 'uk', 'campbell', 7.3).
movie('Grease', 1978, 'musical', 'others', 110, 'uk', 'travolta', 7.2).


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
				
	      write('What decade do you prefer?'),nl,
				write('* 2010'),nl,
				write('* 2000'),nl,
				write('* 1990'),nl,
				write('* 1980'),nl,
				write('* 1970'),nl,
				write('* 1960'),nl,
				write('* skip'),nl,
				write('Type selected year: '),
        read(Decade),nl,
		
        write('According to your previous answers we would recommend you to choose:  '),
				basedOnMood(Sex, Mood, Res),
				write(Res),nl,nl,
				write('1. animation'),nl,
				write('2. drama'),nl,
				write('3. horror'),nl,
				write('4. comedy'),nl,
				write('5. romance'),nl,
				write('6. thriller'),nl,
				write('7. adventure'),nl,
				write('8. others'),nl,		
				write('Type prefered genre: '),
				read(Genre),nl,

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
				write('1. usa'),nl,
				write('2. japan'),nl,
				write('3. france'),nl,
				write('4. great britain'),nl,
				write('5. skip'),nl,
				write('Type prefered country: '),
				read(Country),nl,

			write('What imdb rating is good enough for you?(1-10)'),nl,
			read(Rate),nl,(search(MovieName,Decade,Genre,Duration,Rate,Country,Actor); 

					write('No such movie found in our database. Please reduce one of your preferences.'),nl,
						write('What can we neglect? (1-3) '),nl,nl,
						% (Decade \= 'skip' -> write('* decade')),
						write('1. decade'),nl,write('2. duration'),nl,write('3. imdb'),nl,nl,
						write('Type 1-3: '),
						read(Ignore1),nl,(Ignore1 == 1 -> searchWoYear(MovieName,Genre,Duration,Rate,Country,Actor);
												    (Ignore1 == 2 -> searchWoDuration(MovieName,Decade,Genre,Rate,Country,Actor); 
												    searchWoImdb(MovieName,Decade,Genre,Duration,Country,Actor))); 
														write('What else can we neglect? (1-6) '),nl,nl,
														% (Country \= 'skip' -> write('* country')),nl,(Actor \= 'skip' -> write('* actor')),nl,nl,
														write('1. decade, country'),nl,write('2. decade, actor'),nl,
														write('3. duration, country'),nl,write('4. duration, actor'),nl,
														write('5. imdb, country'),nl,	write('6. imdb, actor'),nl,nl,
														write('Type 1-6: '),
														read(Ignore2),nl,(Ignore2 == 1 -> searchWoYearCountry(MovieName,Genre,Duration,Rate,Actor);
														                Ignore2 == 2 -> searchWoYearActor(MovieName,Genre,Duration,Rate,Country);
																						Ignore2 == 3 -> searchWoDurationCountry(MovieName,Decade,Genre,Rate,Actor);
														                Ignore2 == 4 -> searchWoDurationActor(MovieName,Decade,Genre,Rate,Country);
																						(Ignore2 == 5 -> searchWoImdbCountry(MovieName,Decade,Genre,Duration,Actor);
																						searchWoImdbActor(MovieName,Decade,Genre,Duration,Country))); 
																						nl,defaultSelected(MovieName,Genre)),

			write('Thank you for participation! Best movie for you has been found!').



imdb(MovieName,Rating):- movie(MovieName,_,_,_,_,_,_,R), Rating < R.
actor(MovieName,Actor):- movie(MovieName,_,_,_,_,_,Actor,_).
country(MovieName,Country):- movie(MovieName,_,_,_,_,Country,_,_).
year(MovieName,Year):- movie(MovieName,Y,_,_,_,_,_,_), Year < Y, Year1 is Year + 10, Y < Year1.
genre(MovieName,Genre):- movie(MovieName,_,G1,G2,_,_,_,_), (G1 == Genre; G2 == Genre).

basedOnMood(2, 2, 'comedy, adventure, romance'). 
basedOnMood(X, 1, 'drama, animation'):- (X == 2; X == 1). 
basedOnMood(X, 3, 'horror, thriller'):- (X == 2; X == 1). 
basedOnMood(2, 4, 'adventure, romance').
basedOnMood(1, 2, 'comedy, adventure, thriller').
basedOnMood(1, 4, 'adventure, animation, thriller').

duration(MovieName,'s'):- movie(MovieName,_,_,_,Minutes,_,_,_), 20 < Minutes, Minutes < 60.
duration(MovieName,'m'):- movie(MovieName,_,_,_,Minutes,_,_,_), 61 < Minutes, Minutes < 150.
duration(MovieName,'l'):- movie(MovieName,_,_,_,Minutes,_,_,_), 151 < Minutes.


search(MovieName,Decade,Genre,Hours,Rate,Country,Actor):-
				(Decade == 'skip',!; year(MovieName,Decade)),
				(Country == 'skip',!; country(MovieName,Country)),
				(Actor == 'skip',!; actor(MovieName,Actor)),
				genre(MovieName,Genre),
				imdb(MovieName,Rate),
				duration(MovieName,Hours), !.

defaultSelected(MovieName,Genre):-genre(MovieName, Genre).


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
	                      (Decade == 'skip'; year(MovieName,Decade)),
                        (Country == 'skip'; country(MovieName,Country)),
                        (Actor == 'skip'; actor(MovieName,Actor)),
                        genre(MovieName,Genre),
												imdb(MovieName,Rate), !.

% Search for movie without considering duration & country
searchWoDurationCountry(MovieName,Decade,Genre,Rate,Actor):- 
	                      (Decade == 'skip'; year(MovieName,Decade)),
                        (Actor == 'skip'; actor(MovieName,Actor)),
                        genre(MovieName,Genre),
												imdb(MovieName,Rate), !.

% Search for movie without considering duration & actor
searchWoDurationActor(MovieName,Decade,Genre,Rate,Country):- 
	                      (Decade == 'skip'; year(MovieName,Decade)),
                        (Country == 'skip'; country(MovieName,Country)),
                        genre(MovieName,Genre),
												imdb(MovieName,Rate), !.


% Search for movie without considering imdb
searchWoImdb(MovieName,Decade,Genre,Hours,Country,Actor):-
                        (Decade == 'skip'; year(MovieName,Decade)),
                        (Country == 'skip'; country(MovieName,Country)),
                        (Actor == 'skip'; actor(MovieName,Actor)),
                        genre(MovieName,Genre),
												duration(MovieName,Hours), !.

% Search for movie without considering imdb & actor
searchWoImdbActor(MovieName,Decade,Genre,Hours,Country):-
                        (Decade == 'skip'; year(MovieName,Decade)),
                        (Country == 'skip'; country(MovieName,Country)),
                        genre(MovieName,Genre),
												duration(MovieName,Hours), !.

% Search for movie without considering imdb & country
searchWoImdbCountry(MovieName,Decade,Genre,Hours,Actor):-
                        (Decade == 'skip'; year(MovieName,Decade)),
                        (Actor == 'skip'; actor(MovieName,Actor)),
                        genre(MovieName,Genre),
												duration(MovieName,Hours), !.
