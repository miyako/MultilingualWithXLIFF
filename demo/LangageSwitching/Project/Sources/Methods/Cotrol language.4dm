//%attributes = {}
var $code : Text
var $language : Object
var $languages : Collection
$code:=Lowercase(Request(Get localized string:C991("AlertLanguageCode")))
If (OK=1)
	If ($code="en")
		$code:="en-us"
	End if
	$languages:=DemoLanguages
	For each ($language; $languages)
		If (Lowercase($language.code)=$code)
			SET DATABASE LOCALIZATION($language.code; *)
			return
		End if
	End for each
	ALERT(Get localized string:C991("AlertLanguageUnavailable"))
End if
