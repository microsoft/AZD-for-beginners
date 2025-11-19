<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-19T20:26:55+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "es"
}
-->
# Guía de Despliegue - Dominando los Despliegues con AZD

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 4 - Infraestructura como Código y Despliegue
- **⬅️ Capítulo Anterior**: [Capítulo 3: Configuración](../getting-started/configuration.md)
- **➡️ Siguiente**: [Aprovisionamiento de Recursos](provisioning.md)
- **🚀 Próximo Capítulo**: [Capítulo 5: Soluciones de IA Multi-Agente](../../examples/retail-scenario.md)

## Introducción

Esta guía completa cubre todo lo que necesitas saber sobre cómo desplegar aplicaciones utilizando Azure Developer CLI, desde despliegues básicos con un solo comando hasta escenarios avanzados de producción con hooks personalizados, múltiples entornos e integración con CI/CD. Domina el ciclo de vida completo del despliegue con ejemplos prácticos y mejores prácticas.

## Objetivos de Aprendizaje

Al completar esta guía, podrás:
- Dominar todos los comandos y flujos de trabajo de despliegue de Azure Developer CLI
- Comprender el ciclo de vida completo del despliegue, desde el aprovisionamiento hasta el monitoreo
- Implementar hooks personalizados para automatización antes y después del despliegue
- Configurar múltiples entornos con parámetros específicos para cada uno
- Configurar estrategias avanzadas de despliegue, incluyendo blue-green y canary deployments
- Integrar los despliegues de azd con pipelines de CI/CD y flujos de trabajo DevOps

## Resultados de Aprendizaje

Al finalizar, serás capaz de:
- Ejecutar y solucionar problemas de todos los flujos de trabajo de despliegue de azd de forma independiente
- Diseñar e implementar automatización personalizada para despliegues utilizando hooks
- Configurar despliegues listos para producción con seguridad y monitoreo adecuados
- Gestionar escenarios complejos de despliegue en múltiples entornos
- Optimizar el rendimiento de los despliegues e implementar estrategias de reversión
- Integrar los despliegues de azd en prácticas empresariales de DevOps

## Resumen del Despliegue

Azure Developer CLI proporciona varios comandos de despliegue:
- `azd up` - Flujo de trabajo completo (aprovisionar + desplegar)
- `azd provision` - Crear/actualizar solo recursos de Azure
- `azd deploy` - Desplegar solo el código de la aplicación
- `azd package` - Construir y empaquetar aplicaciones

## Flujos de Trabajo Básicos de Despliegue

### Despliegue Completo (azd up)
El flujo de trabajo más común para nuevos proyectos:
```bash
# Implementar todo desde cero
azd up

# Implementar con un entorno específico
azd up --environment production

# Implementar con parámetros personalizados
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Despliegue Solo de Infraestructura
Cuando solo necesitas actualizar los recursos de Azure:
```bash
# Provisión/actualización de infraestructura
azd provision

# Provisión con simulación para previsualizar cambios
azd provision --preview

# Provisión de servicios específicos
azd provision --service database
```

### Despliegue Solo de Código
Para actualizaciones rápidas de la aplicación:
```bash
# Desplegar todos los servicios
azd deploy

# Salida esperada:
# Desplegando servicios (azd deploy)
# - web: Desplegando... Hecho
# - api: Desplegando... Hecho
# ÉXITO: Su despliegue se completó en 2 minutos 15 segundos

# Desplegar servicio específico
azd deploy --service web
azd deploy --service api

# Desplegar con argumentos de compilación personalizados
azd deploy --service api --build-arg NODE_ENV=production

# Verificar despliegue
azd show --output json | jq '.services'
```

### ✅ Verificación del Despliegue

Después de cualquier despliegue, verifica el éxito:

```bash
# Verificar que todos los servicios estén en funcionamiento
azd show

# Probar los puntos finales de salud
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Verificar los registros en busca de errores
azd logs --service api --since 5m | grep -i error
```

**Criterios de Éxito:**
- ✅ Todos los servicios muestran el estado "Running"
- ✅ Los endpoints de salud devuelven HTTP 200
- ✅ No hay registros de errores en los últimos 5 minutos
- ✅ La aplicación responde a solicitudes de prueba

## 🏗️ Comprendiendo el Proceso de Despliegue

### Fase 1: Hooks Pre-Aprovisionamiento
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### Fase 2: Aprovisionamiento de Infraestructura
- Lee las plantillas de infraestructura (Bicep/Terraform)
- Crea o actualiza recursos de Azure
- Configura redes y seguridad
- Configura monitoreo y registro

### Fase 3: Hooks Post-Aprovisionamiento
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### Fase 4: Empaquetado de la Aplicación
- Construye el código de la aplicación
- Crea artefactos de despliegue
- Empaqueta para la plataforma objetivo (contenedores, archivos ZIP, etc.)

### Fase 5: Hooks Pre-Despliegue
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### Fase 6: Despliegue de la Aplicación
- Despliega aplicaciones empaquetadas en servicios de Azure
- Actualiza configuraciones
- Inicia/reinicia servicios

### Fase 7: Hooks Post-Despliegue
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

## 🎛️ Configuración del Despliegue

### Configuraciones Específicas por Servicio
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### Configuraciones Específicas por Entorno
```bash
# Entorno de desarrollo
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Entorno de pruebas
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Entorno de producción
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Escenarios Avanzados de Despliegue

### Aplicaciones Multi-Servicio
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### Despliegues Blue-Green
```bash
# Crear entorno azul
azd env new production-blue
azd up --environment production-blue

# Probar entorno azul
./scripts/test-environment.sh production-blue

# Cambiar el tráfico a azul (actualización manual de DNS/balanceador de carga)
./scripts/switch-traffic.sh production-blue

# Limpiar entorno verde
azd env select production-green
azd down --force
```

### Despliegues Canary
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### Despliegues Escalonados
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Despliegues de Contenedores

### Despliegues de Aplicaciones en Contenedores
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### Optimización de Dockerfile Multi-Etapa
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Optimización del Rendimiento

### Despliegues Paralelos
```bash
# Configurar despliegue paralelo
azd config set deploy.parallelism 5

# Desplegar servicios en paralelo
azd deploy --parallel
```

### Caché de Construcción
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### Despliegues Incrementales
```bash
# Implementar solo servicios cambiados
azd deploy --incremental

# Implementar con detección de cambios
azd deploy --detect-changes
```

## 🔍 Monitoreo del Despliegue

### Monitoreo en Tiempo Real
```bash
# Monitorear el progreso del despliegue
azd deploy --follow

# Ver los registros del despliegue
azd logs --follow --service api

# Verificar el estado del despliegue
azd show --service api
```

### Verificaciones de Salud
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### Validación Post-Despliegue
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Verificar la salud de la aplicación
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 Consideraciones de Seguridad

### Gestión de Secretos
```bash
# Almacenar secretos de forma segura
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Referenciar secretos en azure.yaml
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### Seguridad de la Red
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Gestión de Identidad y Acceso
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 Estrategias de Reversión

### Reversión Rápida
```bash
# Revertir a la implementación anterior
azd deploy --rollback

# Revertir un servicio específico
azd deploy --service api --rollback

# Revertir a una versión específica
azd deploy --service api --version v1.2.3
```

### Reversión de Infraestructura
```bash
# Revertir cambios en la infraestructura
azd provision --rollback

# Previsualizar cambios de reversión
azd provision --rollback --preview
```

### Reversión de Migración de Base de Datos
```bash
#!/bin/bash
# scripts/restaurar-base-de-datos.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Métricas de Despliegue

### Seguimiento del Rendimiento del Despliegue
```bash
# Habilitar métricas de implementación
azd config set telemetry.deployment.enabled true

# Ver historial de implementación
azd history

# Obtener estadísticas de implementación
azd metrics --type deployment
```

### Recolección de Métricas Personalizadas
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 Mejores Prácticas

### 1. Consistencia de Entornos
```bash
# Usar nombres consistentes
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Mantener la paridad del entorno
./scripts/sync-environments.sh
```

### 2. Validación de Infraestructura
```bash
# Validar antes del despliegue
azd provision --preview
azd provision --what-if

# Usar linting de ARM/Bicep
az bicep lint --file infra/main.bicep
```

### 3. Integración de Pruebas
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. Documentación y Registro
```bash
# Documentar los procedimientos de implementación
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Próximos Pasos

- [Aprovisionamiento de Recursos](provisioning.md) - Profundiza en la gestión de infraestructura
- [Planificación Pre-Despliegue](../pre-deployment/capacity-planning.md) - Planifica tu estrategia de despliegue
- [Problemas Comunes](../troubleshooting/common-issues.md) - Resuelve problemas de despliegue
- [Mejores Prácticas](../troubleshooting/debugging.md) - Estrategias de despliegue listas para producción

## 🎯 Ejercicios Prácticos de Despliegue

### Ejercicio 1: Flujo de Trabajo de Despliegue Incremental (20 minutos)
**Objetivo**: Dominar la diferencia entre despliegues completos e incrementales

```bash
# Despliegue inicial
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registrar el tiempo de despliegue inicial
echo "Full deployment: $(date)" > deployment-log.txt

# Hacer un cambio en el código
echo "// Updated $(date)" >> src/api/src/server.js

# Desplegar solo el código (rápido)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Comparar tiempos
cat deployment-log.txt

# Limpiar
azd down --force --purge
```

**Criterios de Éxito:**
- [ ] El despliegue completo toma de 5 a 15 minutos
- [ ] El despliegue solo de código toma de 2 a 5 minutos
- [ ] Los cambios en el código se reflejan en la aplicación desplegada
- [ ] La infraestructura no cambia después de `azd deploy`

**Resultado de Aprendizaje**: `azd deploy` es un 50-70% más rápido que `azd up` para cambios en el código

### Ejercicio 2: Hooks Personalizados de Despliegue (30 minutos)
**Objetivo**: Implementar automatización antes y después del despliegue

```bash
# Crear script de validación previa al despliegue
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Verificar si las pruebas pasan
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Verificar cambios no confirmados
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Crear prueba de humo posterior al despliegue
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Agregar hooks a azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Probar despliegue con hooks
azd deploy
```

**Criterios de Éxito:**
- [ ] El script pre-despliegue se ejecuta antes del despliegue
- [ ] El despliegue se aborta si las pruebas fallan
- [ ] La prueba de humo post-despliegue valida la salud
- [ ] Los hooks se ejecutan en el orden correcto

### Ejercicio 3: Estrategia de Despliegue Multi-Entorno (45 minutos)
**Objetivo**: Implementar un flujo de trabajo de despliegue escalonado (dev → staging → producción)

```bash
# Crear script de despliegue
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Paso 1: Desplegar en desarrollo
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Paso 2: Desplegar en staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Paso 3: Aprobación manual para producción
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Crear entornos
azd env new dev
azd env new staging
azd env new production

# Ejecutar despliegue escalonado
./deploy-staged.sh
```

**Criterios de Éxito:**
- [ ] El entorno de desarrollo se despliega con éxito
- [ ] El entorno de staging se despliega con éxito
- [ ] Se requiere aprobación manual para producción
- [ ] Todos los entornos tienen verificaciones de salud funcionales
- [ ] Se puede revertir si es necesario

### Ejercicio 4: Estrategia de Reversión (25 minutos)
**Objetivo**: Implementar y probar la reversión de despliegue

```bash
# Desplegar v1
azd env set APP_VERSION "1.0.0"
azd up

# Guardar configuración de v1
cp -r .azure/production .azure/production-v1-backup

# Desplegar v2 con cambio disruptivo
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Detectar fallo
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Revertir código
    git checkout src/api/src/server.js
    
    # Revertir entorno
    azd env set APP_VERSION "1.0.0"
    
    # Volver a desplegar v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Criterios de Éxito:**
- [ ] Se pueden detectar fallos en el despliegue
- [ ] El script de reversión se ejecuta automáticamente
- [ ] La aplicación vuelve a un estado funcional
- [ ] Las verificaciones de salud pasan después de la reversión

## 📊 Seguimiento de Métricas de Despliegue

### Rastrea el Rendimiento de tu Despliegue

```bash
# Crear script de métricas de despliegue
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Registrar en archivo
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Usarlo
./track-deployment.sh
```

**Analiza tus métricas:**
```bash
# Ver historial de despliegue
cat deployment-metrics.csv

# Calcular el tiempo promedio de despliegue
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Recursos Adicionales

- [Referencia de Despliegue de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Despliegue en Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Despliegue en Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Despliegue en Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navegación**
- **Lección Anterior**: [Tu Primer Proyecto](../getting-started/first-project.md)
- **Próxima Lección**: [Aprovisionamiento de Recursos](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->