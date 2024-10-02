Development by using Vagrant
============================

The whole setup can be emulated by using virtual machines managed by [Vagrant](https://www.vagrantup.com/).
This allows easy testing and development in fully disposable VMs.
The setup is optimized for the usage with [VirtualBox](https://www.virtualbox.org/).

Some of the usual commands are as follows:

~~~~~~
vagrant up              # create all VMs
vagrant up main         # create only the `main` VM specified in the `Vagrantfile`
vagrant provision main
~~~~~~

See the [Vagrantfile](/Vagrantfile) for more information.
