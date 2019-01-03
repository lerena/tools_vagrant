#!/usr/bin/env bash
    # Instalar comando 'sed' para buscar y sustituir cadesas de caracteres en ficheros
sudo yum install sed
    # Desactivar SELINUX Centos 7
sudo sed -i 's/SELINUX=enforcing/SELINUX=disable/g' /etc/sysconfig/selinux
    # Activar acceso remotos SSHD como root
sudo sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
sudo sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
    # Recargar SSHD
sudo systemctl restart sshd
    # Reiniciar para que SELINUX se cierre
sudo init 6