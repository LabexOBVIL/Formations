module namespace isbn = "com:oxiane:formation:xq:isbn"; 
import module namespace str = "com:oxiane:formation:xq:common:string" at "strings.xqm";

(:
  Cette fonction vérifie que le code passé correspond bien à un ISBN.
  Soit le nombre de chiffres dans le code est 10, soit il commence par
  978 ou 979.
  @param $code Le code ISBN à tester
  @return true si c'est ISBN, false sinon.  
:)
declare function isbn:isLivre($code as xs:string) as xs:boolean {
  let $length as xs:integer := str:digitLength($code)
  return 
    if($length eq 10) then true() 
    else matches('^97[89].*$',$code)
};

(:
  Renvoie à partir d'un code ISBN valide la version en ISBN 10
  @param $code L'ISBN à normaliser
  @return La version sur 10 digits, avec les éparateurs de groupe.
:)
declare function isbn:normalize($code as xs:string) as xs:string {
  if(str:digitLength($code) eq 10) then $code
  else $code=>substring(5)
};

(:
  Cette fonction renvoie les différents groupes de l'ISBN sous la forme d'une séquence.
  @param $code L'ISBN à découper
  @return Une séquence de 4 chaînes de caractères.
:)
declare function isbn:split($code as xs:string) as xs:string+ {
  isbn:normalize($code)=>tokenize('[^0-9]')
};

declare %private function isbn:getDomain($domain as xs:string, $editor as xs:string, $publi as xs:string, $control as xs:string) as xs:string {
  $domain
};

declare %private function isbn:getEditor($domain as xs:string, $editor as xs:string, $publi as xs:string, $control as xs:string) as xs:string {
  $editor
};

declare %private function isbn:getPublication($domain as xs:string, $editor as xs:string, $publi as xs:string, $control as xs:string) as xs:string {
  $publi
};
declare %private function isbn:getControl($domain as xs:string, $editor as xs:string, $publi as xs:string, $control as xs:string) as xs:string {
  $control
};

(:
  Renvoie le domaine ISBN à partir d'un code ISBN sur 10 ou 13 caractères
  @param $code L'ISBN à traiter
  @return Le code domain de l'ISBN
:)
declare function isbn:getDomain($code as xs:string) as xs:string {
  let $seq as xs:string+ := isbn:split(isbn:normalize($code))
  return isbn:getDomain($seq[1], $seq[2], $seq[3], $seq[4])
};

(:
  Renvoie le code éditeur à partir d'un code ISBN sur 10 ou 13 caractères
  @param $code L'ISBN à traiter
  @return Le code éditeur de l'ISBN
:)
declare function isbn:getEditor($code as xs:string) as xs:string {
  let $seq as xs:string+ := isbn:split(isbn:normalize($code))
  return isbn:getEditor($seq[1], $seq[2], $seq[3], $seq[4])
};

(:
  Renvoie le numéro de publication à partir d'un code ISBN sur 10 ou 13 caractères
  @param $code L'ISBN à traiter
  @return Le numéro de publication de l'ISBN
:)
declare function isbn:getPublication($code as xs:string) as xs:string {
  let $seq as xs:string+ := isbn:split(isbn:normalize($code))
  return isbn:getPublication($seq[1], $seq[2], $seq[3], $seq[4])
};

(:
  Renvoie le code contrôle à partir d'un code ISBN sur 10 ou 13 caractères
  @param $code L'ISBN à traiter
  @return Le code contrôle de l'ISBN
:)
declare function isbn:getControl($code as xs:string) as xs:string {
  let $seq as xs:string+ := isbn:split(isbn:normalize($code))
  return isbn:getControl($seq[1], $seq[2], $seq[3], $seq[4])
};