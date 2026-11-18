-- Run query 001 / 007
CREATE TEMPORARY VIEW cte_2 AS SELECT DISTINCT artificial_hes_apc_2425.person_id AS patient_id
FROM artificial_hes_apc_2425
WHERE artificial_hes_apc_2425.fde = 1 AND artificial_hes_apc_2425.diag_4_01 IN ('I509', 'I255', 'I420', 'I110', 'I500', 'I501', 'I429') AND artificial_hes_apc_2425.admimeth IN ('22', '2D', '2C', '24', '2A', '2B', '25', '23', '21', '28');

-- Run query 002 / 007
CREATE TEMPORARY VIEW cte_1 AS SELECT DISTINCT artificial_hes_apc_2425.person_id AS patient_id
FROM artificial_hes_apc_2425
WHERE artificial_hes_apc_2425.fde = 1 AND artificial_hes_apc_2425.diag_4_01 IN ('I509', 'I255', 'I420', 'I110', 'I500', 'I501', 'I429') AND artificial_hes_apc_2425.admimeth IN ('13', '11', '12');

-- Run query 003 / 007
CREATE TEMPORARY VIEW cte_3 AS SELECT cte_1.patient_id AS patient_id
FROM cte_1 UNION SELECT cte_2.patient_id AS patient_id
FROM cte_2;

-- Run query 004 / 007
CREATE TEMPORARY VIEW cte_4 AS SELECT cte_3.patient_id
FROM cte_3 LEFT OUTER JOIN cte_1 ON cte_1.patient_id = cte_3.patient_id LEFT OUTER JOIN cte_2 ON cte_2.patient_id = cte_3.patient_id
WHERE cte_1.patient_id IS NOT NULL OR cte_2.patient_id IS NOT NULL;

-- Fetch results from query 005 / 007
SELECT cte_4.patient_id
FROM cte_4;

-- Fetch results from query 006 / 007
SELECT artificial_hes_apc_2425.person_id AS patient_id, artificial_hes_apc_2425.procodet AS provider_code, artificial_hes_apc_2425.sitetret AS hospital_code, artificial_hes_apc_2425.diag_4_01 AS primary_diagnosis_code, CASE artificial_hes_apc_2425.diag_4_01 WHEN 'I110' THEN 'Hypertensive heart disease with (congestive) heart failure' WHEN 'I255' THEN 'Ischaemic cardiomyopathy' WHEN 'I420' THEN 'Dilated cardiomyopathy' WHEN 'I429' THEN 'Cardiomyopathy, unspecified' WHEN 'I500' THEN 'Congestive heart failure' WHEN 'I501' THEN 'Left ventricular failure' WHEN 'I509' THEN 'Heart failure, unspecified' END AS primary_diagnosis_description
FROM artificial_hes_apc_2425
WHERE artificial_hes_apc_2425.fde = 1 AND artificial_hes_apc_2425.diag_4_01 IN ('I509', 'I255', 'I420', 'I110', 'I500', 'I501', 'I429') AND artificial_hes_apc_2425.admimeth IN ('13', '11', '12') AND artificial_hes_apc_2425.person_id IN (SELECT cte_4.patient_id
FROM cte_4);

-- Fetch results from query 007 / 007
SELECT artificial_hes_apc_2425.person_id AS patient_id, artificial_hes_apc_2425.procodet AS provider_code, artificial_hes_apc_2425.sitetret AS hospital_code, artificial_hes_apc_2425.diag_4_01 AS primary_diagnosis_code, CASE artificial_hes_apc_2425.diag_4_01 WHEN 'I110' THEN 'Hypertensive heart disease with (congestive) heart failure' WHEN 'I255' THEN 'Ischaemic cardiomyopathy' WHEN 'I420' THEN 'Dilated cardiomyopathy' WHEN 'I429' THEN 'Cardiomyopathy, unspecified' WHEN 'I500' THEN 'Congestive heart failure' WHEN 'I501' THEN 'Left ventricular failure' WHEN 'I509' THEN 'Heart failure, unspecified' END AS primary_diagnosis_description
FROM artificial_hes_apc_2425
WHERE artificial_hes_apc_2425.fde = 1 AND artificial_hes_apc_2425.diag_4_01 IN ('I509', 'I255', 'I420', 'I110', 'I500', 'I501', 'I429') AND artificial_hes_apc_2425.admimeth IN ('22', '2D', '2C', '24', '2A', '2B', '25', '23', '21', '28') AND artificial_hes_apc_2425.person_id IN (SELECT cte_4.patient_id
FROM cte_4);
