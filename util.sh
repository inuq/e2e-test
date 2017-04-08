#!/bin/bash
#
readonly REPLACEMENT_CONTITION="GRID_HOST"

#######################################
# Get docker host ip address
# Globals:
#   HOST_IP_ADRESS
#   TARGET_FILE
# Arguments:
#   None
# Returns:
#   None
#######################################
string_substitution(){
    if [ "${STRING_SUBSTITUTION}" == 'ON' ] ; then
      sed -i -e "s/${REPLACEMENT_CONTITION}/${HOST_IP_ADRESS}/g" ${TARGET_FILE}
    fi
}
#######################################
# Get docker host ip address
# Globals:
#   HOST_OS
# Arguments:
#   None
# Returns:
#   None
#######################################
get_host_ip_address(){
    HOST_IP_ADRESS=`ip route | awk 'NR==1 {print $3}'`
    if [ "${HOST_OS}" == 'mac' ] ; then
        HOST_IP_ADRESS=`nslookup ${HOST_IP_ADRESS} | awk 'NR==1 {print $2}'`
    fi
    echo "Docker Host IP Address = '${HOST_IP_ADRESS}'"
}

#######################################
# Check the options
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
check_option(){
    if [ -z "${HOST_OS+x}" ] ; then
        echo >&2 "error : docker host os is not specified." && exit 1
    fi
    if [ -z "${TARGET_FILE+x}" ] ; then
        STRING_SUBSTITUTION="OFF"
    else
        STRING_SUBSTITUTION="ON"
    fi
}

#######################################
# Gets options
# Globals:
#   None
# Arguments:
#   $@
# Returns:
#   None
#######################################
get_option(){
	while [ $# -gt 0 ];
	do
    	case ${1} in
        	--hostos)
            	HOST_OS=${2}
            	shift
        		;;
          --file)
              TARGET_FILE=${2}
              shift
          	;;
        	*)
            	echo "[ERROR] Invalid option '${1}'"
            	exit 1
        		;;
    	esac
    	shift
	done
}

#
get_option $@
check_option
get_host_ip_address
string_substitution
