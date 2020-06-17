declare namespace li = "com:oxiane:formation:xml:livres";

<livres>{
for $livre in doc("../../TP3/livres.xml")/li:livres/li:livre
let $isbnLength := $livre/li:isbn=>replace('[^0-9]','')=>string-length()
group by $isbnLength
order by $isbnLength descending
return
    element {if($isbnLength eq 10) then 'vieux' else 'jeune'}{for $l in $livre return
      <livre><isbn>{$l/li:isbn/text()}</isbn><titre>{$l/li:titre/text()}</titre></livre>
    }
}</livres>