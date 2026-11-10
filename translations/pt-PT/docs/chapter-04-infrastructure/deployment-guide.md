# Guia de Implementação - Dominar as Implementações com AZD

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 4 - Infraestrutura como Código e Implementação
- **⬅️ Capítulo Anterior**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)
- **➡️ Próximo**: [Provisionamento de Recursos](provisioning.md)
- **🧩 Também neste capítulo**: [Criar o Seu Próprio Modelo](custom-templates.md)
- **🚀 Próximo Capítulo**: [Capítulo 5: Soluções de IA Multi-Agente](../../examples/retail-scenario.md)

## Introdução

> Revisado com base em `azd 1.37.2` (Novembro 2026). Os comandos utilizam Bash; os exemplos em JSON requerem `jq`. Exceto pelo exercício TODO explicitamente inicializado, os exemplos avançados são **fragmentos de integração**: forneça o seu próprio código-fonte, infraestrutura, testes e scripts. Nenhuma implementação Azure foi executada nesta revisão.

Este guia abrangente cobre tudo o que precisa de saber sobre a implementação de aplicações usando o Azure Developer CLI, desde implementações básicas com um único comando a cenários avançados de produção com ganchos personalizados, múltiplos ambientes e integração CI/CD. Domine o ciclo completo de implementação com exemplos práticos e as melhores práticas.

## Objetivos de Aprendizagem

Ao completar este guia, você irá:
- Dominar todos os comandos e fluxos de trabalho de implementação do Azure Developer CLI
- Compreender o ciclo completo de implementação desde o provisionamento até a monitorização
- Implementar ganchos personalizados de implementação para automação pré e pós-implementação
- Configurar múltiplos ambientes com parâmetros específicos para cada ambiente
- Configurar estratégias avançadas de implementação incluindo implementações blue-green e canary
- Integrar as implementações azd com pipelines CI/CD e fluxos de trabalho DevOps

## Resultados Esperados

Após a conclusão, será capaz de:
- Executar e resolver problemas em todos os fluxos de trabalho de implementação azd de forma independente
- Desenhar e implementar automação personalizada de implementações usando ganchos
- Configurar implementações prontas para produção com segurança e monitorização apropriadas
- Gerir cenários complexos de implementação multi-ambiente
- Otimizar o desempenho das implementações e aplicar estratégias de rollback
- Integrar as implementações azd nas práticas corporativas de DevOps

## Visão Geral da Implementação

O Azure Developer CLI proporciona vários comandos de implementação:
- `azd up` - Fluxo completo (provisionar + implementar)
- `azd provision` - Criar/atualizar apenas recursos Azure
- `azd deploy` - Implementar apenas código da aplicação
- `azd package` - Construir e empacotar aplicações

## Fluxos Básicos de Implementação

### Implementação Completa (azd up)
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

### Implementação Apenas de Infraestrutura
Quando só precisa de atualizar recursos Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Implementação Apenas de Código
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

### ✅ Verificação da Implementação

Após qualquer implementação, verifique o sucesso:

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
- ✅ `azd show` resolve para os destinos/URLs esperados do serviço
- ✅ Pedidos para as rotas reais da aplicação retornam o estado e corpo esperados
- ✅ Nenhum registo de erros nos últimos 5 minutos
- ✅ A aplicação responde aos pedidos de teste

## 🏗️ Compreender o Processo de Implementação

### Novo em ganchos? Comece aqui

Um **gancho** é um comando que o azd executa automaticamente num momento específico do processo de implementação—antes ou depois do provisionamento, e antes ou depois de implementar o seu código. Eles permitem-lhe automatizar as pequenas tarefas que sempre rodeiam uma implementação: popular uma base de dados, executar migrações, construir ativos, ou testar rapidamente a aplicação em produção.

| Gancho | Executa-se… | Uso comum |
|------|-------------|-----------|
| `preprovision` | Antes de os recursos serem criados | Validar pré-requisitos, autenticar num registo |
| `postprovision` | Depois de os recursos existirem | Configurar recursos, preparar base de dados |
| `predeploy` | Antes de o código ser implementado | Construir ativos front-end, executar testes unitários |
| `postdeploy` | Depois do código estar ativo | Executar migrações de BD, testar endpoint |

Os ganchos vivem no seu `azure.yaml`. Aqui está o exemplo mais pequeno possível—imprime apenas uma mensagem após a implementação:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

É isso—na próxima vez que executar `azd up`, a mensagem imprime-se automaticamente. Também pode executar um gancho isoladamente, sem uma implementação completa, o que é ótimo para testes:

```bash
azd hooks run postdeploy
```

As fases abaixo mostram ganchos do mundo real (migrações, testes, validação) para cada etapa.

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
- Lê modelos de infraestrutura (Bicep/Terraform)
- Cria ou atualiza recursos Azure
- Configura rede e segurança
- Configura monitorização e registos

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
- Compila o código da aplicação
- Cria artefactos de implementação
- Empacota para a plataforma alvo (contenedores, ficheiros ZIP, etc.)

### Fase 5: Ganchos Pré-Implementação
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
- Atualiza definições de configuração
- Inicia/reinicia serviços

### Fase 7: Ganchos Pós-Implementação
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

### Tratamento de Erros nos Ganchos

Por defeito, **se um comando de gancho terminar com um código diferente de zero, o azd para toda a operação.** Isto normalmente é desejável—uma migração falhada deve interromper a implementação, não enviar uma aplicação com erros. Mas significa que os ganchos precisam de ser escritos com cuidado.

**1. Faça os erros serem evidentes e intencionais.** Um gancho falha quando o seu último comando retorna código de saída diferente de zero. Em scripts shell, adicione `set -e` para que o gancho pare no primeiro comando que falha em vez de continuar silenciosamente:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Permita que um gancho falhe sem parar o azd.** Para passos não-críticos (aquecimento opcional de cache, notificação por melhor esforço), configure `continueOnError: true`. O azd regista a falha mas continua a execução:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Teste ganchos isoladamente antes de uma execução completa.** Não precisa de executar `azd up` para depurar um gancho—execute-o sozinho e itere rapidamente:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Cuidado com shells específicos do sistema operativo.** Um gancho que utiliza `shell: pwsh` necessita do PowerShell instalado na máquina que o executa (incluindo agentes CI). Use `shell: sh` para a maior portabilidade, ou forneça ambas variantes `windows` e `posix`:

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

> **Dica de depuração:** execute qualquer comando azd com `--debug` para ver a linha exata do comando do gancho e a sua saída completa—inestimável quando um gancho funciona localmente mas falha no CI.

## 🎛️ Configuração da Implementação

### Definições de Implementação Específicas do Serviço
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

Estes são valores locais azd apenas. Mapear explicitamente para configuração da infraestrutura/execução. `NODE_ENV` é normalmente `production` para uma aplicação Node implementada, incluindo implementação staging; use uma variável específica da aplicação para distinguir estágios de implementação.

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

**Esboço operativo ilustrativo:** deve fornecer ambos ambientes, uma camada partilhada de encaminhamento de tráfego, e os dois scripts abaixo. O azd não troca tráfego nem valida preparação para rollback automaticamente. Mantenha o verde até o azul passar nos testes e o rollback deixar de ser necessário.

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

### Implementações Canary
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

A divisão de tráfego pertence à configuração do Container Apps (Bicep ou Azure CLI), não a uma propriedade `azure.yaml` `trafficSplit` do azd. A pré-visualização/provisionamento e implementações posteriores devem preservar o modo de revisão escolhido e as regras de encaminhamento.

### Implementações em Estágios
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

## 🐳 Implementações de Contêineres

### Implementações de Container App
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

Configure segredos de runtime com `configuration.secrets`/`secretRef` (ou referências ao Key Vault) e escalamento com `template.scale` na infraestrutura do Container App. Não crie propriedades `secrets` ou `scale` ao nível do serviço no `azure.yaml`.

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

### Implementações Específicas do Serviço
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Cache de Construção
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

O fluxo padrão Node usa scripts do package; ganchos `prepackage` do serviço podem adicionar passos necessários. O cache de camadas Docker é independente da definição do comando de construção do serviço.

### Implementações Eficientes de Código
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Monitorização da Implementação

### Monitorização em Tempo Real da Implementação
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Verificações de Saúde
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

A sua app deve implementar `/health`; não é fornecida automaticamente pelo azd. Não existe uma propriedade genérica de serviço `azure.yaml` `healthCheck`.

### Validação Pós-Implementação
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

### Gestão de Segredos
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` é inválido. Valores de ambiente comuns são texto plano local; não presuma que comandos de leitura os ocultem. Os comandos acima guardam referências ao Key Vault, mas a sua infraestrutura/aplicação deve ainda consumir os segredos e conceder acesso ao runtime.

### Segurança de Rede
Declare e consuma parâmetros de rede em Bicep, e mapeie-os em `infra/main.parameters.json`. Não existe uma sobreposição genérica `infra.parameters` em `azure.yaml`. Intervalos de documentação exemplares `203.0.113.0/24` e `198.51.100.0/24` não são redes reais de escritório/VPN; substitua por intervalos autorizados.

### Gestão de Identidade e Acesso
Ative o `identity` do Container App em Bicep e atribua o papel necessário de plano de dados do Key Vault ao âmbito do cofre. Configure segredos nomeados com suporte do Key Vault e referências de runtime nesse recurso; `identity` e `keyVault` não são propriedades genéricas do serviço azd. Veja [Autenticação & Identidade Gerida](../chapter-03-configuration/authsecurity.md).

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

### 4. Documentação e Registos
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Próximos Passos

- [Provisionamento de Recursos](provisioning.md) - Análise aprofundada de gestão de infraestrutura
- [Planeamento Pré-Implementação](../chapter-06-pre-deployment/capacity-planning.md) - Planeie a sua estratégia de implementação
- [Problemas Comuns](../chapter-07-troubleshooting/common-issues.md) - Resolva problemas de implementação
- [Melhores Práticas](../chapter-07-troubleshooting/debugging.md) - Estratégias de implementação prontas para produção

## 🎯 Exercícios Práticos de Implementação

### Exercício 1: Fluxo Incremental de Implementação (20 minutos)
**Objetivo**: Dominar a diferença entre implementações completas e incrementais

**Ponto de partida:** Bash, Node.js 22, Git, login azd e uma subscrição Azure com permissões de implementação. Execute numa pasta nova; espere recursos faturáveis de App Service/Cosmos DB. Os tempos dependem da região e modelo.

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
- [ ] Registar tempo decorrido para ambos comandos (não há duração garantida)
- [ ] Ambos os comandos completam com sucesso
- [ ] API permanece funcional; a edição só com comentários não altera a UI visível
- [ ] Infraestrutura inalterada após `azd deploy`

**Resultado de Aprendizagem**: `azd deploy` ignora o provisionamento de infraestrutura. Compare tempos medidos em vez de assumir uma aceleração percentual fixa.

### Exercício 2: Ganchos Personalizados de Implementação (30 minutos)
**Objetivo**: Implementar automação pré e pós-implementação

**Ponto de partida:** o projeto `deployment-practice` inicializado acima. Se o limpou, execute `azd up` outra vez antes de testar implementações só de código. A validação abaixo usa o script de construção real da API, não um script `test:unit` raiz inexistente. Os testes da API do modelo precisam de acesso configurado à base de dados; não são testes unitários isolados.

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
- [ ] O script pré-implementação executa antes da implementação
- [ ] A implementação aborta se a validação da construção falhar
- [ ] O teste rápido pós-implementação valida a saúde
- [ ] Os ganchos executam-se na ordem correta

### Exercício 3: Estratégia Multi-Ambiente de Implementação (45 minutos)
**Objetivo**: Implementar fluxo de implementação em etapas (dev → staging → produção)

**Ponto de partida:** o mesmo projeto inicializado de todo com `jq`. Crie os ambientes abaixo com valores reais de subscrição/localização (ou defina `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` em cada um) **antes** de invocar o fluxo de trabalho sem prompt. Este falha intencionalmente em vez de inventar valores em falta. Use apenas ambientes de treino descartáveis, não uma subscrição de produção real.

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
- [ ] O ambiente Dev é implantado com sucesso
- [ ] O ambiente Staging é implantado com sucesso
- [ ] Aprovação manual exigida para produção
- [ ] Todos os ambientes têm verificações de saúde funcionais
- [ ] Possibilidade de reverter se necessário

### Exercício 4: Estratégia de Reversão (25 minutos)
**Objetivo**: Implementar e testar a reversão da implantação usando Git

**Ponto de partida:** um checkout isolado de treino do template de todo com todo o código base comprometido, uma árvore de trabalho Git limpa, e um ambiente configurado descartável. Nunca introduza falhas deliberadas num projeto de produção real. `APP_VERSION` abaixo serve apenas para organização a menos que o ligue explicitamente à aplicação.

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
- [ ] Pode detetar falhas de implantação
- [ ] O script de reversão executa automaticamente
- [ ] A aplicação retorna ao estado funcional
- [ ] As verificações de saúde passam após a reversão

## 📊 Rastreio de Métricas de Implantação

### Rastreie o Desempenho da Sua Implantação

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

**Analise as suas métricas:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Recursos Adicionais

- [Referência de Implantação Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implantação Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implantação Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implantação Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navegação**
- **Lição Anterior**: [O Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **Próxima Lição**: [Provisionamento de Recursos](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->