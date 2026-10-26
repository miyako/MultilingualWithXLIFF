TRACE:C157
C_TEXT:C284($path; $b2)
C_BLOB:C604($b1)
$path:=Get 4D folder:C485(Database folder:K5:14)+"ExcelArabic1.txt"
DOCUMENT TO BLOB:C525($path; $b1)
CREATE RECORD:C68([Table_1:2])
[Table_1:2]Champ_2:2:=$b1
SAVE RECORD:C53([Table_1:2])
$b2:=Convert to text:C1012([Table_1:2]Champ_2:2; "UTF-8")
Var1:=$b2
