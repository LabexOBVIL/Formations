module namespace str = "com:oxiane:formation:xq:common:string";

declare function str:digitLength($s as xs:string) as xs:integer {
  $s=>replace('[^0-9]','')=>string-length()
};