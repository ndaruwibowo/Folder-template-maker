#Requires AutoHotkey v2.0
#SingleInstance Force
#Warn
FileAppend "
(
A line of text.
By default, the hard carriage return (Enter) between the previous line and this one will be written to the file.
	This line is indented with a tab; by default, that tab will also be written to the file.
)", A_ScriptDir "\My File.profile"