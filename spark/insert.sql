-- Appends two rows into the partition (p1 = 3, p2 = 4)
INSERT INTO data_source_tab1 PARTITION (p1 = 3, p2 = 4)
  SELECT id FROM RANGE(1, 3);

-- Overwrites the partition (p1 = 3, p2 = 4) using two new rows
INSERT OVERWRITE TABLE default.data_source_tab1 PARTITION (p1 = 3, p2 = 4)
  SELECT id FROM RANGE(3, 5);