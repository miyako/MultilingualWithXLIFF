If (Form event code=On Clicked)
	var $result : Object
	SET DATABASE LOCALIZATION(Form.language; *)
	$result:=ImportArabic("/RESOURCES/ExcelArabic1.txt")
	If ($result.success)
		Var1:=$result.text
	Else
		ALERT(Get localized string:C991($result.errorKey))
	End if
End if
