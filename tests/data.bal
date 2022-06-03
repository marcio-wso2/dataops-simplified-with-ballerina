function data() returns map<[string, decimal, string[]]>|error {
    map<[string,  decimal, string[]]> dataSet = {
        "Test1": ["./db/so2wdb", 3000, ["Anita Bath", "Amanda Hug"]]
    };
    return dataSet;
}

