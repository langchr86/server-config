claudia-server
==============


## Common steps


Find the common steps needed for this host here:
[Deployment on Ubuntu Host](/docs/deployment-ubuntu.md)


## Prepare block devices

Ensure that the data disks correspond with the used paths in the playbook.


## Run ansible playbook

Ensure to use the real end-user `claudia` for this step.
First we make login easier by deploying SSH public key: `ssh-copy-id claudia@192.168.1.9`

If the samba role fails to create the user do it manually:


## Configure Samba shares on host

* `\\192.168.1.9\daten-sicher`
* `\\192.168.1.9\daten-unsicher`


## Configure RSync backups on host

See: [rsync-daemon role](rsync-daemon.md)


## Others

* [Jellyfin](jellyfin.md)
