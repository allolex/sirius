on run args
	
	tell application "Contacts"
		
		set thePerson to make new person with properties Â
			{first name:item 1 of args, last name:item 2 of args, organization:item 3 of args} Â
				
		
		make new email at end of emails of thePerson with properties Â
			{label:"Other", value:item 4 of args}
		
		save
		
	end tell
	
	tell application "Finder"
		set theURL to "addressbook://" & id of thePerson
		open location (theURL)
	end tell
	
end run
