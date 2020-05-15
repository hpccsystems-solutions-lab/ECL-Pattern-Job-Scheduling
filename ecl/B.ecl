// The second job to run by the Scheduler

ds := DATASET('~SCHEDULER::EXAMPLECODE::JOB_1', {UNSIGNED4 id, STRING line}, FLAT);

newDS := ROLLUP(SORT(ds, id),
                TRUE,
                TRANSFORM({UNSIGNED4 id, STRING line}, 
                          SELF.line := LEFT.line + ' ' + RIGHT.line, SELF.id := 0 ));

OUTPUT(newDS, ,'~SCHEDULER::EXAMPLECODE::JOB_2', OVERWRITE);