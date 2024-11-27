
#
# []ssh into the server using the bash shell
#
source do24.env
source ${DO24_HOME}/do2410/do4a_access_key.sh

#
# []do4q4
#

do4_ssh_x="ssh -i ${do4_ssh_key} ${do4_connection}"

do4_ssh(){ fname=${FUNCNAME[0]} && log "${fname} : ${fname}_, ${fname}__ " ; } 
do4_ssh_(){ echo ${do4_ssh_x} ; } 
do4_ssh__(){ $(do4_ssh_) ; }
