DROP SCHEMA monopoly;
CREATE SCHEMA `monopoly` ;
USE monopoly;

CREATE TABLE Tokens(
`Token_ID`  TINYINT NOT NULL AUTO_INCREMENT,
`Token` VARCHAR(15) NOT NULL,
PRIMARY KEY (Token_ID) );

INSERT INTO Tokens(Token)
VALUES
    ('dog'),
    ('car'),
    ('boot'),
    ('battle-ship'),
    ('top hat'),
    ('thimble');

CREATE TABLE Players(
`Player_ID` INT NOT NULL,
`Name` VARCHAR(20) DEFAULT NULL,
`Chosen_token_ID` TINYINT NOT NULL,
UNIQUE (Chosen_token_ID) ,
PRIMARY KEY (Player_ID),
FOREIGN KEY(Chosen_token_ID) REFERENCES Tokens(Token_ID)
);

INSERT INTO Players(Player_ID, name, Chosen_token_ID)
VALUES
    (156,'Carrie',4),
    (289,'John',1),
    (123,'Angela',2),
    (489,'Peter',6);


CREATE TABLE Move_Tracker(
`Move_ID` INT NOT NULL AUTO_INCREMENT,
`Player_ID` INT NOT NULL,
`Round` INT NOT NULL ,
`Dice_Score` TINYINT NOT NULL ,
CHECK (Dice_Score<=12 AND Dice_Score>=1),
PRIMARY KEY (Move_ID),
FOREIGN KEY(Player_ID) REFERENCES Players(Player_ID)
);


CREATE TABLE Board(
`Location_ID` INT NOT NULL AUTO_INCREMENT,
`Type` VARCHAR(30) NOT NULL,
`Name` VARCHAR(30) NOT NULL,
PRIMARY KEY (Location_ID)
);

INSERT INTO Board(Name,Type)
VALUES
('Old Kent Road','Property'),
('Community Chest 1','Bonus'),
('Whitechapel Road','Property'),
('Income Tax','Bonus'),
('Kings Cross Station','Property'),
('The Angel, Islington','Property'),
('Chance 1', 'Bonus'),
('Euston Road','Property'),
('Pentonville Road','Property'),
('Jail','Bonus'),
('Pall Mall','Property'),
('Electric Company','Property'),
('Whitehall','Property'),
('Northumrl Avenue','Property'),
('Marylebone Station','Property'),
('Bow Street','Property'),
('Community Chest 2','Bonus'),
('Marlborough Street','Property'),
('Vine Street','Property'),
('Free Parking','Bonus'),
('Strand','Property'),
('Chance 2', 'Bonus'),
('Fleet Street','Property'),
('Trafalgar Square','Property'),
('Fenchurch St. Station','Property'),
('Leicester Square','Property'),
('Coventry Street','Property'),
('Water Works', 'Property'),
('Piccadilly','Property'),
('Go to Jail','Bonus'),
('Regent Street','Property'),
('Oxford Street','Property'),
('Community Chest 3','Bonus'),
('Bond Street','Property'),
('Liverpool St. station','Property'),
('Chance 3', 'Bonus'),
('Park Lane','Property'),
('Super Tax', 'Bonus'),
('Mayfair','Property'),
('GO','Bonus');


CREATE TABLE Bonuses AS
    SELECT Location_ID,Name
    FROM Board
    WHERE Type='Bonus'; 

ALTER TABLE Bonuses
ADD Bonus_ID INT NOT NULL AUTO_INCREMENT,
ADD Description VARCHAR(150)  NOT NULL,
ADD PRIMARY KEY (Bonus_ID),
ADD FOREIGN KEY(Location_ID) REFERENCES Board(Location_ID); 

UPDATE Bonuses 
SET Description='Get 50M as your Birthday present' WHERE Location_ID= 2;
UPDATE Bonuses 
SET Description='Pay 200M as an Income Tax' WHERE Location_ID= 4;
UPDATE Bonuses 
SET Description='Move forward 1 space' WHERE Location_ID= 7;
UPDATE Bonuses 
SET Description='No action' WHERE Location_ID=10;
UPDATE Bonuses     
SET Description='For winning a Beauty Contest, you get 300M' WHERE Location_ID=17;
UPDATE Bonuses 
SET Description='No action' WHERE Location_ID=20;
UPDATE Bonuses 
SET Description='Unlucky day. Pay each player a 50M' WHERE Location_ID=22;
UPDATE Bonuses 
SET Description='Go to Jail, do not pass GO, do not collect £200' WHERE Location_ID=30;
UPDATE Bonuses 
SET Description='You won the lottery. Get 150M' WHERE Location_ID=33;
UPDATE Bonuses 
SET Description='Pay a fine 30M for each of your properties' WHERE Location_ID=36;
UPDATE Bonuses 
SET Description='Pay 100M of taxes' WHERE Location_ID=38;
UPDATE Bonuses 
SET Description='Collect 200M' WHERE Location_ID=40;

CREATE TABLE Property AS
    SELECT Location_ID,Name
    FROM Board
    WHERE Type='Property'; 

ALTER TABLE Property
ADD Purchase_cost INT NOT NULL,
ADD Colour VARCHAR(15) NOT NULL,
ADD Owner_ID INT DEFAULT NULL ,
ADD Rent_Payable_Card INT DEFAULT NULL,
ADD Rent_Payable INT DEFAULT NULL,
ADD PRIMARY KEY (Name),
ADD FOREIGN KEY(Location_ID) REFERENCES Board(Location_ID),
ADD FOREIGN KEY(Owner_ID) REFERENCES Players(Player_ID); 


UPDATE Property 
SET Purchase_cost=60, Colour = 'Brown', Owner_ID=489,Rent_Payable_Card = 2   WHERE Location_ID=1;
UPDATE Property 
SET Purchase_cost= 60, Colour = 'Brown',Rent_Payable_Card = 4 WHERE Location_ID=3;
UPDATE Property 
SET Purchase_cost= 200, Colour = 'Black', Owner_ID=489 ,Rent_Payable_Card = 25 WHERE Location_ID=5;
UPDATE Property 
SET Purchase_cost= 100, Colour = 'Blue',Rent_Payable_Card = 6 WHERE Location_ID=6;
UPDATE Property 
SET Purchase_cost= 100, Colour = 'Blue',Rent_Payable_Card = 6  WHERE Location_ID=8;
UPDATE Property 
SET Purchase_cost= 120, Colour = 'Blue' ,Rent_Payable_Card =8  WHERE Location_ID=9;
UPDATE Property 
SET Purchase_cost= 140, Colour = 'Pink',Rent_Payable_Card =  10 WHERE Location_ID=11;
UPDATE Property 
SET Purchase_cost= 140, Colour = 'Pink', Owner_ID=156 ,Rent_Payable_Card =10  WHERE Location_ID=13;
UPDATE Property 
SET Purchase_cost= 160, Colour = 'Pink' ,Rent_Payable_Card = 12 WHERE Location_ID=14;
UPDATE Property 
SET Purchase_cost= 150, Colour = 'White', Owner_ID=289,Rent_Payable_Card = 4   WHERE Location_ID=12;
UPDATE Property 
SET Purchase_cost= 200, Colour = 'Black' ,Rent_Payable_Card =25 WHERE Location_ID=15;
UPDATE Property 
SET Purchase_cost= 180, Colour = 'Orange' ,Rent_Payable_Card = 14  WHERE Location_ID=16;
UPDATE Property 
SET Purchase_cost= 180, Colour = 'Orange',Rent_Payable_Card =14   WHERE Location_ID=18;
UPDATE Property 
SET Purchase_cost= 200, Colour = 'Orange',Rent_Payable_Card = 16  WHERE Location_ID=19;
UPDATE Property 
SET Purchase_cost= 220, Colour = 'Red', Owner_ID=289 ,Rent_Payable_Card =18  WHERE Location_ID=21;
UPDATE Property 
SET Purchase_cost= 220, Colour = 'Red', Owner_ID=123 ,Rent_Payable_Card = 18 WHERE Location_ID=23;
UPDATE Property 
SET Purchase_cost= 240, Colour = 'Red', Owner_ID=123,Rent_Payable_Card = 20  WHERE Location_ID=24;
UPDATE Property 
SET Purchase_cost= 200, Colour = 'Black' ,Rent_Payable_Card =25  WHERE Location_ID=25;
UPDATE Property 
SET Purchase_cost= 260, Colour = 'Yellow' ,Rent_Payable_Card =22  WHERE Location_ID=26;
UPDATE Property 
SET Purchase_cost= 260, Colour = 'Yellow' ,Rent_Payable_Card = 22 WHERE Location_ID=27;
UPDATE Property 
SET Purchase_cost= 280, Colour = 'Yellow', Owner_ID=123, Rent_Payable_Card =24    WHERE Location_ID=29;
UPDATE Property 
SET Purchase_cost= 150, Colour = 'White', Owner_ID=289 ,Rent_Payable_Card =4   WHERE Location_ID=28;
UPDATE Property 
SET Purchase_cost= 300, Colour = 'Green',Rent_Payable_Card =26   WHERE Location_ID=31;
UPDATE Property 
SET Purchase_cost= 300, Colour = 'Green',Rent_Payable_Card = 26  WHERE Location_ID=32;
UPDATE Property 
SET Purchase_cost= 320, Colour = 'Green' ,Rent_Payable_Card =28  WHERE Location_ID=34;
UPDATE Property 
SET Purchase_cost= 200, Colour = 'Black', Owner_ID=489 ,Rent_Payable_Card = 25  WHERE Location_ID=35;
UPDATE Property 
SET Purchase_cost= 350, Colour = 'Navy', Owner_ID=156 ,Rent_Payable_Card = 35 WHERE Location_ID=37;
UPDATE Property 
SET Purchase_cost= 400, Colour = 'Navy',Rent_Payable_Card =50  WHERE Location_ID=39;

CREATE TABLE Players_Current_state(
`Player_ID` INT NOT NULL,
`Current_Bank_Balance` INT NOT NULL,
`Current_Location_ID` INT NOT NULL,
`Available_Bonus_ID` INT DEFAULT NULL,
PRIMARY KEY (Player_ID),
FOREIGN KEY(Player_ID) REFERENCES Players(Player_ID),
FOREIGN KEY(Current_Location_ID) REFERENCES Board(Location_ID),
FOREIGN KEY(Available_Bonus_ID) REFERENCES Bonuses(Bonus_ID)
);

INSERT INTO Players_Current_state(Player_ID, Current_Bank_Balance,Current_Location_ID, Available_Bonus_ID)
VALUES
    (156,1250,37,NULL),
    (289,1450,10,NULL),
    (123,1040,33,NULL),
    (489,950,20,NULL);

CREATE TABLE Gameplay_Trail(
`Move_ID` INT NOT NULL,
`Player_ID` INT NOT NULL,
`New_Location_ID` INT NOT NULL,
`New_Bank_Balance` INT NOT NULL,
PRIMARY KEY (Move_ID),
FOREIGN KEY(Move_ID) REFERENCES Move_Tracker(Move_ID),
FOREIGN KEY(Player_ID) REFERENCES Players(Player_ID),
FOREIGN KEY(New_Location_ID) REFERENCES Board(Location_ID)
);

DELIMITER /
CREATE PROCEDURE update_rent_payable()
BEGIN
	DECLARE var1 INT;
	DECLARE var2 INT;
    DECLARE var3 INT;
    DECLARE var4 INT;
    DECLARE count_var1 INT;
    DECLARE count_var2 INT;
    DECLARE count_var3 INT;
    DECLARE count_var4 INT;
	SET var1= (SELECT Owner_ID FROM Property WHERE Location_ID=1);
	SET var2= (SELECT Owner_ID FROM Property WHERE Location_ID=3);
	IF var1= var2 THEN
		UPDATE Property SET Rent_Payable=Rent_Payable_Card*2 WHERE Location_ID=1 OR Location_ID=3;
	ELSE
		UPDATE Property SET Rent_Payable=Rent_Payable_Card WHERE Location_ID=1 OR Location_ID=3;
    END IF;
	SET var1= (SELECT Owner_ID FROM Property WHERE Location_ID=12);
	SET var2= (SELECT Owner_ID FROM Property WHERE Location_ID=28);
	IF var1= var2 THEN
		UPDATE Property SET Rent_Payable=10 WHERE Location_ID=12 OR Location_ID=28;
	ELSE
		UPDATE Property SET Rent_Payable= Rent_Payable_Card WHERE Location_ID=12 OR Location_ID=28;
    END IF;
	SET var1= (SELECT Owner_ID FROM Property WHERE Location_ID=39);
	SET var2= (SELECT Owner_ID FROM Property WHERE Location_ID=37);
	IF var1= var2 THEN
		UPDATE Property SET Rent_Payable=Rent_Payable_Card*2 WHERE Location_ID=39 OR Location_ID=37;
	ELSE
		UPDATE Property SET Rent_Payable=Rent_Payable_Card WHERE Location_ID=39 OR Location_ID=37;
    END IF;
    SET var1= (SELECT Owner_ID FROM Property WHERE Location_ID=8);
	SET var2= (SELECT Owner_ID FROM Property WHERE Location_ID=9);
    SET var3= (SELECT Owner_ID FROM Property WHERE Location_ID=6);
	IF var1= var2 AND var2=var3 THEN
		UPDATE Property SET Rent_Payable=Rent_Payable_Card*2 WHERE Location_ID=8 OR Location_ID=9 OR Location_ID=6;
	ELSE
		UPDATE Property SET Rent_Payable=Rent_Payable_Card WHERE Location_ID=8 OR Location_ID=9 OR Location_ID=6;
    END IF;
    SET var1= (SELECT Owner_ID FROM Property WHERE Location_ID=34);
	SET var2= (SELECT Owner_ID FROM Property WHERE Location_ID=32);
    SET var3= (SELECT Owner_ID FROM Property WHERE Location_ID=31);
	IF var1= var2 AND var2=var3 THEN
		UPDATE Property SET Rent_Payable=Rent_Payable_Card*2 WHERE Location_ID=32 OR Location_ID=34 OR Location_ID=31;
	ELSE
		UPDATE Property SET Rent_Payable=Rent_Payable_Card WHERE Location_ID=32 OR Location_ID=34 OR Location_ID=31;
    END IF;
    
	SET var1= (SELECT Owner_ID FROM Property WHERE Location_ID=16);
	SET var2= (SELECT Owner_ID FROM Property WHERE Location_ID=18);
    SET var3= (SELECT Owner_ID FROM Property WHERE Location_ID=19);
	IF var1= var2 AND var2=var3 THEN
		UPDATE Property SET Rent_Payable=Rent_Payable_Card*2 WHERE Location_ID=16 OR Location_ID=18 OR Location_ID=19;
	ELSE
		UPDATE Property SET Rent_Payable=Rent_Payable_Card WHERE Location_ID=16 OR Location_ID=18 OR Location_ID=19;
    END IF;
    
    SET var1= (SELECT Owner_ID FROM Property WHERE Location_ID=14);
	SET var2= (SELECT Owner_ID FROM Property WHERE Location_ID=11);
    SET var3= (SELECT Owner_ID FROM Property WHERE Location_ID=13);
	IF var1= var2 AND var2=var3 THEN
		UPDATE Property SET Rent_Payable=Rent_Payable_Card*2 WHERE Location_ID=14 OR Location_ID=11 OR Location_ID=13;
	ELSE
		UPDATE Property SET Rent_Payable=Rent_Payable_Card WHERE Location_ID=14 OR Location_ID=11 OR Location_ID=13;
    END IF;
	SET var1= (SELECT Owner_ID FROM Property WHERE Location_ID=23);
	SET var2= (SELECT Owner_ID FROM Property WHERE Location_ID=21);
    SET var3= (SELECT Owner_ID FROM Property WHERE Location_ID=24);
	IF var1= var2 AND var2=var3 THEN
		UPDATE Property SET Rent_Payable=Rent_Payable_Card*2 WHERE Location_ID=23 OR Location_ID=21 OR Location_ID=24;
	ELSE
		UPDATE Property SET Rent_Payable=Rent_Payable_Card WHERE Location_ID=23 OR Location_ID=21 OR Location_ID=24;
    END IF;
    SET var1= (SELECT Owner_ID FROM Property WHERE Location_ID=26);
	SET var2= (SELECT Owner_ID FROM Property WHERE Location_ID=27);
    SET var3= (SELECT Owner_ID FROM Property WHERE Location_ID=29);
	IF var1= var2 AND var2=var3 THEN
		UPDATE Property SET Rent_Payable=Rent_Payable_Card*2 WHERE Location_ID=26 OR Location_ID=27 OR Location_ID=29;
	ELSE
		UPDATE Property SET Rent_Payable=Rent_Payable_Card WHERE Location_ID=26 OR Location_ID=27 OR Location_ID=29;
    END IF;
    
    SET var1= (SELECT Owner_ID FROM Property WHERE Location_ID=5);
	SET var2= (SELECT Owner_ID FROM Property WHERE Location_ID=15);
    SET var3= (SELECT Owner_ID FROM Property WHERE Location_ID=25);
    SET var4= (SELECT Owner_ID FROM Property WHERE Location_ID=35);
    SET count_var1 = (SELECT count(Owner_ID) FROM Property WHERE Colour='Black' AND Owner_ID=var1 GROUP BY Owner_ID);
    SET count_var2 = (SELECT count(Owner_ID) FROM Property WHERE Colour='Black' AND Owner_ID=var2 GROUP BY Owner_ID);
    SET count_var3 = (SELECT count(Owner_ID) FROM Property WHERE Colour='Black' AND Owner_ID=var3 GROUP BY Owner_ID);
    SET count_var4 = (SELECT count(Owner_ID) FROM Property WHERE Colour='Black' AND Owner_ID=var4 GROUP BY Owner_ID);
    IF count_var1>1 THEN
		IF count_var1=2 THEN
			UPDATE Property SET Rent_Payable=50 WHERE Owner_ID=var1;
        END IF;
        IF count_var1=3 THEN
        	UPDATE Property SET Rent_Payable=100 WHERE Owner_ID=var1;
        END IF;
        IF count_var1=4 THEN 
        	UPDATE Property SET Rent_Payable=200 WHERE Owner_ID=var1;
        END IF;
	ELSE
    	UPDATE Property SET Rent_Payable=Rent_Payable_Card WHERE Owner_ID=var1;
    END IF;
 
    IF count_var2>1 THEN
		IF count_var2=2 THEN
			UPDATE Property SET Rent_Payable=50 WHERE Owner_ID=var2;
        END IF;
        IF count_var2=3 THEN
        	UPDATE Property SET Rent_Payable=100 WHERE Owner_ID=var2;
        END IF;
        IF count_var2=4 THEN 
        	UPDATE Property SET Rent_Payable=200 WHERE Owner_ID=var2;
        END IF;
	ELSE
    	UPDATE Property SET Rent_Payable=Rent_Payable_Card WHERE Owner_ID=var2;
    END IF; 

    IF count_var3>1 THEN
		IF count_var3=2 THEN
			UPDATE Property SET Rent_Payable=50 WHERE Owner_ID=var3;
        END IF;
        IF count_var3=3 THEN
        	UPDATE Property SET Rent_Payable=100 WHERE Owner_ID=var3;
        END IF;
        IF count_var3=4 THEN 
        	UPDATE Property SET Rent_Payable=200 WHERE Owner_ID=var3;
        END IF;
	ELSE
    	UPDATE Property SET Rent_Payable=Rent_Payable_Card WHERE Owner_ID=var3;
    END IF;
    
    IF count_var4>1 THEN
		IF count_var4=2 THEN
			UPDATE Property SET Rent_Payable=50 WHERE Owner_ID=var4;
        END IF;
        IF count_var4=3 THEN
        	UPDATE Property SET Rent_Payable=100 WHERE Owner_ID=var4;
        END IF;
        IF count_var4=4 THEN 
        	UPDATE Property SET Rent_Payable=200 WHERE Owner_ID=var4;
        END IF;
	ELSE
    	UPDATE Property SET Rent_Payable=Rent_Payable_Card WHERE Owner_ID=var4;
    END IF;    
    UPDATE Property SET Rent_Payable=Rent_Payable_Card WHERE Owner_ID IS NULL;
END /
DELIMITER ;

CALL update_rent_payable();

DROP TRIGGER IF EXISTS new_trigger;
DELIMITER /
CREATE TRIGGER new_trigger
AFTER INSERT ON move_tracker
FOR EACH ROW
BEGIN
	DECLARE old_loc integer;
    DECLARE new_loc integer;
    DECLARE new_balance integer;
    DECLARE owner_check integer; 
    DECLARE can_move_from_jail BOOLEAN;
    DECLARE rent INT;
    SET @old_loc = (SELECT Current_Location_ID FROM monopoly.players_current_state where Player_ID=NEW.Player_ID) ;
    SET @new_balance = (SELECT Current_Bank_Balance FROM monopoly.players_current_state where Player_ID=NEW.Player_ID);
    SET @can_move_from_jail = ((@old_loc=10) AND ((SELECT Player_ID FROM Move_Tracker WHERE Move_ID=NEW.Move_ID-1)=NEW.Player_ID) AND ((SELECT Dice_Score FROM Move_Tracker WHERE Move_ID=NEW.Move_ID-1)=12));
    IF (NEW.Dice_Score<12 AND @old_loc <>10) OR @can_move_from_jail=True THEN
        SET @new_loc = NEW.Dice_Score+ @old_loc;
        IF @new_loc >40 THEN
			SET @new_loc= MOD(@new_loc,40);
            IF @old_loc<>40 THEN
				SET @new_balance=@new_balance+200;
			END IF;
		END IF;
        IF @new_loc=7 THEN
			SET @new_loc = @new_loc+1 ;
		END IF;
        IF @new_loc=30 THEN
			SET @new_loc = 10 ;
		END IF;
		UPDATE players_current_state SET Current_Location_ID= @new_loc WHERE Player_ID=NEW.Player_ID;
        IF @new_loc=2 THEN
			SET @new_balance=@new_balance+50;
		END IF;
        IF @new_loc=40 THEN
			SET @new_balance=@new_balance+200;
		END IF;
        IF @new_loc=4 THEN
			SET @new_balance=@new_balance-200;
		END IF;
        IF @new_loc=17 THEN
			SET @new_balance=@new_balance+300;
		END IF;
        IF @new_loc=17 THEN
			SET @new_balance=@new_balance+150;
		END IF;
        IF @new_loc=38 THEN
			SET @new_balance=@new_balance-100;
		END IF;
        IF @new_loc=22 THEN
			SET @new_balance=@new_balance-50*(SELECT COUNT(Player_ID) FROM Players WHERE Player_ID<>NEW.Player_ID);
            UPDATE players_current_state SET Current_Bank_Balance=Current_Bank_Balance+50 WHERE Player_ID<>NEW.Player_ID;
		END IF;
        IF @new_loc=36 THEN
			SET @new_balance=@new_balance-30*(SELECT COUNT(Owner_ID) FROM Property WHERE Owner_ID=NEW.Player_ID);
		END IF;
        IF (@new_loc IN (SELECT Location_ID FROM Property)) THEN
			SET @owner_check=(SELECT Owner_ID FROM Property WHERE Location_iD=@new_loc);
            IF (@owner_check IS NULL) AND (@new_balance>= (SELECT Purchase_Cost FROM Property WHERE Location_iD=@new_loc)) THEN
				SET @new_balance=@new_balance-(SELECT Purchase_Cost FROM Property WHERE Location_iD=@new_loc);
				UPDATE Property SET Owner_ID=NEW.Player_ID WHERE Location_ID=@new_loc;
				CALL update_rent_payable();
			END IF;
            IF (@owner_check IS NOT NULL) AND @new_loc<>28 AND @new_loc<>12  THEN
				SET @new_balance=@new_balance-(SELECT Rent_Payable FROM Property WHERE Location_iD=@new_loc);
                SET @rent=(SELECT Rent_Payable FROM Property WHERE Location_iD=@new_loc);
				UPDATE players_current_state SET Current_Bank_Balance=Current_Bank_Balance+@rent WHERE Player_ID=@owner_check;
            END IF;
            IF (@owner_check IS NOT NULL) AND (@new_loc=28 OR @new_loc=12)  THEN
				SET @new_balance=@new_balance-((SELECT Rent_Payable FROM Property WHERE Location_iD=@new_loc)*NEW.Dice_Score);
                SET @rent=(SELECT Rent_Payable FROM Property WHERE Location_iD=@new_loc)*NEW.Dice_Score;
				UPDATE players_current_state SET Current_Bank_Balance=Current_Bank_Balance+@rent WHERE Player_ID=@owner_check;
            END IF;
        END IF; 
        UPDATE players_current_state SET Current_Bank_Balance= @new_balance WHERE Player_ID=NEW.Player_ID;
        UPDATE players_current_state SET Current_Location_ID= @new_loc WHERE Player_ID=NEW.Player_ID;
        INSERT INTO gameplay_trail SET Move_ID = NEW.Move_ID, Player_ID = NEW.Player_ID, New_Location_ID=@new_loc,New_Bank_Balance=@new_balance;
		IF @new_loc IN (SELECT Location_ID FROM Bonuses) THEN
			UPDATE players_current_state SET Available_Bonus_ID=(SELECT Bonus_ID FROM Bonuses WHERE Location_ID=@new_loc) WHERE Player_ID=NEW.Player_ID;
        END iF;
    END IF;
    IF NEW.Dice_Score=12 AND @old_loc <> 10 THEN
		SET @new_loc = NEW.Dice_Score+ @old_loc;
        SET @new_balance=(SELECT Current_Bank_Balance FROM monopoly.players_current_state where Player_ID=NEW.Player_ID);
		IF @new_loc >40 THEN
			SET @new_loc= MOD(@new_loc,40);
            IF @old_loc<>40 THEN
				SET @new_balance=@new_balance+200;
			END IF;
		END IF;
        IF @new_loc=40 THEN
			SET @new_balance=@new_balance+200;
        END IF;
        INSERT INTO gameplay_trail SET Move_ID = NEW.Move_ID, Player_ID = NEW.Player_ID, New_Location_ID=@new_loc,New_Bank_Balance=@new_balance;
		UPDATE Players_Current_State SET Current_Location_ID=@new_loc WHERE Player_ID=NEW.Player_ID ;
        UPDATE players_current_state SET Current_Bank_Balance= @new_balance WHERE Player_ID=NEW.Player_ID;
    END IF;
    IF @old_loc=10 AND (SELECT Player_ID FROM Move_Tracker WHERE Move_ID=NEW.Move_ID-1)<>NEW.Player_ID THEN
		INSERT INTO gameplay_trail SET Move_ID = NEW.Move_ID, Player_ID = NEW.Player_ID, New_Location_ID=10,New_Bank_Balance=@new_balance;
    END IF;
    UPDATE players_current_state SET Available_Bonus_ID= (SELECT Bonus_ID FROM Bonuses WHERE Location_ID=@new_loc) WHERE Player_ID=NEW.Player_ID;
END /
DELIMITER ;

DELIMITER /
CREATE PROCEDURE show_game_view(IN r INT)
BEGIN
	SELECT Players.Name, Players_Current_State.Current_Bank_Balance, Board.Name AS Location, Bonuses.Description AS Available_Bonus, tokens.token, Move_Tracker.Round
	FROM Players_Current_State
	LEFT JOIN Players
	ON Players_Current_State.Player_ID= Players.Player_ID
	LEFT JOIN Board
	ON Players_Current_State.Current_Location_ID= Board.Location_ID
	LEFT JOIN Bonuses
	ON Players_Current_State.Available_Bonus_ID= Bonuses.Bonus_ID
	LEFT JOIN Tokens
	ON Players.Chosen_Token_ID=Tokens.Token_ID
    LEFT JOIN Move_Tracker
    ON Players.Player_ID=Move_Tracker.Player_ID 
    WHERE Round=r AND Dice_Score<12;
END /
DELIMITER ; 

INSERT INTO move_tracker (Player_ID,Round,Dice_Score)
VALUES
	(156,1, 2);

INSERT INTO move_tracker (Player_ID,Round,Dice_Score)
VALUES
	(289,1, 5);
    
INSERT INTO move_tracker (Player_ID,Round,Dice_Score)
VALUES
	(123,1, 3);

INSERT INTO move_tracker (Player_ID,Round,Dice_Score)
VALUES
	(489,1, 5);
    
CALL show_game_view(1);   

 INSERT INTO move_tracker (Player_ID,Round,Dice_Score)
VALUES
	(156,2, 8);

INSERT INTO move_tracker (Player_ID,Round,Dice_Score)
VALUES
	(289,2, 12);

INSERT INTO move_tracker (Player_ID,Round,Dice_Score)
VALUES
	(289,2, 4);
    
INSERT INTO move_tracker (Player_ID,Round,Dice_Score)
VALUES
	(123,2, 3);

INSERT INTO move_tracker (Player_ID,Round,Dice_Score)
VALUES
	(489,2, 5);
    
CALL show_game_view(2);   
  

