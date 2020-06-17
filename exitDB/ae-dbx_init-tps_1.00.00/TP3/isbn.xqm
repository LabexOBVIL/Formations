declare namespace isbnf = "com:oxiane:formation:xq:libs:isbn";
declare namespace li = "com:oxiane:formation:xml:livres";

import module namespace str = "com:obvil:formation:xml:strings" at "strings.xqm";

(: Créer une première fonction qui vérifie que le code passé est bien un livre (donc qui commence
bien par '978' ou par '979'. Cette fonction prend une chaîne de caractères en paramètre et
renvoie un boolean. Les commentaires en XQuery sont encadrés par (: et :). Ce n'est pas très
joli, mais cela permet de documenter les fonctions. Ajouter la documentation de la fonction. De
façon générale, toute fonction publique doit être documentée, avec une description claire de ce
qu'elle fait d'un point de vue métier, une description de ses paramètres et de ce qu'elle renvoie. :)

declare %private function isbnf:clean-isbn($isbn as xs:string) as xs:string {
    $isbn => replace("[^0-9]", '')
};

declare function isbnf:isBook($isbn as xs:string) as xs:boolean {
    (: Retourne vrai si le numéro est un isbn :)
    $isbn => starts-with("978") or $isbn => starts-with("979")
};

declare function isbnf:normalize-isbn($isbn as xs:string) as xs:string {
    (: Retourne un isbn normalisé s'il est sur 13 positions :)
    if ($isbn => str:digitLength() = 13) then
        $isbn => substring(5)
    else
        $isbn
};

declare function isbnf:split-isbn($isbn as xs:string) as xs:string+ {
    (: Split le isbn sur le '-' :)
    $isbn => tokenize('[^0-9]')
};

(: Créer 4 fonctions qui prennent en paramètre une chaîne de caractères et qui renvoient
respectivement le domaine ISBN, le code éditeur, le numéro de publication, et le code de
contrôle. Ces 4 fonctions utiliseront les précédentes.:)

declare function isbnf:get-domain($isbn as xs:string) as xs:string {
    let $code as xs:string+ := $isbn => isbnf:normalize-isbn() => isbnf:split-isbn()
    return $code[1]
};

declare function isbnf:get-editor($isbn as xs:string) as xs:string {
    let $code as xs:string+ := $isbn => isbnf:normalize-isbn() => isbnf:split-isbn()
    return $code[2]
};

declare function isbnf:get-publication($isbn as xs:string) as xs:string {
    let $code as xs:string+ := $isbn => isbnf:normalize-isbn() => isbnf:split-isbn()
    return $code[3]
};

declare function isbnf:get-control($isbn as xs:string) as xs:string {
    let $code as xs:string+ := $isbn => isbnf:normalize-isbn() => isbnf:split-isbn()
    return $code[4]
};

<livres>
{
for $book in doc('livres.xml')/li:livres/li:livre
return
    <info>
    <livre>{$book/li:titre/data()}</livre>
    <isbn>
        <full>{$book/li:isbn/data()}</full>
        <domaine>{$book/li:isbn=>isbnf:get-domain()}</domaine>
        <editor>{$book/li:isbn=>isbnf:get-editor()}</editor>
        <pub>{$book/li:isbn=>isbnf:get-publication()}</pub>
        <control>{$book/li:isbn=>isbnf:get-control()}</control>
    </isbn>
    </info>
}
</livres>