If (Form event code=On Load)
	var $languages : Collection
	var $language : Object
	$languages:=DemoLanguages
	ARRAY TEXT(Lang_at; 0)
	ARRAY TEXT(LangCode_at; 0)
	For each ($language; $languages)
		APPEND TO ARRAY(Lang_at; $language.label)
		APPEND TO ARRAY(LangCode_at; $language.code)
	End for each
	Lang_at:=Find in array(LangCode_at; "ja")
End if
