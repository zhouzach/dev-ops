
http://gridlab-d.sourceforge.net/wiki/index.php/Mac_OSX/Gsed

brew install gnu-sed

Symlink gsed to sed

     % ln -s /usr/local/bin/gsed /usr/local/bin/sed
Make sure symlinked sed is the first instance of sed in the path

     % which sed

# use gsed as "sed"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"