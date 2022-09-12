use AppleScript version "2.8"
use framework "Foundation"
use scripting additions

on open location urlString

	set urlComponents to my (NSURLComponents's componentsWithString:urlString)

	tell urlComponents
		set ThePassword to urlComponents's |password|() as text
		set TheUser to urlComponents's user() as text
		set ThePort to urlComponents's |port|() as text
		set TheHost to urlComponents's |host|() as text
	end tell
	
	if button returned of result = "Terminal" then
		tell application "Terminal"
			
			if ThePort is "missing value" then
				set cmd to "ssh " & TheUser & "@" & TheHost
			else
				set cmd to "ssh " & "-p " & ThePort & " " & TheUser & "@" & TheHost
			end if
			
			set currentTab to do script cmd
			activate
			delay 1
			do script (ThePassword) in currentTab
			
		end tell
	end if

end open location