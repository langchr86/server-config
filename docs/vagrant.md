vagrant
=======


troubleshooting
---------------


### certificate problems during plugin installation

~~~~~~
$ vagrant up
Vagrant failed to initialize at a very early stage:

The plugins failed to initialize correctly. This may be due to manual
modifications made within the Vagrant home directory. Vagrant can
attempt to automatically correct this issue by running:

  vagrant plugin repair

If Vagrant was recently updated, this error may be due to incompatible
versions of dependencies. To fix this problem please remove and re-install
all plugins. Vagrant can attempt to do this automatically by running:

  vagrant plugin expunge --reinstall

Or you may want to try updating the installed plugins to their latest
versions:

  vagrant plugin update

Error message given during initialization: Unable to resolve dependency: user requested 'vagrant-disksize (= 0.1.3)'


$ vagrant plugin install vagrant-disksize
Installing the 'vagrant-disksize' plugin. This can take a few minutes...
ERROR:  SSL verification error at depth 3: unable to get local issuer certificate (20)
ERROR:  You must add /C=US/O=Starfield Technologies, Inc./OU=Starfield Class 2 Certification Authority to your local trusted store
Vagrant failed to load a configured plugin source. This can be caused
by a variety of issues including: transient connectivity issues, proxy
filtering rejecting access to a configured plugin source, or a configured
plugin source not responding correctly. Please review the error message
below to help resolve the issue:

  SSL_connect SYSCALL returned=5 errno=0 peeraddr=18.165.183.71:443 state=error: certificate verify failed (https://gems.hashicorp.com
/specs.4.8.gz)

Source: https://gems.hashicorp.com/


$ vagrant plugin install --plugin-clean-sources --plugin-source https://rubygems.org vagrant-disksize
Installing the 'vagrant-disksize' plugin. This can take a few minutes...
Fetching vagrant-disksize-0.1.3.gem
Installed the plugin 'vagrant-disksize (0.1.3)'!
~~~~~~

