SOL 1:
SELECT t1.machine_id , ROUND(SUM(t1.timestamp-t2.timestamp)/COUNT(t1.activity_type),3) as processing_time
from Activity t1, Activity t2 
where t1.activity_type='end' and t2.activity_type='start' and t1.machine_id=t2.machine_id and t1.process_id=t2.process_id
GROUP BY t1.machine_id;

SOL 2:
SELECT t1.machine_id , ROUND(AVG(t1.timestamp-t2.timestamp),3) as processing_time
from Activity t1, Activity t2 
where t1.activity_type='end' and t2.activity_type='start' and t1.machine_id=t2.machine_id and t1.process_id=t2.process_id
GROUP BY t1.machine_id;


