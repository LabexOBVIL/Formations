declare namespace li = "com:oxiane:formation:xml:livres";
declare namespace output = "http://www.w3.org/2010/xslt-xqueryserialization";

declare option output:method "xml";
declare option output:indent "yes";
declare option output:omit-xml-declaration "yes";

for tumbling window $book in doc('livres.xml')/li:livres/li:livre/li:isbn

start $s at $s-pos previous $s-prev when($s-pos eq 1) or (string-length($s) ne string-length($s-prev)) 
let $isbnLen := replace($s, '-', '') => string-length()
return <livres>
    <livre> {
        element {if ($isbnLen eq 10) then 'vieux' else 'jeune'}
        {
        for $val in $book/text()
            return <isbn>{$val}</isbn>
        }
    }</livre>
</livres>