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

	if application "ForkLift" is not running then
		# This will launch Forklift if it's not running
		# (But it's not making it the frontmost/focused application)
		activate application "ForkLift"
	end if

	# Give focus to ForkLift
	activate application "ForkLift"

	tell application "System Events"
		tell process "ForkLift"
			keystroke "n" using {command down}
			keystroke "k" using {command down}
			delay 1
			set textToType to TheHost
			keystroke textToType
			keystroke tab
			set textToType to TheUser
			keystroke textToType
			keystroke tab
			set textToType to ThePassword
			keystroke textToType
			if ThePort is not "missing value" then
				keystroke tab
				set textToType to ThePort
				keystroke ThePort
			end if
			keystroke return
		end tell
	end tell

end open location