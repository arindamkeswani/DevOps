const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send("Express app GET response");
});

app.get("/about", (req, res) => {
  res.send("Hi I am Arindam. Nice to meet you :)");
});

app.listen(5000, () => {
  console.log("listening on Port 5000");
});