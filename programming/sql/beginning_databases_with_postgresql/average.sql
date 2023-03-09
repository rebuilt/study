SELECT
    avg(scale_averages.avg) AS "Student average"
FROM (
    SELECT
        scales.id,
        scales.scale_id,
        survey_items.survey_item_id,
        avg(survey_item_responses.likert_score)
    FROM
        measures
        JOIN scales ON scales.measure_id = measures.id
        JOIN survey_items ON scales.id = survey_items.scale_id
        JOIN survey_item_responses ON survey_item_responses.survey_item_id = survey_items.id
    WHERE
        survey_items.survey_item_id LIKE 's-%'
        AND measures.measure_id = '1A-ii'
        AND survey_item_responses.school_id = 163
        AND survey_item_responses.academic_year_id = 6
    GROUP BY
        survey_items.survey_item_id,
        scales.id) AS scale_averages
GROUP BY
    scale_averages.scale_id;

SELECT
    scale_averages.scale_id,
    avg(scale_averages.avg) AS "teacher average"
FROM (
    SELECT
        scales.id,
        scales.scale_id,
        survey_items.survey_item_id,
        avg(survey_item_responses.likert_score)
    FROM
        measures
        JOIN scales ON scales.measure_id = measures.id
        JOIN survey_items ON scales.id = survey_items.scale_id
        JOIN survey_item_responses ON survey_item_responses.survey_item_id = survey_items.id
    WHERE
        survey_items.survey_item_id LIKE 't-%'
        AND measures.measure_id = '1B-ii'
        AND survey_item_responses.school_id = 163
        AND survey_item_responses.academic_year_id = 6
    GROUP BY
        survey_items.survey_item_id,
        scales.id) AS scale_averages
GROUP BY
    scale_averages.scale_id;

-- Gets the average of the teacher's responses to the scales in the given measure
-- This results in a different average than what we get with ruby
SELECT
    avg(teacher_scale_averages.teacher_average) AS "Teacher scale average"
FROM (
    SELECT
        avg(scale_averages.avg) AS teacher_average
    FROM (
        SELECT
            scales.id,
            scales.scale_id,
            survey_items.survey_item_id,
            avg(survey_item_responses.likert_score)
        FROM
            measures
            JOIN scales ON scales.measure_id = measures.id
            JOIN survey_items ON scales.id = survey_items.scale_id
            JOIN survey_item_responses ON survey_item_responses.survey_item_id = survey_items.id
        WHERE
            survey_items.survey_item_id LIKE 't-%'
            AND measures.measure_id = '1B-i'
            AND survey_item_responses.school_id = 163
            AND survey_item_responses.academic_year_id = 6
        GROUP BY
            survey_items.survey_item_id,
            scales.id) AS scale_averages
    GROUP BY
        scale_averages.scale_id) AS teacher_scale_averages;
