# idr-distribution

Code to package and distribute Idris for various platforms.

Right now, all that's there is Debian Stretch. If you have `docker` and `git`
on your path, this should just work:

    PLATFORM=debian/stretch VERSION=v1.2.0 ./script/run.sh

In my experience, it helps to allocate ~4GB RAM to docker to compile Idris.
