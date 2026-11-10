# Guia de Implantação - Dominando Implantações com AZD

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 4 - Infraestrutura como Código & Implantação
- **⬅️ Capítulo Anterior**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)
- **➡️ Próximo**: [Provisionamento de Recursos](provisioning.md)
- **🧩 Também neste capítulo**: [Criando Seu Próprio Template](custom-templates.md)
- **🚀 Próximo Capítulo**: [Capítulo 5: Soluções Multi-Agentes de IA](../../examples/retail-scenario.md)

## Introdução

> Revisado contra `azd 1.37.2` (novembro de 2026). Comandos usam Bash; exemplos JSON requerem `jq`. Exceto pelo exercício todo explicitamente inicializado, exemplos avançados são **fragmentos de integração**: forneça sua própria origem, infraestrutura, testes e scripts. Nenhuma implantação na Azure foi executada nesta revisão.

Este guia abrangente cobre tudo o que você precisa saber sobre implantar aplicações usando o Azure Developer CLI, desde implantações básicas de um único comando até cenários avançados de produção com ganchos personalizados, múltiplos ambientes e integração CI/CD. Domine o ciclo completo de implantação com exemplos práticos e melhores práticas.

## Objetivos de Aprendizagem

Ao concluir este guia, você irá:
- Dominar todos os comandos e fluxos de trabalho de implantação do Azure Developer CLI
- Entender o ciclo completo de implantação desde o provisionamento até o monitoramento
- Implementar ganchos de implantação personalizados para automação pré e pós-implantação
- Configurar múltiplos ambientes com parâmetros específicos para cada ambiente
- Configurar estratégias avançadas de implantação incluindo blue-green e canary
- Integrar implantações azd com pipelines CI/CD e fluxos de trabalho DevOps

## Resultados do Aprendizado

Após a conclusão, você será capaz de:
- Executar e solucionar todos os fluxos de trabalho de implantação azd independentemente
- Projetar e implementar automação personalizada de implantação usando ganchos
- Configurar implantações preparadas para produção com segurança e monitoramento adequados
- Gerenciar cenários complexos de implantação em múltiplos ambientes
- Otimizar desempenho de implantação e implementar estratégias de rollback
- Integrar implantações azd às práticas empresariais DevOps

## Visão Geral da Implantação

Azure Developer CLI fornece vários comandos de implantação:
- `azd up` - Fluxo completo (provisionar + implantar)
- `azd provision` - Criar/atualizar recursos do Azure apenas
- `azd deploy` - Implantar apenas código da aplicação
- `azd package` - Construir e empacotar aplicações

## Fluxos Básicos de Implantação

### Implantação Completa (azd up)
O fluxo mais comum para novos projetos:
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

### Implantação Apenas de Infraestrutura
Quando você só precisa atualizar os recursos do Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Implantação Apenas de Código
Para atualizações rápidas da aplicação:
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

### ✅ Verificação da Implantação

Após qualquer implantação, verifique o sucesso:

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

**Critérios de Sucesso:**
- ✅ `azd show` resolve os alvos/URLs esperados do serviço
- ✅ Requisições às rotas reais da aplicação retornam o status e corpo esperados
- ✅ Sem logs de erro nos últimos 5 minutos
- ✅ A aplicação responde a requisições de teste

## 🏗️ Entendendo o Processo de Implantação

### Novo em ganchos? Comece aqui

Um **gancho** é um comando que o azd executa automaticamente em um momento específico no processo de implantação — antes ou depois do provisionamento, e antes ou depois de implantar seu código. Eles permitem automatizar pequenas tarefas que sempre cercam uma implantação: preencher um banco de dados, executar migrações, construir ativos ou testar rapidamente o app ao vivo.

| Gancho | Executa… | Uso comum |
|------|-------|------------|
| `preprovision` | Antes que recursos sejam criados | Validar pré-requisitos, logar em um registro |
| `postprovision` | Depois que recursos existem | Configurar recursos, preparar o banco de dados |
| `predeploy` | Antes do código ser implantado | Construir ativos front-end, rodar testes unitários |
| `postdeploy` | Depois que o código está ativo | Executar migrações no BD, testar rapidamente o endpoint |

Ganchos vivem em seu `azure.yaml`. Aqui está o menor exemplo possível—ele apenas imprime uma mensagem após a implantação:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Isso é tudo — da próxima vez que você executar `azd up`, a mensagem será impressa automaticamente. Você também pode executar um gancho sozinho, sem uma implantação completa, o que é ótimo para testes:

```bash
azd hooks run postdeploy
```

As fases abaixo mostram ganchos reais (migrações, testes, validação) para cada etapa.

### Fase 1: Ganchos Pré-Provisionamento
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
- Cria ou atualiza recursos do Azure
- Configura rede e segurança
- Configura monitoramento e logs

### Fase 3: Ganchos Pós-Provisionamento
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
- Cria artefatos de implantação
- Empacota para a plataforma alvo (containers, arquivos ZIP, etc.)

### Fase 5: Ganchos Pré-Implantação
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
- Implanta aplicações empacotadas nos serviços Azure
- Atualiza configurações
- Inicia/reinicia serviços

### Fase 7: Ganchos Pós-Implantação
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

### Tratando Erros em Ganchos

Por padrão, **se um comando gancho termina com código diferente de zero, o azd para toda a operação.** Normalmente, é isso que você quer — uma migração falha deve interromper a implantação, não lançar um app com erros. Mas isso significa que os ganchos devem ser escritos com cuidado.

**1. Faça as falhas serem evidentes e intencionais.** Um gancho falha quando seu último comando retorna código de saída diferente de zero. Em scripts shell, adicione `set -e` para que o gancho pare no primeiro comando que falhar, em vez de continuar silenciosamente:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Permita que um gancho falhe sem parar o azd.** Para passos não críticos (aquecimento opcional de cache, notificação sem garantia), defina `continueOnError: true`. O azd registra a falha mas continua:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Teste ganchos isoladamente antes de uma execução completa.** Você não precisa executar `azd up` para depurar um gancho — execute-o sozinho e iterate rapidamente:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Fique atento a shells específicos do sistema operacional.** Um gancho usando `shell: pwsh` precisa do PowerShell instalado na máquina que o executa (incluindo agentes CI). Use `shell: sh` para a compatibilidade mais ampla, ou forneça variantes `windows` e `posix`:

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

> **Dica de depuração:** execute qualquer comando azd com `--debug` para ver a linha exata do comando gancho e sua saída completa—inestimável quando um gancho funciona localmente mas falha no CI.

## 🎛️ Configuração de Implantação

### Configurações de Implantação Específicas do Serviço
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

### Configurações Específicas do Ambiente

Estes são valores locais do azd somente. Mapear explicitamente para a configuração da infraestrutura/tempo de execução. `NODE_ENV` é normalmente `production` para um app Node implantado, incluindo implantação de staging; use uma variável específica do aplicativo para distinguir estágios de implantação.

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

## 🔧 Cenários Avançados de Implantação

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

### Implantações Blue-Green

**Esboço operacional ilustrativo:** você deve fornecer ambos os ambientes, uma camada compartilhada de roteamento de tráfego e os dois scripts abaixo. O azd não troca tráfego nem valida prontidão para rollback automaticamente. Mantenha o verde até que o azul tenha passado nos testes e o rollback não seja mais necessário.

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

### Implantações Canary
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Divisão de tráfego pertence à configuração do Container Apps (Bicep ou Azure CLI), não a uma propriedade `azure.yaml` `trafficSplit` do azd. Pré-visualização/provisionamento e implantações posteriores devem preservar o modo de revisão escolhido e regras de roteamento.

### Implantações em Estágios
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

## 🐳 Implantações em Contêineres

### Implantações de Container App
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

Configure segredos em tempo de execução com `configuration.secrets`/`secretRef` (ou referências do Key Vault) e escala com `template.scale` na infraestrutura do Container App. Não crie propriedades de serviço `secrets` ou `scale` em `azure.yaml`.

### Otimização Multi-Estágio de Dockerfile
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

## ⚡ Otimização de Desempenho

### Implantações Específicas de Serviço
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Cache de Build
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

O fluxo padrão para Node usa scripts de pacote; ganchos `prepackage` do serviço podem adicionar passos requeridos. Cache de camadas Docker é separado da definição do comando de build do serviço.

### Implantações Eficientes de Código
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Monitoramento da Implantação

### Monitoramento da Implantação em Tempo Real
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Health Checks
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

Seu app deve implementar `/health`; não é suprido automaticamente pelo azd. Não existe propriedade genérica de serviço `azure.yaml` `healthCheck`.

### Validação Pós-Implantação
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

## 🔐 Considerações de Segurança

### Gerenciamento de Segredos
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` é inválido. Valores comuns de ambiente são texto puro local; não presuma que comandos de leitura os redigam. Os comandos acima salvam referências ao Key Vault, mas sua infraestrutura/aplicação deve consumir os segredos e conceder acesso à identidade em tempo de execução.

### Segurança de Rede
Declare e consuma parâmetros de rede em Bicep, e os mapeie em `infra/main.parameters.json`. Não há sobreposição genérica `infra.parameters` em `azure.yaml`. Exemplos de documentação com intervalos `203.0.113.0/24` e `198.51.100.0/24` não são redes reais de escritório/VPN; substitua-os por intervalos autorizados.

### Gerenciamento de Identidade e Acesso
Habilite a `identity` do Container App em Bicep e atribua a função necessária do plano de dados do Key Vault no escopo do cofre. Configure segredos nomeados respaldados no Key Vault e referências em execução nesse recurso; `identity` e `keyVault` não são propriedades genéricas de serviço azd. Veja [Autenticação & Identidade Gerenciada](../chapter-03-configuration/authsecurity.md).

## 🚨 Estratégias de Rollback

### Rollback Rápido
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

### Rollback da Infraestrutura
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validação da Infraestrutura
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Próximos Passos

- [Provisionamento de Recursos](provisioning.md) - Mergulho profundo no gerenciamento de infraestrutura
- [Planejamento Pré-Implantação](../chapter-06-pre-deployment/capacity-planning.md) - Planeje sua estratégia de implantação
- [Problemas Comuns](../chapter-07-troubleshooting/common-issues.md) - Resolva problemas de implantação
- [Melhores Práticas](../chapter-07-troubleshooting/debugging.md) - Estratégias de implantação prontas para produção

## 🎯 Exercícios Práticos de Implantação

### Exercício 1: Fluxo de Implantação Incremental (20 minutos)
**Objetivo**: Dominar a diferença entre implantações completas e incrementais

**Ponto de partida:** Bash, Node.js 22, Git, login azd e uma assinatura Azure com permissões de implantação. Execute em um diretório novo; espere recursos billables de App Service/Cosmos DB. Os tempos dependem da região e do template.

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

**Critérios de Sucesso:**
- [ ] Registre o tempo decorrido para ambos os comandos (não há duração garantida)
- [ ] Ambos os comandos concluem com sucesso
- [ ] A API permanece funcional; a edição apenas de comentário não é mudança visível na UI
- [ ] Infraestrutura inalterada após `azd deploy`

**Resultado de Aprendizado**: `azd deploy` pula o provisionamento de infraestrutura. Compare os tempos medidos em vez de assumir uma velocidade fixa percentual.

### Exercício 2: Ganchos Personalizados de Implantação (30 minutos)
**Objetivo**: Implementar automação pré e pós-implantação

**Ponto de partida:** o projeto `deployment-practice` inicializado acima. Se você limpou, execute `azd up` novamente antes de testar a implantação só de código. A validação abaixo usa o script real de build da API, não um script `test:unit` raiz inexistente. Os testes da API do template precisam de acesso configurado ao banco de dados; não são testes unitários isolados.

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

**Critérios de Sucesso:**
- [ ] Script pré-implantação executa antes da implantação
- [ ] Implantação aborta se a validação da build falhar
- [ ] Teste rápido pós-implantação valida saúde
- [ ] Ganchos executam na ordem correta

### Exercício 3: Estratégia de Implantação Multi-Ambiente (45 minutos)
**Objetivo**: Implementar fluxo de implantação em estágios (dev → staging → produção)

**Ponto de partida:** o mesmo projeto todo inicializado com `jq`. Crie os ambientes abaixo com valores reais de assinatura/localização (ou defina `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` em cada um) **antes** de invocar o fluxo de trabalho sem prompt. Ele falha intencionalmente em vez de inventar valores ausentes. Use apenas ambientes de treinamento descartáveis, não uma assinatura de produção real.

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

**Critérios de Sucesso:**
- [ ] Ambiente de Dev implanta com sucesso
- [ ] Ambiente de Staging implanta com sucesso
- [ ] Aprovação manual requerida para produção
- [ ] Todos os ambientes possuem verificações de integridade funcionando
- [ ] Pode reverter se necessário

### Exercício 4: Estratégia de Rollback (25 minutos)
**Objetivo**: Implementar e testar rollback de implantação usando Git

**Ponto de partida:** um checkout de treinamento isolado do template todo com todo o código base inicial comprometido, uma árvore de trabalho limpa do Git e um ambiente configurado descartável. Nunca introduza falhas deliberadas em um projeto de produção real. `APP_VERSION` abaixo é apenas registro contábil, a menos que você o integre explicitamente no app.

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

**Critérios de Sucesso:**
- [ ] Pode detectar falhas de implantação
- [ ] Script de rollback executa automaticamente
- [ ] Aplicação retorna ao estado funcional
- [ ] Verificações de integridade passam após rollback

## 📊 Acompanhamento de Métricas de Implantação

### Acompanhe o Desempenho da Sua Implantação

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

**Analise suas métricas:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Recursos Adicionais

- [Referência de Implantação da Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
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
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->