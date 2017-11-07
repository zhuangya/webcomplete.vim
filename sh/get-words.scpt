on is_running(appName)
	tell application "System Events" to (name of processes) contains appName
end is_running

on run argv
	try
		set chromeRunning to is_running("Google Chrome")
		if chromeRunning then
			tell application "Google Chrome" to tell active tab of window 1 to execute javascript "[...new Set(document.body.innerText.match(/\\w+/g))].sort().join('\\n')"
		else
			return ""
		end if
	on error errStr number errorNumber
		return ""
	end try
end run
