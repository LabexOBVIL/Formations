xquery version "3.1";
declare namespace li = "com:oxiane:formation:xml:livres";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "xml";
declare option output:indent "yes";
declare option output:omit-xml-declaration "yes";

<livres>{
for tumbling window $win in doc("../../TP3/livres.xml")/li:livres/li:livre
start 
  $s at $s-pos 
  previous $p 
  when 
    $s-pos eq 1 or 
    ($s/li:isbn=>replace('[^0-9]','')=>string-length() != $p/li:isbn=>replace('[^0-9]','')=>string-length()) 
return
    element {if($win[1]/li:isbn=>replace('[^0-9]','')=>string-length() eq 10) then 'vieux' else 'jeune'}{for $l in $win return
      <livre><isbn>{$l/li:isbn/text()}</isbn><titre>{$l/li:titre/text()}</titre></livre>
    }
}</livres>