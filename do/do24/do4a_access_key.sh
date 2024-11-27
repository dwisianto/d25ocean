#
# [] reading the environment file
#
source do4.env


#
#
#
log() { local now=$(date +'%y-%m-%d %H:%M:%S') && echo "[$now] $1" ; }
do_env(){
    log "do_user     ${do_user}"
    log "do_pass     ${do_pass}"
    log "do_address  ${do_address}"
}


# 
# [] ssh-keygen
# cd ~/.ssh
# ssh-keygen -f id_rsa_do24.pub -C xxx@yyy.zzz
# chmod 600 ~/.ssh/xx_xxx
#
HOME_SSH=${HOME}/.ssh
do4_ssh_cfg=$HOME_SSH/config
do4_ssh_key=$HOME_SSH/id_rsa_do24
do4_ssh_key_pub=$HOME_SSH/id_rsa_do24.pub


#
# https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/
#
do4_connection="${do_user}@${do_address}"  
do4_ssh_copy_id="ssh-copy-id ${do4_connection}"
do4_ssh_copy_(){ echo ${do4_ssh_copy_id} ; } 
do4_ssh_copy__(){ $(do4_ssh_copy_) ; } 
