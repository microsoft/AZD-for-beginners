# Problemas Comuns e Soluções

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Solução de Problemas e Depuração
- **⬅️ Capítulo Anterior**: [Capítulo 6: Verificações Pré-voo](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Próximo**: [Guia de Depuração](debugging.md)
- **🚀 Próximo Capítulo**: [Capítulo 8: Padrões de Produção e Empresariais](../chapter-08-production/production-ai-practices.md)

## Introdução

Este guia abrangente de solução de problemas cobre as questões mais frequentemente encontradas ao usar o Azure Developer CLI. Aprenda a diagnosticar, solucionar e resolver problemas comuns com autenticação, implantação, provisionamento de infraestrutura e configuração de aplicativos. Cada problema inclui sintomas detalhados, causas raiz e procedimentos de resolução passo a passo.

## Objetivos de Aprendizagem

Ao concluir este guia, você irá:
- Dominar técnicas de diagnóstico para problemas do Azure Developer CLI
- Entender problemas comuns de autenticação e permissão e suas soluções
- Resolver falhas de implantação, erros de provisionamento de infraestrutura e problemas de configuração
- Implementar estratégias proativas de monitoramento e depuração
- Aplicar metodologias sistemáticas de solução de problemas para questões complexas
- Configurar logging e monitoramento adequados para prevenir problemas futuros

## Resultados de Aprendizagem

Após a conclusão, você será capaz de:
- Diagnosticar problemas do Azure Developer CLI usando ferramentas diagnósticas integradas
- Resolver problemas relacionados a autenticação, assinatura e permissões de forma independente
- Solucionar falhas de implantação e erros de provisionamento de infraestrutura efetivamente
- Depurar problemas de configuração de aplicativos e específicos do ambiente
- Implementar monitoramento e alertas para identificar proativamente problemas potenciais
- Aplicar melhores práticas para logging, depuração e fluxos de trabalho de resolução de problemas

## Diagnósticos Rápidos

> Substitua nomes/IDs de exemplo pelos valores do seu ambiente. Fragmentos de Bash, Bicep, JavaScript e arquivo de parâmetros são rotulados separadamente abaixo; eles não formam um único script executável. Reveja operações destrutivas e oculte segredos antes de compartilhar diagnósticos. `azd monitor --logs` abre um navegador; não transmite logs do terminal.

Antes de mergulhar em problemas específicos, execute estes comandos para coletar informações de diagnóstico:

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

### Problema: "Privilégios insuficientes" durante a implantação
**Sintomas:**
- Implantação falha com erros de permissão
- Não é possível criar certos recursos Azure

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

## 🏗️ Erros de Provisionamento de Infraestrutura

### Problema: Conflitos de nome de recurso
**Sintomas:**
- Erros "O nome do recurso já existe"
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
- Certos SKUs não disponíveis na região selecionada

**Soluções:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Alterar a variável de localização não migra recursos existentes. Um grupo de recursos ou recurso existente pode rejeitar a alteração de localização; use um ambiente separado para um redesdobramento regional.

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

### Problema: Erros no template Bicep
**Sintomas:**
- Falhas de validação do template
- Erros de sintaxe em arquivos Bicep

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

## 🚀 Falhas de Implantação

### Problema: Falhas na compilação
**Sintomas:**
- Aplicação falha ao compilar durante a implantação
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

### Problema: Falhas na implantação de contêiner
**Sintomas:**
- Aplicativos em contêiner falham ao iniciar
- Erros ao puxar imagens

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

### Problema: Falhas de conexão com banco de dados
**Sintomas:**
- Aplicação não consegue conectar ao banco de dados
- Erros de tempo limite de conexão

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

### Problema: Variáveis de ambiente não funcionando
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
- Erros de validação de certificado

**Soluções:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: Problemas de configuração CORS
**Sintomas:**
- Frontend não consegue chamar API
- Requisição cross-origin bloqueada

**Soluções:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Atualize sua aplicação Express existente (com `cors` importado):

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

## 🌍 Problemas de Gerenciamento de Ambiente

### Problema: Problemas ao trocar ambiente
**Sintomas:**
- Ambiente errado sendo usado
- Configuração não troca corretamente

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

### Problema: Corrupção de ambiente
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

### Problema: Tempos de implantação lentos
**Sintomas:**
- Implantações demorando muito
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

### Problema: Problemas de desempenho do aplicativo
**Sintomas:**
- Tempos de resposta lentos
- Alto uso de recursos

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

## 🛠️ Ferramentas e Comandos para Solução de Problemas

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

### Análise de Logs
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

## 🆘 Obtendo Ajuda Adicional

### Quando Escalar
- Problemas de autenticação persistem após tentar todas as soluções
- Problemas de infraestrutura com serviços Azure
- Problemas relacionados à cobrança ou assinatura
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

### Informações para Coletar
Antes de contatar o suporte, reúna:
- saída do `azd version`
- saída do `azd config show`
- saída do `azd show` (status atual da implantação)
- Mensagens de erro (texto completo)
- Passos para reproduzir o problema
- Detalhes do ambiente ocultados (nunca compartilhe `azd env get-values` cru, que pode conter segredos)
- Linha do tempo de quando o problema começou

### Script de Coleta de Logs
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

### Configuração de Monitoramento
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
- [Provisionamento de Recursos](../chapter-04-infrastructure/provisioning.md) - Solução de problemas de infraestrutura
- [Planejamento de Capacidade](../chapter-06-pre-deployment/capacity-planning.md) - Orientações para planejamento de recursos
- [Seleção de SKU](../chapter-06-pre-deployment/sku-selection.md) - Recomendações de nível de serviço

---

**Dica**: Mantenha este guia nos seus favoritos e consulte-o sempre que encontrar problemas. A maioria dos problemas já foi vista antes e possui soluções estabelecidas!

---

**Navegação**
- **Lição Anterior**: [Provisionamento de Recursos](../chapter-04-infrastructure/provisioning.md)
- **Próxima Lição**: [Guia de Depuração](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->