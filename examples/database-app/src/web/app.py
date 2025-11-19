import os
import pyodbc
from flask import Flask, jsonify
from opencensus.ext.azure.log_exporter import AzureLogHandler
import logging

app = Flask(__name__)

# Configure Application Insights logging
if os.getenv('APPLICATIONINSIGHTS_CONNECTION_STRING'):
    logger = logging.getLogger(__name__)
    logger.addHandler(AzureLogHandler(connection_string=os.getenv('APPLICATIONINSIGHTS_CONNECTION_STRING')))
    logger.setLevel(logging.INFO)
else:
    logger = logging.getLogger(__name__)
    logger.setLevel(logging.INFO)

def get_db_connection():
    """Establish a connection to the SQL database."""
    connection_string = os.getenv('SQL_CONNECTION_STRING')
    if not connection_string:
        raise ValueError("SQL_CONNECTION_STRING environment variable is not set")
    return pyodbc.connect(connection_string)

def init_database():
    """Initialize the database with a sample table if it doesn't exist."""
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        
        # Create a sample table
        cursor.execute('''
            IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='products' AND xtype='U')
            CREATE TABLE products (
                id INT PRIMARY KEY IDENTITY(1,1),
                name NVARCHAR(100) NOT NULL,
                description NVARCHAR(500),
                price DECIMAL(10, 2),
                created_at DATETIME DEFAULT GETDATE()
            )
        ''')
        
        # Insert sample data if table is empty
        cursor.execute("SELECT COUNT(*) FROM products")
        count = cursor.fetchone()[0]
        
        if count == 0:
            sample_products = [
                ('Laptop', 'High-performance laptop', 1299.99),
                ('Mouse', 'Wireless ergonomic mouse', 29.99),
                ('Keyboard', 'Mechanical keyboard', 89.99),
                ('Monitor', '27-inch 4K monitor', 399.99),
                ('Webcam', 'HD webcam with microphone', 79.99)
            ]
            
            cursor.executemany(
                "INSERT INTO products (name, description, price) VALUES (?, ?, ?)",
                sample_products
            )
            logger.info(f"Inserted {len(sample_products)} sample products")
        
        conn.commit()
        cursor.close()
        conn.close()
        logger.info("Database initialized successfully")
        
    except Exception as e:
        logger.error(f"Database initialization error: {str(e)}")
        raise

@app.route('/')
def home():
    """Home endpoint with API information."""
    return jsonify({
        'message': 'Welcome to the Database App API',
        'endpoints': {
            '/': 'This help message',
            '/health': 'Health check endpoint',
            '/products': 'List all products',
            '/products/<id>': 'Get product by ID'
        }
    })

@app.route('/health')
def health():
    """Health check endpoint that verifies database connectivity."""
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT 1")
        cursor.fetchone()
        cursor.close()
        conn.close()
        
        logger.info("Health check passed")
        return jsonify({
            'status': 'healthy',
            'database': 'connected'
        }), 200
        
    except Exception as e:
        logger.error(f"Health check failed: {str(e)}")
        return jsonify({
            'status': 'unhealthy',
            'database': 'disconnected',
            'error': str(e)
        }), 503

@app.route('/products')
def get_products():
    """Get all products from the database."""
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT id, name, description, price, created_at FROM products ORDER BY id")
        
        products = []
        for row in cursor.fetchall():
            products.append({
                'id': row[0],
                'name': row[1],
                'description': row[2],
                'price': float(row[3]) if row[3] else None,
                'created_at': row[4].isoformat() if row[4] else None
            })
        
        cursor.close()
        conn.close()
        
        logger.info(f"Retrieved {len(products)} products")
        return jsonify(products), 200
        
    except Exception as e:
        logger.error(f"Error retrieving products: {str(e)}")
        return jsonify({'error': str(e)}), 500

@app.route('/products/<int:product_id>')
def get_product(product_id):
    """Get a specific product by ID."""
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            "SELECT id, name, description, price, created_at FROM products WHERE id = ?",
            (product_id,)
        )
        
        row = cursor.fetchone()
        cursor.close()
        conn.close()
        
        if row:
            product = {
                'id': row[0],
                'name': row[1],
                'description': row[2],
                'price': float(row[3]) if row[3] else None,
                'created_at': row[4].isoformat() if row[4] else None
            }
            logger.info(f"Retrieved product {product_id}")
            return jsonify(product), 200
        else:
            return jsonify({'error': 'Product not found'}), 404
        
    except Exception as e:
        logger.error(f"Error retrieving product {product_id}: {str(e)}")
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    # Initialize database on startup
    init_database()
    
    # Run the Flask app
    port = int(os.environ.get('PORT', 8000))
    app.run(host='0.0.0.0', port=port)
