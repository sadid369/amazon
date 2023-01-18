const express = require("express");

const PORT = 3000;

const app = express();
app.get("/", (req, res) => {
  res.send("hello from simple server :)");
});
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server is running at PORT ${PORT}`);
});
