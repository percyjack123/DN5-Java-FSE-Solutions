SET SERVEROUTPUT ON;

DECLARE
BEGIN
    FOR customer_record IN (
        SELECT c.CustomerID,
               c.Name,
               l.LoanID,
               l.InterestRate,
               c.DOB
        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID
    )
    LOOP
        IF TRUNC(MONTHS_BETWEEN(SYSDATE, customer_record.DOB) / 12) > 60 THEN

            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE LoanID = customer_record.LoanID;

        END IF;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Scenario 1 Completed');

END;
/
SET SERVEROUTPUT ON;

DECLARE
BEGIN

    FOR customer_record IN (
        SELECT CustomerID,
               Balance
        FROM Customers
    )
    LOOP

        IF customer_record.Balance > 10000 THEN

            UPDATE Customers
            SET IsVIP = 'Y'
            WHERE CustomerID = customer_record.CustomerID;

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Scenario 2 Completed');

END;
/
SET SERVEROUTPUT ON;

DECLARE

BEGIN

    FOR loan_record IN (

        SELECT c.Name,
               l.LoanID,
               l.EndDate

        FROM Customers c
        JOIN Loans l

        ON c.CustomerID = l.CustomerID

        WHERE l.EndDate
        BETWEEN TRUNC(SYSDATE)
        AND TRUNC(SYSDATE) + 30

    )

    LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan '
            || loan_record.LoanID
            || ' for '
            || loan_record.Name
            || ' is due on '
            || TO_CHAR(loan_record.EndDate,'DD-MON-YYYY')
        );

    END LOOP;

END;
/