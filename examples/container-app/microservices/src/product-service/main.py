import os
import logging
from datetime import datetime
from flask import Flask, jsonify, request
from opencensus.ext.azure.log_exporter import AzureLogHandler

app = Flask(__name__)

# Configure logging
logger = logging.getLogger(__name__)
if os.getenv('APPLICATIONINSIGHTS_CONNECTION_STRING'):
    logger.addHandler(AzureLogHandler(
        connection_string=os.getenv('APPLICATIONINSIGHTS_CONNECTION_STRING')
    ))
logger.setLevel(logging.INFO)

# In-memory product store (for simplicity)
products = [
    {"id": 1, "name": "Laptop", "description": "High-performance laptop", "price": 999.99, "stock": 50},
    {"id": 2, "name": "Mouse", "description": "Wireless ergonomic mouse", "price": 29.99, "stock": 200},
    {"id": 3, "name": "Keyboard", "description": "Mechanical keyboard", "price": 79.99, "stock": 150},
    {"id": 4, "name": "Monitor", "description": "27-inch 4K monitor", "price": 399.99, "stock": 75},
    {"id": 5, "name": "Webcam", "description": "HD webcam with microphone", "price": 89.99, "stock": 100}
]

@app.before_request
def log_request():
    logger.info(f"Request: {request.method} {request.path}")

@app.after_request
def log_response(response):
    logger.info(f"Response: {response.status_code}")
    return response

@app.route('/health', methods=['GET'])
def health():
    """Health check endpoint"""
    return jsonify({
        'status': 'healthy',
        'service': 'product-service',
        'timestamp': datetime.utcnow().isoformat()
    }), 200

@app.route('/', methods=['GET'])
def root():
    """Root endpoint"""
    return jsonify({
        'service': 'Product Service',
        'version': '1.0.0',
        'endpoints': {
            '/health': 'Health check',
            '/products': 'List all products',
            '/products/<id>': 'Get product by ID'
        }
    }), 200

@app.route('/products', methods=['GET'])
def get_products():
    """Get all products"""
    logger.info(f"Retrieved {len(products)} products")
    return jsonify(products), 200

@app.route('/products/<int:product_id>', methods=['GET'])
def get_product(product_id):
    """Get product by ID"""
    product = next((p for p in products if p['id'] == product_id), None)
    
    if product:
        logger.info(f"Retrieved product {product_id}")
        return jsonify(product), 200
    else:
        logger.warning(f"Product {product_id} not found")
        return jsonify({'error': 'Product not found'}), 404

@app.errorhandler(Exception)
def handle_error(error):
    logger.error(f"Unhandled error: {str(error)}")
    return jsonify({
        'error': 'Internal server error',
        'message': str(error)
    }), 500

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8000))
    app.run(host='0.0.0.0', port=port)
