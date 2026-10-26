If (Form event code=On Clicked)
	var $window : Integer
	var $data : Object
	$data:=Form
	SET DATABASE LOCALIZATION("ja"; *)
	$window:=Open form window("HDI2"; Plain form window; Horizontally centered; Vertically centered)
	SET WINDOW TITLE($data.title; $window)
	DIALOG("HDI2"; $data; *)
End if
