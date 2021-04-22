#!/bin/bash
echo "$(tput setaf 2)
`date +"%A, %e %B %Y, %r"`
`uname -srmo`

$(tput sgr0)- Uptime.............: `uptime`
$(tput sgr0)- Running Processes..: `ps ax | wc -l | tr -d " "`
$(tput sgr0)- IP Addresses.......: `hostname | /usr/bin/cut -d " " -f 1` and `wget -q -O - http://icanhazip.com/ | tail`

$(tput sgr0)"
neofetch

if ps -p $SSH_AGENT_PID > /dev/null
then
   echo "ssh-agent is already running"
else
eval `ssh-agent -s`
ssh-add ~/.ssh/id_ed25519_envs && ssh-add ~/.ssh/id_ecdsa_rootofpime
fi
