declare namespace li = "com:oxiane:formation:xml:livres";
declare namespace txt = "com:oxiane:formation:text";
declare namespace at = "com:oxiane:formation:xml:auteurs";

for $li in doc("../../TP3/livres.xml")/li:livres/li:livre
return <livre>
<titre>{$li/li:titre/string()}</titre>
{
  for $at in doc("../../TP3/auteurs.xml")/at:auteurs/at:auteur[at:id = $li/li:auteurs/li:auteur/@refid]
  return <auteur>{$at/string-join((at:prenom/string(),at:nom/string()),' ')}</auteur>
}
</livre>