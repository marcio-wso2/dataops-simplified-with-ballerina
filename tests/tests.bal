import ballerina/test;
import ballerina/io;
@test:Config {
    dataProvider: data
}
function getHighValuesTest(string dbFilePath, decimal amount, string[] expected) returns error? {
    string[]|error returnedValues  = getHighPaymentDetails(dbFilePath, amount);
    if(returnedValues is string[]) {
        test:assertTrue(returnedValues ==  expected);
    } else {
        io:println(returnedValues);
        test:assertFail(returnedValues.message());
    }
}
