const express = require("express");
const Product = require("../models/product");
const auth = require("../middlewares/auth");
const productRouter = express.Router();

productRouter.get("/api/products", auth, async (req, res, next) => {
  try {
    console.log(req.query.category);
    const product = await Product.find({
      category: req.query.category,
    });
    // const product = await Product.find({});
    console.log(product[0]);
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: e.message });
  }
});
module.exports = productRouter;
