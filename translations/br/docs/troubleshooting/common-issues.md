<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-17T21:25:32+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "br"
}
-->
# Problemas Comuns e Soluções

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Solução de Problemas e Depuração
- **⬅️ Capítulo Anterior**: [Capítulo 6: Verificações Prévias](../pre-deployment/preflight-checks.md)
- **➡️ Próximo**: [Guia de Depuração](debugging.md)
- **🚀 Próximo Capítulo**: [Capítulo 8: Padrões de Produção e Corporativos](../ai-foundry/production-ai-practices.md)

## Introdução

Este guia abrangente de solução de problemas aborda as questões mais frequentemente encontradas ao usar o Azure Developer CLI. Aprenda a diagnosticar, solucionar e resolver problemas comuns relacionados à autenticação, implantação, provisionamento de infraestrutura e configuração de aplicativos. Cada problema inclui sintomas detalhados, causas principais e procedimentos passo a passo para resolução.

## Objetivos de Aprendizado

Ao concluir este guia, você será capaz de:
- Dominar técnicas de diagnóstico para problemas no Azure Developer CLI
- Compreender problemas comuns de autenticação e permissões e suas soluções
- Resolver falhas de implantação, erros de provisionamento de infraestrutura e problemas de configuração
- Implementar estratégias proativas de monitoramento e depuração
- Aplicar metodologias sistemáticas de solução de problemas para questões complexas
- Configurar logs e monitoramento adequados para prevenir problemas futuros

## Resultados de Aprendizado

Após a conclusão, você será capaz de:
- Diagnosticar problemas no Azure Developer CLI usando ferramentas de diagnóstico integradas
- Resolver problemas relacionados à autenticação, assinatura e permissões de forma independente
- Solucionar falhas de implantação e erros de provisionamento de infraestrutura de maneira eficaz
- Depurar problemas de configuração de aplicativos e questões específicas de ambiente
- Implementar monitoramento e alertas para identificar problemas potenciais de forma proativa
- Aplicar as melhores práticas para fluxos de trabalho de registro, depuração e resolução de problemas

## Diagnósticos Rápidos

Antes de mergulhar em problemas específicos, execute estes comandos para coletar informações de diagnóstico:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Problemas de Autenticação

### Problema: "Falha ao obter token de acesso"
**Sintomas:**
- `azd up` falha com erros de autenticação
- Comandos retornam "não autorizado" ou "acesso negado"

**Soluções:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problema: "Privilégios insuficientes" durante a implantação
**Sintomas:**
- A implantação falha com erros de permissão
- Não é possível criar determinados recursos do Azure

**Soluções:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problema: Problemas de autenticação multi-locatário
**Soluções:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Erros de Provisionamento de Infraestrutura

### Problema: Conflitos de nomes de recursos
**Sintomas:**
- Erros "O nome do recurso já existe"
- A implantação falha durante a criação de recursos

**Soluções:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### Problema: Localização/Região não disponível
**Sintomas:**
- "A localização 'xyz' não está disponível para o tipo de recurso"
- Certos SKUs não estão disponíveis na região selecionada

**Soluções:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

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

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problema: Erros em templates Bicep
**Sintomas:**
- Falhas na validação do template
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

### Problema: Falhas na construção
**Sintomas:**
- O aplicativo falha ao ser construído durante a implantação
- Erros na instalação de pacotes

**Soluções:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Problema: Falhas na implantação de contêineres
**Sintomas:**
- Aplicativos em contêiner não iniciam
- Erros ao puxar imagens

**Soluções:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Falhas de conexão com o banco de dados
**Sintomas:**
- O aplicativo não consegue se conectar ao banco de dados
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
- O aplicativo não consegue ler valores de configuração
- Variáveis de ambiente aparecem vazias

**Soluções:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

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
- O frontend não consegue chamar a API
- Solicitação de origem cruzada bloqueada

**Soluções:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 Problemas de Gerenciamento de Ambiente

### Problema: Problemas ao alternar ambientes
**Sintomas:**
- Ambiente errado sendo usado
- Configuração não alterna corretamente

**Soluções:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

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

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 Problemas de Desempenho

### Problema: Tempos de implantação lentos
**Sintomas:**
- Implantações demorando muito
- Erros de tempo limite durante a implantação

**Soluções:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### Problema: Problemas de desempenho do aplicativo
**Sintomas:**
- Tempos de resposta lentos
- Alto uso de recursos

**Soluções:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Ferramentas e Comandos de Solução de Problemas

### Comandos de Depuração
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Análise de Logs
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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
- Problemas de infraestrutura com serviços do Azure
- Questões relacionadas a cobrança ou assinatura
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
Antes de entrar em contato com o suporte, colete:
- Saída de `azd version`
- Saída de `azd info`
- Mensagens de erro (texto completo)
- Passos para reproduzir o problema
- Detalhes do ambiente (`azd env show`)
- Linha do tempo de quando o problema começou

### Script de Coleta de Logs
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Prevenção de Problemas

### Checklist Pré-implantação
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
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Manutenção Regular
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Recursos Relacionados

- [Guia de Depuração](debugging.md) - Técnicas avançadas de depuração
- [Provisionamento de Recursos](../deployment/provisioning.md) - Solução de problemas de infraestrutura
- [Planejamento de Capacidade](../pre-deployment/capacity-planning.md) - Orientação para planejamento de recursos
- [Seleção de SKU](../pre-deployment/sku-selection.md) - Recomendações de níveis de serviço

---

**Dica**: Mantenha este guia nos favoritos e consulte-o sempre que encontrar problemas. A maioria dos problemas já foi enfrentada antes e possui soluções estabelecidas!

---

**Navegação**
- **Lição Anterior**: [Provisionamento de Recursos](../deployment/provisioning.md)
- **Próxima Lição**: [Guia de Depuração](debugging.md)

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte oficial. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.