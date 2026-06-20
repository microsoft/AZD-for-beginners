# Guía de Despliegue - Dominando los Despliegues con AZD

**Navegación del Capítulo:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🧩 Also in this chapter**: [Authoring Your Own Template](custom-templates.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Introducción

Esta guía completa cubre todo lo que necesitas saber sobre el despliegue de aplicaciones usando Azure Developer CLI, desde despliegues básicos con un solo comando hasta escenarios avanzados de producción con hooks personalizados, múltiples entornos e integración CI/CD. Domina el ciclo de vida completo del despliegue con ejemplos prácticos y mejores prácticas.

## Objetivos de Aprendizaje

Al completar esta guía, podrás:
- Dominar todos los comandos y flujos de trabajo de despliegue de Azure Developer CLI
- Entender el ciclo de vida completo del despliegue desde el aprovisionamiento hasta el monitoreo
- Implementar hooks de despliegue personalizados para automatización previa y posterior
- Configurar múltiples entornos con parámetros específicos por entorno
- Configurar estrategias avanzadas de despliegue incluyendo blue-green y canary
- Integrar despliegues de azd con pipelines CI/CD y flujos de trabajo DevOps

## Resultados de Aprendizaje

Al finalizar, serás capaz de:
- Ejecutar y solucionar problemas de todos los flujos de despliegue de azd de manera independiente
- Diseñar e implementar automatización de despliegue personalizada usando hooks
- Configurar despliegues listos para producción con seguridad y monitoreo adecuados
- Gestionar escenarios complejos de despliegue multi-entorno
- Optimizar el rendimiento de despliegue e implementar estrategias de rollback
- Integrar los despliegues de azd en prácticas DevOps empresariales

## Resumen de Despliegue

Azure Developer CLI proporciona varios comandos de despliegue:
- `azd up` - Flujo completo (provisionar + desplegar)
- `azd provision` - Crear/actualizar solo recursos de Azure
- `azd deploy` - Desplegar solo el código de la aplicación
- `azd package` - Construir y empaquetar aplicaciones

## Flujos de Despliegue Básicos

### Despliegue Completo (azd up)
El flujo más común para proyectos nuevos:
```bash
# Desplegar todo desde cero
azd up

# Desplegar con entorno específico
azd up --environment production

# Desplegar con parámetros personalizados
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Despliegue Solo de Infraestructura
Cuando solo necesitas actualizar recursos de Azure:
```bash
# Aprovisionar/actualizar la infraestructura
azd provision

# Aprovisionar con ejecución de prueba para previsualizar los cambios
azd provision --preview

# Aprovisionar servicios específicos
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
# ÉXITO: Su despliegue se completó en 2 minutos y 15 segundos

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
# Comprobar que todos los servicios estén en funcionamiento
azd show

# Probar los endpoints de salud
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Supervisar errores (se abre en el navegador por defecto)
azd monitor --logs
```

**Criterios de éxito:**
- ✅ Todos los servicios muestran estado "Running"
- ✅ Los endpoints de salud devuelven HTTP 200
- ✅ No hay logs de error en los últimos 5 minutos
- ✅ La aplicación responde a las solicitudes de prueba

## 🏗️ Entendiendo el Proceso de Despliegue

### ¿Nuevo en hooks? Empieza aquí

Un **hook** es un comando que azd ejecuta automáticamente en un momento específico del proceso de despliegue—antes o después del aprovisionamiento, y antes o después de desplegar tu código. Permiten automatizar las tareas pequeñas que siempre rodean un despliegue: poblar una base de datos, ejecutar migraciones, construir assets o realizar pruebas de humo en la aplicación en vivo.

| Hook | Se ejecuta… | Uso común |
|------|-------------|-----------|
| `preprovision` | Antes de crear los recursos | Validar prerrequisitos, iniciar sesión en un registro |
| `postprovision` | Después de que los recursos existen | Configurar recursos, preparar la base de datos |
| `predeploy` | Antes de desplegar el código | Construir assets front-end, ejecutar pruebas unitarias |
| `postdeploy` | Después de que el código está en vivo | Ejecutar migraciones de BD, prueba de humo del endpoint |

Los hooks viven en tu `azure.yaml`. Aquí está el ejemplo más pequeño posible—solo imprime un mensaje después del despliegue:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Eso es todo—la próxima vez que ejecutes `azd up`, el mensaje se imprime automáticamente. También puedes ejecutar un hook por sí solo, sin un despliegue completo, lo cual es ideal para pruebas:

```bash
azd hooks run postdeploy
```

Las fases a continuación muestran hooks del mundo real (migraciones, pruebas, validación) para cada etapa.

### Fase 1: Hooks Pre-Provision
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
- Lee plantillas de infraestructura (Bicep/Terraform)
- Crea o actualiza recursos de Azure
- Configura redes y seguridad
- Configura monitoreo y logging

### Fase 3: Hooks Post-Provision
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

### Fase 5: Hooks Pre-Deploy
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
- Despliega las aplicaciones empaquetadas a servicios de Azure
- Actualiza la configuración
- Inicia/reinicia servicios

### Fase 7: Hooks Post-Deploy
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

### Manejo de Errores en Hooks

Por defecto, **si un comando de hook sale con un código distinto de cero, azd detiene toda la operación.** Esto suele ser lo que deseas—una migración fallida debe detener el despliegue, no enviar una aplicación rota. Pero esto significa que los hooks deben escribirse con cuidado.

**1. Haz que los fallos sean ruidosos e intencionales.** Un hook falla cuando su último comando devuelve un código de salida distinto de cero. En scripts de shell, añade `set -e` para que el hook se detenga en el primer comando que falle en lugar de continuar silenciosamente:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Permite que un hook falle sin detener azd.** Para pasos no críticos (una precarga de caché opcional, una notificación de buen esfuerzo), establece `continueOnError: true`. azd registra la falla pero continúa:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Prueba los hooks de forma aislada antes de una ejecución completa.** No tienes que ejecutar `azd up` para depurar un hook—ejecútalo por sí solo e itera rápidamente:

```bash
azd hooks run predeploy          # ejecuta solo el hook predeploy
azd hooks run postdeploy --service api
```

**4. Ten en cuenta shells específicos del SO.** Un hook que usa `shell: pwsh` necesita PowerShell instalado en la máquina que lo ejecute (incluyendo agentes CI). Usa `shell: sh` para la mayor portabilidad, o proporciona variantes `windows` y `posix`:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **Consejo de depuración:** ejecuta cualquier comando de azd con `--debug` para ver la línea de comando exacta del hook y su salida completa—invaluable cuando un hook funciona localmente pero falla en CI.

## 🎛️ Configuración de Despliegue

### Configuración de Despliegue por Servicio
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

## 🔧 Escenarios de Despliegue Avanzados

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
# Crear el entorno azul
azd env new production-blue
azd up --environment production-blue

# Probar el entorno azul
./scripts/test-environment.sh production-blue

# Redirigir el tráfico al entorno azul (actualización manual de DNS/balanceador de carga)
./scripts/switch-traffic.sh production-blue

# Limpiar el entorno verde
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

### Despliegues por Etapas
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

### Despliegues en Container App
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

### Optimización de Dockerfile en Múltiples Etapas
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

### Despliegues Específicos por Servicio
```bash
# Desplegar un servicio específico para iteraciones más rápidas
azd deploy --service web
azd deploy --service api

# Desplegar todos los servicios
azd deploy
```

### Caché de Construcción
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Despliegues de Código Eficientes
```bash
# Utilice azd deploy (no azd up) para cambios únicamente de código
# Esto omite la provisión de infraestructura y es mucho más rápido
azd deploy

# Despliegue un servicio específico para iterar más rápidamente
azd deploy --service api
```

## 🔍 Monitoreo del Despliegue

### Monitoreo de Despliegue en Tiempo Real
```bash
# Supervisar la aplicación en tiempo real
azd monitor --live

# Ver los registros de la aplicación
azd monitor --logs

# Comprobar el estado del despliegue
azd show
```

### Health Checks
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

## 🔐 Consideraciones de Seguridad

### Gestión de Secrets
```bash
# Almacenar secretos de forma segura
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Hacer referencia a secretos en azure.yaml
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

### Identidad y Gestión de Accesos
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

## 🚨 Estrategias de Rollback

### Rollback Rápido
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

### Rollback de Infraestructura
```bash
# Previsualizar los cambios de infraestructura antes de aplicarlos
azd provision --preview

# Para revertir cambios en la infraestructura, use el control de versiones:
git revert HEAD  # Revertir los cambios en la infraestructura
azd provision    # Aplicar el estado anterior de la infraestructura
```

### Rollback de Migraciones de Base de Datos
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

### Seguimiento del Rendimiento de Despliegue
```bash
# Ver el estado actual del despliegue
azd show

# Supervisar la aplicación con Application Insights
azd monitor --overview

# Ver métricas en tiempo real
azd monitor --live
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

# Mantener la paridad entre entornos
./scripts/sync-environments.sh
```

### 2. Validación de Infraestructura
```bash
# Previsualizar los cambios de infraestructura antes del despliegue
azd provision --preview

# Usar linting para ARM/Bicep
az bicep lint --file infra/main.bicep

# Validar la sintaxis de Bicep
az bicep build --file infra/main.bicep
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
# Documentar los procedimientos de despliegue
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Próximos Pasos

- [Provisioning Resources](provisioning.md) - Profundiza en la gestión de infraestructura
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Planifica tu estrategia de despliegue
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Resuelve problemas de despliegue
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Estrategias de despliegue listas para producción

## 🎯 Ejercicios Prácticos de Despliegue

### Ejercicio 1: Flujo de Despliegue Incremental (20 minutos)
**Objetivo**: Dominar la diferencia entre despliegues completos e incrementales

```bash
# Despliegue inicial
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registrar la hora del despliegue inicial
echo "Full deployment: $(date)" > deployment-log.txt

# Realizar un cambio en el código
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

### Ejercicio 2: Hooks de Despliegue Personalizados (30 minutos)
**Objetivo**: Implementar automatización previa y posterior al despliegue

```bash
# Crear script de validación previo al despliegue
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
- [ ] El script pre-deploy se ejecuta antes del despliegue
- [ ] El despliegue se aborta si las pruebas fallan
- [ ] La prueba de humo post-deploy valida la salud
- [ ] Los hooks se ejecutan en el orden correcto

### Ejercicio 3: Estrategia de Despliegue Multi-Entorno (45 minutos)
**Objetivo**: Implementar un flujo de despliegue por etapas (dev → staging → production)

```bash
# Crear script de despliegue
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Paso 1: Desplegar a dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Paso 2: Desplegar a staging
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
- [ ] El entorno dev se despliega con éxito
- [ ] El entorno staging se despliega con éxito
- [ ] Se requiere aprobación manual para producción
- [ ] Todos los entornos tienen health checks funcionando
- [ ] Se puede hacer rollback si es necesario

### Ejercicio 4: Estrategia de Rollback (25 minutos)
**Objetivo**: Implementar y probar rollback de despliegue usando Git

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
- [ ] Se pueden detectar fallos de despliegue
- [ ] El script de rollback se ejecuta automáticamente
- [ ] La aplicación vuelve a un estado funcional
- [ ] Los health checks pasan después del rollback

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

# Calcular el tiempo promedio de despliegue
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Recursos Adicionales

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navegación**
- **Previous Lesson**: [Your First Project](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->