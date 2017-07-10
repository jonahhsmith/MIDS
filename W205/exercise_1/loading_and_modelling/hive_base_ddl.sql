DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals (
    Provider_ID        string, 
    Hospital_Name      string, 
    Address            string, 
    City               string, 
    State              string, 
    Zip_Code           string,
    County_Name        string, 
    Phone_Number       string, 
    Hospital_Type      string, 
    Hospital_Ownership string,
    Emergency_Services string
    ) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",", 
    "quoteChar" = '"',  
    "escapeChar" = '\\'
    )
STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/hospital';

DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care (
    Provider_ID        string, 
    Hospital_Name      string, 
    Address            string, 
    City               string, 
    State              string, 
    Zip_Code           string, 
    County_Name        string, 
    Phone_Number       string, 
    Condition          string,
    Measure_ID         string, 
    Measure_Name       string, 
    Score              string, 
    Sample             string, 
    Footnote           string, 
    Measure_Start_Date Date, 
    Measure_End_Date   Date )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",", 
    "quoteChar" = '"',  
    "escapeChar" = '\\'
    )
STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/effective_care';

DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions (
    Provider_ID          string,
    Hospital_Name        string,
    Address              string,
    City                 string,
    State                string,
    ZIP_Code             string,
    County_Name          string,
    Phone_Number         string,
    Measure_Name         string,
    Measure_ID           string,
    Compared_to_National string,
    Denominator          string,
    Score                string,
    Lower_Estimate       string,
    Higher_Estimate      string,
    Footnote             string,
    Measure_Start_Date   Date,
    Measure_End_Date     Date )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",", 
    "quoteChar" = '"',  
    "escapeChar" = '\\'
    )
STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/readmissions';


DROP TABLE measures;
CREATE EXTERNAL TABLE measures (
    Measure_Name            string, 
    Measure_ID              string, 
    Measure_Start_Quarter   string,  
    Measure_Start_Date      Date, 
    Measure_End_Quarter     string, 
    Measure_End_Date        Date )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",", 
    "quoteChar" = '"',  
    "escapeChar" = '\\'
    )
STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/measures';


DROP TABLE SURVEYS_RESPONSES;
CREATE EXTERNAL TABLE SURVEYS_RESPONSES (
    Provider_Number          string,
    Hospital_Name            string,
    Address                  string,
    City                     string,
    State                    string,
    ZIP_Code                 string,
    County_Name              string,
    Comm_Nurse_Ach           string,
    Comm_Nurse_Imp           string,
    Comm_Nurse_Dim           string,
    Comm_Doc_Ach             string,
    Comm_Doc_Imp             string,
    Comm_Doc_Dim             string,
    Response_Staff_Ach       string,
    Response_Staff_Imp       string,
    Response_Staff_Dim       string,
    Pain_Mgmt_Ach            string,
    Pain_Mgmt_Imp            string,
    Pain_Mgmt_Dim            string,
    Comm_Medicine_Ach        string,
    Comm_Medicine_Imp        string,
    Comm_Medicine_Dim        string,
    Clean_Env_Ach            string,
    Clean_Env_Imp            string,
    Clean_Env_Dim            string,
    Discharge_Ach            string,
    Discharge_Imp            string,
    Discharge_Dim            string,
    Overall_Ach              string,
    Overall_Imp              string,
    Overall_Dim              string,
    HCAHPS_Base_Score        string,
    HCAHPS_Consistency_Score string
    )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",", 
    "quoteChar" = '"',  
    "escapeChar" = '\\'
    )
STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/surveys_responses';

