Select survey_items.survey_item_id, avg(survey_item_responses.likert_score)
from student_races 
JOIN survey_item_responses ON student_races.student_id = survey_item_responses.student_id  
JOIN survey_items ON survey_items.id = survey_item_responses.survey_item_id 
JOIN scales ON scales.id = survey_items.scale_id 
JOIN measures ON measures.id = scales.measure_id 
WHERE student_races.race_id = 17  
WHERE measures.measure_id = "1A-ii"
Group By survey_items.survey_item_id
limit 1000;


Select survey_items.survey_item_id, avg(survey_item_responses.likert_score), races.id, races.designation
from student_races 
JOIN survey_item_responses ON student_races.student_id = survey_item_responses.student_id  
JOIN survey_items ON survey_items.id = survey_item_responses.survey_item_id 
JOIN scales ON scales.id = survey_items.scale_id 
JOIN measures ON measures.id = scales.measure_id 
JOIN races ON student_races.race_id = races.id
WHERE student_races.race_id = 17 
AND survey_item_responses.school_id = 163 
AND survey_item_responses.academic_year_id = 6 
AND measures.measure_id = '1A-ii'
Group By survey_items.survey_item_id, races.id, races.designation;
