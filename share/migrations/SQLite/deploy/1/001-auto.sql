-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Tue Feb 19 15:12:18 2013
-- 

;
BEGIN TRANSACTION;
--
-- Table: checklist
--
CREATE TABLE checklist (
  checklist_id INTEGER PRIMARY KEY NOT NULL,
  title varchar(64) NOT NULL,
  copy text NOT NULL
);
--
-- Table: user
--
CREATE TABLE user (
  user_id INTEGER PRIMARY KEY NOT NULL
);
--
-- Table: item
--
CREATE TABLE item (
  item_id INTEGER PRIMARY KEY NOT NULL,
  checklist_id integer NOT NULL,
  copy text NOT NULL,
  FOREIGN KEY (checklist_id) REFERENCES checklist(checklist_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX item_idx_checklist_id ON item (checklist_id);
--
-- Table: user_checklist
--
CREATE TABLE user_checklist (
  checklist_id INTEGER PRIMARY KEY NOT NULL,
  user_id integer NOT NULL,
  title varchar(64) NOT NULL,
  position integer NOT NULL,
  copy text NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX user_checklist_idx_user_id ON user_checklist (user_id);
--
-- Table: user_item
--
CREATE TABLE user_item (
  item_id INTEGER PRIMARY KEY NOT NULL,
  checklist_id integer NOT NULL,
  position integer NOT NULL,
  copy text NOT NULL,
  completed boolean NOT NULL DEFAULT 0,
  FOREIGN KEY (checklist_id) REFERENCES user_checklist(checklist_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX user_item_idx_checklist_id ON user_item (checklist_id);
COMMIT;
