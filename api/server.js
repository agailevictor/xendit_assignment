import express from "express";
import winston from "./config/winston";
import morgan from "morgan";
import bodyParser from "body-parser";
import dotenv from "dotenv";
import routes from "./routes/route";
import cors from "cors";

dotenv.config();
const PORT = process.env.PORT || 3000;
const app = express();

app.use(cors());
app.use(bodyParser.json());
app.use(morgan('combined', { stream: winston.stream }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use('/orgs', routes);


app.listen(PORT, () => console.log("Server is Up and running at http://localhost:" + PORT));

module.exports = app;