# Problemas Comuns e Soluções

**Navegação pelo Capítulo:**
- **📚 Início do Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Resolução de Problemas & Depuração
- **⬅️ Capítulo Anterior**: [Capítulo 6: Verificações pré-voo](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Seguinte**: [Guia de Depuração](debugging.md)
- **🚀 Próximo Capítulo**: [Capítulo 8: Padrões de Produção & Empresariais](../chapter-08-production/production-ai-practices.md)

## Introdução

Este guia abrangente de resolução de problemas cobre os problemas mais frequentes ao usar o Azure Developer CLI. Aprenda a diagnosticar, resolver problemas e solucionar problemas comuns com autenticação, implantação, provisão de infraestrutura e configuração de aplicações. Cada problema inclui sintomas detalhados, causas principais e procedimentos de resolução passo a passo.

## Objetivos de Aprendizagem

Ao completar este guia, irá:
- Dominar técnicas de diagnóstico para problemas do Azure Developer CLI
- Compreender problemas comuns de autenticação e permissões e as suas soluções
- Resolver falhas de implantação, erros de provisão de infraestrutura e problemas de configuração
- Implementar estratégias proativas de monitorização e depuração
- Aplicar metodologias sistemáticas de resolução de problemas para casos complexos
- Configurar registos e monitorização apropriados para prevenir problemas futuros

## Resultados de Aprendizagem

Após completar, será capaz de:
- Diagnosticar problemas do Azure Developer CLI usando ferramentas de diagnóstico integradas
- Resolver problemas relacionados com autenticação, subscrição e permissões de forma autónoma
- Solucionar falhas de implantação e erros de provisão de infraestrutura eficazmente
- Depurar problemas de configuração de aplicação e problemas específicos de ambiente
- Implementar monitorização e alertas para identificar proativamente potenciais problemas
- Aplicar as melhores práticas para registos, depuração e fluxos de trabalho de resolução de problemas

## Diagnóstico Rápido

> Substitua nomes/IDs de exemplo pelos valores do seu ambiente. Fragmentos de Bash, Bicep, JavaScript e ficheiros de parâmetros são indicados separadamente abaixo; não são um script executável único. Reveja operações destrutivas e retire segredos antes de partilhar diagnósticos. `azd monitor --logs` abre um navegador; não transmite registos do terminal.

Antes de entrar em problemas específicos, execute estes comandos para recolher informação de diagnóstico:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## Problemas de Autenticação

### Problema: "Falha ao obter token de acesso"
**Sintomas:**
- `azd up` falha com erros de autenticação
- Comandos retornam "não autorizado" ou "acesso negado"

**Soluções:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### Problema: "Privilégios insuficientes" durante implantação
**Sintomas:**
- Implantação falha com erros de permissão
- Incapacidade para criar certos recursos Azure

**Soluções:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problema: Problemas de autenticação multi-inquilino
**Soluções:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Erros de Provisão de Infraestrutura

### Problema: Conflitos de nomes de recursos
**Sintomas:**
- Erros de "O nome do recurso já existe"
- Implantação falha durante a criação do recurso

**Soluções:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### Problema: Localização/Região não disponível
**Sintomas:**
- "A localização 'xyz' não está disponível para o tipo de recurso"
- Alguns SKUs não estão disponíveis na região selecionada

**Soluções:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Alterar a variável de localização não migra recursos existentes. Um grupo de recursos ou recurso existente pode rejeitar a alteração de localização; use um ambiente separado para uma reimplantação regional.

### Problema: Erros de cota excedida
**Sintomas:**
- "Cota excedida para o tipo de recurso"
- "Número máximo de recursos atingido"

**Soluções:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Para desenvolvimento, escolha um SKU menor suportado em `infra/main.parameters.json`:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problema: Erros em modelos Bicep
**Sintomas:**
- Falhas na validação do modelo
- Erros de sintaxe nos ficheiros Bicep

**Soluções:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 Falhas na Implantação

### Problema: Falhas na construção
**Sintomas:**
- Aplicação falha ao construir durante a implantação
- Erros na instalação de pacotes

**Soluções:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Problema: Falhas na implantação de contentores
**Sintomas:**
- Aplicações container falham ao iniciar
- Erros a puxar imagens

**Soluções:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Falhas na ligação à base de dados
**Sintomas:**
- Aplicação não consegue conectar à base de dados
- Erros de timeout na conexão

**Soluções:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemas de Configuração

### Problema: Variáveis de ambiente não funcionam
**Sintomas:**
- App não consegue ler valores de configuração
- Variáveis de ambiente parecem vazias

**Soluções:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problema: Problemas com certificados SSL/TLS
**Sintomas:**
- HTTPS não funciona
- Erros na validação de certificados

**Soluções:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: Problemas na configuração CORS
**Sintomas:**
- Frontend não consegue chamar API
- Pedido entre origens bloqueado

**Soluções:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Atualize a sua aplicação Express existente (com `cors` importado):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 Problemas de Gestão de Ambiente

### Problema: Problemas na mudança de ambiente
**Sintomas:**
- Ambiente errado a ser usado
- Configuração não muda corretamente

**Soluções:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Problema: Corrupção do ambiente
**Sintomas:**
- Ambiente mostra estado inválido
- Recursos não correspondem à configuração

**Soluções:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Problemas de Desempenho

### Problema: Tempos lentos de implantação
**Sintomas:**
- Implantações a demorar demasiado
- Timeouts durante a implantação

**Soluções:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### Problema: Problemas de desempenho da aplicação
**Sintomas:**
- Tempos de resposta lentos
- Uso elevado de recursos

**Soluções:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Ferramentas e Comandos de Resolução de Problemas

### Comandos de Depuração
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Análise de Registos
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigação de Recursos
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Obtenção de Ajuda Adicional

### Quando Escalar
- Problemas de autenticação persistem após tentar todas as soluções
- Problemas de infraestrutura com serviços Azure
- Problemas relacionados com faturação ou subscrição
- Preocupações ou incidentes de segurança

### Canais de Suporte
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informação a Recolher
Antes de contactar suporte, recolha:
- Output de `azd version`
- Output de `azd config show`
- Output de `azd show` (estado atual da implantação)
- Mensagens de erro (texto completo)
- Passos para reproduzir o problema
- Detalhes do ambiente editados (nunca partilhe `azd env get-values` cru, que pode conter segredos)
- Cronologia de quando o problema começou

### Script de Recolha de Registos
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Prevenção de Problemas

### Lista de Verificação Pré-implantação
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### Configuração de Monitorização
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### Manutenção Regular
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Recursos Relacionados

- [Guia de Depuração](debugging.md) - Técnicas avançadas de depuração
- [Provisão de Recursos](../chapter-04-infrastructure/provisioning.md) - Resolução de problemas de infraestrutura
- [Planeamento de Capacidade](../chapter-06-pre-deployment/capacity-planning.md) - Orientação sobre planeamento de recursos
- [Seleção de SKU](../chapter-06-pre-deployment/sku-selection.md) - Recomendações sobre níveis de serviço

---

**Dica**: Mantenha este guia como favorito e consulte-o sempre que encontrar problemas. A maioria dos problemas já foi vista antes e tem soluções estabelecidas!

---

**Navegação**
- **Lição Anterior**: [Provisão de Recursos](../chapter-04-infrastructure/provisioning.md)
- **Próxima Lição**: [Guia de Depuração](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->