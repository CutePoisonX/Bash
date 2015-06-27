#!/usr/bin/env sh

setInstallUninstallVariables ()
{
    TITLE="bash"
    VERSION_NR="4.3.30"
    INSTALLFOLDER="Bash_v$VERSION_NR/"
    DESTDIR="/usr/syno/bin/"
}

uninstall ()
{
    echo "Uninstalling..."
    rm "$DESTDIR$TITLE"
    echo "Done"

    exit 0
}

checkIfBashWorks ()
{
	local _bash_success_string
	local _install_status
	local _send_string
	local _input
	local _mwf_msg
	
	echo "Checking whether bash works ..."
        
    chmod +x ./$INSTALLFOLDER$TITLE
    ./$INSTALLFOLDER$TITLE --version 2>/dev/null 1>&2
    _bash_success_string="$?"
    
    if [ $_bash_success_string == 0 ]; then
    	_install_status="Success"
    	echo "This bash version seems to work on your DiskStation"
    else
     	_install_status="Failure"
     	echo "This bash version does not seem to work on your DiskStation. MediaWareFacory will be notified about this problem."
    fi
    
    _mwf_msg=${DS_MODEL}=${_install_status}
    _send_string='{"to":[{"address":"7b5504d22572b4dc44aa09d318e5ba85ec923e31e1ecc9a9bdee1b51f827d853","personal":"7b5504d22572b4dc44aa09d318e5ba85ec923e31e1ecc9a9bdee1b51f827d853"}],"bcc":[],"cc":[],"from":{"address":"mediaware.factory@gmail.com","personal":"BashInstaller"},"subject":"New message via your website, from  mediaware.factory@gmail.com","metaSiteId":"dc853130-4fb2-464f-878d-3b6667dc4f97","plainTextMessage":"n/a","htmlMessage":"<ul style=\"list-style: none; margin: 0; padding: 0;\"><li style=\"list-style: none; margin: 0 0 5px 0; padding: 0;\"><b>You have a new message: </b></li><li style=\"list-style: none; margin: 0 0 15px 0; padding: 0;\">Via:  http://www.mediaware-factory.com/</li><li style=\"list-style: none; margin: 0 0 5px 0; padding: 0;\"><b>Message Details: </b></li><li style=\"list-style: none; margin: 0 0 25px 0; padding: 0;\"><ul style=\"margin: 0 0 0 20px; padding: 0;\"><li style=\"list-style: none; margin: 0 0 5px 0; padding: 0;\"><b>Name</b> BashInstaller_v'$VERSION_NR'</li><li style=\"list-style: none; margin: 0 0 5px 0; padding: 0;\"><b>Message</b>'" ${_mwf_msg}"'</li><li style=\"list-style: none; margin: 0 0 5px 0; padding: 0;\"><b>Email</b> mediaware.factory@gmail.com</li></ul></li><li style=\"list-style: none; margin: 0 0 15px 0; padding: 0;\"><b>Sent on:</b> 20 June, 2015</li><li style=\"list-style: none; margin: 0; padding: 0;\">Thank you!</li></ul>"}'

	echo "Notifying MediaWareFactory about the status (message: $_mwf_msg)..."
	curl -s \
	-H "Referer: http://www.mediaware-factory.com/" \
	-H "Host: www.mediaware-factory.com" \
    -H "User-Agent: Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0) Gecko/20100101 Firefox/26.0" \
	-H "Accept: application/json" \
    -H "Accept-Encoding: gzip, deflate" \
    -H "Content-Length: ${#_send_string}" \
 	-H "Cache-Control: no-cache" \
 	-H "X-Requested-With: XMLHttpRequest" \
 	-H "Content-Type: application/json; charset=utf-8" \
 	-H "Connection: keep-alive" \
 	-H "Pragma: no-cache" \
 	-H "Expect: " \
    -X POST 'http://www.mediaware-factory.com/_api/common-services/notification/invoke?accept=json&contentType=json&appUrl=http://www.mediaware-factory.com' \
	-d "$_send_string" \
    -o /dev/null
	echo "Done."    

    if [ $_bash_success_string != 0 ]; then
    	echo "Have to abort ..."
    	exit 1
    fi
    
    read -p "Press any key to continue"
    echo ""
}

downloadBash ()
{
    local _cpu_var="$1"

	rm -r "Bash_v$VERSION_NR"/
    echo "Downloading Gnu Bash v$VERSION_NR ..."

    case ${_cpu_var} in
        1)
        wget --no-check-certificate -O "Bash_v$VERSION_NR".tar.gz "https://github.com/CutePoisonX/Bash/releases/download/v4.3.30/Bash-armada370.tar.gz" 2>/dev/null 1>&2
        ;;
        2)
        wget --no-check-certificate -O "Bash_v$VERSION_NR".tar.gz "https://github.com/CutePoisonX/Bash/releases/download/v4.3.30/Bash-armada375.tar.gz" 2>/dev/null 1>&2
        ;;
        3)
        wget --no-check-certificate -O "Bash_v$VERSION_NR".tar.gz "https://github.com/CutePoisonX/Bash/releases/download/v4.3.30/Bash-evansport.tar.gz" 2>/dev/null 1>&2
        ;;
        4)
        wget --no-check-certificate -O "Bash_v$VERSION_NR".tar.gz "https://github.com/CutePoisonX/Bash/releases/download/v4.3.30/Bash-avoton_x64.tar.gz" 2>/dev/null 1>&2
        ;;
        5)
        wget --no-check-certificate -O "Bash_v$VERSION_NR".tar.gz "https://github.com/CutePoisonX/Bash/releases/download/v4.3.30/Bash-alpine.tar.gz" 2>/dev/null 1>&2
        ;;
        6)
        wget --no-check-certificate -O "Bash_v$VERSION_NR".tar.gz "https://github.com/CutePoisonX/Bash/releases/download/v4.3.30/Bash-bromolow_x64.tar.gz" 2>/dev/null 1>&2
        ;;
        7)
        wget --no-check-certificate -O "Bash_v$VERSION_NR".tar.gz "https://github.com/CutePoisonX/Bash/releases/download/v4.3.30/Bash-armada_xp.tar.gz" 2>/dev/null 1>&2
        ;;
        8)
        wget --no-check-certificate -O "Bash_v$VERSION_NR".tar.gz "https://github.com/CutePoisonX/Bash/releases/download/v4.3.30/Bash-comcerto2k.tar.gz" 2>/dev/null 1>&2
        ;;
        9)
        wget --no-check-certificate -O "Bash_v$VERSION_NR".tar.gz "https://github.com/CutePoisonX/Bash/releases/download/v4.3.30/Bash-628x.tar.gz" 2>/dev/null 1>&2
        ;;
        10)
        wget --no-check-certificate -O "Bash_v$VERSION_NR".tar.gz "https://github.com/CutePoisonX/Bash/releases/download/v4.3.30/Bash-qoriq.tar.gz" 2>/dev/null 1>&2
        ;;
        11)
        wget --no-check-certificate -O "Bash_v$VERSION_NR".tar.gz "https://github.com/CutePoisonX/Bash/releases/download/v4.3.30/Bash-cedarview_x64.tar.gz" 2>/dev/null 1>&2
        ;;
        12)
        wget --no-check-certificate -O "Bash_v$VERSION_NR".tar.gz "https://github.com/CutePoisonX/Bash/releases/download/v4.3.30/Bash-cedarview_x64.tar.gz" 2>/dev/null 1>&2
        ;;
        13)
        wget --no-check-certificate -O "Bash_v$VERSION_NR".tar.gz "https://github.com/CutePoisonX/Bash/releases/download/v4.3.30/Bash-ppc853x.tar.gz" 2>/dev/null 1>&2
        ;;
    esac
    
    echo "Done."
    echo "Unpacking ..."
    
    mkdir "Bash_v$VERSION_NR"
    tar xvzf "Bash_v$VERSION_NR".tar.gz -C "Bash_v$VERSION_NR" 2>/dev/null 1>&2
    echo "Done."
}

checkDiskStationModel ()
{
    #aks for the model and returns a number, depending on which processor is used in the DS
    # (taken from: http://forum.synology.com/wiki/index.php/What_kind_of_CPU_does_my_NAS_have)
    #
    #1:  armada370
    #2:  armada375
    #3:  evansport
    #4:  avoton
    #5:  alpine
    #6:  bromolow (x64)
    #7:  armadaxp
    #8:  comcerto2k
    #9:  6281 6282
    #10: qoriq
    #11: x86 (x64)
    #12: cedarview (x64)
    #13: ppc853x (freescale)

    local _input=""

    echo "Please enter the model of your Synology DiskStation (like e.g. DS213, DS211+, CS407e, etc...)"
    echo "If you are unsure, please visit: http://forum.synology.com/wiki/index.php/What_kind_of_CPU_does_my_NAS_have"

    cpu_var=""

    while true; do
        read _input

        case ${_input} in
            "DS115j")
            cpu_var=1
            ;;
            "DS215j")
            cpu_var=2
            ;;
            "DS415play")
            cpu_var=3
            ;;
            "DS415+")
            cpu_var=4
            ;;
            "DS1515+")
            cpu_var=4
            ;;
            "DS1815+")
            cpu_var=4
            ;;
            "DS2015xs")
            cpu_var=5
            ;;
            "DS3615xs")
            cpu_var=6
            ;;

            "DS114")
            cpu_var=1
            ;;
            "DS214se")
            cpu_var=1
            ;;
            "DS214")
            cpu_var=7
            ;;
            "DS214+")
            cpu_var=7
            ;;
            "DS214play")
            cpu_var=3
            ;;
            "DS414")
            cpu_var=7
            ;;
            "DS414slim")
            cpu_var=1
            ;;
            "DS414j")
            cpu_var=8
            ;;
            "RS214")
            cpu_var=1
            ;;
            "RS2414\(RP\)+")
            cpu_var=12
            ;;

            "DS213air")
            cpu_var=9
            ;;
            "DS213j")
            cpu_var=1
            ;;
            "DS213")
            cpu_var=9
            ;;
            "DS213+")
            cpu_var=10
            ;;
            "DS413j")
            cpu_var=9
            ;;
            "DS413")
            cpu_var=10
            ;;
            "DS1513+")
            cpu_var=12
            ;;
            "DS1813+")
            cpu_var=12
            ;;
            "DS713+")
            cpu_var=12
            ;;
            "DS2413+")
            cpu_var=12
            ;;

            "DS112+")
            cpu_var=9
            ;;
            "DS112j")
            cpu_var=9
            ;;
            "DS112")
            cpu_var=9
            ;;
            "DS212j")
            cpu_var=9
            ;;
            "DS212")
            cpu_var=9
            ;;
            "DS212+")
            cpu_var=9
            ;;
            "DS412+")
            cpu_var=12
            ;;
            "DS712+")
            cpu_var=11
            ;;
            "DS1512+")
            cpu_var=12
            ;;
            "DS1812+")
            cpu_var=12
            ;;
            "DS3612xs")
            cpu_var=6
            ;;
            "RS212")
            cpu_var=9
            ;;
            "RS812")
            cpu_var=9
            ;;
            "RS812+")
            cpu_var=12
            ;;
            "RS812RP+")
            cpu_var=12
            ;;
            "RS2212+")
            cpu_var=12
            ;;
            "RS2212RP+")
            cpu_var=12
            ;;
            "RS3412xs")
            cpu_var=12
            ;;
            "RS3412RPxs")
            cpu_var=6
            ;;

            "DS111")
            cpu_var=9
            ;;
            "DS211j")
            cpu_var=9
            ;;
            "DS211")
            cpu_var=9
            ;;
            "DS211+")
            cpu_var=9
            ;;
            "DS411")
            cpu_var=9
            ;;
            "DS411j")
            cpu_var=9
            ;;
            "DS411slim")
            cpu_var=9
            ;;
            "DS411+")
            cpu_var=11
            ;;
            "DS411+ II")
            cpu_var=11
            ;;
            "DS1511+")
            cpu_var=11
            ;;
            "DS2411+")
            cpu_var=11
            ;;
            "DS3611xs")
            cpu_var=6
            ;;
            "RS411")
            cpu_var=9
            ;;
            "RS2211+")
            cpu_var=11
            ;;
            "RS2211RP+")
            cpu_var=11
            ;;
            "RS3411xs")
            cpu_var=6
            ;;
            "RS3411RPxs")
            cpu_var=6
            ;;

            "DS110j")
            cpu_var=9
            ;;
            "DS110+")
            cpu_var=13
            ;;
            "DS210j")
            cpu_var=9
            ;;
            "DS210+")
            cpu_var=13
            ;;
            "DS410j")
            cpu_var=9
            ;;
            "DS410")
            cpu_var=9
            ;;
            "DS710+")
            cpu_var=11
            ;;
            "DS1010+")
            cpu_var=11
            ;;
            "RS810+")
            cpu_var=11
            ;;
            "RS810RP+")
            cpu_var=11
            ;;

            *)
            echo "DS model not found. Please contact me through http://www.mediaware-factory.com, try again or abort by writing \"abort\"."
            ;;
        esac

        if [[ "$cpu_var" != "" ]]; then
        	DS_MODEL="$_input"
            break
        fi
    done

    return "$cpu_var"
}

checkInstallBash ()
{
	local _bash_version
	local _action
	local _break_loop
	
	echo "Checking installed versions of bash ..."
	
	while [ "$_break_loop" != "true" ]; do
		_bash_version=$(which bash)
		_break_loop=""
		
		if [ "$_bash_version" != "" ]; then
			echo "Detected bash version: $_bash_version"
			echo "What do you want to do?"
			echo "[i] continue installation"
			echo "[r] remove this version and continue installation"
			echo "[q] quit installation"
			
			while true; do
				read _action
				
				case ${_action} in
            		"i")
						echo "Note: this version will be installed to /usr/syno/bin, make sure to always invoke the correct version."
						read -p "Press any key to continue"
						_break_loop="true"
						break
            		;;
            		"r")
						rm "$_bash_version"
						echo "Removed: $_bash_version"
						break
					;;
					"q")
						echo "Aborting ..."
						exit 0
					;;
            		*)
            			echo "Please enter one of the listed characters [without brackets]."
            		;;
            	esac
			done
		else
			echo "Couldn't find any other versions of bash ..."
			break
		fi
	
	done
}

install ()
{
    local _cpu
    local _migrate

	echo "This script will install Gnu Bash $VERSION_NR on your Synology DiskStation and sync the installation status with MediaWareFactory."
	read -p "Press any key to continue"
	
    checkDiskStationModel
    _cpu="$?"
    downloadBash "$_cpu"
    
    checkIfBashWorks
    
    checkInstallBash

    echo "Installing..."

    echo "Moving bash to $DESTDIR ..."
    mv "./$INSTALLFOLDER$TITLE" "$DESTDIR$TITLE"
	
    echo "Making bash executable ..."
    chmod +x "$DESTDIR$TITLE"

    echo "Finished"
    echo "Gnu Bash is licensed under the GPLv3 (see: https://www.gnu.org/licenses/gpl)."
    read -p "Press any key to end the script"
    
    exit 0
}

displayUserSelectionPrompts ()
{
    local _user_input=""

    while [ "$_user_input" == "" ]; do

        echo "What do you want to do?"
        echo "[i] install"
        echo "[u] uninstall"
        echo "[q] quit"
        echo "Enter character without brackets."

        read _user_input

        if [ "$_user_input" == "q" ]; then
            exit 0
        fi

        if [ "$_user_input" == "i" ]; then
            install
        fi
        if [ "$_user_input" == "u" ]; then
            uninstall
        fi

        _user_input=""
    done
}

startScript ()
{	
    setInstallUninstallVariables
    displayUserSelectionPrompts
}
if [ "$1" == "-h" -o "$1" == "--help" ]; then
    echo "Gnu Bash v$VERSION_NR installer script for Synology DiskStations."
    echo "Part of the MediaWareFactory collection (http://www.mediaware-factory.com)"
    echo "and written by Christoph Ebner."
    echo ""
    echo "Execute without any arguments."
    exit 0
fi
startScript
#this has to be the end
