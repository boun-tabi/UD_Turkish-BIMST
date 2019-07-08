---
layout: relation
title: 'compound'
shortdef: 'compound'
udver: '2'
---

The ``compound`` relation is one of four relations
for multi-word expressions (MWEs) (the other two being [fixed]() and [flat]()).

~~~ sdparse
çelik/NOUN yelek/NOUN \n steel vest (bulletproof vest)
compound(yelek, çelik)
~~~

~~~ sdparse
kırmızı/ADJ şarap/NOUN \n red wine
compound(şarap, kırmızı)
~~~

~~~ sdparse
Roma Imparatorluğu \n Roman Empire
compound(Imparatorluğu, Roma)
~~~


It is also used for numbers, where head is the right-most number.

~~~ sdparse
iki yüz bin lira\n two hundred thousand liras
compound(bin, iki)
compound(bin, yüz)
nummod(lira, bin)
~~~

For reduplication, the subtype [compound:redup](compound-redup) is used.

For productive and systematic (light-)verb compounds, such as _et-_ and _ol-_, the subtype [compound:lvc](compound-lvc) is used.
For the rest of the verb compounds, ``compound`` is used.

~~~ sdparse
annesi hapse girmiş. \n His mom was put in jail.
compound(hapse, girmiş)
~~~


For non-lexicalized (non-MWE) nominal modification,
e.g., _tahta kapı_ "wood(en) door", [nmod]() relation is used.

The use of ``compound`` for a constituent like:

~~~sdparse
kapı kolu
compound(kolu, kapı)
~~~

Is no longer implemented in BOUN Treebank. Instead the compounds where there is a compound/agreement marking suffix *-I* are evaluated under ``nmod:poss``
~~~sdparse
kapı kolu
nmod:poss(kolu, kapı)
~~~
