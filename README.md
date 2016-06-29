# bash-auto-updater

Script to provide auto update functionality to other projects.

Disclaimer: This script needs to be placed inside a git project.

## Installation

Head to your git project folder and run the following command:
```bash
$ git submodule add https://github.com/carlosV2/bash-autoupdater.git lib/update
```

Optionally you can change the last parameter to be any location inside your project.


Once you have the submodule declared, you need to copy and paste the following code into any bash file
of your project when the auto update needs to happen:
```bash
#UPDATE_DELAY=86400
path=`dirname ${BASH_SOURCE}`
$(cd ${path}; git submodule update --init)
source "${path}/lib/update/update.sh"
```

Mind the folder in case you changed the location of the submodule.


You can control when the auto update happens by initializing the UPDATE_DELAY variable. It accepts
any number of seconds before it will try to update again. If this variable is not provided, it will
fallback to 86400 seconds (a day). Setting this variable to 0 will always trigger the update process.