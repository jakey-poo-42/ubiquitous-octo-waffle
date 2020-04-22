function sqlQuery(q) {
  var mysql = require(['mysql']);

  var con = mysql.createConnection({
    host: "localhost",
    user: "webaccess",
    password: "cop4710proj",
    database: "project_schema"
  });

  con.connect(function(err) {
    if(err) {
      console.log("Error! Cannot connect to database. Error log below.");
      throw err;
    }
    console.log("Connected to database.");
  })
  con.query(q, function(err, result){
    if(err){
      console.log("Error! Unable to process query. Error log below.");
      throw err;
    }
    console.log(result);
  });
};
