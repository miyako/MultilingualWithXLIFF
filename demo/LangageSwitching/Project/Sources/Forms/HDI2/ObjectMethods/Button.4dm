If (Form event code=On Clicked)
	var $window : Integer
	var $language : Text
	var $data : Object
	$language:=LangCode_at{Lang_at}
	SET DATABASE LOCALIZATION($language; *)
	$data:=New object("language"; $language)
	$window:=Open form window("Localized"; Plain form window; Horizontally centered; Vertically centered)
	SET WINDOW TITLE(Replace string(Get localized string:C991("Localized_WindowTitle"); "{language}"; $language); $window)
	DIALOG("Localized"; $data)
	CLOSE WINDOW($window)
	SET DATABASE LOCALIZATION("ja"; *)
End if
