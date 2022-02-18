output sshcommand {
  value = "ssh root@${ibm_is_floating_ip.fip.address}"
}

output vpc_id {
 value = ibm_is_vpc.vpc_vm.id
}