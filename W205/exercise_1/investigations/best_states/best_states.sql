select State
      ,sum((Score - avg_score) / stdv_score * Denominator)/sum(Denominator) Avg_Score_Norm
      ,sum(Denominator) Tot_Denominator
      ,count(*) Tot_Readmissions
      ,count(distinct provider_id) Tot_Hospitals
  from readmissions_t r
  , readmissions_measures m
  where r.Measure_Name = m.Measure_Name
  group by State
  order by Avg_Score_Norm
limit 10;