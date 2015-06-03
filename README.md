# Nishsort

**Nishsort is a bash script (Debian-tested) which reads a file of Nishnaabe words (Pic River dialect), and returns a list of those words sorted by grapheme.**

**Command line option ```-ag``` will output the sorted list aligned by grapheme.**



## Sample Output

Without use of command line option ```-ag```:

```
cat myinfile.txt | bash nishsort.sh

****Unrecognizable character in: qwadaakrwad
****Unrecognizable character in: xngwiigan
ahiim
aabaabkahganked
aabaabkahgaadeg
aabtooyhiing
aadaakhwaad
aaniin
aapdahoonaad
aazhoobhidwaad
baakhaakwenh
beshbiihmawaad
bgakhamaazod
biidhoodood
biighwaad
biijbiihmaagod

. . .
```


Using command line option ```-ag```:

```
cat myinfile.txt | bash nishsort.sh -ag

....****Unrecognizable character in: qwadaakrwad
....****Unrecognizable character in: xngwiigan
|a..|h..|ii.|m..
|aa.|b..|aa.|b..|k..|a..|h..|g..|a..|n..|k..|e..|d..
|aa.|b..|aa.|b..|k..|a..|h..|g..|aa.|d..|e..|g..
|aa.|b..|t..|oo.|y..|h..|ii.|ng.
|aa.|d..|aa.|k..|h..|w..|aa.|d..
|aa.|n..|ii.|n..
|aa.|p..|d..|a..|h..|oo.|n..|aa.|d..
|aa.|zh.|oo.|b..|h..|i..|d..|w..|aa.|d..
|b..|aa.|k..|h..|aa.|k..|w..|e..|nh.
|b..|e..|sh.|b..|ii.|h..|m..|a..|w..|aa.|d..
|b..|g..|a..|k..|h..|a..|m..|aa.|z..|o..|d..
|b..|ii.|d..|h..|oo.|d..|oo.|d..
|b..|ii.|g..|h..|w..|aa.|d..
|b..|ii.|j..|b..|ii.|h..|m..|aa.|g..|o..|d..

. . .
```



## Current project member:

John Paul Montano
[http://jpmontano.com](http://jpmontano.com)
