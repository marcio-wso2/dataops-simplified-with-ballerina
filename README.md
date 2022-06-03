# 2.4 H2DB Data Load

## Problem Statement

SO2W needs you to load all the data from the database into a Ballerina table for further processing. Then you need to find the names of employees who have payment entries greater than a given amount (e.g., 3000.00) by querying the Ballerina table.

> The sample database file is `so2wdb.mv.db`, and the database name is `so2wdb`. It is given within the `db` folder.

Create a ballerina table with the following columns and populate it by loading the full data set in the H2 database.

`payment_id` - integer

`amount` - decimal

`employee_name` - string

Write a function to query the Ballerina table using Ballerina query expressions to extract employee names with payments greater than the given amount.

## Constraints

* Use the H2 database file provided in the `db` folder to validate queries and the Ballerina sample
* Add the H2 database driver as a platform dependency in your `Ballerina.toml` file
* Do not add the driver JAR into the package directory

## Definition

`
function getHighPaymentDetails(string dbFilePath, decimal amount) returns string[]|error
`

## Test Environment

* The database file is `so2wdb.mv.db`. Use the jdbc URL as `jdbc:h2:file:/path/to/file/so2wdb`
* Username: `root`
* Password: `root`

## Example

**Input:** dbFilePath : `“/Path/to/file/so2wdb”`, amount : `3000`

**Output:** `["Anita Bath", "Amanda Hug"]`

## Hints

* Use the [ballerinax/java.jdbc](https://central.ballerina.io/ballerinax/java.jdbc) module to work with the database
* Refer to the [Prerequisite](https://lib.ballerina.io/ballerinax/java.jdbc/latest) section for steps to add the JDBC driver as a dependency
* Use [query](https://lib.ballerina.io/ballerinax/java.jdbc/latest/clients/Client#query)  remote method to query data from DB
* [Simple query](https://ballerina.io/learn/by-example/jdbc-query-operation.html)
* [Table syntax](https://ballerina.io/learn/by-example/table-syntax.html)
* Use [Querying tables](https://ballerina.io/learn/by-example/querying-tables.html) to find the required data from the Ballerina table
