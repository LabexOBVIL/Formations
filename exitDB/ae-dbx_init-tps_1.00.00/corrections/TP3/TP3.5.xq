declare namespace li = "com:oxiane:formation:xml:livres";
declare namespace txt = "com:oxiane:formation:text";
declare namespace at = "com:oxiane:formation:xml:auteurs";

for $at in doc("../../TP3/auteurs.xml")/at:auteurs/at:auteur
for $li allowing empty in doc("../../TP3/livres.xml")/li:livres/li:livre[li:auteurs/li:auteur/@refid = $at/at:id/string()]
return 
<auteur>
  <nom>{$at/string-join((at:prenom/string(),at:nom/string()),' ')}</nom>
  {if(not(empty($li))) then $li/li:resume/string() else ()}
</auteur>