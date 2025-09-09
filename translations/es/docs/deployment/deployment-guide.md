<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-09T16:59:52+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "es"
}
-->
# Guía de Despliegue - Dominando los Despliegues con AZD

## Introducción

Esta guía completa cubre todo lo que necesitas saber sobre el despliegue de aplicaciones utilizando Azure Developer CLI, desde despliegues básicos con un solo comando hasta escenarios avanzados de producción con hooks personalizados, múltiples entornos e integración con CI/CD. Domina el ciclo de vida completo del despliegue con ejemplos prácticos y mejores prácticas.

## Objetivos de Aprendizaje

Al completar esta guía, podrás:
- Dominar todos los comandos y flujos de trabajo de despliegue de Azure Developer CLI
- Comprender el ciclo de vida completo del despliegue, desde la provisión hasta el monitoreo
- Implementar hooks personalizados para automatización antes y después del despliegue
- Configurar múltiples entornos con parámetros específicos para cada entorno
- Establecer estrategias avanzadas de despliegue, incluyendo despliegues blue-green y canary
- Integrar los despliegues de azd con pipelines de CI/CD y flujos de trabajo de DevOps

## Resultados de Aprendizaje

Al finalizar, serás capaz de:
- Ejecutar y solucionar problemas de todos los flujos de trabajo de despliegue de azd de manera independiente
- Diseñar e implementar automatización personalizada de despliegue utilizando hooks
- Configurar despliegues listos para producción con seguridad y monitoreo adecuados
- Gestionar escenarios complejos de despliegue en múltiples entornos
- Optimizar el rendimiento del despliegue e implementar estrategias de reversión
- Integrar los despliegues de azd en prácticas empresariales de DevOps

## Resumen del Despliegue

Azure Developer CLI proporciona varios comandos de despliegue:
- `azd up` - Flujo completo (provisión + despliegue)
- `azd provision` - Crear/actualizar solo recursos de Azure
- `azd deploy` - Desplegar solo el código de la aplicación
- `azd package` - Construir y empaquetar aplicaciones

## Flujos de Trabajo Básicos de Despliegue

### Despliegue Completo (azd up)
El flujo de trabajo más común para nuevos proyectos:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Despliegue Solo de Infraestructura
Cuando solo necesitas actualizar los recursos de Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Despliegue Solo de Código
Para actualizaciones rápidas de la aplicación:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Comprendiendo el Proceso de Despliegue

### Fase 1: Hooks Pre-Provisión
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

### Fase 2: Provisión de Infraestructura
- Lee las plantillas de infraestructura (Bicep/Terraform)
- Crea o actualiza recursos de Azure
- Configura redes y seguridad
- Establece monitoreo y registro

### Fase 3: Hooks Post-Provisión
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

### Fase 4: Empaquetado de Aplicaciones
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

### Fase 6: Despliegue de Aplicaciones
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

## 🎛️ Configuración de Despliegue

### Configuraciones Específicas de Servicio
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

### Configuraciones Específicas de Entorno
```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
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
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
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

## 🐳 Despliegues en Contenedores

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
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
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
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Monitoreo de Despliegue

### Monitoreo en Tiempo Real
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
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

# Check application health
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
# Store secrets securely
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Reference secrets in azure.yaml
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

### Seguridad de Red
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
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Reversión de Infraestructura
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Reversión de Migración de Base de Datos
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Métricas de Despliegue

### Seguimiento del Rendimiento del Despliegue
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### Recopilación de Métricas Personalizadas
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validación de Infraestructura
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Próximos Pasos

- [Provisión de Recursos](provisioning.md) - Análisis detallado de la gestión de infraestructura
- [Planificación Pre-Despliegue](../pre-deployment/capacity-planning.md) - Planifica tu estrategia de despliegue
- [Problemas Comunes](../troubleshooting/common-issues.md) - Soluciona problemas de despliegue
- [Mejores Prácticas](../troubleshooting/debugging.md) - Estrategias de despliegue listas para producción

## Recursos Adicionales

- [Referencia de Despliegue de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Despliegue de Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Despliegue de Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Despliegue de Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navegación**
- **Lección Anterior**: [Tu Primer Proyecto](../getting-started/first-project.md)
- **Próxima Lección**: [Provisión de Recursos](provisioning.md)

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.