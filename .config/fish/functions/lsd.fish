function lsd
  command lsd -lAF --blocks=permission,size,date,name --date=relative --total-size --group-dirs first $argv
end
