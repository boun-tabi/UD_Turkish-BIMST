---
layout: relation
title: 'obj'
shortdef: 'direct object'
udver: '2'
---

The direct object of a verb is the noun phrase that denotes the entity
acted upon.

In Turkish, direct objects typically take
either nominative (unmarked), or accusative [cases](tr-feat/Case).
However, any other case except for genitive can be utilized as well. 
There are two criteria we use when we decide whether a non-canonically marked object 
is an `obj` or an `obl`:
- Is the case predictable solely from the semantic denotation of the case?
- Does the verb determine the use of the case?

Here, the canonically (marked or unmarked) marked objects:
~~~ sdparse
Hafta sonları kitap okurum . \n I read (books) during weekends
obj(okurum, kitap)
~~~

~~~ sdparse
Kitabı okudum . \n I read the book.
obj(okudum, Kitabı)
~~~

Here's the ablative marked object, which denotes a partitive reading.
~~~ sdparse
pastadan yedim. \n I ate (some of) the cake.
obj(yedim, pastadan)
~~~
Note that the above differs from, e.g.,
_tabaktan yedim_ "I ate from the plate",
where relation should be [obl]().


We also mark the non-case marked or accusative noun phrases as ``obj``
even if they are not the entities that are acted upon.

~~~ sdparse
Dün 10 kilometre koştum . \n I ran 10 kilometers yesterday
obj(koştum, kilometre)
~~~

~~~ sdparse
Dün 10 kilometreyi 35 dakikada koştum . \n  Yesterday, I ran 10 kilometers in 35 minutes
obj(koştum, kilometreyi)
~~~

Here's the non-canonically marked objects:

~~~sdparse
Sana güveniyorum. \n I trust you
obj(güveniyorum, Sana)
~~~

~~~sdparse
Sana söylemedim. \n I did not tell you
iobj(söylemedim, Sana)
~~~

~~~ sdparse
bu evde karar kıldık. \n We have decided on this home.
obj(karar, evde)
compound(karar, kıldık)
~~~

~~~ sdparse
bu evde namaz kıldık. \n We prayed in this home.
obl(namaz, evde)
compound(namaz, kıldık)
~~~

~~~ sdparse
Aliden hoşlanıyorum. \n I like Ali.
obj(hoşlanıyorum, Aliden)
~~~

~~~sdparse
Evden geliyorum. \n I am coming from home.
obl(geliyorum, Evden)
~~~

~~~sdparse
Çocukla dalga geçiyorum. \n I am mocking the child.
obj(dalga, Çocukla)
compound(dalga, geçiyorum.)
~~~

~~~sdparse
Arkadaşlarla koşuyorum. \n I am jogging with friends.
obl(koşuyorum, Arkadaşlarla)
~~~
It is not limited to these verbs only. Many more verbs can utilise non-cannonical object marking in Turkish.
