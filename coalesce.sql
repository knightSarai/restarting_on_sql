-- to replace null with empty
SELECT COALESCE(<coulmn>, 'Empty') AS column_alias
from <table>
