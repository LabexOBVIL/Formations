xquery version "3.1";

declare namespace li = "com:oxiane:formation:xml:livres";
declare namespace str = "com:oxiane:formation:xml:str";

(: > Commencer par écrire une expression qui affiche toutes les balises ISBN 10.
> Puis enrichir cette expression pour afficher l'ancienne version et la nouvelle
> Enfin, écrire l'expression de mise à jour.
> Réafficher le fichier pour vérifier que tous les ISBN sont bien maintenant au format ISBN 13 :)

declare function str:digitLength($s as xs:string) as xs:integer {
  $s => string-length()
};

declare function str:clean($s as xs:string) as xs:integer {
    $s => replace('[^0-9]', '')
};

for $book in doc('/db/data/shared/livres.xml')/li:livres/li:livre
let $isbn := $book/li:isbn
let $isbn-length := $isbn/data() => str:digitLength()
return
    if ($isbn-length eq 13) then
        
        update replace $isbn/text() with xs:string('978-' || $isbn/data())
    else
        xs:string($isbn/data())
