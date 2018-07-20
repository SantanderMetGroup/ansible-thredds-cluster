If you get this error message when doing `vagrant up` 

There was an error while executing `VBoxManage`, a CLI used by Vagrant
for controlling VirtualBox. The command and stderr is shown below.

  Command: ["startvm", "b38b8f95-fcd3-4fcb-ab1c-63aa02a5fc16", "--type", "headless"]

 **Stderr: VBoxManage: error: VDEplug library: not found (VERR_PDM_HIF_OPEN_FAILED).**
  VBoxManage: error: Failed to attach the network LUN (VERR_PDM_HIF_OPEN_FAILED)
  VBoxManage: error: Details: code NS_ERROR_FAILURE (0x80004005), component ConsoleWrap, interface IConsole

Do the following:

`cp /usr/lib/libvdeplug.so.2 /usr/lib/libvdeplug.so`



You wil most likely have to install libpcap:
`apt install libpcap-dev`


vde download mirror: https://sourceforge.net/projects/vde/files/vde2/2.3/vde2-2.3.tar.gz/download

NOTE: ./configure --enable-experimental
