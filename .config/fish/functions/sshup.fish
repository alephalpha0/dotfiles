# Defined in /data/data/com.termux/files/home/tmp/fish.HBT9nL/sshup.fish @ line 2
function sshup
  eval (ssh-agent -c)
  ssh-add ~/.ssh/$argv
end
