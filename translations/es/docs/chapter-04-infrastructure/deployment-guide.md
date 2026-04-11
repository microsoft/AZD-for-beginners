# Guía de Despliegue - Dominando los despliegues con AZD

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Actual**: Capítulo 4 - Infraestructura como Código y Despliegue
- **⬅️ Capítulo Anterior**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)
- **➡️ Siguiente**: [Aprovisionamiento de Recursos](provisioning.md)
- **🚀 Próximo Capítulo**: [Capítulo 5: Soluciones de IA Multi-Agente](../../examples/retail-scenario.md)

## Introducción

Esta guía integral cubre todo lo que necesitas saber sobre desplegar aplicaciones usando Azure Developer CLI, desde despliegues básicos con un solo comando hasta escenarios avanzados de producción con hooks personalizados, múltiples entornos e integración CI/CD. Domina el ciclo de vida completo del despliegue con ejemplos prácticos y buenas prácticas.

## Objetivos de Aprendizaje

Al completar esta guía, tú:
- Dominarás todos los comandos y flujos de trabajo de despliegue de Azure Developer CLI
- Entenderás el ciclo de vida completo del despliegue, desde el aprovisionamiento hasta el monitoreo
- Implementarás hooks de despliegue personalizados para automatización previa y posterior al despliegue
- Configurarás múltiples entornos con parámetros específicos por entorno
- Configurarás estrategias avanzadas de despliegue, incluyendo blue-green y canary
- Integrarás los despliegues de azd con pipelines CI/CD y flujos de trabajo DevOps

## Resultados del Aprendizaje

Al finalizar, serás capaz de:
- Ejecutar y solucionar problemas de todos los flujos de despliegue de azd de forma independiente
- Diseñar e implementar automatización de despliegue personalizada usando hooks
- Configurar despliegues listos para producción con seguridad y monitoreo adecuados
- Gestionar escenarios complejos de despliegue multi-entorno
- Optimizar el rendimiento de despliegue e implementar estrategias de rollback
- Integrar los despliegues de azd en prácticas DevOps empresariales

## Resumen del Despliegue

Azure Developer CLI proporciona varios comandos de despliegue:
- `azd up` - Flujo completo (aprovisionamiento + despliegue)
- `azd provision` - Crear/actualizar únicamente recursos de Azure
- `azd deploy` - Desplegar únicamente el código de la aplicación
- `azd package` - Compilar y empaquetar aplicaciones

## Flujos básicos de despliegue

### Despliegue completo (azd up)
El flujo más común para proyectos nuevos:
```bash
# Desplegar todo desde cero
azd up

# Desplegar con un entorno específico
azd up --environment production

# Desplegar con parámetros personalizados
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Despliegue solo de infraestructura
Cuando solo necesitas actualizar los recursos de Azure:
```bash
# Provisionar/actualizar la infraestructura
azd provision

# Provisionar con simulación (dry-run) para previsualizar los cambios
azd provision --preview

# Provisionar servicios específicos
azd provision --service database
```

### Despliegue solo de código
Para actualizaciones rápidas de la aplicación:
```bash
# Desplegar todos los servicios
azd deploy

# Salida esperada:
# Desplegando servicios (azd deploy)
# - web: Desplegando... Hecho
# - api: Desplegando... Hecho
# ÉXITO: Su despliegue se completó en 2 minutos y 15 segundos

# Desplegar un servicio específico
azd deploy --service web
azd deploy --service api

# Desplegar con argumentos de compilación personalizados
azd deploy --service api --build-arg NODE_ENV=production

# Verificar despliegue
azd show --output json | jq '.services'
```

### ✅ Verificación del despliegue

Después de cualquier despliegue, verifica el éxito:

```bash
# Comprobar que todos los servicios estén en ejecución
azd show

# Probar los endpoints de estado
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitorear en busca de errores (se abre en el navegador de forma predeterminada)
azd monitor --logs
```

**Criterios de éxito:**
- ✅ Todos los servicios muestran el estado "Running"
- ✅ Los endpoints de salud devuelven HTTP 200
- ✅ No hay registros de errores en los últimos 5 minutos
- ✅ La aplicación responde a las solicitudes de prueba

## 🏗️ Entendiendo el proceso de despliegue

### Fase 1: Hooks previos al aprovisionamiento
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

### Fase 2: Aprovisionamiento de infraestructura
- Lee plantillas de infraestructura (Bicep/Terraform)
- Crea o actualiza recursos de Azure
- Configura redes y seguridad
- Configura supervisión y registro

### Fase 3: Hooks posteriores al aprovisionamiento
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

### Fase 4: Empaquetado de la aplicación
- Compila el código de la aplicación
- Crea artefactos de despliegue
- Empaqueta para la plataforma objetivo (contenedores, archivos ZIP, etc.)

### Fase 5: Hooks previos al despliegue
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

### Fase 6: Despliegue de la aplicación
- Despliega las aplicaciones empaquetadas en los servicios de Azure
- Actualiza las configuraciones
- Inicia/reinicia servicios

### Fase 7: Hooks posteriores al despliegue
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

## 🎛️ Configuración de despliegue

### Configuraciones de despliegue específicas por servicio
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

### Configuraciones específicas por entorno
```bash
# Entorno de desarrollo
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Entorno de preproducción
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

## 🔧 Escenarios avanzados de despliegue

### Aplicaciones multi-servicio
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

### Despliegues blue-green
```bash
# Crear entorno azul
azd env new production-blue
azd up --environment production-blue

# Probar entorno azul
./scripts/test-environment.sh production-blue

# Redirigir el tráfico al entorno azul (actualización manual de DNS/balanceador de carga)
./scripts/switch-traffic.sh production-blue

# Limpiar el entorno verde
azd env select production-green
azd down --force
```

### Despliegues canary
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

### Despliegues por etapas
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

## 🐳 Despliegues de contenedores

### Despliegue de Container Apps
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

### Optimización de Dockerfile multi-etapa
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

## ⚡ Optimización del rendimiento

### Despliegues específicos por servicio
```bash
# Desplegar un servicio específico para iteraciones más rápidas
azd deploy --service web
azd deploy --service api

# Desplegar todos los servicios
azd deploy
```

### Caché de compilación
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Despliegues de código eficientes
```bash
# Use azd deploy (no azd up) para cambios solo de código
# Esto omite el aprovisionamiento de infraestructura y es mucho más rápido
azd deploy

# Despliegue el servicio específico para iteraciones más rápidas
azd deploy --service api
```

## 🔍 Monitorización del despliegue

### Monitorización del despliegue en tiempo real
```bash
# Monitorear la aplicación en tiempo real
azd monitor --live

# Ver los registros de la aplicación
azd monitor --logs

# Comprobar el estado del despliegue
azd show
```

### Comprobaciones de salud
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

### Validación posterior al despliegue
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Comprobar la salud de la aplicación
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

## 🔐 Consideraciones de seguridad

### Gestión de secretos
```bash
# Almacenar secretos de forma segura
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Hacer referencia a los secretos en azure.yaml
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

### Seguridad de red
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Gestión de identidad y acceso
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

## 🚨 Estrategias de reversión

### Reversión rápida
```bash
# AZD no tiene reversión incorporada. Enfoques recomendados:

# Opción 1: Volver a desplegar desde Git (recomendado)
git revert HEAD  # Revertir el commit problemático
git push
azd deploy

# Opción 2: Volver a desplegar un commit específico
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Reversión de infraestructura
```bash
# Previsualizar los cambios en la infraestructura antes de aplicarlos
azd provision --preview

# Para revertir la infraestructura, utilice el control de versiones:
git revert HEAD  # Revertir cambios en la infraestructura
azd provision    # Aplicar el estado anterior de la infraestructura
```

### Reversión de migración de base de datos
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Métricas de despliegue

### Seguimiento del rendimiento de despliegue
```bash
# Ver el estado actual del despliegue
azd show

# Supervisar la aplicación con Application Insights
azd monitor --overview

# Ver métricas en tiempo real
azd monitor --live
```

### Recolección de métricas personalizadas
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

## 🎯 Mejores prácticas

### 1. Consistencia entre entornos
```bash
# Usar nombres coherentes
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Mantener la paridad entre entornos
./scripts/sync-environments.sh
```

### 2. Validación de la infraestructura
```bash
# Previsualizar los cambios de infraestructura antes del despliegue
azd provision --preview

# Usar linting para ARM/Bicep
az bicep lint --file infra/main.bicep

# Validar la sintaxis de Bicep
az bicep build --file infra/main.bicep
```

### 3. Integración de pruebas
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

### 4. Documentación y registro
```bash
# Documentar los procedimientos de despliegue
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Próximos pasos

- [Aprovisionamiento de Recursos](provisioning.md) - Análisis detallado de la gestión de infraestructura
- [Planificación previa al despliegue](../chapter-06-pre-deployment/capacity-planning.md) - Planifica tu estrategia de despliegue
- [Problemas comunes](../chapter-07-troubleshooting/common-issues.md) - Resolver problemas de despliegue
- [Mejores prácticas](../chapter-07-troubleshooting/debugging.md) - Estrategias de despliegue listas para producción

## 🎯 Ejercicios prácticos de despliegue

### Ejercicio 1: Flujo de despliegue incremental (20 minutos)
**Objetivo**: Dominar la diferencia entre despliegues completos e incrementales

```bash
# Despliegue inicial
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registrar la hora del despliegue inicial
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

**Criterios de éxito:**
- [ ] El despliegue completo tarda 5-15 minutos
- [ ] El despliegue solo de código tarda 2-5 minutos
- [ ] Los cambios de código se reflejan en la aplicación desplegada
- [ ] La infraestructura no cambia después de `azd deploy`

**Resultado de aprendizaje**: `azd deploy` es 50-70% más rápido que `azd up` para cambios de código

### Ejercicio 2: Hooks de despliegue personalizados (30 minutos)
**Objetivo**: Implementar automatización previa y posterior al despliegue

```bash
# Crear un script de validación previo al despliegue
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Comprobar si las pruebas pasan
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Comprobar si hay cambios sin confirmar
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

# Probar el despliegue con hooks
azd deploy
```

**Criterios de éxito:**
- [ ] El script previo al despliegue se ejecuta antes del despliegue
- [ ] El despliegue se aborta si las pruebas fallan
- [ ] La prueba de humo posterior al despliegue valida la salud
- [ ] Los hooks se ejecutan en el orden correcto

### Ejercicio 3: Estrategia de despliegue multi-entorno (45 minutos)
**Objetivo**: Implementar un flujo de despliegue por etapas (dev → staging → production)

```bash
# Crear script de despliegue
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Paso 1: Desplegar en dev
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

# Ejecutar despliegue por etapas
./deploy-staged.sh
```

**Criterios de éxito:**
- [ ] El entorno dev se despliega correctamente
- [ ] El entorno staging se despliega correctamente
- [ ] Se requiere aprobación manual para producción
- [ ] Todos los entornos tienen comprobaciones de salud funcionando
- [ ] Se puede revertir si es necesario

### Ejercicio 4: Estrategia de reversión (25 minutos)
**Objetivo**: Implementar y probar la reversión de despliegue usando Git

```bash
# Desplegar v1
azd env set APP_VERSION "1.0.0"
azd up

# Guardar el hash del commit de v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Desplegar v2 con cambio incompatible
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Detectar fallo y revertir
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Revertir usando git
    git revert HEAD --no-edit
    
    # Revertir el entorno
    azd env set APP_VERSION "1.0.0"
    
    # Volver a desplegar v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Criterios de éxito:**
- [ ] Puede detectar fallos en el despliegue
- [ ] El script de reversión se ejecuta automáticamente
- [ ] La aplicación vuelve a un estado funcional
- [ ] Las comprobaciones de salud pasan después de la reversión

## 📊 Seguimiento de métricas de despliegue

### Rastrea el rendimiento de tu despliegue

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Registrar en un archivo
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Úsalo
./track-deployment.sh
```

**Analiza tus métricas:**
```bash
# Ver historial de despliegues
cat deployment-metrics.csv

# Calcular tiempo promedio de despliegue
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Recursos adicionales

- [Referencia de despliegue de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Despliegue en Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Despliegue en Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Despliegue en Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navegación**
- **Lección anterior**: [Tu primer proyecto](../chapter-01-foundation/first-project.md)
- **Siguiente lección**: [Aprovisionamiento de Recursos](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por traductores humanos. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->