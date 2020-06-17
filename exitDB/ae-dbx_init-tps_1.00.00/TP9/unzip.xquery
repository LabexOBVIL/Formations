xquery version "3.1";

let $collection-uri := "/db/data/shared/"

let $zip := util:binary-doc($collection-uri || "library.zip")

return compression:unzip($zip, compression:no-filter#3, (),
function($path, $dt, $px){$collection-uri || $path}, ())