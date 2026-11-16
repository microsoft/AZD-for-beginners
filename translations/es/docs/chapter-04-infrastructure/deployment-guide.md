# Guía de Despliegue - Dominando los Despliegues con AZD

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 4 - Infraestructura como Código y Despliegue
- **⬅️ Capítulo Anterior**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)
- **➡️ Siguiente**: [Provisionamiento de Recursos](provisioning.md)
- **🧩 También en este capítulo**: [Creando Tu Propia Plantilla](custom-templates.md)
- **🚀 Próximo Capítulo**: [Capítulo 5: Soluciones de IA Multi-Agente](../../examples/retail-scenario.md)

## Introducción

> Revisado con `azd 1.37.2` (noviembre de 2026). Los comandos usan Bash; los ejemplos JSON requieren `jq`. Excepto por el ejercicio todo explícitamente inicializado, los ejemplos avanzados son **fragmentos de integración**: proporciona tu propio código fuente, infraestructura, pruebas y scripts. No se ejecutaron despliegues en Azure durante esta revisión.

Esta guía completa cubre todo lo que necesitas saber sobre despliegue de aplicaciones usando Azure Developer CLI, desde despliegues básicos con un solo comando hasta escenarios avanzados de producción con hooks personalizados, múltiples entornos e integración CI/CD. Domina el ciclo completo de despliegue con ejemplos prácticos y mejores prácticas.

## Objetivos de Aprendizaje

Al completar esta guía, podrás:
- Dominar todos los comandos y flujos de trabajo de despliegue de Azure Developer CLI
- Entender el ciclo completo de despliegue desde provisión hasta monitoreo
- Implementar hooks personalizados para automatización previa y posterior al despliegue
- Configurar múltiples entornos con parámetros específicos para cada uno
- Configurar estrategias de despliegue avanzadas incluyendo blue-green y canary
- Integrar despliegues azd con pipelines CI/CD y flujos de trabajo DevOps

## Resultados de Aprendizaje

Al finalizar, podrás:
- Ejecutar y solucionar todos los flujos de trabajo de despliegue azd de manera independiente
- Diseñar e implementar automatización personalizada con hooks
- Configurar despliegues listos para producción con seguridad y monitoreo adecuados
- Gestionar escenarios complejos de despliegue multi-entorno
- Optimizar el rendimiento del despliegue e implementar estrategias de reversión
- Integrar despliegues azd en prácticas DevOps empresariales

## Visión General del Despliegue

Azure Developer CLI proporciona varios comandos para despliegue:
- `azd up` - Flujo completo (provisón + despliegue)
- `azd provision` - Crear/actualizar solo recursos de Azure
- `azd deploy` - Desplegar solo el código de la aplicación
- `azd package` - Construir y empaquetar aplicaciones

## Flujos de Trabajo Básicos de Despliegue

### Despliegue Completo (azd up)
El flujo más común para nuevos proyectos:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### Despliegue Solo de Infraestructura
Cuando solo necesitas actualizar recursos de Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Despliegue Solo de Código
Para actualizaciones rápidas de la aplicación:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ Verificación del Despliegue

Después de cualquier despliegue, verifica el éxito:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**Criterios de Éxito:**
- ✅ `azd show` resuelve los objetivos/URLs de servicio esperados
- ✅ Las solicitudes a rutas reales de la aplicación devuelven el estado y contenido esperados
- ✅ No hay registros de error en los últimos 5 minutos
- ✅ La aplicación responde a solicitudes de prueba

## 🏗️ Entendiendo el Proceso de Despliegue

### ¿Nuevo en hooks? Comienza aquí

Un **hook** es un comando que azd ejecuta automáticamente en un momento específico del proceso de despliegue—antes o después de la provisión, y antes o después de desplegar tu código. Te permiten automatizar las pequeñas tareas que siempre rodean un despliegue: poblar una base de datos, ejecutar migraciones, compilar activos o hacer pruebas básicas de la aplicación en vivo.

| Hook | Se ejecuta… | Uso común |
|------|-------------|------------|
| `preprovision` | Antes de que se creen los recursos | Validar prerrequisitos, iniciar sesión en un registro |
| `postprovision` | Después de que los recursos existen | Configurar recursos, preparar la base de datos |
| `predeploy` | Antes de desplegar código | Construir activos front-end, ejecutar pruebas unitarias |
| `postdeploy` | Después de que el código está en vivo | Ejecutar migraciones DB, pruebas básicas del endpoint |

Los hooks viven en tu `azure.yaml`. Aquí está el ejemplo más pequeño posible—solo imprime un mensaje tras el despliegue:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Eso es todo—la próxima vez que ejecutes `azd up`, el mensaje se imprime automáticamente. También puedes ejecutar un hook por sí solo, sin un despliegue completo, lo cual es ideal para probar:

```bash
azd hooks run postdeploy
```

Las fases a continuación muestran hooks del mundo real (migraciones, pruebas, validación) para cada etapa.

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
- Lee plantillas de infraestructura (Bicep/Terraform)
- Crea o actualiza recursos de Azure
- Configura redes y seguridad
- Configura monitoreo y registros

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

### Fase 4: Empaquetado de Aplicación
- Construye código de aplicación
- Crea artefactos de despliegue
- Empaqueta para plataforma objetivo (contenedores, archivos ZIP, etc.)

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

### Fase 6: Despliegue de Aplicación
- Despliega aplicaciones empaquetadas a servicios de Azure
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
      curl --fail "$WEB_URL/health"
```

### Manejo de Errores en Hooks

Por defecto, **si un comando hook termina con código distinto de cero, azd detiene toda la operación.** Esto normalmente es lo deseado—una migración fallida debe detener el despliegue, no lanzar una app rota. Pero significa que los hooks deben escribirse cuidadosamente.

**1. Haz que los fallos sean perceptibles e intencionales.** Un hook falla cuando su último comando devuelve un código de salida distinto de cero. En scripts shell, añade `set -e` para que el hook se detenga en el primer comando fallido en lugar de continuar en silencio:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Permite que un hook falle sin detener azd.** Para pasos no críticos (calentamiento opcional de caché, notificación a modo esfuerzo máximo), establece `continueOnError: true`. azd registra la falla pero sigue adelante:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Prueba hooks aislados antes de una ejecución completa.** No tienes que ejecutar `azd up` para depurar un hook—ejecútalo solo y itera rápido:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Atento a shells específicos del sistema operativo.** Un hook usando `shell: pwsh` necesita PowerShell instalado en la máquina que lo ejecuta (incluidos agentes CI). Usa `shell: sh` para la mayor portabilidad, o provee ambas variantes `windows` y `posix`:

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

> **Consejo de depuración:** ejecuta cualquier comando azd con `--debug` para ver la línea exacta del comando hook y su salida completa—imprescindible cuando el hook funciona localmente pero falla en CI.

## 🎛️ Configuración del Despliegue

### Configuraciones Específicas por Servicio
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### Configuraciones Específicas por Entorno

Estos son valores locales de azd únicamente. Mapéalos explícitamente a la configuración de infraestructura/tiempo de ejecución. `NODE_ENV` es normalmente `production` para una app Node desplegada, incluyendo un despliegue staging; usa una variable separada específica de app para distinguir etapas de despliegue.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
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

**Esquema operativo ilustrativo:** debes proporcionar ambos entornos, una capa compartida de enrutamiento de tráfico y los dos scripts abajo. azd no cambia el tráfico ni valida la preparación para rollback automáticamente. Mantén green hasta que blue pase las pruebas y ya no se necesite rollback.

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
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

La división de tráfico corresponde a la configuración de Container Apps (Bicep o Azure CLI), no a una propiedad `azure.yaml` `trafficSplit` de azd. El preview/provisionamiento y despliegues posteriores deben preservar el modo de revisión y reglas de enrutamiento seleccionadas.

### Despliegues por Etapas
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Despliegues de Contenedores

### Despliegue de Container Apps
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

Configura secretos en tiempo de ejecución con `configuration.secrets`/`secretRef` (o referencias a Key Vault) y escalado con `template.scale` en infraestructura Container App. No inventes propiedades `secrets` o `scale` a nivel de servicio en `azure.yaml`.

### Optimización Multi-Etapa de Dockerfile
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
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
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Caché de Construcción
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

El flujo estándar de Node usa scripts de paquete; hooks `prepackage` de servicio pueden añadir pasos requeridos. El cacheo de capas Docker es independiente de definir un comando de construcción del servicio.

### Despliegues de Código Eficientes
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Monitoreo del Despliegue

### Monitoreo en Tiempo Real del Despliegue
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Chequeos de Salud
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

Tu aplicación debe implementar `/health`; no es provisto automáticamente por azd. No existe una propiedad genérica `azure.yaml` `healthCheck` a nivel de servicio.

### Validación Post-Despliegue
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
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

### Manejo de Secretos
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` es inválido. Valores ordinarios de entorno son texto plano local; no asumas que comandos de lectura los ocultan. Los comandos anteriores guardan referencias Key Vault, pero tu infraestructura/aplicación debe consumir los secretos y otorgar acceso de identidad en tiempo de ejecución.

### Seguridad de Red
Declara y consume parámetros de red en Bicep, y mapéalos en `infra/main.parameters.json`. No existe superposición genérica `infra.parameters` en `azure.yaml`. Las documentaciones ejemplo usan rangos `203.0.113.0/24` y `198.51.100.0/24` que no son redes de oficina/VPN reales; reemplázalos con rangos autorizados.

### Gestión de Identidad y Acceso
Habilita `identity` del Container App en Bicep y asigna el rol necesario de plano de datos Key Vault en el ámbito del vault. Configura secretos respaldados por Key Vault y referencias en tiempo de ejecución en ese recurso; `identity` y `keyVault` no son propiedades genéricas de servicio azd. Consulta [Autenticación & Identidad Administrada](../chapter-03-configuration/authsecurity.md).

## 🚨 Estrategias de Reversión (Rollback)

### Reversión Rápida
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### Reversión de Infraestructura
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Reversión de Migraciones de Base de Datos
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
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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

### 1. Consistencia del Entorno
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
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
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

### 4. Documentación y Registros
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Próximos Pasos

- [Provisionamiento de Recursos](provisioning.md) - Profundiza en la gestión de infraestructura
- [Planificación Previa al Despliegue](../chapter-06-pre-deployment/capacity-planning.md) - Planifica tu estrategia de despliegue
- [Problemas Comunes](../chapter-07-troubleshooting/common-issues.md) - Resuelve problemas de despliegue
- [Mejores Prácticas](../chapter-07-troubleshooting/debugging.md) - Estrategias de despliegue listas para producción

## 🎯 Ejercicios Prácticos de Despliegue

### Ejercicio 1: Flujo de Trabajo de Despliegue Incremental (20 minutos)
**Meta**: Domina la diferencia entre despliegues completos e incrementales

**Punto de partida:** Bash, Node.js 22, Git, inicio de sesión azd y una suscripción Azure con permisos de despliegue. Ejecuta en un directorio nuevo; espera recursos facturables de App Service/Cosmos DB. El tiempo depende de la región y plantilla.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**Criterios de Éxito:**
- [ ] Registrar tiempo transcurrido de ambos comandos (no hay duración garantizada)
- [ ] Ambos comandos terminan exitosamente
- [ ] La API permanece funcional; la edición solo comentario no cambia interfaz visible
- [ ] Infraestructura sin cambios tras `azd deploy`

**Resultado de Aprendizaje**: `azd deploy` omite provisión de infraestructura. Compara tiempos medidos en lugar de asumir aceleración fija.

### Ejercicio 2: Hooks Personalizados de Despliegue (30 minutos)
**Meta**: Implementa automatización pre y post-despliegue

**Punto de partida:** el proyecto `deployment-practice` inicializado arriba. Si lo limpiaste, ejecuta `azd up` de nuevo antes de probar despliegue solo código. La validación usa el script real de construcción de la API, no un script `test:unit` inexistente en raíz. Las pruebas API en la plantilla necesitan acceso de base de datos configurado; no son pruebas unitarias aisladas.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**Criterios de Éxito:**
- [ ] Script pre-despliegue se ejecuta antes del despliegue
- [ ] Despliegue aborta si falla validación de construcción
- [ ] Prueba básica post-despliegue valida salud
- [ ] Hooks se ejecutan en orden correcto

### Ejercicio 3: Estrategia de Despliegue Multi-Entorno (45 minutos)
**Meta**: Implementa flujo de despliegue escalonado (dev → staging → producción)

**Punto de partida:** el mismo proyecto inicializado de todo con `jq`. Crea los entornos siguientes con valores reales de suscripción/ubicación (o establece `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` en cada uno) **antes** de invocar el flujo de trabajo sin indicaciones. Intencionalmente falla en lugar de inventar valores faltantes. Usa solo entornos de entrenamiento desechables, no una suscripción de producción real.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**Criterios de éxito:**
- [ ] El entorno de desarrollo se despliega correctamente
- [ ] El entorno de preproducción se despliega correctamente
- [ ] Se requiere aprobación manual para producción
- [ ] Todos los entornos tienen comprobaciones de estado funcionando
- [ ] Se puede revertir si es necesario

### Ejercicio 4: Estrategia de Reversión (25 minutos)
**Objetivo**: Implementar y probar la reversión de despliegue usando Git

**Punto de partida:** una revisión de entrenamiento aislada de la plantilla todo con todo el código base comprometido, un árbol de trabajo Git limpio, y un entorno desechable configurado. Nunca introduzcas fallas deliberadas en un proyecto de producción real. `APP_VERSION` abajo es solo para registro contable a menos que lo conectes explícitamente en la aplicación.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**Criterios de éxito:**
- [ ] Se pueden detectar fallos de despliegue
- [ ] El script de reversión se ejecuta automáticamente
- [ ] La aplicación vuelve a un estado funcional
- [ ] Las comprobaciones de estado pasan después de la reversión

## 📊 Seguimiento de Métricas de Despliegue

### Rastrea el desempeño de tu despliegue

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**Analiza tus métricas:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Recursos Adicionales

- [Referencia de Despliegue de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Despliegue de Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Despliegue de Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Despliegue de Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navegación**
- **Lección anterior**: [Tu primer proyecto](../chapter-01-foundation/first-project.md)
- **Lección siguiente**: [Aprovisionamiento de recursos](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->