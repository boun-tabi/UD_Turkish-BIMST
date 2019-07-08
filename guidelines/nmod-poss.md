---
layout: relation
title: 'nmod:poss'
shortdef: 'possessive nominal modifier'
udver: '2'
---

This subtype of [nmod]() is used in (genitive-)possessive constructions.
Typically, the head of the construction is a possessive noun phrase,
and the dependent can be either in nominative or genitive [case](tr-feat/Case).

~~~ sdparse
Ali'nin kitabı   \n Ali's book
nmod:poss(kitabı, Ali'nin)
~~~

~~~ sdparse
Sabah kahvesi \n Morning coffee
nmod:poss(kahvesi, Sabah)
~~~

``nmod:poss`` is also extended for use in 'X out of Y' constructions for Turkish;

~~~sdparse
Çocuklardan biri ödevini yapmamış. \n One of the kids did not do his homework.
nmod:poss(biri, Çocuklardan)
obj(yapmamaış, ödevini)
~~~
