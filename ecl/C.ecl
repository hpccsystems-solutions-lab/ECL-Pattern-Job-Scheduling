// The last job to run by the Scheduler

ds := DATASET('~SCHEDULER::EXAMPLECODE::JOB_2', {UNSIGNED4 id, STRING line}, FLAT);

newDS := PROJECT(ds, TRANSFORM({STRING line}, SELF.line := 'I LOVE ' + LEFT.line + '!'));

OUTPUT(newDS);