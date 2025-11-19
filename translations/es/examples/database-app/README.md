<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-19T21:13:54+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "es"
}
-->
# Implementación de una base de datos Microsoft SQL y una aplicación web con AZD

⏱️ **Tiempo estimado**: 20-30 minutos | 💰 **Costo estimado**: ~$15-25/mes | ⭐ **Complejidad**: Intermedia

Este **ejemplo completo y funcional** demuestra cómo usar el [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) para implementar una aplicación web Python Flask con una base de datos Microsoft SQL en Azure. Todo el código está incluido y probado, sin dependencias externas requeridas.

## Lo que aprenderás

Al completar este ejemplo, aprenderás a:
- Implementar una aplicación de múltiples capas (aplicación web + base de datos) usando infraestructura como código
- Configurar conexiones seguras a la base de datos sin codificar secretos
- Monitorear la salud de la aplicación con Application Insights
- Gestionar recursos de Azure de manera eficiente con AZD CLI
- Seguir las mejores prácticas de Azure en seguridad, optimización de costos y observabilidad

## Resumen del escenario
- **Aplicación web**: API REST de Python Flask con conectividad a base de datos
- **Base de datos**: Base de datos Azure SQL con datos de ejemplo
- **Infraestructura**: Provisionada usando Bicep (plantillas modulares y reutilizables)
- **Implementación**: Totalmente automatizada con comandos `azd`
- **Monitoreo**: Application Insights para registros y telemetría

## Requisitos previos

### Herramientas necesarias

Antes de comenzar, verifica que tienes instaladas estas herramientas:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versión 2.50.0 o superior)
   ```sh
   az --version
   # Salida esperada: azure-cli 2.50.0 o superior
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versión 1.0.0 o superior)
   ```sh
   azd version
   # Salida esperada: versión azd 1.0.0 o superior
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (para desarrollo local)
   ```sh
   python --version
   # Salida esperada: Python 3.8 o superior
   ```

4. **[Docker](https://www.docker.com/get-started)** (opcional, para desarrollo local en contenedores)
   ```sh
   docker --version
   # Salida esperada: versión de Docker 20.10 o superior
   ```

### Requisitos de Azure

- Una **suscripción activa de Azure** ([crea una cuenta gratuita](https://azure.microsoft.com/free/))
- Permisos para crear recursos en tu suscripción
- Rol de **Propietario** o **Colaborador** en la suscripción o grupo de recursos

### Conocimientos previos

Este es un ejemplo de **nivel intermedio**. Deberías estar familiarizado con:
- Operaciones básicas en la línea de comandos
- Conceptos fundamentales de la nube (recursos, grupos de recursos)
- Comprensión básica de aplicaciones web y bases de datos

**¿Nuevo en AZD?** Comienza con la [guía de introducción](../../docs/getting-started/azd-basics.md) primero.

## Arquitectura

Este ejemplo implementa una arquitectura de dos capas con una aplicación web y una base de datos SQL:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Despliegue de recursos:**
- **Grupo de recursos**: Contenedor para todos los recursos
- **Plan de servicio de aplicaciones**: Hospedaje basado en Linux (nivel B1 para eficiencia de costos)
- **Aplicación web**: Runtime de Python 3.11 con aplicación Flask
- **Servidor SQL**: Servidor de base de datos administrado con TLS 1.2 mínimo
- **Base de datos SQL**: Nivel básico (2GB, adecuado para desarrollo/pruebas)
- **Application Insights**: Monitoreo y registro
- **Espacio de trabajo de Log Analytics**: Almacenamiento centralizado de registros

**Analogía**: Piensa en esto como un restaurante (aplicación web) con un congelador (base de datos). Los clientes ordenan del menú (endpoints de la API), y la cocina (aplicación Flask) recupera los ingredientes (datos) del congelador. El gerente del restaurante (Application Insights) rastrea todo lo que sucede.

## Estructura de carpetas

Todos los archivos están incluidos en este ejemplo, no se requieren dependencias externas:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**Qué hace cada archivo:**
- **azure.yaml**: Indica a AZD qué implementar y dónde
- **infra/main.bicep**: Orquesta todos los recursos de Azure
- **infra/resources/*.bicep**: Definiciones individuales de recursos (modulares para reutilización)
- **src/web/app.py**: Aplicación Flask con lógica de base de datos
- **requirements.txt**: Dependencias de paquetes de Python
- **Dockerfile**: Instrucciones de contenedorización para la implementación

## Inicio rápido (paso a paso)

### Paso 1: Clonar y navegar

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Verificación de éxito**: Verifica que veas `azure.yaml` y la carpeta `infra/`:
```sh
ls
# Esperado: README.md, azure.yaml, infra/, src/
```

### Paso 2: Autenticarse con Azure

```sh
azd auth login
```

Esto abrirá tu navegador para la autenticación en Azure. Inicia sesión con tus credenciales de Azure.

**✓ Verificación de éxito**: Deberías ver:
```
Logged in to Azure.
```

### Paso 3: Inicializar el entorno

```sh
azd init
```

**Qué sucede**: AZD crea una configuración local para tu implementación.

**Indicaciones que verás**:
- **Nombre del entorno**: Ingresa un nombre corto (por ejemplo, `dev`, `miapp`)
- **Suscripción de Azure**: Selecciona tu suscripción de la lista
- **Ubicación de Azure**: Elige una región (por ejemplo, `eastus`, `westeurope`)

**✓ Verificación de éxito**: Deberías ver:
```
SUCCESS: New project initialized!
```

### Paso 4: Provisión de recursos de Azure

```sh
azd provision
```

**Qué sucede**: AZD implementa toda la infraestructura (toma de 5 a 8 minutos):
1. Crea el grupo de recursos
2. Crea el servidor SQL y la base de datos
3. Crea el plan de servicio de aplicaciones
4. Crea la aplicación web
5. Crea Application Insights
6. Configura redes y seguridad

**Se te pedirá**:
- **Nombre de usuario del administrador SQL**: Ingresa un nombre de usuario (por ejemplo, `sqladmin`)
- **Contraseña del administrador SQL**: Ingresa una contraseña segura (¡guárdala!)

**✓ Verificación de éxito**: Deberías ver:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tiempo**: 5-8 minutos

### Paso 5: Implementar la aplicación

```sh
azd deploy
```

**Qué sucede**: AZD construye e implementa tu aplicación Flask:
1. Empaqueta la aplicación Python
2. Construye el contenedor Docker
3. Lo sube a Azure Web App
4. Inicializa la base de datos con datos de ejemplo
5. Inicia la aplicación

**✓ Verificación de éxito**: Deberías ver:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tiempo**: 3-5 minutos

### Paso 6: Navegar por la aplicación

```sh
azd browse
```

Esto abrirá tu aplicación web implementada en el navegador en `https://app-<unique-id>.azurewebsites.net`

**✓ Verificación de éxito**: Deberías ver una salida JSON:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Paso 7: Probar los endpoints de la API

**Verificación de salud** (verifica la conexión a la base de datos):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Respuesta esperada**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Listar productos** (datos de ejemplo):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Respuesta esperada**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Obtener un producto específico**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Verificación de éxito**: Todos los endpoints devuelven datos JSON sin errores.

---

**🎉 ¡Felicidades!** Has implementado con éxito una aplicación web con una base de datos en Azure usando AZD.

## Análisis detallado de la configuración

### Variables de entorno

Los secretos se gestionan de forma segura a través de la configuración de Azure App Service—**nunca se codifican en el código fuente**.

**Configurado automáticamente por AZD**:
- `SQL_CONNECTION_STRING`: Conexión a la base de datos con credenciales encriptadas
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Endpoint de telemetría de monitoreo
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Habilita la instalación automática de dependencias

**Dónde se almacenan los secretos**:
1. Durante `azd provision`, proporcionas credenciales SQL mediante indicaciones seguras
2. AZD las almacena en tu archivo local `.azure/<env-name>/.env` (excluido de Git)
3. AZD las inyecta en la configuración de Azure App Service (encriptadas en reposo)
4. La aplicación las lee mediante `os.getenv()` en tiempo de ejecución

### Desarrollo local

Para pruebas locales, crea un archivo `.env` a partir del ejemplo:

```sh
cp .env.sample .env
# Edita .env con tu conexión de base de datos local
```

**Flujo de trabajo de desarrollo local**:
```sh
# Instalar dependencias
cd src/web
pip install -r requirements.txt

# Configurar variables de entorno
export SQL_CONNECTION_STRING="your-local-connection-string"

# Ejecutar la aplicación
python app.py
```

**Prueba localmente**:
```sh
curl http://localhost:8000/health
# Esperado: {"status": "saludable", "database": "conectado"}
```

### Infraestructura como código

Todos los recursos de Azure están definidos en **plantillas Bicep** (carpeta `infra/`):

- **Diseño modular**: Cada tipo de recurso tiene su propio archivo para reutilización
- **Parametrizado**: Personaliza SKUs, regiones, convenciones de nombres
- **Mejores prácticas**: Sigue estándares de nombres y configuraciones de seguridad de Azure
- **Control de versiones**: Los cambios en la infraestructura se rastrean en Git

**Ejemplo de personalización**:
Para cambiar el nivel de la base de datos, edita `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Mejores prácticas de seguridad

Este ejemplo sigue las mejores prácticas de seguridad de Azure:

### 1. **Sin secretos en el código fuente**
- ✅ Credenciales almacenadas en la configuración de Azure App Service (encriptadas)
- ✅ Archivos `.env` excluidos de Git mediante `.gitignore`
- ✅ Secretos pasados mediante parámetros seguros durante la provisión

### 2. **Conexiones encriptadas**
- ✅ TLS 1.2 mínimo para el servidor SQL
- ✅ Solo HTTPS habilitado para la aplicación web
- ✅ Conexiones a la base de datos usan canales encriptados

### 3. **Seguridad de red**
- ✅ Firewall del servidor SQL configurado para permitir solo servicios de Azure
- ✅ Acceso a la red pública restringido (puede bloquearse aún más con Endpoints Privados)
- ✅ FTPS deshabilitado en la aplicación web

### 4. **Autenticación y autorización**
- ⚠️ **Actual**: Autenticación SQL (usuario/contraseña)
- ✅ **Recomendación para producción**: Usar Identidad Administrada de Azure para autenticación sin contraseña

**Para actualizar a Identidad Administrada** (para producción):
1. Habilita identidad administrada en la aplicación web
2. Otorga permisos SQL a la identidad
3. Actualiza la cadena de conexión para usar identidad administrada
4. Elimina la autenticación basada en contraseña

### 5. **Auditoría y cumplimiento**
- ✅ Application Insights registra todas las solicitudes y errores
- ✅ Auditoría habilitada en la base de datos SQL (puede configurarse para cumplimiento)
- ✅ Todos los recursos etiquetados para gobernanza

**Lista de verificación de seguridad antes de producción**:
- [ ] Habilitar Azure Defender para SQL
- [ ] Configurar Endpoints Privados para la base de datos SQL
- [ ] Habilitar Firewall de Aplicaciones Web (WAF)
- [ ] Implementar Azure Key Vault para rotación de secretos
- [ ] Configurar autenticación de Azure AD
- [ ] Habilitar registros de diagnóstico para todos los recursos

## Optimización de costos

**Costos mensuales estimados** (a noviembre de 2025):

| Recurso | SKU/Nivel | Costo estimado |
|---------|-----------|----------------|
| Plan de servicio de aplicaciones | B1 (Básico) | ~$13/mes |
| Base de datos SQL | Básico (2GB) | ~$5/mes |
| Application Insights | Pago por uso | ~$2/mes (bajo tráfico) |
| **Total** | | **~$20/mes** |

**💡 Consejos para ahorrar costos**:

1. **Usa el nivel gratuito para aprendizaje**:
   - App Service: Nivel F1 (gratis, horas limitadas)
   - Base de datos SQL: Usa Azure SQL Database sin servidor
   - Application Insights: 5GB/mes de ingestión gratuita

2. **Detén recursos cuando no los uses**:
   ```sh
   # Detener la aplicación web (la base de datos sigue cobrando)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Reiniciar cuando sea necesario
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Elimina todo después de probar**:
   ```sh
   azd down
   ```
   Esto elimina TODOS los recursos y detiene los cargos.

4. **SKUs de desarrollo vs. producción**:
   - **Desarrollo**: Nivel básico (usado en este ejemplo)
   - **Producción**: Nivel estándar/premium con redundancia

**Monitoreo de costos**:
- Ve los costos en [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Configura alertas de costos para evitar sorpresas
- Etiqueta todos los recursos con `azd-env-name` para seguimiento

**Alternativa de nivel gratuito**:
Para fines de aprendizaje, puedes modificar `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Nota**: El nivel gratuito tiene limitaciones (60 min/día de CPU, no siempre activo).

## Monitoreo y observabilidad

### Integración con Application Insights

Este ejemplo incluye **Application Insights** para monitoreo integral:

**Qué se monitorea**:
- ✅ Solicitudes HTTP (latencia, códigos de estado, endpoints)
- ✅ Errores y excepciones de la aplicación
- ✅ Registro personalizado desde la aplicación Flask
- ✅ Salud de la conexión a la base de datos
- ✅ Métricas de rendimiento (CPU, memoria)

**Acceso a Application Insights**:
1. Abre [Azure Portal](https://portal.azure.com)
2. Navega a tu grupo de recursos (`rg-<env-name>`)
3. Haz clic en el recurso Application Insights (`appi-<unique-id>`)

**Consultas útiles** (Application Insights → Logs):

**Ver todas las solicitudes**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Encontrar errores**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Verificar endpoint de salud**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Auditoría de la base de datos SQL

**La auditoría de la base de datos SQL está habilitada** para rastrear:
- Patrones de acceso a la base de datos
- Intentos fallidos de inicio de sesión
- Cambios en el esquema
- Acceso a datos (para cumplimiento)

**Acceso a registros de auditoría**:
1. Azure Portal → Base de datos SQL → Auditoría
2. Ver registros en el espacio de trabajo de Log Analytics

### Monitoreo en tiempo real

**Ver métricas en vivo**:
1. Application Insights → Live Metrics
2. Ver solicitudes, fallos y rendimiento en tiempo real

**Configurar alertas**:
Crea alertas para eventos críticos:
- Errores HTTP 500 > 5 en 5 minutos
- Fallos en la conexión a la base de datos
- Tiempos de respuesta altos (>2 segundos)

**Ejemplo de creación de alerta**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Solución de problemas

### Problemas comunes y soluciones

#### 1. `azd provision` falla con "Ubicación no disponible"

**Síntoma**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Solución**:
Elige una región diferente de Azure o registra el proveedor de recursos:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Falla de conexión SQL durante la implementación

**Síntoma**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Solución**:
- Verifica que el firewall del servidor SQL permita servicios de Azure (configurado automáticamente)
- Asegúrate de que la contraseña de administrador de SQL se ingresó correctamente durante `azd provision`
- Confirma que el servidor SQL esté completamente aprovisionado (puede tardar 2-3 minutos)

**Verificar conexión**:
```sh
# Desde el Portal de Azure, ve a Base de datos SQL → Editor de consultas
# Intenta conectarte con tus credenciales
```

#### 3. La aplicación web muestra "Error de aplicación"

**Síntoma**:
El navegador muestra una página de error genérica.

**Solución**:
Revisa los registros de la aplicación:
```sh
# Ver registros recientes
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Causas comunes**:
- Variables de entorno faltantes (verifica App Service → Configuración)
- Fallo en la instalación de paquetes de Python (revisa los registros de implementación)
- Error de inicialización de la base de datos (verifica la conectividad SQL)

#### 4. `azd deploy` falla con "Error de compilación"

**Síntoma**:
```
Error: Failed to build project
```

**Solución**:
- Asegúrate de que `requirements.txt` no tenga errores de sintaxis
- Verifica que Python 3.11 esté especificado en `infra/resources/web-app.bicep`
- Confirma que el Dockerfile tenga la imagen base correcta

**Depurar localmente**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "No autorizado" al ejecutar comandos AZD

**Síntoma**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Solución**:
Reautentícate con Azure:
```sh
azd auth login
az login
```

Verifica que tengas los permisos correctos (rol de Colaborador) en la suscripción.

#### 6. Costos altos de base de datos

**Síntoma**:
Factura inesperada de Azure.

**Solución**:
- Verifica si olvidaste ejecutar `azd down` después de las pruebas
- Confirma que la base de datos SQL esté usando el nivel Básico (no Premium)
- Revisa los costos en Azure Cost Management
- Configura alertas de costos

### Obtener ayuda

**Ver todas las variables de entorno de AZD**:
```sh
azd env get-values
```

**Verificar estado de implementación**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Acceder a registros de la aplicación**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**¿Necesitas más ayuda?**
- [Guía de solución de problemas de AZD](../../docs/troubleshooting/common-issues.md)
- [Solución de problemas de Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Solución de problemas de Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Ejercicios prácticos

### Ejercicio 1: Verifica tu implementación (Principiante)

**Objetivo**: Confirmar que todos los recursos están implementados y la aplicación funciona.

**Pasos**:
1. Lista todos los recursos en tu grupo de recursos:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Esperado**: 6-7 recursos (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Prueba todos los puntos de acceso API:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Esperado**: Todos devuelven JSON válido sin errores

3. Revisa Application Insights:
   - Navega a Application Insights en el portal de Azure
   - Ve a "Live Metrics"
   - Actualiza tu navegador en la aplicación web
   **Esperado**: Ver solicitudes apareciendo en tiempo real

**Criterios de éxito**: Existen los 6-7 recursos, todos los puntos de acceso devuelven datos, Live Metrics muestra actividad.

---

### Ejercicio 2: Agregar un nuevo punto de acceso API (Intermedio)

**Objetivo**: Extender la aplicación Flask con un nuevo punto de acceso.

**Código inicial**: Puntos de acceso actuales en `src/web/app.py`

**Pasos**:
1. Edita `src/web/app.py` y agrega un nuevo punto de acceso después de la función `get_product()`:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
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
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Implementa la aplicación actualizada:
   ```sh
   azd deploy
   ```

3. Prueba el nuevo punto de acceso:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Esperado**: Devuelve productos que coinciden con "laptop"

**Criterios de éxito**: El nuevo punto de acceso funciona, devuelve resultados filtrados, aparece en los registros de Application Insights.

---

### Ejercicio 3: Agregar monitoreo y alertas (Avanzado)

**Objetivo**: Configurar monitoreo proactivo con alertas.

**Pasos**:
1. Crea una alerta para errores HTTP 500:
   ```sh
   # Obtener ID de recurso de Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Crear alerta
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Activa la alerta causando errores:
   ```sh
   # Solicitar un producto inexistente
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Verifica si la alerta se activó:
   - Portal de Azure → Alertas → Reglas de alerta
   - Revisa tu correo electrónico (si está configurado)

**Criterios de éxito**: La regla de alerta está creada, se activa con errores, se reciben notificaciones.

---

### Ejercicio 4: Cambios en el esquema de la base de datos (Avanzado)

**Objetivo**: Agregar una nueva tabla y modificar la aplicación para usarla.

**Pasos**:
1. Conéctate a la base de datos SQL a través del Editor de consultas del portal de Azure

2. Crea una nueva tabla `categories`:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. Actualiza `src/web/app.py` para incluir información de categorías en las respuestas

4. Implementa y prueba

**Criterios de éxito**: La nueva tabla existe, los productos muestran información de categorías, la aplicación sigue funcionando.

---

### Ejercicio 5: Implementar caché (Experto)

**Objetivo**: Agregar Azure Redis Cache para mejorar el rendimiento.

**Pasos**:
1. Agrega Redis Cache a `infra/main.bicep`
2. Actualiza `src/web/app.py` para almacenar en caché las consultas de productos
3. Mide la mejora de rendimiento con Application Insights
4. Compara tiempos de respuesta antes/después del caché

**Criterios de éxito**: Redis está implementado, el caché funciona, los tiempos de respuesta mejoran en >50%.

**Consejo**: Comienza con [documentación de Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Limpieza

Para evitar cargos continuos, elimina todos los recursos al terminar:

```sh
azd down
```

**Confirmación**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Escribe `y` para confirmar.

**✓ Verificación de éxito**: 
- Todos los recursos están eliminados del portal de Azure
- No hay cargos continuos
- La carpeta local `.azure/<env-name>` puede ser eliminada

**Alternativa** (mantener infraestructura, eliminar datos):
```sh
# Eliminar solo el grupo de recursos (mantener la configuración de AZD)
az group delete --name rg-<env-name> --yes
```
## Más información

### Documentación relacionada
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentación de Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Documentación de Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Documentación de Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Referencia del lenguaje Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Próximos pasos en este curso
- **[Ejemplo de aplicaciones en contenedor](../../../../examples/container-app)**: Implementa microservicios con Azure Container Apps
- **[Guía de integración de IA](../../../../docs/ai-foundry)**: Agrega capacidades de IA a tu aplicación
- **[Mejores prácticas de implementación](../../docs/deployment/deployment-guide.md)**: Patrones de implementación en producción

### Temas avanzados
- **Identidad administrada**: Elimina contraseñas y usa autenticación de Azure AD
- **Puntos de acceso privados**: Asegura conexiones de base de datos dentro de una red virtual
- **Integración CI/CD**: Automatiza implementaciones con GitHub Actions o Azure DevOps
- **Multi-entorno**: Configura entornos de desarrollo, pruebas y producción
- **Migraciones de base de datos**: Usa Alembic o Entity Framework para versionar esquemas

### Comparación con otros enfoques

**AZD vs. Plantillas ARM**:
- ✅ AZD: Abstracción de alto nivel, comandos más simples
- ⚠️ ARM: Más detallado, control granular

**AZD vs. Terraform**:
- ✅ AZD: Nativo de Azure, integrado con servicios de Azure
- ⚠️ Terraform: Soporte multi-nube, ecosistema más amplio

**AZD vs. Portal de Azure**:
- ✅ AZD: Repetible, controlado por versiones, automatizable
- ⚠️ Portal: Clics manuales, difícil de reproducir

**Piensa en AZD como**: Docker Compose para Azure—configuración simplificada para implementaciones complejas.

---

## Preguntas frecuentes

**P: ¿Puedo usar un lenguaje de programación diferente?**  
R: ¡Sí! Reemplaza `src/web/` con Node.js, C#, Go o cualquier lenguaje. Actualiza `azure.yaml` y Bicep según corresponda.

**P: ¿Cómo agrego más bases de datos?**  
R: Agrega otro módulo de base de datos SQL en `infra/main.bicep` o usa PostgreSQL/MySQL de los servicios de base de datos de Azure.

**P: ¿Puedo usar esto para producción?**  
R: Este es un punto de partida. Para producción, agrega: identidad administrada, puntos de acceso privados, redundancia, estrategia de respaldo, WAF y monitoreo mejorado.

**P: ¿Qué pasa si quiero usar contenedores en lugar de implementación de código?**  
R: Consulta el [Ejemplo de aplicaciones en contenedor](../../../../examples/container-app) que utiliza contenedores Docker en todo el proceso.

**P: ¿Cómo me conecto a la base de datos desde mi máquina local?**  
R: Agrega tu IP al firewall del servidor SQL:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**P: ¿Puedo usar una base de datos existente en lugar de crear una nueva?**  
R: Sí, modifica `infra/main.bicep` para referenciar un servidor SQL existente y actualiza los parámetros de la cadena de conexión.

---

> **Nota:** Este ejemplo demuestra mejores prácticas para implementar una aplicación web con una base de datos usando AZD. Incluye código funcional, documentación completa y ejercicios prácticos para reforzar el aprendizaje. Para implementaciones en producción, revisa los requisitos de seguridad, escalabilidad, cumplimiento y costos específicos de tu organización.

**📚 Navegación del curso:**
- ← Anterior: [Ejemplo de aplicaciones en contenedor](../../../../examples/container-app)
- → Siguiente: [Guía de integración de IA](../../../../docs/ai-foundry)
- 🏠 [Inicio del curso](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->