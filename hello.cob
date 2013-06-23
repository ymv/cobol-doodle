       IDENTIFICATION DIVISION.
       PROGRAM-ID. hello.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT transactions ASSIGN TO "transactions.dat"
               ORGANIZATION LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD transactions.
       01 TRANSACTIONS-LINE PIC X(256).
       WORKING-STORAGE SECTION.
       01 TR-SUM PIC X(10).
       01 TR-SRC PIC X(10).
       01 TR-DST PIC X(10).
       PROCEDURE DIVISION.
           OPEN INPUT transactions
           PERFORM UNTIL 1=0
               READ transactions AT END
                   DISPLAY "EOF"
                   EXIT PERFORM
               END-READ
               UNSTRING TRANSACTIONS-LINE DELIMITED BY x"09" INTO
                   TR-SUM
                   TR-SRC
                   TR-DST
               END-UNSTRING
               DISPLAY TR-SUM
               DISPLAY TR-SRC
               DISPLAY TR-DST
           END-PERFORM
           CLOSE transactions.
       STOP RUN.
