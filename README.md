This repository contains adapters to install applications that aren't packaged
for Batis. Using Batis provides a consistent way to manage and uninstall them.
Adapters can also add desktop integration like launchers and mimetypes.

Most adapters can be used by downloading the application from its website, and
then running the ``adapt.sh`` script on it. E.g.

    ./pycharm/adapt.sh ~/Downloads/pycharm-community-4.5.4.tar.gz

If you want to adapt an application that's not already covered, have a go at
writing an adapter, and make a pull request for it. Applications which already
offer a pre-built Linux tarball are easiest to adapt. You can copy code from
other adapters where applicable.

If you maintain an application which has an adapter here, you're welcome to use
it as a starting point to make a Batis package of your application.
