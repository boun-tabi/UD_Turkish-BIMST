---
layout: relation
title: 'advcl'
shortdef: 'adverbial clause modifier'
udver: '2'
---

An adverbial clause modifier is a clause which modifies
a verb or other predicate (adjective, etc.),
as a modifier not as a core complement. 
This includes things such as a temporal clause,
consequence, conditional clause, purpose clause, etc.
The dependent must be clausal (or else it is an [advmod]())
and the dependent is the main predicate of the clause.

Turkish adverbial clauses are mainly formed through morphological inflections. In BOUN treebank we valued inner syntax of constituents and placed these suffixed forms under ``advcl``

~~~ sdparse
Ali gelince sevindi . \n He\/she became happy when Ali arrived
advcl(sevindi, gelince)
~~~

~~~ sdparse
Okurken uyuyakalmışım . \n I fell asleep while reading
advcl(uyuyakalmışım, Okurken)
~~~

~~~sdparse
Koşarak geldim. \n I came here running.
advcl(geldim, Koşarak)
~~~

~~~sdparse
İşimi bitirip geldim. \n I finished my job then I came here.
advcl(geldim, bitirip)
obj(bitirip, İşimi)
~~~

~~~sdparse
Seni gördüğümde evdeydim. \n I was at home when I saw you.
advcl(evdeydim, gördüğümde)
obj(gördüğümde, Seni)
~~~

~~~sdparse
Kitapları düşürmeden götür. \n Carry the books without dropping.
advcl(götür, düşürmeden)
obj(götür, Kitapları)
~~~

~~~sdparse
Yemekleri bittikçe tazele. \n Put some more food as it runs out.
advcl(tazele, bittikçe)
obj(tazele, Yemekleri)
~~~

~~~ sdparse
Kitabı okusaydın anlardın . \n You would understand if you had read the book
advcl(anlardın, okusaydın)
~~~

The subordinator _ki_ and a few other subordinating words may also form adverbial clauses.

~~~ sdparse
Bu kitabı sen de okursun diye aldım \n I bought this book so that you would read it too
advcl(aldım, okursun)
mark(okursun, diye)
~~~

~~~ sdparse
Bu kitabı aldım ki sen de okuyasın \n I bought this book so that you would read it too
advcl(aldım, okuyasın)
mark(okuyasın, ki)
~~~

~~~ sdparse
Bu kitabı okudun mu herşeyi anlayacaksın \n You will understand everything once you have read this book
advcl(anlayacaksın, okudun)
mark(okudun, mu)
~~~

Some inflicted reduplications are also marked ``advcl``

~~~sdparse
Bilip bilmeden beni suçlama. \n Don't blame me without knowing anything.
compound:redup(Bilip, bilmeden)
advcl(suçlama, Bilip)
obj(suçlama, beni)
~~~








