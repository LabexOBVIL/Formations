declare namespace ox = "com:oxiane:formation";

for $form in doc('../../TP1/catalogue.xml')/ox:formations/ox:formation
order by $form/titre/text() ascending
where $form/contains(@id, 'X')
return <formation>{$form/@id}</formation>