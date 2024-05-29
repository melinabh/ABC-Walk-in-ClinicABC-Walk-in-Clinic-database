/*
Question 1:
Create a query that returns Patients’ full names, addresses, phone numbers and email addresses. (Ten results minimum).
*/
SELECT patient_fullname, patient_address, patient_phone, patient_email
FROM group30schema.patient;

-- Question 2:
-- Create a query that lists all patients who have not had 
-- any appointment in the clinic in the last 2 years (at least one patient)


select p.patient_fullname, a.status from group30schema. patient p
join group30schema.appointment a on p.idPatient = a.idAppointment
where a.status LIKE 'Canceled';

/*
Question 3:
Create a query that returns the all appointment by a particular patient in the year of 2020
(should return 5 appointments at least) the result set would include patient names, 
examining doctors’ and nurses’ names, dates and times of the appointments, 
any tests ordered by the doctors for the patient.
*/
SELECT
    p.patient_fullname AS PatientName,
    CONCAT(d.staff_fullname, ' (Doctor)') AS DoctorName,
    CONCAT(n.staff_fullname, ' (Nurse)') AS NurseName,
    a.date AS AppointmentDate,
    a.time AS AppointmentTime,
    dgn.diagnostic_name AS Prescription
  
FROM group30schema.appointment a
JOIN group30schema.patient p ON p.idPatient = a.idPatient
JOIN group30schema.staff d ON d.idStaff = a.idStaff
JOIN group30schema.Exmaination e ON e.Appointment_idAppointment = a.idAppointment
JOIN group30schema.staff n ON n.idStaff = e.Staff_idStaff
LEFT JOIN group30schema.diagnostic dgn ON dgn.Appointment_idAppointment = a.idAppointment

WHERE
    p.idPatient = 1
    AND YEAR(a.date) = 2020
    AND (d.idStaff BETWEEN 1 AND 16 OR d.iddepartment IN (1, 2))
    
ORDER BY
    a.date, a.time;
    
/*
Question 4:
Create a query that returns all appointments that were either cancelled, 
or patients were No Show in the month of December 2020. (five results minimum)
*/
SELECT *
FROM group30schema.appointment
WHERE (status = 'Canceled' OR status = 'Scheduled')
AND YEAR(date) = 2020
AND MONTH(date) = 12
LIMIT 5;

/*
Question 5:
Create a query that that returns staff members’ names (excluding doctors),
 their hourly rates, number of hours worked and Salary (calculated column; 
 there are 13 employees in the clinic) for the two weeks period (
*/
select
s.staff_fullname AS StaffName,
s.staff_rate AS HourlyRate,
SUM(p.hours_worked) AS TotalHoursWorked,
SUM(p.hours_worked) * s.staff_rate AS Salary
FROM group30schema.staff s
JOIN group30schema.payroll p ON s.idStaff = p.idstaff
WHERE s.iddepartment != 1 AND s.idStaff > 10 -- Exclude doctors
AND p.from_date BETWEEN '2023-07-14' AND '2023-07-28'
GROUP BY s.staff_fullname, s.staff_rate;

/*
Question 6:
The Clinic Manager has decided to send “Happy holidays” greeting cards in December 
and needs the full names and complete addresses (street address, city, province, Postal Code) 
for all human beings who are part of the clinic (Doctors, nurses, patients, secretaries etc) 
so create a query that returns this information (usually called a mailing label)
*/
select staff_fullname, staff_province, staff_city, staff_address, staff_postalcode,
'staff' as type
from group30schema.staff
UNION
select patient_fullname, patient_province, patient_city, patient_address, patient_postalcode,
'patient' as type from group30schema.patient;

/*
Question 7:
Create a query that returns all patients enrolled permanently with one of the doctors
*/
SELECT *
FROM patient
WHERE enrolled_status = 'Enrolled'

-- Question 8:
-- (add a column primary member id in the patient table; make one patient as the primary member
-- and then create another column called relationship and add husband, wife, son, daughter etc.)
ALTER TABLE group30schema.patient
	ADD COLUMN primary_member_id INT,
	ADD COLUMN relationship VARCHAR(50);
 
UPDATE group30schema.patient
SET primary_member_id = 2,
		relationship = 'Husband'
WHERE idPatient = 1;

UPDATE group30schema.patient
SET primary_member_id = 3,
		relationship = 'Wife'
WHERE idPatient = 10;

UPDATE group30schema.patient
SET primary_member_id = 6,
		relationship = 'Father'
WHERE idPatient = 4;

UPDATE group30schema.patient
SET primary_member_id = 12,
		relationship = 'Son'
WHERE idPatient = 16;

SELECT * FROM group30schema.patient;
         
-- Create a query that returns a list of all patients and their family member 
SELECT 
	p1.idPatient AS 'Patient ID',
    p1.patient_fullname AS 'Patient Name',
    p1.primary_member_id AS 'Primary Member ID',
    p1.relationship AS 'Relationship'
FROM group30schema.patient p1
LEFT JOIN group30schema.patient p2 ON p1.primary_member_id = p2.idPatient
WHERE p1.primary_member_id IS NOT NULL;    

-- Query 9
-- Create a query that would create a list of all patients that were seen by a particular doctor on a given date

SELECT
	p.patient_fullname AS 'Patient Name',
	a.date AS 'Appointment Date',
    CONCAT(d.staff_fullname, ' (Doctor)') AS 'Doctor Name'
FROM group30schema.appointment a
JOIN group30schema.patient p ON p.idPatient = a.idPatient
JOIN group30schema.staff d ON d.idStaff = a.idStaff

WHERE a.idStaff = 10
    AND DATE(a.date) = '2022-12-18'

/* Query 10
-- Create a query that would return name of a patient who paid some sort of a fee to the clinic, 
-- also retrieve the service for which he paid and the doctor’s name 
 (for example Dr Smith, Sick Note) */

SELECT
	p.patient_fullname AS 'Patient Name',
    i.items AS 'Clinic Fee',
    CONCAT(d.staff_fullname, ' (Doctor)') AS 'Doctor Name'
FROM group30schema.invoices i
JOIN group30schema.appointment a ON a.idAppointment = i.idAppointment
JOIN group30schema.patient p ON p.idPatient = a.idPatient
JOIN group30schema.staff d ON d.idStaff = a.idStaff

