const express = require("express");
const Product = require("../models/product");
const admin = require("./../middlewares/admin");
const adminRouter = express.Router();

adminRouter.post("/admin/add-product", admin, async (req, res, next) => {
  try {
    const { name, description, price, quantity, category, images } = req.body;
    let product = Product({
      name,
      description,
      price,
      quantity,
      category,
      images,
    });
    product = await product.save();
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: e.message });
  }
});
adminRouter.get("/admin/get-product", admin, async (req, res, next) => {
  try {
    const product = await Product.find({});
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = adminRouter;
