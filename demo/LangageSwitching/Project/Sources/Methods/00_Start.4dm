//%attributes = {}
#DECLARE($params : Object)

var $title : Text
var $window; $i; $left; $top; $right; $bottom : Integer
SET DATABASE LOCALIZATION("ja"; *)
$title:=Get localized string:C991("Demo_WindowTitle")

ARRAY LONGINT($windows; 0)
WINDOW LIST($windows)
For ($i; 1; Size of array($windows))
	$window:=$windows{$i}
	If (Window process($window)=1) && (Get window title($window)=$title)
		GET WINDOW RECT($left; $top; $right; $bottom; $window)
		CALL FORM($window; Formula(SET WINDOW RECT($left; $top; $right; $bottom; $window)))
		return
	End if
End for

If (Count parameters=0)
	CALL WORKER(1; Current method name; New object("title"; $title))
Else
	SET MENU BAR(1)
	$window:=Open form window("HDI"; Plain form window; Horizontally centered; Vertically centered)
	SET WINDOW TITLE($title; $window)
	DIALOG("HDI"; $params; *)
End if
