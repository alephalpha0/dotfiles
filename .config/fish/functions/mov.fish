function mov
  command rsync -avz --checksum --progress -h --remove-source-files $argv
end
