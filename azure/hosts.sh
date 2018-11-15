#!/bin/bash

vmss_ip=$(echo "$(terraform output vm_ip)")

if [ -n "$vmss_ip" ]; then
  echo "host ansible_ssh_port=22 ansible_ssh_host=$vmss_ip" | tee inventory
else
  echo "vmss_ip is empty"
fi
