const bcryptjs = require("bcryptjs");
const express = require("express");
const authRouter = express.Router();
const User = require("./../models/user");
// Signup Route
authRouter.post("/api/signup", async (req, res) => {
  try {
    console.log("here");
    const { name, email, password } = req.body;
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists" });
      // return next('msg: "User with same email already exists" ');
    }
    const hashedPassword = await bcryptjs.hash(password, 8);
    let user = new User({ name, email, password: hashedPassword });
    user = await user.save();
    res.json(user);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

module.exports = authRouter;
