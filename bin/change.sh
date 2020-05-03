 # sed -E -f change.sed covid19.erb >updated  from Apr4

git show fe5290:dashboards/covid19.erb  | sed -E -f change.sed  >  ../dashboards/covid19.erb 

 sed -E -f change.sed  TEPL-covidzoom.rb > ../jobs/covidzoom.rb 

git commit -am "April update $(date  +%m-%d -d -1day) "
git diff --stat --cached origin/master


#verif
sed 's|.*\\1,||' change.sed| sed -E 's/[0-9]//g'
