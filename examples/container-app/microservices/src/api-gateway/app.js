const express = require('express');
const axios = require('axios');
const appInsights = require('applicationinsights');

// Initialize Application Insights
if (process.env.APPLICATIONINSIGHTS_CONNECTION_STRING) {
  appInsights.setup(process.env.APPLICATIONINSIGHTS_CONNECTION_STRING)
    .setAutoDependencyCorrelation(true)
    .setAutoCollectRequests(true)
    .setAutoCollectPerformance(true, true)
    .setAutoCollectExceptions(true)
    .setAutoCollectDependencies(true)
    .setAutoCollectConsole(true)
    .start();
}

const app = express();
const PORT = process.env.PORT || 8080;
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL || 'http://product-service';

app.use(express.json());

// Logging middleware
app.use((req, res, next) => {
  const start = Date.now();
  res.on('finish', () => {
    const duration = Date.now() - start;
    console.log(`${req.method} ${req.path} ${res.statusCode} - ${duration}ms`);
  });
  next();
});

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({
    status: 'healthy',
    service: 'api-gateway',
    timestamp: new Date().toISOString()
  });
});

// Root endpoint
app.get('/', (req, res) => {
  res.json({
    service: 'API Gateway',
    version: '1.0.0',
    endpoints: {
      '/health': 'Health check',
      '/api/products': 'List all products',
      '/api/products/:id': 'Get product by ID'
    }
  });
});

// Route to product service
app.get('/api/products', async (req, res) => {
  try {
    console.log(`Forwarding request to ${PRODUCT_SERVICE_URL}/products`);
    const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`, {
      timeout: 5000
    });
    res.json(response.data);
  } catch (error) {
    console.error('Error calling product service:', error.message);
    res.status(503).json({
      error: 'Product service unavailable',
      message: error.message
    });
  }
});

// Route to product service - get by ID
app.get('/api/products/:id', async (req, res) => {
  try {
    const { id } = req.params;
    console.log(`Forwarding request to ${PRODUCT_SERVICE_URL}/products/${id}`);
    const response = await axios.get(`${PRODUCT_SERVICE_URL}/products/${id}`, {
      timeout: 5000
    });
    res.json(response.data);
  } catch (error) {
    if (error.response && error.response.status === 404) {
      res.status(404).json({ error: 'Product not found' });
    } else {
      console.error('Error calling product service:', error.message);
      res.status(503).json({
        error: 'Product service unavailable',
        message: error.message
      });
    }
  }
});

// Error handling
app.use((err, req, res, next) => {
  console.error('Unhandled error:', err);
  res.status(500).json({
    error: 'Internal server error',
    message: err.message
  });
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`API Gateway listening on port ${PORT}`);
  console.log(`Product Service URL: ${PRODUCT_SERVICE_URL}`);
});
