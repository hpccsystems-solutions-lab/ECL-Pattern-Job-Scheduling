IMPORT Std;
IMPORT ecl.WorkunitExec;

/** Scheduler
  * Run this scheduler job on hThor after job A, B and C are compiled.
  */

RunByNameAndWait(STRING wuJobName) := FUNCTION
    runResults := WorkunitExec.RunCompiledWorkunitByName
        (
            wuJobName,
            waitForCompletion := TRUE,
            username := '',
            userPW :=''
        );
    logStartAction := Std.System.Log.AddWorkunitInformation(Std.Date.SecondsToString(Std.Date.CurrentSeconds()) + ': running ' + wuJobName);
    logEndAction := Std.System.Log.AddWorkunitInformation(Std.Date.SecondsToString(Std.Date.CurrentSeconds()) + ': success: ' + IF(EXISTS(runResults), 'true', 'false'));

    RETURN SEQUENTIAL(logStartAction, logEndAction);
END;

runScheduler := ORDERED

    (
        RunByNameAndWait('A');
        RunByNameAndWait('B');
        RunByNameAndWait('C');
    );

runScheduler : WHEN(CRON('* * * * *'));
