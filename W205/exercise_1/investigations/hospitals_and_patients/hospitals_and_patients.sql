select (avg(agg_score * r.Avg_Score_Norm) - (avg(agg_score) * avg(r.Avg_Score_Norm))) /
   (stddev(agg_score) * stddev(r.Avg_Score_Norm)) cor
   ,avg(agg_score) 
   ,avg(r.Avg_Score_Norm)
   ,avg(agg_score * r.Avg_Score_Norm)
   ,stddev(agg_score) 
   ,stddev(r.Avg_Score_Norm)
from survey_t s
,
(
  select Provider_ID
      ,sum((Score - avg_score) / stdv_score * Denominator)/sum(Denominator) Avg_Score_Norm
  from readmissions_t r
  , readmissions_measures m
  where r.Measure_Name = m.Measure_Name
  group by Provider_ID
) r
where r.Provider_ID = s.Provider_ID
;
