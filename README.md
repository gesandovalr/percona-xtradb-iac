# percona-xtradb-iac

Ansible Playbooks.

As my previous post the hashicorp vault with the 3 nodes, they need to be deployed before the percona and this goes with AWX. I prefer it this way in order to have organized everything.

This is specifically for VMware so we start with the idea that we have a template created with Almalinux 9 and user called "myusr" and a Gitlab instance for execute the pipeline and variables to call the pipeline.

"prerequisite_install" : Role to install prerequisites and updates

"percona_Install": Install percona packges and database services initialization, and firewall rules (in the last post there is a certificate generatednamed tls.crt this is the hashicorp vault certificate and is needed role: certificate_install" and this certificate needs to be present in the playbook. I could probably do a section for that and upload it to an S3 but I'm too lazy.

"vault_agent": Hashicort vault agent installation.

"percona_bootstraper" : Bootstraper role for the 3 nodes, make sure you have ansible-vault with the secrets to setup the root password this setup was done to be load balanced using maxscale so there is section for maxscale too, I will post this in the future.

"keyring_install": add keyring configuration to Percona config files.

"certificates_copy": Copy the certificates from master node01 to the other two nodes.

"database_init": Database initialization.

