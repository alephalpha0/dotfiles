function sshup
  command eval (ssh-agent -c)
  ssh-add ~/.ssh/$argv
end
