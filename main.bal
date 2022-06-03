import  ballerinax/java.jdbc;
import ballerina/sql;

sql:ConnectionPool connPool = {maxOpenConnections: 5};
configurable string dbuser =  ? ;
configurable string dbpassword = ? ; 

type Payment record {
    int payment_id;
    decimal amount;
    string employee_name;
};

function getHighPaymentDetails(string dbFilePath, decimal amount) returns string[]|error {
    jdbc:Client|sql:Error dbClient = new (url = "jdbc:h2:file:" + dbFilePath, 
                                        user = dbuser, 
                                        password = dbpassword,
                                        connectionPool = connPool);

    if dbClient is jdbc:Client {
        //Fetches only the employees who have payments, not all of them.
        sql:ParameterizedQuery statement = `SELECT P.PAYMENT_ID as payment_id, P.AMOUNT as amount, E.NAME as employee_name
                                            FROM EMPLOYEE E 
                                            INNER JOIN PAYMENT P ON (E.EMPLOYEE_ID = P.EMPLOYEE_ID)
                                            ORDER BY p.PAYMENT_ID asc`;

        stream<Payment, error?> resultStream = dbClient->query(statement);
        
        table<Payment> inMemoryTable = table [];
        check from Payment payment in resultStream
        do {
            inMemoryTable.add(payment);
        };        

        return from Payment payment in inMemoryTable
               where payment.amount > amount
               select payment.employee_name;

    }
    
    return [];
}
