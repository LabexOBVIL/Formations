<html>
  <head>
    <title>Tricher pour ses tables de multiplication</title>
  </head>
  <boby>
  <table>{
(
  <tr><th/>{for $x in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10) return <th>{$x}</th>}</tr>,
  for $y in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  return
    <tr><th>{$y}</th> {
      for $x in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
      return <td>{$x * $y}</td>
      }
    </tr>)
    }</table></boby>
</html>