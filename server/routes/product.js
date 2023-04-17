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
    res.status(500).json({ error: error.message });
  }
});
productRouter.get(
  "/api/products/search/:name",
  auth,
  async (req, res, next) => {
    try {
      console.log(req.params.name);
      const product = await Product.find({
        name: { $regex: req.params.name, $options: "i" },
      });

      console.log(product);
      res.json(product);
    } catch (error) {
      print(error.message);
      res.status(500).json({ error: error.message });
    }
  }
);

productRouter.post("/api/rate-product", auth, async (req, res) => {
  try {
    const { id, rating } = req.body;
    let product = await Product.findById(id);
    for (let i = 0; i < product.ratings.length; i++) {
      if (product.ratings[i].userId == req.user) {
        product.ratings.splice(i, 1);
        break;
      }
    }
    const ratingSchema = {
      userId: req.user,
      rating,
    };
    product.ratings.push(ratingSchema);
    product = await product.save();
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});
module.exports = productRouter;
