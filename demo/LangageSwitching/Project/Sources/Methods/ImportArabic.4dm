//%attributes = {"invisible":true}
#DECLARE($path : Text) -> $result : Object

var $file : 4D.File
var $bytes : Blob
var $text : Text
$result:=New object("success"; False; "errorKey"; "AlertArabicRead")
$file:=File($path)
If (Not($file.exists))
	$result.errorKey:="AlertArabicMissing"
	return
End if

DOCUMENT TO BLOB($file.platformPath; $bytes)
If (OK=0)
	return
End if
$text:=Convert to text($bytes; "UTF-16")
$text:=Replace string($text; Char(13)+Char(10); Char(13))
CREATE RECORD([Table_1])
[Table_1]Champ_2:=$bytes
SAVE RECORD([Table_1])
If (Is new record([Table_1]))
	$result.errorKey:="AlertArabicSave"
	return
End if
$result:=New object("success"; True; "text"; $text)
