# Guia de Implantação - Dominando Implantações com AZD

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 4 - Infraestrutura como Código & Implantação
- **⬅️ Capítulo Anterior**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)
- **➡️ Próximo**: [Provisionamento de Recursos](provisioning.md)
- **🚀 Próximo Capítulo**: [Capítulo 5: Soluções de IA Multi-Agente](../../examples/retail-scenario.md)

## Introdução

Este guia abrangente cobre tudo o que você precisa saber sobre implantar aplicações usando o Azure Developer CLI, desde implantações básicas com um único comando até cenários avançados de produção com hooks personalizados, múltiplos ambientes e integração CI/CD. Domine o ciclo completo de implantação com exemplos práticos e melhores práticas.

## Objetivos de Aprendizagem

Ao concluir este guia, você irá:
- Dominar todos os comandos e fluxos de implantação do Azure Developer CLI
- Compreender todo o ciclo de vida da implantação, desde o provisionamento até o monitoramento
- Implementar hooks de implantação personalizados para automação pré e pós-implantação
- Configurar múltiplos ambientes com parâmetros específicos por ambiente
- Configurar estratégias avançadas de implantação, incluindo blue-green e canary
- Integrar implantações azd com pipelines CI/CD e fluxos de trabalho DevOps

## Resultados de Aprendizagem

Ao concluir, você será capaz de:
- Executar e solucionar problemas de todos os fluxos de implantação azd de forma independente
- Projetar e implementar automação de implantação personalizada usando hooks
- Configurar implantações prontas para produção com segurança e monitoramento adequados
- Gerenciar cenários de implantação complexos com múltiplos ambientes
- Otimizar o desempenho de implantação e implementar estratégias de rollback
- Integrar implantações azd às práticas DevOps empresariais

## Visão Geral da Implantação

Azure Developer CLI fornece vários comandos de implantação:
- `azd up` - Fluxo completo (provisionamento + implantação)
- `azd provision` - Criar/atualizar apenas recursos do Azure
- `azd deploy` - Implantar apenas o código da aplicação
- `azd package` - Compilar e empacotar aplicações

## Fluxos de Implantação Básicos

### Implantação Completa (azd up)
O fluxo mais comum para novos projetos:
```bash
# Implantar tudo do zero
azd up

# Implantar com ambiente específico
azd up --environment production

# Implantar com parâmetros personalizados
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Provisionamento Apenas de Infraestrutura
Quando você precisa apenas atualizar recursos do Azure:
```bash
# Provisionar/atualizar a infraestrutura
azd provision

# Provisionar com dry-run para pré-visualizar as alterações
azd provision --preview

# Provisionar serviços específicos
azd provision --service database
```

### Implantação Só do Código
Para atualizações rápidas da aplicação:
```bash
# Implantar todos os serviços
azd deploy

# Saída esperada:
# Implantando serviços (azd deploy)
# - web: Implantando... Concluído
# - api: Implantando... Concluído
# SUCESSO: Sua implantação foi concluída em 2 minutos e 15 segundos

# Implantar serviço específico
azd deploy --service web
azd deploy --service api

# Implantar com argumentos de compilação personalizados
azd deploy --service api --build-arg NODE_ENV=production

# Verificar implantação
azd show --output json | jq '.services'
```

### ✅ Verificação da Implantação

Após qualquer implantação, verifique o sucesso:

```bash
# Verifique se todos os serviços estão em execução
azd show

# Teste os endpoints de saúde
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Monitore por erros (abre no navegador por padrão)
azd monitor --logs
```

**Critérios de Sucesso:**
- ✅ Todos os serviços mostram status 'Em execução'
- ✅ Endpoints de saúde retornam HTTP 200
- ✅ Nenhum log de erro nos últimos 5 minutos
- ✅ Aplicação responde a requisições de teste

## 🏗️ Entendendo o Processo de Implantação

### Fase 1: Hooks de Pré-Provisionamento
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

### Fase 2: Provisionamento de Infraestrutura
- Lê templates de infraestrutura (Bicep/Terraform)
- Cria ou atualiza recursos do Azure
- Configura rede e segurança
- Configura monitoramento e logging

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
- Compila o código da aplicação
- Cria artefatos de implantação
- Empacota para a plataforma alvo (contêineres, arquivos ZIP, etc.)

### Fase 5: Hooks Pré-Implantação
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

### Fase 6: Implantação da Aplicação
- Implanta aplicações empacotadas nos serviços do Azure
- Atualiza configurações
- Inicia/reinicia serviços

### Fase 7: Hooks Pós-Implantação
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

## 🎛️ Configuração de Implantação

### Configurações de Implantação por Serviço
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

### Configurações Específicas por Ambiente
```bash
# Ambiente de desenvolvimento
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Ambiente de homologação
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

## 🔧 Cenários Avançados de Implantação

### Aplicações Multi-serviço
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

### Implantações Blue-Green
```bash
# Criar ambiente azul
azd env new production-blue
azd up --environment production-blue

# Testar ambiente azul
./scripts/test-environment.sh production-blue

# Alternar tráfego para o ambiente azul (atualização manual de DNS/balanceador de carga)
./scripts/switch-traffic.sh production-blue

# Limpar ambiente verde
azd env select production-green
azd down --force
```

### Implantações Canary
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

### Implantações em Etapas
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

## 🐳 Implantações de Contêineres

### Implantações de Aplicativos Containerizados
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

### Otimização de Dockerfile em Múltiplas Etapas
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

### Implantações Específicas por Serviço
```bash
# Implantar um serviço específico para iteração mais rápida
azd deploy --service web
azd deploy --service api

# Implantar todos os serviços
azd deploy
```

### Cache de Build
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Implantações de Código Eficientes
```bash
# Use azd deploy (não azd up) para alterações apenas no código
# Isso ignora o provisionamento da infraestrutura e é muito mais rápido
azd deploy

# Faça o deploy de um serviço específico para iterações mais rápidas
azd deploy --service api
```

## 🔍 Monitoramento de Implantação

### Monitoramento de Implantação em Tempo Real
```bash
# Monitore a aplicação em tempo real
azd monitor --live

# Ver logs da aplicação
azd monitor --logs

# Verificar status da implantação
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

### Validação Pós-Implantação
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Verificar a saúde da aplicação
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

### Gerenciamento de Segredos
```bash
# Armazenar segredos com segurança
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

### Gerenciamento de Identidade e Acesso
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
# AZD não possui rollback embutido. Abordagens recomendadas:

# Opção 1: Reimplantar a partir do Git (recomendado)
git revert HEAD  # Reverta o commit problemático
git push
azd deploy

# Opção 2: Reimplantar commit específico
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback de Infraestrutura
```bash
# Visualize as alterações na infraestrutura antes de aplicar
azd provision --preview

# Para reverter a infraestrutura, use o controle de versão:
git revert HEAD  # Reverter alterações na infraestrutura
azd provision    # Aplicar o estado anterior da infraestrutura
```

### Rollback de Migração de Banco de Dados
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Métricas de Implantação

### Acompanhar o Desempenho da Implantação
```bash
# Ver status atual da implantação
azd show

# Monitorar a aplicação com o Application Insights
azd monitor --overview

# Ver métricas em tempo real
azd monitor --live
```

### Coleta de Métricas Customizadas
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

### 1. Consistência entre Ambientes
```bash
# Use nomenclatura consistente
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Mantenha a paridade entre ambientes
./scripts/sync-environments.sh
```

### 2. Validação da Infraestrutura
```bash
# Visualizar alterações de infraestrutura antes da implantação
azd provision --preview

# Use linting para ARM/Bicep
az bicep lint --file infra/main.bicep

# Validar sintaxe do Bicep
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

### 4. Documentação e Registro de Logs
```bash
# Documentar procedimentos de implantação
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Próximos Passos

- [Provisionamento de Recursos](provisioning.md) - Exploração aprofundada do gerenciamento de infraestrutura
- [Planejamento Pré-Implantação](../chapter-06-pre-deployment/capacity-planning.md) - Planeje sua estratégia de implantação
- [Problemas Comuns](../chapter-07-troubleshooting/common-issues.md) - Resolva problemas de implantação
- [Melhores Práticas](../chapter-07-troubleshooting/debugging.md) - Estratégias de implantação prontas para produção

## 🎯 Exercícios Práticos de Implantação

### Exercício 1: Fluxo de Implantação Incremental (20 minutos)
**Objetivo**: Domine a diferença entre implantações completas e incrementais

```bash
# Implantação inicial
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registrar o horário da implantação inicial
echo "Full deployment: $(date)" > deployment-log.txt

# Fazer uma alteração no código
echo "// Updated $(date)" >> src/api/src/server.js

# Implantar apenas o código (rápido)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Comparar horários
cat deployment-log.txt

# Limpar
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] implantação completa leva 5-15 minutos
- [ ] implantação somente do código leva 2-5 minutos
- [ ] mudanças de código refletidas na aplicação implantada
- [ ] infraestrutura inalterada após `azd deploy`

**Resultado de Aprendizagem**: `azd deploy` é 50-70% mais rápido que o `azd up` para alterações de código

### Exercício 2: Hooks de Implantação Personalizados (30 minutos)
**Objetivo**: Implementar automação pré e pós-implantação

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

# Verificar se há alterações não comitadas
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Criar teste rápido pós-implantação
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

# Adicionar hooks ao azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testar implantação com hooks
azd deploy
```

**Critérios de Sucesso:**
- [ ] Script de pré-implantação executa antes da implantação
- [ ] Implantação aborta se os testes falharem
- [ ] Teste de fumaça pós-implantação valida saúde
- [ ] Hooks executam na ordem correta

### Exercício 3: Estratégia de Implantação Multi-Ambiente (45 minutos)
**Objetivo**: Implementar fluxo de implantação em etapas (dev → staging → production)

```bash
# Criar script de implantação
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Etapa 1: Implantar no dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Etapa 2: Implantar no staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Etapa 3: Aprovação manual para produção
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

# Executar implantação em etapas
./deploy-staged.sh
```

**Critérios de Sucesso:**
- [ ] Ambiente dev implanta com sucesso
- [ ] Ambiente staging implanta com sucesso
- [ ] Aprovação manual exigida para production
- [ ] Todos os ambientes têm verificações de saúde funcionando
- [ ] É possível realizar rollback se necessário

### Exercício 4: Estratégia de Rollback (25 minutos)
**Objetivo**: Implementar e testar rollback de implantação usando Git

```bash
# Implantar v1
azd env set APP_VERSION "1.0.0"
azd up

# Salvar hash do commit de v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Implantar v2 com mudança que quebra compatibilidade
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Detectar falha e reverter
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Reverter usando git
    git revert HEAD --no-edit
    
    # Reverter ambiente
    azd env set APP_VERSION "1.0.0"
    
    # Reimplantar v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Critérios de Sucesso:**
- [ ] Consegue detectar falhas de implantação
- [ ] Script de rollback executa automaticamente
- [ ] Aplicação retorna ao estado funcional
- [ ] Verificações de saúde passam após rollback

## 📊 Rastreamento de Métricas de Implantação

### Acompanhe o Desempenho da Sua Implantação

```bash
# Criar script de métricas de implantação
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

# Registrar em arquivo
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Use-o
./track-deployment.sh
```

**Analise suas métricas:**
```bash
# Exibir histórico de implantações
cat deployment-metrics.csv

# Calcular tempo médio de implantação
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Recursos Adicionais

- [Referência de Implantação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implantação do Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implantação do Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implantação do Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navegação**
- **Lição Anterior**: [Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **Próxima Lição**: [Provisionamento de Recursos](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original, em seu idioma nativo, deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->