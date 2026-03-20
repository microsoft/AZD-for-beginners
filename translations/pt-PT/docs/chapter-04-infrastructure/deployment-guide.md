# Guia de Implementação - Dominando Implementações AZD

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 4 - Infraestrutura como Código & Implementação
- **⬅️ Capítulo Anterior**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)
- **➡️ Seguinte**: [Provisionamento de Recursos](provisioning.md)
- **🚀 Próximo Capítulo**: [Capítulo 5: Soluções de IA Multi-Agente](../../examples/retail-scenario.md)

## Introdução

Este guia abrangente cobre tudo o que precisa saber sobre a implementação de aplicações usando o Azure Developer CLI, desde implementações básicas com um único comando até cenários avançados de produção com hooks personalizados, múltiplos ambientes e integração CI/CD. Domine o ciclo completo de implementação com exemplos práticos e melhores práticas.

## Objetivos de Aprendizagem

Ao completar este guia, irá:
- Dominar todos os comandos e fluxos de trabalho de implementação do Azure Developer CLI
- Compreender o ciclo completo de implementação desde o provisionamento até à monitorização
- Implementar hooks personalizados para automação pré e pós-implementação
- Configurar múltiplos ambientes com parâmetros específicos para cada ambiente
- Configurar estratégias avançadas de implementação incluindo implementações blue-green e canary
- Integrar implementações azd com pipelines CI/CD e fluxos DevOps

## Resultados de Aprendizagem

Após a conclusão, será capaz de:
- Executar e resolver problemas de todos os fluxos de trabalho de implementação azd de forma independente
- Projetar e implementar automação personalizada da implementação usando hooks
- Configurar implementações prontas para produção com segurança e monitorização adequadas
- Gerir cenários complexos de implementação multi-ambiente
- Otimizar o desempenho da implementação e implementar estratégias de rollback
- Integrar implementações azd nas práticas DevOps empresariais

## Visão Geral da Implementação

O Azure Developer CLI fornece vários comandos de implementação:
- `azd up` - Fluxo completo (provisionar + implementar)
- `azd provision` - Criar/atualizar apenas recursos Azure
- `azd deploy` - Implementar apenas código da aplicação
- `azd package` - Construir e empacotar aplicações

## Fluxos de Trabalho Básicos de Implementação

### Implementação Completa (azd up)
O fluxo mais comum para novos projetos:
```bash
# Implantar tudo do zero
azd up

# Implantar com ambiente específico
azd up --environment production

# Implantar com parâmetros personalizados
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Implementação Apenas de Infraestrutura
Quando só precisa de atualizar recursos Azure:
```bash
# Providenciar/atualizar infraestrutura
azd provision

# Providenciar com execução simulada para pré-visualizar alterações
azd provision --preview

# Providenciar serviços específicos
azd provision --service database
```

### Implementação Apenas de Código
Para atualizações rápidas da aplicação:
```bash
# Implantar todos os serviços
azd deploy

# Saída esperada:
# A implantar serviços (azd deploy)
# - web: A implantar... Concluído
# - api: A implantar... Concluído
# SUCESSO: A sua implantação foi concluída em 2 minutos e 15 segundos

# Implantar serviço específico
azd deploy --service web
azd deploy --service api

# Implantar com argumentos de compilação personalizados
azd deploy --service api --build-arg NODE_ENV=production

# Verificar implantação
azd show --output json | jq '.services'
```

### ✅ Verificação da Implementação

Após qualquer implementação, verifique o sucesso:

```bash
# Verifique se todos os serviços estão a funcionar
azd show

# Teste os endpoints de saúde
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitorize erros (abre no navegador por defeito)
azd monitor --logs
```

**Critérios de Sucesso:**
- ✅ Todos os serviços mostram estado "Running"
- ✅ Endpoints de saúde retornam HTTP 200
- ✅ Sem logs de erro nos últimos 5 minutos
- ✅ Aplicação responde a pedidos de teste

## 🏗️ Compreender o Processo de Implementação

### Fase 1: Hooks Pré-Provisionamento
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

### Fase 2: Provisionamento da Infraestrutura
- Lê templates de infraestrutura (Bicep/Terraform)
- Cria ou atualiza os recursos Azure
- Configura rede e segurança
- Configura monitorização e logging

### Fase 3: Hooks Pós-Provisionamento
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

### Fase 4: Empacotamento da Aplicação
- Constrói o código da aplicação
- Cria artefactos de implementação
- Empacota para a plataforma alvo (contenores, ficheiros ZIP, etc.)

### Fase 5: Hooks Pré-Implementação
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

### Fase 6: Implementação da Aplicação
- Implementa as aplicações empacotadas nos serviços Azure
- Atualiza configurações
- Inicia/reinicia serviços

### Fase 7: Hooks Pós-Implementação
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

## 🎛️ Configuração da Implementação

### Definições de Implementação Específicas do Serviço
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

### Configurações Específicas de Ambiente
```bash
# Ambiente de desenvolvimento
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Ambiente de preparação
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Ambiente de produção
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Cenários Avançados de Implementação

### Aplicações Multi-Serviço
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

### Implementações Blue-Green
```bash
# Criar ambiente azul
azd env new production-blue
azd up --environment production-blue

# Testar ambiente azul
./scripts/test-environment.sh production-blue

# Mudar tráfego para azul (atualização manual de DNS/balanceador de carga)
./scripts/switch-traffic.sh production-blue

# Limpar ambiente verde
azd env select production-green
azd down --force
```

### Implementações Canary
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

### Implementações em Etapas
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

## 🐳 Implementações em Contêineres

### Implementações de Container App
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

### Otimização Multi-Etapas do Dockerfile
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

## ⚡ Otimização de Desempenho

### Implementações Específicas do Serviço
```bash
# Desplegar um serviço específico para uma iteração mais rápida
azd deploy --service web
azd deploy --service api

# Desplegar todos os serviços
azd deploy
```

### Cache de Construção
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Implementações de Código Eficientes
```bash
# Utilize azd deploy (não azd up) para alterações apenas de código
# Isto evita o provisionamento de infraestruturas e é muito mais rápido
azd deploy

# Faça deploy de serviços específicos para uma iteração mais rápida
azd deploy --service api
```

## 🔍 Monitorização da Implementação

### Monitorização da Implementação em Tempo Real
```bash
# Monitorizar a aplicação em tempo real
azd monitor --live

# Ver os registos da aplicação
azd monitor --logs

# Verificar o estado da implementação
azd show
```

### Verificações de Saúde
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

### Validação Pós-Implementação
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Verificar saúde da aplicação
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

## 🔐 Considerações de Segurança

### Gestão de Segredos
```bash
# Armazenar segredos de forma segura
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Referenciar segredos em azure.yaml
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

### Segurança de Rede
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Gestão de Identidade e Acesso
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

## 🚨 Estratégias de Rollback

### Rollback Rápido
```bash
# O AZD não tem rollback incorporado. Abordagens recomendadas:

# Opção 1: Voltar a fazer o deploy a partir do Git (recomendado)
git revert HEAD  # Reverter o commit problemático
git push
azd deploy

# Opção 2: Voltar a fazer o deploy de um commit específico
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback da Infraestrutura
```bash
# Pré-visualizar alterações na infraestrutura antes de aplicar
azd provision --preview

# Para reverter a infraestrutura, use controlo de versões:
git revert HEAD  # Reverter alterações na infraestrutura
azd provision    # Aplicar estado anterior da infraestrutura
```

### Rollback de Migração de Base de Dados
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Métricas de Implementação

### Acompanhe o Desempenho da Implementação
```bash
# Ver estado atual da implementação
azd show

# Monitorizar a aplicação com Application Insights
azd monitor --overview

# Ver métricas em tempo real
azd monitor --live
```

### Coleta de Métricas Personalizadas
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

## 🎯 Melhores Práticas

### 1. Consistência do Ambiente
```bash
# Use uma nomenclatura consistente
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Mantenha a paridade do ambiente
./scripts/sync-environments.sh
```

### 2. Validação da Infraestrutura
```bash
# Visualizar alterações de infraestrutura antes da implementação
azd provision --preview

# Utilizar linting ARM/Bicep
az bicep lint --file infra/main.bicep

# Validar a sintaxe do Bicep
az bicep build --file infra/main.bicep
```

### 3. Integração de Testes
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

### 4. Documentação e Logging
```bash
# Documentar procedimentos de implementação
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Próximos Passos

- [Provisionamento de Recursos](provisioning.md) - Mergulho profundo na gestão de infraestrutura
- [Planeamento Pré-Implementação](../chapter-06-pre-deployment/capacity-planning.md) - Planeie a sua estratégia de implementação
- [Problemas Comuns](../chapter-07-troubleshooting/common-issues.md) - Resolva problemas de implementação
- [Melhores Práticas](../chapter-07-troubleshooting/debugging.md) - Estratégias de implementação prontas para produção

## 🎯 Exercícios Práticos de Implementação

### Exercício 1: Fluxo de Implementação Incremental (20 minutos)
**Objetivo**: Dominar a diferença entre implementações completas e incrementais

```bash
# Implantação inicial
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registar hora da implantação inicial
echo "Full deployment: $(date)" > deployment-log.txt

# Fazer uma alteração no código
echo "// Updated $(date)" >> src/api/src/server.js

# Implantar apenas o código (rápido)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Comparar tempos
cat deployment-log.txt

# Limpar
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] Implementação completa demora 5-15 minutos
- [ ] Implementação apenas de código demora 2-5 minutos
- [ ] Alterações de código refletidas na aplicação implementada
- [ ] Infraestrutura inalterada após `azd deploy`

**Resultado de Aprendizagem**: `azd deploy` é 50-70% mais rápido que `azd up` para alterações de código

### Exercício 2: Hooks Personalizados de Implementação (30 minutos)
**Objetivo**: Implementar automação pré e pós-implementação

```bash
# Criar script de validação pré-implantação
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Verificar se os testes passam
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Verificar alterações não cometidas
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Criar teste inicial pós-implantação
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

# Adicionar ganchos ao azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testar implantação com ganchos
azd deploy
```

**Critérios de Sucesso:**
- [ ] Script pré-implementação corre antes da implementação
- [ ] Implementação aborta se testes falharem
- [ ] Teste pós-implementação valida a saúde
- [ ] Hooks executam na ordem correta

### Exercício 3: Estratégia de Implementação Multi-Ambiente (45 minutos)
**Objetivo**: Implementar fluxo de implementação em etapas (dev → staging → produção)

```bash
# Criar script de implantação
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Passo 1: Implantar no desenvolvimento
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Passo 2: Implantar na pré-produção
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Passo 3: Aprovação manual para produção
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

# Criar ambientes
azd env new dev
azd env new staging
azd env new production

# Executar implantação faseada
./deploy-staged.sh
```

**Critérios de Sucesso:**
- [ ] Ambiente de desenvolvimento implementa com sucesso
- [ ] Ambiente de staging implementa com sucesso
- [ ] Aprovação manual necessária para produção
- [ ] Todos os ambientes têm verificações de saúde a funcionar
- [ ] Possibilidade de rollback se necessário

### Exercício 4: Estratégia de Rollback (25 minutos)
**Objetivo**: Implementar e testar rollback da implementação usando Git

```bash
# Implementar v1
azd env set APP_VERSION "1.0.0"
azd up

# Guardar hash do commit v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Implementar v2 com alteração incompatível
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Detetar falha e reverter
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Reverter usando git
    git revert HEAD --no-edit
    
    # Reverter ambiente
    azd env set APP_VERSION "1.0.0"
    
    # Reimplementar v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Critérios de Sucesso:**
- [ ] Capaz de detetar falhas na implementação
- [ ] Script de rollback corre automaticamente
- [ ] Aplicação retorna ao estado funcional
- [ ] Verificações de saúde passam após rollback

## 📊 Acompanhamento de Métricas de Implementação

### Acompanhe o Desempenho da Sua Implementação

```bash
# Criar script de métricas de implementação
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

# Registar no ficheiro
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Usar isso
./track-deployment.sh
```

**Analise as suas métricas:**
```bash
# Ver histórico de implementações
cat deployment-metrics.csv

# Calcular o tempo médio de implementação
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Recursos Adicionais

- [Referência de Implementação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implementação Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implementação Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implementação Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navegação**
- **Lição Anterior**: [O Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **Lição Seguinte**: [Provisionamento de Recursos](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte oficial. Para informações críticas, recomenda-se a tradução profissional feita por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->