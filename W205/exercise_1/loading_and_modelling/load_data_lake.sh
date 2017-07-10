wget -O Hospital_Data.zip https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip

mkdir /data/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare/hospital
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses

unzip -p Hospital_Data.zip 'Hospital General Information.csv' >hospital.csv
tail -n+2 hospital.csv > /data/hospital_compare/hospital.csv
hdfs dfs -put /data/hospital_compare/hospital.csv /user/w205/hospital_compare/hospital

unzip -p Hospital_Data.zip 'Timely and Effective Care - Hospital.csv' >effective_care.csv
tail -n+2 effective_care.csv > /data/hospital_compare/effective_care.csv
hdfs dfs -put /data/hospital_compare/effective_care.csv /user/w205/hospital_compare/effective_care

unzip -p Hospital_Data.zip 'Readmissions and Deaths - Hospital.csv' >readmissions.csv
tail -n+2 readmissions.csv > /data/hospital_compare/readmissions.csv
hdfs dfs -put /data/hospital_compare/readmissions.csv  /user/w205/hospital_compare/readmissions

unzip -p Hospital_Data.zip 'Measure Dates.csv' >measures.csv
tail -n+2 measures.csv > /data/hospital_compare/measures.csv
hdfs dfs -put /data/hospital_compare/measures.csv  /user/w205/hospital_compare/measures

unzip -p Hospital_Data.zip 'hvbp_hcahps_05_28_2015.csv' >surveys_responses.csv
tail -n+2 surveys_responses.csv > /data/hospital_compare/surveys_responses.csv
hdfs dfs -put /data/hospital_compare/surveys_responses.csv  /user/w205/hospital_compare/surveys_responses

rm hospital.csv
rm effective_care.csv
rm readmissions.csv
rm measures.csv
rm surveys_responses.csv

rm -rf /data/hospital_compare
rm Hospital_Data.zip
