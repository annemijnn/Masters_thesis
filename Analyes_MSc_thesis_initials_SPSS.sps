* Encoding: UTF-8.
GET DATA
  /TYPE=XLSX
  /FILE='\\vu.local\home\anm380\Documents\!! UNIVERSITEIT PERSOONLIJK\board_members.xlsx'
  /SHEET=name 'Sheet 1'
  /CELLRANGE=FULL
  /READNAMES=ON
  /DATATYPEMIN PERCENTAGE=95.0
  /HIDDEN IGNORE=YES.
EXECUTE.
DATASET NAME DataSet6 WINDOW=FRONT.

* delete the initials in the board1 column and check if it worked.
string board1period (a1).
COMPUTE board1period = CHAR.SUBSTR(board1,2,1).
fre board1period.

string period1 (a1).
recode board1period ("." = "1") (else = "0") INTO period1.
fre period1.
alter type period1 (f1.0).
fre period1.

* delete the initials in the board2 column and check if it worked.
string board2period (a1).
COMPUTE board2period = CHAR.SUBSTR(board2,2,1).
fre board2period.

string period2 (a1).
recode board2period ("." = "1") (else = "0") INTO period2.
fre period2.
alter type period2 (f1.0).
fre period2.

* delete the initials in the board3 column and check if it worked.
string board3period (a1).
COMPUTE board3period = CHAR.SUBSTR(board3,2,1).
fre board3period.

string period3 (a1).
recode board3period ("." = "1") (else = "0") INTO period3.
fre period3.
alter type period3 (f1.0).
fre period3.

* delete the initials in the board4 column and check if it worked.
string board4period (a1).
COMPUTE board4period = CHAR.SUBSTR(board4,2,1).
fre board4period.

string period4 (a1).
recode board4period ("." = "1") (else = "0") INTO period4.
fre period4.
alter type period4 (f1.0).
fre period4.

* delete the initials in the board5 column and check if it worked.
string board5period (a1).
COMPUTE board5period = CHAR.SUBSTR(board5,2,1).
fre board5period.

string period5 (a1).
recode board5period ("." = "1") (else = "0") INTO period5.
fre period5.
alter type period5 (f1.0).
fre period5.

* delete the initials in the board6 column and check if it worked.
string board6period (a1).
COMPUTE board6period = CHAR.SUBSTR(board6,2,1).
fre board6period.

string period6 (a1).
recode board6period ("." = "1") (else = "0") INTO period6.
fre period6.
alter type period6 (f1.0).
fre period6.

* delete the initials in the board7 column and check if it worked.
string board7period (a1).
COMPUTE board7period = CHAR.SUBSTR(board7,2,1).
fre board7period.

string period7 (a1).
recode board7period ("." = "1") (else = "0") INTO period7.
fre period7.
alter type period7 (f1.0).
fre period7.

* delete the initials in the board8 column and check if it worked.    
string board8period (a1).
COMPUTE board8period = CHAR.SUBSTR(board8,2,1).
fre board8period.

string period8 (a1).
recode board8period ("." = "1") (else = "0") INTO period8.
fre period8.
alter type period8 (f1.0).
fre period8.

* delete the initials in the board9 column and check if it worked.
string board9period (a1).
COMPUTE board9period = CHAR.SUBSTR(board9,2,1).
fre board9period.

string period9 (a1).
recode board9period ("." = "1") (else = "0") INTO period9.
fre period9.
alter type period9 (f1.0).
fre period9.

* delete the initials in the board10 column and check if it worked.
string board10period (a1).
COMPUTE board10period = CHAR.SUBSTR(board10,2,1).
fre board10period.

string period10 (a1).
recode board10period ("." = "1") (else = "0") INTO period10.
fre period10.
alter type period10 (f1.0).
fre period10.

* delete the initials in the board11 column and check if it worked.
string board11period (a1).
COMPUTE board11period = CHAR.SUBSTR(board11,2,1).
fre board11period.

string period11 (a1).
recode board11period ("." = "1") (else = "0") INTO period11.
fre period11.
alter type period11 (f1.0).
fre period11.

* delete the initials in the board12 column and check if it worked.    
string board12period (a1).
COMPUTE board12period = CHAR.SUBSTR(board12,2,1).
fre board12period.

string period12 (a1).
recode board12period ("." = "1") (else = "0") INTO period12.
fre period12.
alter type period12 (f1.0).
fre period12.

* delete the initials in the board13 column and check if it worked.
string board13period (a1).
COMPUTE board13period = CHAR.SUBSTR(board13,2,1).
fre board13period.

string period13 (a1).
recode board13period ("." = "1") (else = "0") INTO period13.
fre period13.
alter type period13 (f1.0).
fre period13.

* delete the initials in the board14 column and check if it worked.
string board14period (a1).
COMPUTE board14period = CHAR.SUBSTR(board14,2,1).
fre board14period.

string period14 (a1).
recode board14period ("." = "1") (else = "0") INTO period14.
fre period14.
alter type period14 (f1.0).
fre period14.

* delete the initials in the board15 column and check if it worked.
string board15period (a1).
COMPUTE board15period = CHAR.SUBSTR(board15,2,1).
fre board15period.

string period15 (a1).
recode board15period ("." = "1") (else = "0") INTO period15.
fre period15.
alter type period15 (f1.0).
fre period15.

* delete the initials in the board16 column and check if it worked.
string board16period (a1).
COMPUTE board16period = CHAR.SUBSTR(board16,2,1).
fre board16period.

string period16 (a1).
recode board16period ("." = "1") (else = "0") INTO period16.
fre period16.
alter type period16 (f1.0).
fre period16.

* delete the initials in the board17 column and check if it worked.
string board17period (a1).
COMPUTE board17period = CHAR.SUBSTR(board17,2,1).
fre board17period.

string period17 (a1).
recode board17period ("." = "1") (else = "0") INTO period17.
fre period17.
alter type period17 (f1.0).
fre period17.

* delete the initials in the board18 column and check if it worked.
string board18period (a1).
COMPUTE board18period = CHAR.SUBSTR(board18,2,1).
fre board18period.

string period18 (a1).
recode board18period ("." = "1") (else = "0") INTO period18.
fre period18.
alter type period18 (f1.0).
fre period18.

* delete the initials in the board19 column and check if it worked.
string board19period (a1).
COMPUTE board19period = CHAR.SUBSTR(board19,2,1).
fre board19period.

string period19 (a1).
recode board19period ("." = "1") (else = "0") INTO period19.
fre period19.
alter type period19 (f1.0).
fre period19.

* delete the initials in the board20 column and check if it worked.
string board20period (a1).
COMPUTE board20period = CHAR.SUBSTR(board20,2,1).
fre board20period.

string period20 (a1).
recode board20period ("." = "1") (else = "0") INTO period20.
fre period20.
alter type period20 (f1.0).
fre period20.

* check if the analyses worked.
COUNT periods = period1 period2 period3 period4 period5 period6 period7 period8 period9 period10 period11 period12 period13 period14 period15 period16 period17 period18 period19 period20 (1).
fre periods.

* save the results as an outfile.
save OUTFILE = '\\vu.local\home\anm380\Documents\!! UNIVERSITEIT PERSOONLIJK\board_members2.sav'.

DATASET COPY  board_members2.
DATASET ACTIVATE  board_members2.
FILTER OFF.
USE ALL.
SELECT IF (periods = .00).
EXECUTE.
DATASET ACTIVATE  DataSet6.
