import React, { useState, useEffect } from "react";

function App() {
  const [tasks, setTasks] = useState([]);
  const [title, setTitle] = useState("");

  useEffect(() => {
    fetch("/tasks")
      .then(res => res.json())
      .then(data => setTasks(data));
  }, []);

  const addTask = () => {
    fetch("/tasks", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ title })
    })
      .then(res => res.json())
      .then(task => setTasks([...tasks, task]));
  };

  return (
    <div>
      <h1>Todo App</h1>
      <input value={title} onChange={e => setTitle(e.target.value)} />
      <button onClick={addTask}>Add Task</button>
      <ul>
        {tasks.map(t => (
          <li key={t.id}>{t.title}</li>
        ))}
      </ul>
    </div>
  );
}

export default App;
