declare namespace li = "com:oxiane:formation:xml:livres";

for $book in doc('livres.xml')/li:livres/li:livre

let $isbn := replace($book/li:isbn/data(), '-', '')
let $isbnLen := string-length($isbn)

group by $isbnLen
order by $isbnLen descending

return <livre>
    <date>{if ($isbnLen eq 10) then 'av. 2007' else 'ap. 2007'}</date>
    {for $title in $book/li:titre
    return <titre>{$title/data()}</titre>
    }
</livre>