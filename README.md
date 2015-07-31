# Nishsort

**Nishsort is a bash script (Debian-tested) which reads a file of Nishnaabe words (Pic River dialect), and returns a list of those words sorted by grapheme.**

**Command line option ```-ag``` will output the sorted list aligned by grapheme.**



## Sample Output

Without use of command line option ```-ag```:

```
$ cat myinfile.txt | bash nishsort.sh

****Unrecognizable character in: qwadaakrwad
****Unrecognizable character in: xngwiigan
ahiim
aabaabkahganked
aabaabkahgaadeg
aabtooyhiing
aadaakhwaad
aaniin
aanzyaan
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
$ cat myinfile.txt | bash nishsort.sh -ag

....****Unrecognizable character in: qwadaakrwad
....****Unrecognizable character in: xngwiigan
|a..|h..|ii.|m..
|aa.|b..|aa.|b..|k..|a..|h..|g..|a..|n..|k..|e..|d..
|aa.|b..|aa.|b..|k..|a..|h..|g..|aa.|d..|e..|g..
|aa.|b..|t..|oo.|y..|h..|ii.|ng.
|aa.|d..|aa.|k..|h..|w..|aa.|d..
|aa.|n..|ii.|n..
|aa.|nz.|y..|aa.|n..
|aa.|p..|d..|a..|h..|oo.|n..|aa.|d..
|aa.|zh.|oo.|b..|h..|i..|d..|w..|aa.|d..
|b..|aa.|k..|h..|aa.|k..|w..|e..|nh.
|b..|e..|sh.|b..|ii.|h..|m..|a..|w..|aa.|d..
|b..|g..|a..|k..|h..|a..|m..|aa.|z..|o..|d..
|b..|ii.|d..|h..|oo.|d..|oo.|d..
|b..|ii.|g..|h..|w..|aa.|d..
|b..|ii.|j..|b..|ii.|h..|m..|aa.|g..|o..|d..
|b..|k..|a..|d..|e..|h..|aa.|d..
|b..|k..|e..|y..|h..|ii.
|b..|k..|i..|t..|e..|h..|g..|a..|n..
|b..|k..|i..|t..|e..|h..|g..|aa.|ns.
|b..|k..|i..|t..|e..|h..|w..|aa.|d..
|b..|k..|o..|b..|ii.|h..|g..|aa.|d..|e..|g..
|b..|m..|aa.|h..|g..|o..|d..
|b..|m..|i..|d..|aa.|b..|ii.|b..|h..|i..|g..|o..|d..
|b..|n..|a..|h..|g..|aa.|d..|e..|g..
|b..|oo.|k..|g..|a..|h..|a..|ng.
|b..|oo.|k..|g..|a..|h..|w..|aa.|d..
|b..|oo.|z..|b..|ii.|h..|aa.|s..|i..|ng.
|b..|z..|i..|g..|h..|o..|d..
|d..|b..|a..|h..|aa.|b..|aa.|n..
|d..|b..|a..|h..|aa.|b..|aa.|n..|e..|y..|aa.|g..
|d..|b..|a..|h..|g..|a..|n..|e..|ns.
|d..|b..|i..|h..|aa.|d..
|d..|e..|b..|h..|oo.|k..|aa.|n..|aa.|d..
|g..|aa.|s..|'..|h..|aa.|d..
|g..|aa.|s..|b..|ii.|h..|a..|ng.
|g..|aa.|shk|aa.|k..|h..|i..|g..|e..|d..
|g..|b..|aa.|b..|w..|e..|h..|g..|a..|n..
|g..|e..|t..|e..|-..|y..|a..|h..|aa.
|g..|e..|t..|e..|h..|aa.|w..|a..|ng.
|g..|g..|ii.|-..|n..|'..|z..|i..|k..|w..|e..|ȟ..|d..|i..|z..
|g..|g..|w..|e..|j..|k..|a..|zh.|b..|a..|h..|d..|i..|w..|aa.|d..
|g..|i..|j..|y..|a..|h..|ii.
|g..|ii.|g..|oo.|ny.|h..|aa.|d..
|g..|ii.|shk|g..|a..|h..|g..|aa.|d..|e..|g..
|g..|ii.|shk|g..|a..|h..|g..|aa.|z..|o..|d..
|g..|ii.|w..|t..|aa.|-..|y..|i..|h..|ii.
|g..|k..|e..|nd.|m..|oo.|h..|aa.|d..
|g..|k..|e..|nd.|m..|oo.|h..|w..|e..|d..
|g..|k..|i..|n..|oo.|h..|m..|aa.|g..|oo.|w..|i..|n..
|g..|nj.|i..|b..|h..|i..|w..|e..|d..
|g..|nz.|aa.|b..|ii.|h..|a..|ng.
|g..|o..|n..|'..|h..|i..|g..|e..|d..
|g..|p..|i..|d..|aa.|b..|ii.|h..|w..|e..|d..
|g..|shk|a..|h..|oo.|d..|oo.|d..
|g..|w..|i..|h..|aa.|d..
|g..|z..|ii.|h..|o..|d..
|j..|ii.|ch.|ii.|shk|nzh|e..|h..|g..|e..|d..
|j..|ii.|g..|g..|a..|h..|s..|e..|d..
|m..|aa.|d..|w..|e..|w..|e..|b..|z..|o..|n..|'..|h..|aa.|d..
|m..|aa.|j..|ii.|h..|aa.|d..|g..|o..|s..|e..|g..
|m..|aa.|m..|w..|i..|b..|ii.|h..|g..|e..|d..
|m..|ii.|k..|h..|w..|aa.|d..
|m..|m..|a..|k..|ii.|h..|aa.|d..
|m..|m..|i..|g..|j..|ii.|h..|aa.|n..|k..|w..|e..|d..
|m..|n..|o..|b..|ii.|h..|g..|e..|d..
|m..|oo.|n..|'..|h..|i..|b..|ii.|d..
|m..|oo.|zh.|h..|o..|d..
|m..|sk.|o..|b..|ii.|h..|w..|aa.|d..
|m..|w..|i..|h..|aa.|d..
|m..|z..|i..|w..|e..|b..|ii.|h..|g..|aa.|d..|e..|g..
|n..|'..|d..|a..|ǧ..|sh.|i..|n..
|n..|'..|g..|a..|j..|h..|i..|w..|e..|d..
|n..|'..|s..|o..|-..|d..|b..|a..|h..|oo.|b..|aa.|n..
|n..|aa.|d..|h..|i..|b..|ii.|d..|aa.|b..|ii.|d..
|n..|aa.|d..|h..|oo.|j..|g..|e..|d..
|n..|b..|a..|g..|d..|a..|h..|a..|ng.
|n..|i..|m..|aa.|h..|g..|o..|d..
|n..|i..|shk|w..|e..|h..|aa.|d..
|n..|ii.|w..|oo.|b..|h..|i..|d..|w..|aa.|d..
|n..|ii.|y..|o..|-..|n..|a..|m..|h..|e..|-..|g..|ii.|zh.|g..|a..|k..
|n..|m..|a..|z..|n..|i..|h..|g..|e..
|n..|n..|aa.|h..|ch.|i..|g..|e..|d..
|n..|ng.|w..|w..|aa.|g..|n..|e..|h..|a..|ng.
|n..|oo.|j..|h..|i..|k..|w..|e..|w..|e..|-..|n..|'..|g..|a..|m..|o..|n..
|n..|oo.|sk.|w..|aa.|d..|h..|a..|ng.
|w..|a..|s..|y..|a..|h..|ii.
|w..|aa.|s..|'..|k..|w..|a..|h..|w..|aa.|d..
|w..|d..|aa.|b..|ii.|h..|aa.|d..
|w..|d..|e..|h..|m..|i..|n..|i..|-..|b..|aa.|shk|m..|i..|n..|'..|s..|i..|g..|a..|n..
|w..|e..|w..|e..|s..|e..|h..|o..|n..
|w..|ii.|k..|h..|i..|b..|ii.|d..
|w..|ii.|n..|'..|h..|aa.|d..
|w..|j..|ii.|ng.|h..|i..|g..|aa.|d..|e..|g..
|w..|mb.|aa.|k..|h..|w..|aa.|d..
|w..|mb.|i..|n..|a..|ng.
|w..|n..|i..|b..|h..|i..|d..|w..|aa.|d..
|w..|n..|i..|shk|aa.|b..|n..|i..|h..|o..|d..
|w..|n..|i..|shk|w..|e..|h..|aa.|d..
|w..|n..|ii.|h..|g..|e..|d..
|w..|nz.|o..|d..
|w..|zh.|aa.|w..|shk|o..|b..|ii.|h..|g..|e..|d..
|w..|zh.|i..|b..|ii.|h..|g..|aa.|ns.
|w..|zh.|i..|g..|h..|i..|g..|e..|d..
|w..|zh.|ii.|t..|aa.|h..|aa.|d..
|z..|aa.|g..|j..|i..|n..|aa.|zh.|h..|w..|aa.|d..
|z..|aa.|g..|j..|i..|y..|h..|ii.|ng.
|z..|aa.|g..|z..|i..|b..|h..|i..|d..|w..|aa.|d..
|z..|g..|a..|h..|oo.|z..|o..|d..
|z..|oo.|ng.|d..|e..|h..|e..|w..|i..|n..
|zh.|ii.|b..|aa.|z..|g..|o..|h..|g..|a..|n..
```



## Current project member:

John Paul Montano
[http://jpmontano.com](http://jpmontano.com)
