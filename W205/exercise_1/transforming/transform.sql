DROP TABLE readmissions_t;
CREATE TABLE readmissions_t as 
SELECT 
     Provider_ID         
    ,Hospital_Name       
    ,State               
    ,Measure_Name        
    ,Compared_to_National
    ,cast(Denominator as float) Denominator        
    ,cast(Score as float) Score
from readmissions
where cast(score as float) is not null;

DROP TABLE effective_care_t;
CREATE TABLE effective_care_t as
SELECT
     Provider_ID
    ,Hospital_Name
    ,State
    ,Condition
    ,Measure_ID
    ,Measure_Name
    ,cast(Score as float) score
    ,cast(Sample as float) sample
from effective_care
where cast(score as float) is not null
;

drop table readmissions_measures;
create table readmissions_measures as
select 
 a.measure_name
,a.avg_score
,pow(sum(pow(score - a.avg_score,2) * denominator) / sum(denominator),0.5)   stdv_score
from 
(
select 
    measure_name
   ,sum(score * denominator) / sum(denominator)   avg_score
from readmissions_t
group by measure_name) a
, readmissions_t b 
where a.measure_name = b.measure_name
group by a.measure_name, a.avg_score
;

drop table effective_measures;
create table effective_measures as
select 
 a.measure_name
,a.avg_score
,pow(sum(pow(score - a.avg_score,2) * sample) / sum(sample),0.5)   stdv_score
from 
(
select 
    measure_name
   ,sum(score * sample) / sum(sample)   avg_score
from effective_care_t
group by measure_name) a
, effective_care_t b 
where a.measure_name = b.measure_name
group by a.measure_name, a.avg_score
;

drop table survey_t;
create table survey_t as 
select
    Provider_Number Provider_ID
    ,Hospital_Name           
    ,State                   
    ,cast(HCAHPS_Base_Score as float) Base_Score
    ,cast(HCAHPS_Consistency_Score as float) Consist_Score
    ,cast(HCAHPS_Base_Score as float) 
    + cast(HCAHPS_Consistency_Score as float) Agg_Score
from surveys_responses
where cast(HCAHPS_Base_Score as float) is not null;
