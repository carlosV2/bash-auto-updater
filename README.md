# bash-auto-updater

Script to provide auto update functionality to other projects.

Disclaimer: This script needs to be placed inside a git project.

## Installation

Head to your git project folder and run the following command:
```bash
$ git submodule add https://github.com/carlosV2/bash-auto-updater.git lib/update
```

Optionally you can change the last parameter to be any location inside your project.


Once you have the submodule declared, you need to copy and paste the following code into any bash file
of your project when the auto update needs to happen:
```bash
#UPDATE_DELAY=86400
UPDATE_PATH=`dirname ${BASH_SOURCE}`
$(cd ${UPDATE_PATH}; git submodule update --init)
source "${UPDATE_PATH}/lib/update/update.sh"
```

Mind the folder in case you changed the location of the submodule.


The `UPDATE_PATH` variable should always point to the project's root folder (where the `.git` folder is).
Please, make the necessary tweaks to have it always pointing to the right folder.


You can control when the auto update happens by initializing the `UPDATE_DELAY` variable. It accepts
any number of seconds before it will try to update again. If this variable is not provided, it will
fallback to 86400 seconds (a day). Setting this variable to 0 will always trigger the update process.