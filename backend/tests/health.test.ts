import request from 'supertest';
import express from 'express';

// Simular la app Express (en un proyecto real, importa la instancia real)
const app = express();
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok' });
});

describe('GET /health', () => {
  it('should return 200 and status ok', async () => {
    const res = await request(app).get('/health');
    expect(res.status).toBe(200);
    expect(res.body.status).toBe('ok');
  });
}); 