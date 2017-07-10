select 
  pow(sum(pow(score - e2.wtd_avg_score,2) * sample) / sum(sample),0.5)   stdv_score2
 ,e2.StdDev_Score
 ,e2.Wtd_Avg_Score
 ,e2.Count_Score
 ,e2.measure_id
 ,e2.measure_Name
from
effective_care_t e
,
(
select 
     e.Measure_ID
    ,nvl(m.Measure_Name,e.measure_Name) measure_Name
    ,sum(Score*Sample)/sum(Sample) Wtd_Avg_Score
    ,stddev(score) StdDev_Score
    ,count(*) Count_Score
from effective_care_t e
    ,measures m 
where e.Measure_ID = m.Measure_ID
group by e.Measure_ID, nvl(m.Measure_Name,e.measure_Name)
having sum(sample) > 1000
   and count(*) > 100
) e2
where e.Measure_ID = e2.Measure_ID
group by 
  e2.measure_id
 ,e2.measure_Name
 ,e2.Wtd_Avg_Score
 ,e2.StdDev_Score
 ,e2.Count_Score
order by stdv_score2 desc
;