//%attributes = {}
// Ask user to select a language
CHOIX_LG:=Request:C163("Please choose a language: fr for French, en for English, de for German :")

// Apply selected language
Case of 
	: (CHOIX_LG="fr")
		SET DATABASE LOCALIZATION:C1104("fr")  // Change interface language to French
	: (CHOIX_LG="en")
		SET DATABASE LOCALIZATION:C1104("en")  // Change interface language to English
	: (CHOIX_LG="de")
		SET DATABASE LOCALIZATION:C1104("de")  // Change interface language to German
	Else 
		SET DATABASE LOCALIZATION:C1104("en")  // By default, the interface is in English
End case 
