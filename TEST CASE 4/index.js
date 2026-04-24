const express = require('express');
const app = express();
const port = 8080;

app.get('/health', (req, res) => {
  res.json({ status: 'OK' });
});

app.listen(port, () => {
  console.log(`API is running on http://localhost:${port}`);
});
