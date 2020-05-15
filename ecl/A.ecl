// The first job to run by the Scheduler

ds := DATASET([{1, 'HPCC SYSTEMS'},
               {2, 'PATTERN JOBS'},
               {3, 'SCHEDULER'},
               {4, 'EXAMPLE CODE'}], {UNSIGNED4 id, STRING line});

OUTPUT(ds, , '~SCHEDULER::EXAMPLECODE::JOB_1', OVERWRITE);
 