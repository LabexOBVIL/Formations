declare namespace ox = "com:oxiane:formation";


for $formation in //ox:formation
    let $val := $formation/@*/data()
    order by $formation/titre/text() ascending
    where contains($val, 'X')
    return <form-id>{$val}</form-id>