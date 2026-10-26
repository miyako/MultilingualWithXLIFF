//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_LONGINT:C283($2)
If (Count parameters:C259=0)
	
	For ($Loop_l; 1; Size of array:C274(LangCode_at))
		$pssID:=New process:C317(Current method name:C684; 0; Current method name:C684; LangCode_at{$Loop_l}; $Loop_l)
		DELAY PROCESS:C323(Current process:C322; 60)
	End for 
	
	
Else 
	C_LONGINT:C283($base)
	SET DATABASE LOCALIZATION:C1104($1)
	$base:=100+(50*$2)
	$ref:=Open window:C153($base; $base; $base+500; $base+350; 4; "Language code : "+$1; "Close")
	DIALOG:C40("Localized")
	CLOSE WINDOW:C154
End if 
