const express = require('express');
const app = express();
const port = 8080;

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'OK' });
});

app.listen(port, () => {
  console.log(`Node.js API by Pranay is running on port ${port}`);
});
