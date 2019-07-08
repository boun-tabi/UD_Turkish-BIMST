---
layout: relation
title: 'advmod'
shortdef: 'adverbial modifier'
udver: '2'
---

An adverbial modifier of a word is a (non-clausal) [adverb](tr-pos/ADV)
or adverbial phrase that serves to modify the meaning of the word.

Note that nouns in particular morphological [cases](tr-feat/Case),
or followed by an [adposition](tr-pos/ADP) are marked
using [obl]() even if they function as adverbial modifiers.

~~~ sdparse
Çok iyi bir kitap \n A very good book
advmod(iyi, Çok)
~~~

~~~ sdparse
Sürekli konuşuyorlar \n They are talking continuously
advmod(konuşuyorlar, Sürekli)
~~~

We use a special label, [tr-dep/advmod:emph]() for adverbial modifiers that are used for emphasis.

Also in comparative structures ``advmod`` tag is used. As exampled;

~~~sdparse
Ayşe Ali'den daha çevik. \n Ayşe is more agile than Ali.
advmod(çevik, daha)
advmod(çevik, Ali'den)
nsubj(çevik, Ayşe)
~~~

Some suffixes can form adverbs from nouns in Turkish.

~~~sdparse
Resmi ilgiyle inceliyordu. \ S\/he was inspecting the picture with care.
advmod(inceliyordu, ilgiyle)
obj(inceliyordu, Resmi)
~~~

Some reduplications can also serve as ``advmod``

~~~sdparse
Ödevini zar zor yaptın. \n You struggled doing your homework.
compound:redup(zar, zor)
advmod(yaptı, zar)
obj(yaptı, Ödevini)
~~~

~~~sdparse
Car car konuşma. \n Stop nagging.
compound:redup(Car, car)
advmod(konuşma, Car)
~~~

~~~sdparse
Aval aval baktın. \n You were looking around cluelessly.
compound:redup(Aval, aval)
advmod(baktın, Aval)
~~~












