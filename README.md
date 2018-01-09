# idr-distribution

Code to package and distribute Idris for various platforms.

Right now, all that's there is Debian Stretch. If you have `docker` and `git`
on your path, this should work:

    PLATFORM=debian/stretch VERSION=v1.2.0 ./script/run.sh

If you're iterating and don't want to clean the workspace each time, set `CLEAN=false`.

In my experience, it helps to allocate ~4GB RAM to docker to compile Idris.

When you are ready to release, try

  VERSION=v1.2.0 ./script/release.sh

  PLATFORM=debian/stretch VERSION=v1.2.0 ./script/upload.sh
