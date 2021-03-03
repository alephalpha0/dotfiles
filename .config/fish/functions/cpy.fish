function cpy
  command rsync -avz --checksum --progress -h $argv
end
