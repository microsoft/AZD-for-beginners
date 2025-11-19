from flask import Flask, jsonify, request
from datetime import datetime
import os
import logging

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

app = Flask(__name__)

# In-memory storage for demo purposes
items = {}
item_counter = 0

@app.route('/health', methods=['GET'])
def health():
    """Health check endpoint"""
    return jsonify({
        'status': 'healthy',
        'timestamp': datetime.utcnow().isoformat() + 'Z',
        'service': 'simple-flask-api',
        'version': '1.0.0'
    })

@app.route('/api/items', methods=['GET'])
def get_items():
    """Get all items"""
    logger.info(f"Getting all items. Total: {len(items)}")
    return jsonify({
        'items': list(items.values()),
        'total': len(items)
    })

@app.route('/api/items', methods=['POST'])
def create_item():
    """Create a new item"""
    global item_counter
    
    if not request.json:
        return jsonify({'error': 'Request must be JSON'}), 400
    
    data = request.json
    if 'name' not in data:
        return jsonify({'error': 'Name is required'}), 400
    
    item_counter += 1
    item = {
        'id': item_counter,
        'name': data.get('name'),
        'description': data.get('description', ''),
        'created_at': datetime.utcnow().isoformat() + 'Z'
    }
    items[item_counter] = item
    
    logger.info(f"Created item {item_counter}: {item['name']}")
    return jsonify(item), 201

@app.route('/api/items/<int:item_id>', methods=['GET'])
def get_item(item_id):
    """Get a specific item"""
    item = items.get(item_id)
    if not item:
        logger.warning(f"Item {item_id} not found")
        return jsonify({'error': 'Item not found'}), 404
    
    logger.info(f"Retrieved item {item_id}")
    return jsonify(item)

@app.route('/api/items/<int:item_id>', methods=['PUT'])
def update_item(item_id):
    """Update an existing item"""
    if item_id not in items:
        logger.warning(f"Attempted to update non-existent item {item_id}")
        return jsonify({'error': 'Item not found'}), 404
    
    if not request.json:
        return jsonify({'error': 'Request must be JSON'}), 400
    
    data = request.json
    items[item_id].update({
        'name': data.get('name', items[item_id]['name']),
        'description': data.get('description', items[item_id]['description']),
        'updated_at': datetime.utcnow().isoformat() + 'Z'
    })
    
    logger.info(f"Updated item {item_id}")
    return jsonify(items[item_id])

@app.route('/api/items/<int:item_id>', methods=['DELETE'])
def delete_item(item_id):
    """Delete an item"""
    if item_id not in items:
        logger.warning(f"Attempted to delete non-existent item {item_id}")
        return jsonify({'error': 'Item not found'}), 404
    
    del items[item_id]
    logger.info(f"Deleted item {item_id}")
    return '', 204

@app.route('/', methods=['GET'])
def root():
    """Root endpoint with API information"""
    return jsonify({
        'service': 'simple-flask-api',
        'version': '1.0.0',
        'description': 'A simple Flask REST API for Azure Container Apps',
        'endpoints': {
            'health': '/health',
            'items': '/api/items',
            'item': '/api/items/{id}'
        }
    })

@app.errorhandler(404)
def not_found(error):
    return jsonify({'error': 'Endpoint not found'}), 404

@app.errorhandler(500)
def internal_error(error):
    logger.error(f"Internal error: {error}")
    return jsonify({'error': 'Internal server error'}), 500

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8000))
    debug = os.environ.get('DEBUG', 'False').lower() == 'true'
    
    logger.info(f"Starting Flask API on port {port}")
    app.run(host='0.0.0.0', port=port, debug=debug)
