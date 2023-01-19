const express = require("express");
const authRouter = require("./routes/auth");

const PORT = 3000;
const app = express();
app.use(authRouter);
app.get("/", (req, res) => {
  res.send("hello from simple server :)");
});
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server is running at PORT ${PORT}`);
});
