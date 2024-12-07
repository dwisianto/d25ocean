
#
# []ssh into the server using the bash shell
#
source do24.env
source ${DO24_HOME}/do2410/do4a_access_key.sh



#
#
#
do4_scp_in__zip_folder="${DO24_HOME}/do24_setup"
do4_scp_in__zip_file="${do4_scp_in__zip_folder}_$(date +%F).zip"
do4_scp_in__zip_cmd="zip -r ${do4_scp_in__zip_file} ${do4_scp_in__zip_folder}"
do4_scp_in__zip(){ 
    echo """ 
        folder : ${do4_scp_in__zip_folder}
        file: ${do4_scp_in__zip_file}
    """ 
}
do4_scp_in__zip_(){ echo ${do4_scp_in__zip_cmd} ; }
do4_scp_in__zip__(){ $(do4_scp_in__zip_) ; }


#
#
#
do4_scp_in_src=${do4_scp_in__zip_file}
do4_scp_in_tgt='~/'
do4_scp_in_cmd="scp -i ${do4_ssh_key} ${do4_scp_in_src} ${do4_connection}:${do4_scp_in_tgt}"
do4_scp_in(){ 
    echo """
    Secure Copy using Key: ${do4_ssh_key}
        From       : ${do4_scp_in_src}
        To         : ${do4_connection}:${do4_scp_in_tgt}
    """
}
do4_scp_in_(){ echo ${do4_scp_in_cmd} ; } 
do4_scp_in__(){ $(do4_scp_in_)  ; }


#
#
#
do4_scp_out_zip_file=''
do4_scp_out_src=${DO24_SERVER}/${do4_scp_out_zip_file}
do4_scp_out_tgt=${DO24_HOME}
do4_scp_out_cmd="scp -i ${do4_ssh_key} ${do4_connection}:${do4_scp_out_src} ${do4_scp_out_tgt}"

do4_scp_out(){ 
    echo """
    Secure Copy using Key:${do4_ssh_key} 
        From       : ${do4_connection}:${do4_scp_out_src}
        To         : ${do4_scp_out_tgt}
    """
}
do4_scp_out_(){ echo ${do4_scp_out_cmd} ; }
do4_scp_out__(){ $(do4_scp_out_) ; }
