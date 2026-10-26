//TRACE
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222(Tab Control; 2)
		Tab Control{1}:=Get localized string:C991("Change Language")
		Tab Control{2}:=Get localized string:C991("Demo")
		
		ARRAY TEXT:C222(Lang_at; 0)
		ARRAY TEXT:C222(LangCode_at; 0)
		
		APPEND TO ARRAY:C911(Lang_at; "English (en-US)")
		APPEND TO ARRAY:C911(LangCode_at; "en-US")
		
		APPEND TO ARRAY:C911(Lang_at; "Spanish (es)")
		APPEND TO ARRAY:C911(LangCode_at; "es")
		
		APPEND TO ARRAY:C911(Lang_at; "French (fr)")
		APPEND TO ARRAY:C911(LangCode_at; "fr")
		
		APPEND TO ARRAY:C911(Lang_at; "German (de)")
		APPEND TO ARRAY:C911(LangCode_at; "de")
		
		APPEND TO ARRAY:C911(Lang_at; "Italian (it)")
		APPEND TO ARRAY:C911(LangCode_at; "it")
		
		APPEND TO ARRAY:C911(Lang_at; "Japanese (ja)")
		APPEND TO ARRAY:C911(LangCode_at; "ja")
		
		Lang_at:=1
		
		
End case 
