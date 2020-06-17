declare namespace html = "html:com";

for $x in (1 to 10)
    return <html:tr>{
    
    for $y in (1 to 10)
    return <html:td>{$x} * {$y} = {$x * $y}</html:td>
        } </html:tr>

for $x in (1 to 10)
return
<tr>
    <th>{$x}</th>
{
for $y in (1 to 10)
return <td>{$x * $y}</td>
}
</tr>

<html><table>
{(
<tr>{for $op in (1 to 10) return <th>{$op}</th>}</tr>,
for $x in (1 to 10)
return    
    <tr><th>{$x}</th>
    {
    for $y in (1 to 10)
        return <td>{$x * $y}</td>
    }
    </tr>
)}
</table>
</html>