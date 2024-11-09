#
# [] 
#
source do4b_bash_and_ssh.sh


#
# [] doctl
# https://docs.digitalocean.com/reference/doctl/how-to/install/
#
doc_brew='brew install doctl'


#
# []
#
doc_help_(){ echo "doctl help" ; }
doc_help__(){ $(doc_help_) ; }

doc_auth_a="doctl auth switch --access-token $DIGITALOCEAN_ACCESS_TOKEN"
doc_auth_(){ echo ${doc_auth_a} ; }
doc_auth__(){ $(doc_auth_) ; } 

doc_auth_init_a="doctl auth init --access-token $DIGITALOCEAN_ACCESS_TOKEN"
doc_auth_init_(){ echo ${doc_auth_init_a} ; }
doc_auth_init__(){ $(doc_auth_init_) ; }


doc_auth_list_(){ echo "doctl auth list" ; }
doc_auth_list__(){ $(doctl_auth_list_) ; }


doc_acc_get_(){ echo "doctl account get" ; }
doc_acc_get__(){ $(doc_acc_get_) ; }


doc_bill_get_(){ echo "doctl balance get" ; }
doc_bill_get__(){ $(doc_bill_get_) ; }

doc_invoice_(){ echo "doctl invoice list" ; }
doc_invoice__(){ $(doc_invoice_) ; }


doc_pjt_(){  echo "doctl projects list" ; }
doc_pjt__(){ $(doc_pjt_) ; }


# []vpcs
# https://docs.digitalocean.com/reference/doctl/reference/vpcs/
doc_vpc_(){ echo "doctl vpcs list" ; }
doc_vpc__(){ $(doc_vpc_) ; }

doc_vpc_help_(){ echo "doctl vpcs help" ; }
doc_vpc_help__(){ $(doc_vpc_help_) ; }



#
#
#

doc_cmp_ssh_(){ echo "doctl compute ssh help" ; }
doc_cmp_ssh__(){ $(doc_cmp_ssh_) ; }

doc_cmp_ssh_hlp_(){ echo "doctl compute ssh help" ; }
doc_cmp_ssh_hlp__(){ $(doc_cmp_ssh_hlp_) ; }

doc_cmp_ssh_id='454139843'
doc_cmp_ssh_id_(){ echo "doctl compute ssh ${doctl_cmp_ssh_id}" ; }
doc_cmp_ssh_id__(){ $(doc_cmp_ssh_id_) ; }

doc_cmp_ssh_key_(){ echo "doctl compute ssh-key list" ; }
doc_cmp_ssh_key__(){ $(doc_cmp_ssh_key_) ; }

doc_cmp_ssh_key_help_(){ echo "doctl compute ssh-key help" ; }
doc_cmp_ssh_key_help__(){ $(doc_cmp_ssh_key_help_) ; }

doc_cmp_ssh_key_new_(){ echo "doctl compute ssh-key create" ; }
doc_cmp_ssh_key_new__(){ $(doc_cmp_ssh_key_help_) ; }

doc_cmp_ssh_key_del_(){ echo "doctl compute ssh-key delete" ; }
doc_cmp_ssh_key_del__(){ $(doc_cmp_ssh_key_help_) ; }

doc_cmp_ssh_key_import_(){ echo "doctl compute ssh-key import" ; }
doc_cmp_ssh_key_import__(){ $(doc_cmp_ssh_key_import_) ; }







#
#
#
doc_cmp_(){ echo "doctl compute help" ; }
doc_cmp__(){ $(doc_cmp_) ; }

doc_cmp_size_(){ echo "doctl compute size list" ; }
doc_cmp_size__(){ $(doc_cmp_size_) ; }

doc_cmp_img_(){ echo "doctl compute image list-distribution " ; }
doc_cmp_img__(){ $(doc_cmp_img_) ; }

doc_cmp_dl_(){ echo "doctl compute droplet list" ; }
doc_cmp_dl__(){ $(doc_cmp_dl_) ; }
 

#
# []dl_new
# https://docs.digitalocean.com/reference/doctl/reference/compute/droplet/create/
# https://github.com/opendocs-md/do-tutorials/blob/master/md/en/how-to-use-doctl-the-official-digitalocean-command-line-client.md
# https://willcarh.art/blog/spinning-up-a-fleet-of-digitalocean-droplets
#
#  --user-data $'#!/bin/bash\n touch /root/example.txt; sudo apt update;sudo snap install doctl'
#dl_a="do$(date +%y%m%d)"           #
dl_s="--size s-1vcpu-1gb"          # cmp_size
dl_i="--image centos-stream-9-x64" # cmp_img
dl_img=$(doctl compute image list | grep "centos" | awk '{ print $2 }')
dl_r="--region nyc3"
dl_sk_fingerprint_file=${HOME_SSH}/id_rsa_do24.pub
dl_sk_fingerprint="$(ssh-keygen -E md5 -lf ${dl_sk_fingerprint_file} | awk '{print $2}' | cut -c 5-)"
dl_sk="--ssh-keys ${dl_sk_fingerprint}"
dl_v="--volumes "
dl_w="--wait"
dl_agent="--droplet-agent"
dl_backup="--enable-backups"
dl_monitor="--enable-monitoring"
dl_proj_id="--project-id"
dl_s_k="--ssh-keys"
dl_vpcs="--vpc-uuid c05a4820-d8b1-4517-9959-2c4ec4e4d0fc" # doc_vpc_
dl_uid="do$(date +%y%m%d)"
dl_arg1="${dl_uid} ${dl_i} ${dl_r} ${dl_s} ${dl_sk}"
dl_arg2=" ${dl_b} ${dl_c} ${dl_w}"



doc_cmp_dl_new_(){ echo "doctl compute droplet create ${dl_arg1} ${dl_arg2} " ; }
doc_cmp_dl_new__(){ $(doc_cmp_dl_new_) ; }
#  --region nyc1 --enable-ipv6 --size 4gb --image freebsd-10-2-x64 --ssh-keys 1797332 --wait
# return


dl_del_id="abc" # dl_list
doc_cmp_dl_del_(){ echo "doctl compute droplet delete ${dl_del_id} " ; }
doc_cmp_dl_del__(){ $(doc_cmp_dl_del_) ; }
#return

dl_act_off_id="abc"
doc_cmp_dl_act_off_(){ echo " doctl compute droplet-action shutdown ${dl_act_off_id}" ; }
doc_cmp_dl_act_off__(){ $(doc_cmp_dl_act_off_) ; }
#return

#
# []vol
# https://docs.digitalocean.com/reference/doctl/reference/compute/volume/create/
# doctl compute volume create example-volume --region nyc1 --size 4TiB --tag frontend,backend
# return
doc_cmp_vol_(){ echo "doctl compute volume list" ; }
doc_cmp_vol__(){ $(doc_cmp_vol_) ; }


vl_id="y24q4vol1"
vl_d="--desc y24q4vol1"
vl_s="--size 100GiB"
vl_r='--region nyc3'
vl_t="--fs-type ext4"
vl_l="--fs-label "
vl_arg="${vl_id} ${vl_d} ${vl_r} ${vl_s} ${vl_t} ${vl_l}"
doc_cmp_vol_new_(){ echo "doctl compute volume create ${vl_arg}" ; }
doc_cmp_vol_new__(){ $(doc_cmp_vol_new_) ; }

vl_del_uid="e9fec965-42b2-11ec-ac33-0a58ac14a1d1"
doc_cmp_vol_del_(){ echo "doctl compute volume delete ${vl_del_uid}" ; }
doc_cmp_vol_del__(){ $(doc_cmp_vol_del_) ; }

doc_cmp_vol_get_(){ echo "doctl compute volume get" ; }
doc_cmp_vol_get__(){ $(doc_cmp_vol_get_) ; }

doc_cmp_vol_snp_(){ echo "doctl compute volume snapshot" ; }
doc_cmp_vol_snp__(){ $(doc_cmp_vol_snp_) ; }

doc_cmp_vol_to_dl() {
    volume=$(doctl compute volume list | grep "$1" | awk '{ print $1 }')
    droplet=$(doctl compute droplet list | grep "$2" | awk '{ print $1 }')
    doctl compute volume-action attach "$volume" "$droplet"
}





#
# []secure
#
# https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04
# https://github.com/imthenachoman/How-To-Secure-A-Linux-Server
#
# 1. Login as root
# 2. Creating a new user
# 3. Granting Administrative Privileges
# 4. Setting Up a Firewall
# 5. Enabling External Access for Your Regular User
#   
do_new_stp1(){
    echo """
    """
}


#
# []snapshot
#
# For all my Droplets
FILTER=".[]|select(.resource_id==\"${DROPLET}\")"
doc_lst_(){
	DROPLETS=$(doctl compute droplet list --format=ID --no-header)
	for DROPLET in ${DROPLETS}
	do
	  doctl compute snapshot list \
	  --resource=droplet \
	  --output=json 
#	  | jq "${FILTER}"
	done
}
