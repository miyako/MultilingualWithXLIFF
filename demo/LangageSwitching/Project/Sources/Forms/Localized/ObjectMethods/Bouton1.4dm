If (Form event code=On Clicked)
	var $value : Text
	SET DATABASE LOCALIZATION(Form.language; *)
	$value:=Get localized string:C991("month_1")
	ALERT($value)
End if