# ECL-Pattern-Job-Scheduling

ECL-Pattern-Job-Scheduling provides an example to programmatially schedule workflows in HPCC Systems. It can be used to schedule both Thor jobs and Roxie jobs. 

ECL-Pattern-Job-Scheduling is also able to schedule jobs from different code base. In another word, it can schedule jobs wihtout knowing or making any  changes to the source code. The job names are the only thing you need to know to schedule workflow with ECL-Pattern-Job-Scheduling. 

Thinking about how to schedule three jobs A.ecl, B.ecl and C.ecl without knowing anything about the source code but the name of each job. Each job is wrapped in an ECL file. Job A is wrapped in A.ecl file, job B is wrapped in B.ecl file and job C is wrapped in C.ecl file. We assume they are from different code bases and we cannot change the content of the source code.


The example in ECL-Pattern-Job-Scheduling aims to accomplish this task. The scheduler is defined in the Scheduler.ecl file. It schedules job A, B and C running sequentially every minute.

How to use the scheduler in the example:

1. Compile the jobs. Compile the three jobs A.ecl, B.ecl and C.ecl on THOR.
2. Run the scheduler on hThor. The three jobs are already defined in the Scheduler.ecl. All you need to do is to run the Scheduler.ecl on hThor.
3. The scheduler is on WAIT status when it's not running. To stop the scheduler, descheduler the scheduler on its Workunit page. 
4. If you are interested in adding more jobs, you can define the new jobs in the scheduler. For example, you create another job named New_Job.ecl. In the Scheduler.ecl, define it as below:

```
    runScheduler := ORDERED

        (
            RunByNameAndWait('A');
            RunByNameAndWait('B');
            RunByNameAndWait('C');
            RunByNameAndWait('New_Job');
        );
```


Then repeat step 1 to 3 in the above.


