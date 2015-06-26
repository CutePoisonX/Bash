# Bash 4.3.3
This repo contains several up-to-date pre-compiled bash binaries for Synology DiskStations. The intention is to provide bash without having to install ipkg on your DiskStation (which gives you a legacy version anyway).

# Installation on Synology DiskStations

* SSH into your DiskStation
* Download the script: `wget https://github.com/CutePoisonX/Bash/releases/download/v4.3.3/SynologyBashInstaller.sh`
* Make the script executable: `chmod +x SynologyBashInstaller.sh`
* Execute the script: `./SynologyBashInstaller.sh`
* Follow the instructions to install bash on your DiskStation

# Installation on the Raspberry pi 2
* SSH into your Raspberry
* Download bash: `wget https://github.com/CutePoisonX/Bash/releases/download/v4.3.3/bash-Raspberry2`
* Rename it: `mv "bash-Raspberry2" "bash"`
* Move it to your preferred destination, like /bin/: `mv "bash" "/bin/bash"`

Note: on openelec, you don't have write access to the /bin/ - directory. If you want to use bash, please change the first line of the script you want to execute (called shebang) to `#!/path/to/bash` where you have to substitute /path/to/bash/ with the actual path.

# Installation on other systems
Check the current [release](https://github.com/CutePoisonX/Bash/releases) if there is a version for your system available.

# Bash infos
Website: https://www.gnu.org/software/bash/

License: GPLv3 (http://www.gnu.org/licenses/gpl.html)

