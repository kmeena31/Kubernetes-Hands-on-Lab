const express = require('express');
const os = require('os');
const { createClient } = require('redis');

const PORT = process.env.PORT || 3000;
const GREETING = process.env.GREETING || 'Hello from Module 1!';
const REDIS_URL = process.env.REDIS_URL;

const app = express();
let redis = null;

if (REDIS_URL) {
  redis = createClient({ url: REDIS_URL });
  redis.on('error', (err) => console.error('Redis error:', err.message));
  redis.connect()
    .then(() => console.log('Connected to Redis'))
    .catch((err) => console.error('Redis connect failed:', err.message));
}

app.get('/', async (req, res) => {
  const visits = redis && redis.isReady ? await redis.incr('visits') : null;
  res.json({ message: GREETING, servedBy: os.hostname(), visits });
});

app.get('/health', (req, res) => res.status(200).send('OK'));

const server = app.listen(PORT, () => console.log(`Listening on port ${PORT}`));

process.on('SIGTERM', () => {
  console.log('SIGTERM received - shutting down gracefully');
  server.close(async () => {
    if (redis && redis.isOpen) await redis.close();
    console.log('Shutdown complete');
    process.exit(0);
  });
});
