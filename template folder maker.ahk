#Requires AutoHotkey v2.0
#SingleInstance Force
#Warn
MainGui := Gui()
MainGui.Add("Text",, "Choose the destination directory:")
EditFDDest := MainGui.AddEdit("vFolderDisp w250 ReadOnly", "...")
MainGui.AddButton("x+10", "Choose").OnEvent("Click", ChooseClick)
MainGui.Add("Text", "xs", "Type your folder(s) name, separated by comma:")
EditFDNames := MainGui.AddEdit("vFolderNames w211", "Flower,Seedling,Tree")
MainGui.AddButton("x+10", "Save").OnEvent("Click", SaveClick)
MainGui.AddButton("x+10", "Load").OnEvent("Click", LoadClick)
; Call Choose_Click when clicked.
MainGui.AddButton("xs", "Create folder(s)").OnEvent("Click", CreateFolderClick)
MainGui.OnEvent("Close", MainGuiClose)
MainGui.Show()

ChooseClick(*)
{
  EditFDDest.Value := DirSelect(, 3)
}


SaveClick(*)
{
  SaveProfileDest := DirSelect(, 3)
  if not SaveProfileDest = ""
    FileAppend EditFDNames.Value, SaveProfileDest "\Template1.profile"
  else
    Exit
}

LoadClick(*)
{
  LoadProfileDest := FileSelect(3, , "Open a file", "Profile files (*.profile)")
  if not LoadProfileDest = ""
    EditFDNames.Value := FileRead(LoadProfileDest)
  Else
    Exit
}


CreateFolderClick(*)
{
  Result := MsgBox("Would you like to create the folder(s)? (press Yes or No)",, "YesNo")
if Result = "Yes"
  Loop Parse, EditFDNames.Value, ","
    {
      CreateFDDest := EditFDDest.Value . A_LoopField
      DirCreate CreateFDDest
    }
else
    Exit
}

MainGuiClose(*)
{
ExitApp
}