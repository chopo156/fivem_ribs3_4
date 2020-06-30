RegisterCommand("record", function()
    StartRecording(1) 
end)

RegisterCommand("stoprecord", function()
    StopRecordingAndSaveClip()
end)