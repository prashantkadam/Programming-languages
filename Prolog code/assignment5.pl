length( [], 0 ).

length( [H|T], Res ) :-
	length( T, Res1 ),
	Res is Res1 + 1.

/*Q.1*/

max( [X], X ).
max( [H|T], Res ) :- max( T, Res1 ),
( 	H>Res1 ->
		Res is H
	; 
		Res is Res1
).

/*Q.2*/

insertNTerm( N, T, T1 ) :-
T=..[ Func|Param ],
insertNTerm1( N, N, Param, NewParam ),
T1=..[ Func|NewParam ].

insertNTerm1( N, _, [], [] ).

insertNTerm1( K, N, [H|T], Res ) :-
(
	N==1->
		insertNTerm1( K, K, T, Res1 ),	
		Res = [H,1|Res1]
	;
		N1 is N-1,
		insertNTerm1(K,N1,T,Res1),	
		Res = [H|Res1]
).

/*Q.3*/

append( [], L, L ).

append( [H|T], L, Res ) :-
	append( T, L, Res1 ),
	Res = [H|Res1].

my_merge( [], L, L ).

my_merge( [H|T], L, Res ) :-
	my_merge( T, L, Res1 ),
	Res = [H|Res1].

sublist2( [X], [] ).

sublist2( [H|T], Res ) :-
	sublist2( T, Res1 ),
	Res = [T|Res1].

sublist1( _, 0, _, [[]] ):-!.

sublist1( [H|T], N, K, Res ) :-
(
	N = K ->
		N1 is N-1,
		sublist1( [H|T], N1, K, Res2 ),
		Res = [[H|T]|Res2]
	;
		N1 is N-1,
		append( T, [H], Res1 ),
		sublist2( Res1, Res2 ),
		sublist1( Res1, N1, K, Res3 ),
		my_merge( Res2, Res3, Res )
).

sublist( L, Res ) :- length( L, X ), P1 is X+1, sublist1( L, P1, P1, Res 
).

/*Q.4*/

position( X, [H|T], Res) :- position1( 0, X, [H|T], Res ).

position1( N, X, [], [] ).

position1( N, X, [H|T], Res ) :-
	N1 is N+1,
	position1( N1, X, T, Res1 ),
	(	
		X = H ->
			Res = [N1|Res1]
		;
			Res = Res1
	).

/*Q.5*/

merge( [], L, L ).

merge( L, [], L ).

merge( [H|T], [H1|T1], Res ) :-
(
	H < H1 ->
		merge( T, [H1|T1], Res1 ),
		Res = [H|Res1]
	;
		merge( [H|T], T1, Res1 ),
		Res = [H1|Res1]
).
