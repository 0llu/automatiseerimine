const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: 'database',
  user: 'todo_user',
  password: 'Passw0rd',
  database: 'todoapp'
});

app.get('/tasks', (req, res) => {
  db.query('SELECT * FROM tasks', (err, results) => {
    if (err) return res.json({ error: err });
    res.json(results);
  });
});

app.post('/tasks', (req, res) => {
  const { title } = req.body;
  db.query('INSERT INTO tasks (title) VALUES (?)', [title], (err, result) => {
    if (err) return res.json({ error: err });
    res.json({ id: result.insertId, title, completed: false });
  });
});

app.listen(5000, () => console.log('API running on port 5000'));
