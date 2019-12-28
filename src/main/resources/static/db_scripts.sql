use sapoorva;
create table organization(
   id INT NOT NULL AUTO_INCREMENT,
   org_name VARCHAR(40) NOT NULL,
   location VARCHAR(40) NOT NULL,
   org_type VARCHAR(40) NOT NULL,
   PRIMARY KEY ( id )
)ENGINE=INNODB;

create table employee(
   id INT NOT NULL AUTO_INCREMENT,
   first_name VARCHAR(100) NOT NULL,
   last_name VARCHAR(100) NOT NULL,
   salary VARCHAR(40) NOT NULL,
   email VARCHAR(40) NOT NULL,
   dob DATE,
   designation VARCHAR(40) NOT NULL,
   org_id INT NOT NULL,
   PRIMARY KEY ( id ),
   FOREIGN KEY (org_id)
        REFERENCES organization(id)
        ON DELETE CASCADE
)ENGINE=INNODB;

create table customer(
   id INT NOT NULL AUTO_INCREMENT,
   cust_name VARCHAR(100) NOT NULL,
   dob DATE,
   org_id INT NOT NULL,
   PRIMARY KEY ( id ),
   FOREIGN KEY (org_id)
        REFERENCES organization(id)
        ON DELETE CASCADE
)ENGINE=INNODB;

create table contract(
   id INT NOT NULL AUTO_INCREMENT,
   contract_name VARCHAR(100) NOT NULL,
   duration INT,
   budget VARCHAR(50),
   sign_date DATE,
   completion_date DATE,
   org_id INT NOT NULL,
   cust_id INT NOT NULL,
   PRIMARY KEY ( id ),
   FOREIGN KEY (org_id)
        REFERENCES organization(id)
        ON DELETE CASCADE,
    FOREIGN KEY (cust_id)
    REFERENCES customer(id)
    ON DELETE CASCADE
)ENGINE=INNODB;

create table payment_schedule(
   id INT NOT NULL AUTO_INCREMENT,
   discription VARCHAR(100) NOT NULL,
   schedule_date DATE NOT NULL,
   amount decimal(10,2) NOT NULL,
   payment_method VARCHAR(50),
   payment_date DATE,
   status CHAR(10) default 'PENDING',
   cust_id INT NOT NULL,
   org_id INT NOT NULL,
   PRIMARY KEY ( id ),
   FOREIGN KEY (cust_id)
    REFERENCES customer(id)
    ON DELETE CASCADE,
   FOREIGN KEY (org_id)
        REFERENCES organization(id)
        ON DELETE CASCADE
)ENGINE=INNODB;


create table discussion(
id INT NOT NULL AUTO_INCREMENT,
discription VARCHAR(100) NOT NULL,
discusion_date DATE, 
cust_id INT NOT NULL,
emp_id INT NOT NULL,
discussion_type VARCHAR(100),
PRIMARY KEY (id),
FOREIGN KEY(cust_id)
    REFERENCES CUSTOMER(id)
    ON DELETE CASCADE,
FOREIGN KEY (emp_id)
    REFERENCES EMPLOYEE(id)
    ON DELETE CASCADE
    )ENGINE=INNODB;
    
    
create table action (
id INT NOT NULL AUTO_INCREMENT,
discussion_id INT NOT NULL,
action_name CHAR(50)NOT NULL,
status CHAR(10) default 'PENDING',
action_date DATE NOT NULL,
completion_date DATE,
PRIMARY KEY(id),
FOREIGN KEY(discussion_id)
REFERENCES discussion(id)
ON DELETE CASCADE
)ENGINE=INNODB;

create table material (
id INT NOT NULL AUTO_INCREMENT,
material_name VARCHAR(100) NOT NULL,
unit_price decimal(10,2) NOT NULL,
image blob,
brand VARCHAR(100),
PRIMARY KEY (id)
)ENGINE=INNODB;

create table material_contract
( id INT NOT NULL AUTO_INCREMENT,
contract_id INT NOT NULL,
material_id INT NOT NULL,
type VARCHAR(100),
quantity INT,
PRIMARY KEY (id),
FOREIGN KEY (contract_id)
REFERENCES contract(id)
ON DELETE CASCADE,
FOREIGN KEY (material_id)
REFERENCES material(id)
ON DELETE CASCADE)ENGINE=INNODB;
