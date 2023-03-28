const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://root:root@cluster0.yfrjyvl.mongodb.net/amazon";
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Mongodb Successfully ");
  })
  .catch((e) => {
    console.log(e);
  });
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server is running at PORT ${PORT}`);
});
