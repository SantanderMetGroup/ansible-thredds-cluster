# Switching scenario #
In this scenario a switched environment is created with VDE Switch, a virtual switch that can connect several network components together, in order to prove
that DSR can work with a Layer 2 switch between the load balancer and the servers.


## Requirements

You should install the following software in your **host** machine:
* vde_switch *(see the Important Notes section below)*

### vde_switch installation
Download the tarball file from the following URL:

[https://sourceforge.net/projects/vde/files/vde2/2.3/vde2-2.3.tar.gz/download](https://sourceforge.net/projects/vde/files/vde2/2.3/vde2-2.3.tar.gz/download)

And then configure the installation with:
`./configure --enable-experimental`

By activating this flag you will be able to capture packets on the switch.

## Execution
Before doing `vagrant up` you should start the vde_switch by running the following command:

`vde_switch -s /tmp/switch1`

With the `-s` option we tell vde_switch to create a socket in order to stablish a communication with the switch, and so we can capture on the switch as well;
this socket will be a parameter of Virtualbox in the Vagrantfile as well, so both must coincide.

After the switch has been started:
```
vagrant up --provision
ansible-playbook networking.yml
ansible-playbook deploy.yml --ask-vault-pass
```

If you want to capture packets on the switch you must do as it follows **from the switch's console**:


`plugin/add /usr/local/lib/vde2/plugins/pdump.so`

The you should see a message like this (check the Important Notes section below if you get any errors):

`Success 1000`

In order to start capturing:

`pdump/active 1`

And when you want to stop capturing:

`pdump/active 0`

You will find a **vde-dump.cap** file in your working directory which you can oper with Wireshark or simmilar.





### Documentation

* [VDE Switch General Info](http://wiki.virtualsquare.org/wiki/index.php/VDE)
* [VDE Switch Basic Networking](http://wiki.virtualsquare.org/wiki/index.php/VDE_Basic_Networking)


#### Important Notes

1. If you get this error message when doing `vagrant up`:
```
There was an error while executing `VBoxManage`, a CLI used by Vagrant
for controlling VirtualBox. The command and stderr is shown below.

  Command: ["startvm", "b38b8f95-fcd3-4fcb-ab1c-63aa02a5fc16", "--type", "headless"]

 `**`Stderr: VBoxManage: error: VDEplug library: not found (VERR_PDM_HIF_OPEN_FAILED).`**`
  VBoxManage: error: Failed to attach the network LUN (VERR_PDM_HIF_OPEN_FAILED)
  VBoxManage: error: Details: code NS_ERROR_FAILURE (0x80004005), component ConsoleWrap, interface IConsole
```
Do the following:

`cp /usr/lib/libvdeplug.so.2 /usr/lib/libvdeplug.so`



2. Also, you will most likely have to install libpcap if you want to capture:
`apt install libpcap-dev`
