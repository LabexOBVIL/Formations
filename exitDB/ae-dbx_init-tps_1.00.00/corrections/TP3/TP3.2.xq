for $y in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
return
  <tr><th>{$y}</th> {
    for $x in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    return <td>{$x * $y}</td>
  }</tr>
