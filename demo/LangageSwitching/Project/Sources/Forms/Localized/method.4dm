//TRACE

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		C_TEXT:C284(Text32; $Current)
		
		$Current:=Get database localization:C1009(Current localization:K5:22)
		Case of 
				
			: ($Current="fr")
				WebArea_url:="https://fr.4d.com/"
				OBJECT SET FORMAT:C236(*; "Picture1"; "path:/RESOURCES/fr.lproj/Flag.png")
			: ($Current="en")
				WebArea_url:="https://us.4d.com/"
				OBJECT SET FORMAT:C236(*; "Picture1"; "path:/RESOURCES/en.lproj/Flag.png")
			: ($Current="ja")
				WebArea_url:="https://jp.4d.com/"
				OBJECT SET FORMAT:C236(*; "Picture1"; "path:/RESOURCES/ja.lproj/Flag.png")
			: ($Current="es-es")
				WebArea_url:="https://es.4d.com/"
				OBJECT SET FORMAT:C236(*; "Picture1"; "path:/RESOURCES/es.lproj/Flag.png")
			: ($Current="de")
				WebArea_url:="https://de.4d.com/"
				OBJECT SET FORMAT:C236(*; "Picture1"; "path:/RESOURCES/de.lproj/Flag.png")
			: ($Current="it")
				WebArea_url:="https://it.4d.com/"
				OBJECT SET FORMAT:C236(*; "Picture1"; "path:/RESOURCES/it.lproj/Flag.png")
				
		End case 
		
		OBJECT SET TITLE:C194(*; "Text34"; WebArea_url)
		
End case 