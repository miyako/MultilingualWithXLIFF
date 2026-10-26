If (Form event code=On Load)
	var $current : Text
	$current:=Lowercase(Substring(Get database localization(Current localization); 1; 2))
	Form.language:=$current
	Case of
		: ($current="fr")
			Form.url:="https://fr.4d.com/"
		: ($current="en")
			Form.url:="https://us.4d.com/"
		: ($current="ja")
			Form.url:="https://jp.4d.com/"
		: ($current="es")
			Form.url:="https://es.4d.com/"
		: ($current="de")
			Form.url:="https://de.4d.com/"
		: ($current="it")
			Form.url:="https://it.4d.com/"
		Else
			ALERT(Get localized string:C991("AlertLanguageUnavailable"))
			CANCEL
			return
	End case
	OBJECT SET FORMAT(*; "Picture1"; "path:/RESOURCES/"+$current+".lproj/Flag.png")
	OBJECT SET TITLE(*; "Text34"; Form.url)
End if