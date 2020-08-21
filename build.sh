GIT_SSH_COMMAND='ssh -i /root/gitkeys/id_rsa -o IdentitiesOnly=yes -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'  git clone git@www.github.com:<repo>
cd <repo>
docker build -t <tag> .
cat /root/registrypassword/password.txt | docker login <registry> --username <username> --password-stdin
