# idr-distribution

Code to package and distribute Idris for various platforms.  Binary releases can
be found on the releases page.


## Current status

There is an *UNTESTED* release of 1.2.0 for Debian Stretch on the releases page.

See this [Dockerfile](https://github.com/ejconlon/idr-distribution/blob/master/debian/stretch/example/Dockerfile) for an example of how to install a released artifact.

I am pretty bad at all this so please help improve things if you see better ways.
New platforms are welcome too.


## Doing it yourself

Right now, Debian Stretch is the only supported platform. If you have `docker` and `git`
on your path, this should work:

    PLATFORM=debian/stretch VERSION=1.2.0 ./script/run.sh

If you're iterating and don't want to clean the workspace each time, set `CLEAN=false`.

In my experience, it helps to allocate ~4GB RAM to docker to compile Idris.

When you are ready to release (requires repo permissions), try

    VERSION=1.2.0 ./script/release.sh
    PLATFORM=debian/stretch VERSION=1.2.0 ./script/upload.sh
