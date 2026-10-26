//%attributes = {"invisible":true}
#DECLARE($language : Text; $index : Integer)

var $languages : Collection
var $i; $process; $base; $window : Integer
var $data : Object
If (Count parameters=0)
	$languages:=DemoLanguages
	For ($i; 0; $languages.length-1)
		$process:=New process(Current method name; 0; Current method name; $languages[$i].code; $i)
		DELAY PROCESS(Current process; 60)
	End for
Else
	SET DATABASE LOCALIZATION($language; *)
	$data:=New object("language"; $language)
	$base:=100+(40*$index)
	$window:=Open form window("Localized"; Plain form window; $base; $base)
	SET WINDOW TITLE(Replace string(Get localized string:C991("Localized_WindowTitle"); "{language}"; $language); $window)
	DIALOG("Localized"; $data)
	CLOSE WINDOW($window)
End if
