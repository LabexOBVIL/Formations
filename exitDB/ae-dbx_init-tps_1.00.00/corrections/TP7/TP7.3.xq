declare namespace li = "com:oxiane:formation:xml:livres";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
import module namespace isbn = "com:oxiane:formation:xq:isbn" at "isbn.xqm";
declare option output:indent "yes";

<livres>{
for $li in doc("../../TP3/livres.xml")/li:livres/li:livre
return
  <livre>
    <titre>{$li/li:titre/data()}</titre>
    <isbn>{$li/li:isbn/data()}</isbn>
    <domaine>{$li/li:isbn=>isbn:getDomain()}</domaine>
    <editeur>{$li/li:isbn/data()=>isbn:getEditor()}</editeur>
    <publication>{$li/li:isbn/data()=>isbn:getPublication()}</publication>
    <controle>{$li/li:isbn/data()=>isbn:getControl()}</controle>
  </livre>
}</livres>