const express = require("express");
const cors = require("cors");
const cookieParser = require("cookie-parser");
const path = require("path");
const session = require("express-session");
const app = express();

require("dotenv").config();

// app.use(
//   cors({
//     origin: "https://cookieapp.vercel.app",
//     credentials: true,
//   })
// );

// app.set("trust proxy", 1);

app.use(express.static(path.join(__dirname, "./build")));

app.use(cors());

app.use(cookieParser());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(
  session({
    resave: false,
    saveUninitialized: false,
    secret: "session",
    cookie: {
      maxAge: 30 * 60 * 60 * 1000,
      // sameSite: "stric",
      // secure: true,
    },
  })
);

app.post("/set", async (req, res) => {
  try {
    req.session.jwt = "hello";
    res.status(200).send({ message: "Cookie Saves Successfully " });
  } catch (error) {
    console.log(error);
  }
});

app.post("/set1", async (req, res) => {
  try {
    res.cookie("jwt", "updated", {
      // httpOnly: true,
      sameSite: "none",
      secure: true,
    });
    res.status(200).send({ message: "Cookie Set Successfully" });
  } catch (error) {
    console.log(error);
  }
});

app.get("/get", async (req, res) => {
  try {
    console.log(req.session.jwt);
    res.status(200).send({ message: req.session.jwt });
  } catch (error) {
    console.log(error);
  }
});

app.post("/remove", (req, res) => {
  req.session.jwt = null;

  res.send({ message: "Logged out." });
});


app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "./build/index.html"));
});

const port = 5000;

app.listen(port || 5000, () => {
  console.log(`Serving running at http://localhost:${port}`);
});