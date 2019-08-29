import dotenv from "dotenv";
import pg from "pg";
dotenv.config();

const pool = new pg.Pool({
    user: process.env.PG_ROOT_USER,
    database: process.env.PG_DATABASE,
    password: process.env.PG_ROOT_PASSWORD,
    port: process.env.PG_PORT,
    max: 10,
    idleTimeoutMillis: 30000,
});

export default pool;