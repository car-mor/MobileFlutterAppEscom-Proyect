import mysql from "mysql2/promise"

export const connectionMySQL = await mysql.createConnection(
    {
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
        port: process.env.DB_PORT
    }
)

try {
  await connectionMySQL.connect();
  console.log("Database connection successful");
} catch (err) {
  console.error("Database connection error:", err);
}
