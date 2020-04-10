 # sed -E -f change.sed covid19.erb >updated  from Apr4

git show fe5290:dashboards/covid19.erb  | sed -E -f change.sed  >  ../covid19.erb 


git commit -am " date  +%m-%d -d -1day "

