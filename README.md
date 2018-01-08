# idr-distribution

Code to package and distribute Idris for various platforms.

Right now, all that's there is Debian Stretch. If you have `docker` and `git`
on your path, this should just work:

    ./script/run.sh debian/stretch v1.2.0

In my experience, it helps to allocate 3GB RAM to docker to compile Idris.
