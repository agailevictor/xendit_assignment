import dotenv from "dotenv";
import pg from "pg";
dotenv.config();
const pool = new pg.Pool({
	host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
    max: 10,
    idleTimeoutMillis: 30000,
});

export default pool;