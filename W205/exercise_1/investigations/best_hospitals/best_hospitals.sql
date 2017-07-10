select Provider_ID
      ,Hospital_Name
      ,State
      ,sum((Score - avg_score) / stdv_score * Denominator)/sum(Denominator) Avg_Score_Norm
      ,sum(Denominator) Tot_Denominator
      ,count(*) Tot_Readmissions
  from readmissions_t r
  , readmissions_measures m
  where r.Measure_Name = m.Measure_Name
  group by Provider_ID,Hospital_Name,State
  having sum(Denominator) > 1000
     and count(*) > 2
  order by Avg_Score_Norm
limit 10;