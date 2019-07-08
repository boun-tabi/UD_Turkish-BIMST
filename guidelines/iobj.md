---
layout: relation
title: 'iobj'
shortdef: 'indirect object'
udver: '2'
---

`iobj` is a core nominal argument of the verb apart from object and the subject. Sentences cannot have a `iobj` without having first `obj`. 

~~~ sdparse
"Ne bu?" demiş abisine. \n He asked his brother what it was.
iobj(demiş, abisine)
~~~

It is important not to mistake every dative case marked nominal with `iobj` since dative case can be provided semantically and lexically. In those cases, it should be `obl` and `obj`, respectively.
