/** Назва, Рік випуску, жанр1, жанр2, країна, головний герой-актор, рейтинг*/

movie('Dr1', 1999,'drama', 'others',  108,'USA','Hanks',8.7).

movie('Cm1', 1984, 'comedy', 'others', 198, 'Poland', 'Depp', 7.9).

movie('Adv1', 2001, 'adventure', 'fantasy', 128, 'Ukraine', 'Wood', 8.1).

movie('Th1c', 1991, 'thriller', 'others', 113, 'USA', 'Hopkins', 8.2).

movie('An1', 2001, 'animation', 'family', 30, 'USA', 'Myers', 7.8).

movie('Rm1', 1960, 'romance', 'others', 117, 'USA', 'Burton', 7.5).

movie('Hr1', 1980, 'horror', 'psychopaths', 146, 'USA', 'Roberts', 7.9).


start(MovieName) :-	
      write('This test will help you to find the best movie to watch.'),nl,
                write('Kindly answer the questions below.'),nl,nl,

				write('   What is your gender?'),nl,
				write('1. male'),nl,
				write('2. female'),nl,
				read(Sex),nl,

				write('   How do you feel now?'),nl,
				write('1. sad'),nl,
				write('2. happy'),nl,
				write('3. angry'),nl,
				write('4. normal'),nl,
				read(Mood),nl,
				
	      write('What decade do you prefer?'),nl,
				write('1. 2010'),nl,
				write('2. 2000'),nl,
				write('3. 1990'),nl,
				write('4. 1980'),nl,
				write('5. 1970'),nl,
				write('6. 1960'),nl,
				write('7. skip'),nl,
        read(Decade),nl,
		
				write('Choose prefered genre:'),nl,
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
				read(Genre),nl,

		  	write('How much time do you have?'),nl,
				write('1. little'),nl,
				write('2. lots'),nl,
				read(Time),nl, (Time == 'lots' -> write('How many hours exactly? '),nl,
			          	     read(TimeExact),nl,
											 (TimeExact < 3 -> Duration = 'm'; Duration = 'l');
											  Duration = 's'),nl,
			
				write('Do you have favourite actor?'),nl,
				write('1. yes'),nl,
				write('2. no'),nl,
				read(Ans1),nl, (Ans1 == 'yes' -> write('What is actors lastname? '),nl,
			          	     Ans1 == 'yes' -> read(Actor); Actor = 'skip'),nl,

				write('Movies of what country do you prefer?'),nl,
				write('1. USA'),nl,
				write('2. Japan'),nl,
				write('3. France'),nl,
				write('4. Great Britain'),nl,
				write('5. skip'),nl,
				read(Country),nl,

			write('What imdb rating is good enough for you?(1-10)'),nl,
			read(Rate),nl,(search(MovieName,Decade,Genre,Duration,Rate,Country,Actor); 

					write('No such movie found in our database. Please reduce one of your preferences.'),nl,
						write('What can we neglect? '),nl,nl,
						% (Decade \= 'skip' -> write('* decade')),
						write('* decade'),nl,write('* duration'),nl,write('* imdb'),nl,nl,
						read(Ignore1),nl,(Ignore1 == 'decade' -> searchWoYear(MovieName,Genre,Duration,Rate,Country,Actor);
												    (Ignore1 == 'duration' -> searchWoDuration(MovieName,Decade,Genre,Rate,Country,Actor); 
												    searchWoImdb(MovieName,Decade,Genre,Duration,Country,Actor))); 
														write('What else can we neglect? '),nl,nl,
														% (Country \= 'skip' -> write('* country')),nl,(Actor \= 'skip' -> write('* actor')),nl,nl,
														write('* country'),nl,write('* actor'),nl,nl,
														read(Ignore2),nl,((Ignore1 == 'year', Ignore2 == 'country') -> searchWoYearCountry(MovieName,Genre,Duration,Rate,Actor);
														                (Ignore1 == 'year', Ignore2 == 'actor') -> searchWoYearActor(MovieName,Genre,Duration,Rate,Country);
																						(Ignore1 == 'duration', Ignore2 == 'country') -> searchWoDurationCountry(MovieName,Decade,Genre,Rate,Actor);
														                (Ignore1 == 'duration', Ignore2 == 'actor') -> searchWoDurationActor(MovieName,Decade,Genre,Rate,Country);
																						((Ignore1 == 'imdb', Ignore2 == 'country') -> searchWoImdbCountry(MovieName,Decade,Genre,Duration,Actor);
																						searchWoImdbActor(MovieName,Decade,Genre,Duration,Country))); 
																						nl,defaultSelected(MovieName,Genre)),

			write('Thank you for participation! Best movie for you has been found!').



imdb(MovieName,Rating):- movie(MovieName,_,_,_,_,_,_,R), Rating < R.
actor(MovieName,Actor):- movie(MovieName,_,_,_,_,_,Actor,_).
country(MovieName,Country):- movie(MovieName,_,_,_,_,Country,_,_).
year(MovieName,Year):- movie(MovieName,Y,_,_,_,_,_,_), Year < Y, Year1 is Year + 10, Y < Year1.
genre(MovieName,Genre):- movie(MovieName,_,G1,G2,_,_,_,_), (G1 == Genre; G2 == Genre).

basedOnMood('female', 'happy', 'comedy, adventure, romance'). 
basedOnMood(X, 'sad', 'drama, animation'):- (X == 'female'; X == 'male'). 
basedOnMood(X, 'angry', 'horror, thriller'):- (X == 'female'; X == 'male'). 
basedOnMood('female', 'normal', 'adventure, romance').
basedOnMood('male', 'happy', 'comedy, adventure, thriller').
basedOnMood('male', 'normal', 'adventure, animation, thriller').

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


