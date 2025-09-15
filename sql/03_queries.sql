Select first_name, last_name, address
  From Patients
;
SELECT COUNT(*) AS appointment_count
  FROM Visits
    WHERE visit_date = '2024-01-15';
      select first_name,last_name 
        from Providers
          ORDER by last_name ASC
;
SELECT provider_ID, visit_date,patient_ID
  FROM Visits
    WHERE visit_date = '2024-01-15'
;
Select insurance_ID, insurance_name
  From Insurance
;
SELECT DISTINCT specialty
FROM Specialization
  ;
-- Second set of selects
Select first_name, last_name
From Nurses
  Where nurse_ID In(
    Select nurse_ID
    From Visits
  );

Select first_name, last_name
  From Patients
    Where patient_ID In (
      Select patient_ID
      From Visits
      Where visit_ID in (
        Select visit_ID
        From Differentials
        Where diagnosis = 'Covid_19'
      )
    );
SELECT Patients.first_name, Patients.last_name, Differentials.diagnosis
FROM Patients
INNER JOIN Visits ON Patients.patient_ID = Visits.patient_ID
INNER JOIN Differentials ON Differentials.visit_ID = Visits.visit_ID;

select Patients.first_name, Patients.last_name, Providers.first_name, Providers.last_name
  from Providers
  inner join Visits on Providers.provider_ID = Visits.provider_ID
  inner join Patients on Patients.patient_ID = Visits.patient_ID;

select Patients.first_name, Patients.last_name, Treatment.medication_code
from patients
inner join visits on patients.patient_ID = visits.patient_ID
inner join Differentials on Differentials.visit_ID = visits.visit_ID
inner join treatment on treatment.treatment_ID = Differentials.treatment_ID;
