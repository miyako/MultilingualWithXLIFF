//%attributes = {}
SET DATABASE LOCALIZATION:C1104("en-US")

C_LONGINT:C283($1)

Case of 
	: (Count parameters:C259=0)
		$pss:=New process:C317(Current method name:C684; 0; Current method name:C684; Red:K11:4)
		
	Else 
		
		//CreateCountries 
		
		$Ref:=Open form window:C675("HDI"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
		DIALOG:C40("HDI")
		CLOSE WINDOW:C154
		
		If (OK=1)
			
			$Ref:=Open form window:C675("HDI2"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
			DIALOG:C40("HDI2")
			CLOSE WINDOW:C154
			
		End if 
		
		
End case 

