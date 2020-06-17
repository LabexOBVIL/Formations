module namespace str = "com:obvil:formation:xml:strings";

declare function str:digitLength($string as xs:string) as xs:integer {
 $string => replace("[^0-9]", '') => string-length()
};