CREATE TABLE IF NOT EXISTS Stud (
    id MEDIUMINT NOT NULL AUTOINCREMENT,
    vk_Id MEDIUMINT NOT NULL,
    group_Id MEDIUMINT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS Group (
    id MEDIUMINT NOT NULL AUTOINCREMENT,
    group_Name VARCHAR(10) NOT NULL,
    time_Table_Id MEDIUMINT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (time_Table_Id)
);
CREATE TABLE IF NOT EXISTS Time_Table (
    id MEDIUMINT NOT NULL AUTOINCREMENT,
    even_Id MEDIUMINT NULL,
    odd_Id MEDIUMINT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS Week (
    id MEDIUMINT NOT NULL AUTOINCREMENT,
    monday_Id MEDIUMINT NULL,
    tuesday_Id MEDIUMINT NULL,
    wednesday_Id MEDIUMINT NULL,
    thursday_Id MEDIUMINT NULL,
    friday_Id MEDIUMINT NULL,
    saturday_Id  MEDIUMINT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS Day (
    id MEDIUMINT NOT NULL AUTOINCREMENT,
    shedule TEXT NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF NOT EXISTS Stud    ADD CONSTRAINT FK_Stud_group_Id FOREIGN KEY (group_Id) REFERENCES Group (id);

ALTER TABLE IF NOT EXISTS Group   ADD CONSTRAINT FK_Group_Time_Table_id FOREIGN KEY (time_Table_Id) REFERENCES TimeTable (id);

ALTER TABLE IF NOT EXISTS Time_Table  ADD CONSTRAINT FK_Time_Table_even_Id FOREIGN KEY (even_Id) REFERENCES Week (id);
ALTER TABLE IF NOT EXISTS Time_Table  ADD CONSTRAINT FK_Time_Table_odd_Id FOREIGN KEY (odd_Id) REFERENCES Week (id);

ALTER TABLE IF NOT EXISTS Week    ADD CONSTRAINT FK_Week_monday_id FOREIGN KEY (monday_Id) REFERENCES Day (id);
ALTER TABLE IF NOT EXISTS Week    ADD CONSTRAINT FK_Week_tuesday_id FOREIGN KEY (tuesday_Id) REFERENCES Day (id);
ALTER TABLE IF NOT EXISTS Week    ADD CONSTRAINT FK_Week_wednesday_id FOREIGN KEY (wednesday_Id) REFERENCES Day (id);
ALTER TABLE IF NOT EXISTS Week    ADD CONSTRAINT FK_Week_thursday_id FOREIGN KEY (thursday_Id) REFERENCES Day (id);
ALTER TABLE IF NOT EXISTS Week    ADD CONSTRAINT FK_Week_friday_id FOREIGN KEY (friday_Id) REFERENCES Day (id);
ALTER TABLE IF NOT EXISTS Week    ADD CONSTRAINT FK_Week_saturday_id FOREIGN KEY (saturday_Id) REFERENCES Day (id);