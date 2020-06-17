xquery version "3.1";

let $col := collection("file:///Users/cmarchand/devel/formation/AE-DBX/src/main/tp-resources?recurse=yes&amp;select=*.xml")/*
return 
  if(empty($col)) then 'Aucun fichier trouvé'
  else for $n in $col
return name($n)
