const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// MySQL DB connection
const db = mysql.createConnection({
  host: process.env.DB_HOST || 'your-db-host.amazonaws.com',
  user: process.env.DB_USER || 'admin',
  password: process.env.DB_PASSWORD || 'yourpassword',
  database: process.env.DB_NAME || 'ecommercedb'
});

db.connect(err => {
  if (err) {
    console.error('DB connection failed:', err);
  } else {
    console.log('✅ Connected to MySQL');
  }
});

// Get Products API
app.get('/api/products', (req, res) => {
  db.query('SELECT * FROM products', (err, results) => {
    if (err) {
      res.status(500).json({ error: 'Database error' });
    } else {
      res.json(results);
    }
  });
});

// Home
app.get('/', (req, res) => {
  res.send('🛒 AliShop Backend API Running!');
});

app.listen(port, () => {
  console.log(`🚀 Backend server running on port ${port}`);
});