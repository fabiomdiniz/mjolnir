<html>
<head>
<title>Mjolnir - Agenda Octaplus</title>
<script src="http://code.jquery.com/jquery-1.4.3.min.js"></script>
<script src="/static/picnet.table.filter.min.js"></script>
<script>
  $.expr[':'].icontains = function(obj, index, meta, stack){
return (obj.textContent || obj.innerText || jQuery(obj).text() || '').toLowerCase().indexOf(meta[3].toLowerCase()) >= 0;
};

    $(document).ready(function() {
        $('#search_n').focus().keyup(function() {
            $('#table tr:not(:icontains("' + $(this).val() + '"))').hide();
            $('#table tr:icontains("' + $(this).val() + '")').show();
            $('#table tr:eq(0)').show();
        });
    });
</script>
</head>
<body>
  <center><img src="/static/mjolnir.jpg"/>
  <br/></center>
<input type="text" id="search_n"/><br/>
<table id="table" border="1">
<thead>
<tr>
<th>Nome</th>
<th>Empresa</th>
<th>Telefone</th>
<th>Endereço</th>
</tr>
</thead>
<tbody>
%for row in data:
	<tr>
	%for col in row:
	<th>{{ col }}</th>
	%end
	</tr>
%end
</tbody>
</table>
</body>