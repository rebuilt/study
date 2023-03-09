INSERT INTO part (part_id, description, parent_part_id)
    VALUES (1, 'tables and chairs', NULL);

INSERT INTO part (part_id, description, parent_part_id)
    VALUES (2, 'chair', 1);

INSERT INTO part (part_id, description, parent_part_id)
    VALUES (3, 'table', 1);
