# Common Issues and Solutions

**Chapter Navigation:**
- **📚 Página Inicial do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Solução de Problemas e Depuração
- **⬅️ Capítulo Anterior**: [Capítulo 6: Verificações Pré-implantação](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Próximo**: [Guia de Depuração](debugging.md)
- **🚀 Próximo Capítulo**: [Capítulo 8: Padrões de Produção & Enterprise](../chapter-08-production/production-ai-practices.md)

## Introdução

Este guia abrangente de solução de problemas cobre os problemas mais frequentemente encontrados ao usar o Azure Developer CLI. Aprenda a diagnosticar, solucionar e resolver problemas comuns com autenticação, implantação, provisionamento de infraestrutura e configuração de aplicações. Cada problema inclui sintomas detalhados, causas raiz e procedimentos de resolução passo a passo.

## Objetivos de Aprendizagem

Ao concluir este guia, você irá:
- Dominar técnicas de diagnóstico para problemas do Azure Developer CLI
- Entender problemas comuns de autenticação e permissões e suas soluções
- Resolver falhas de implantação, erros de provisionamento de infraestrutura e problemas de configuração
- Implementar estratégias proativas de monitoramento e depuração
- Aplicar metodologias sistemáticas de solução de problemas para problemas complexos
- Configurar logging e monitoramento adequados para evitar problemas futuros

## Resultados de Aprendizagem

Ao final, você será capaz de:
- Diagnosticar problemas do Azure Developer CLI usando ferramentas de diagnóstico integradas
- Resolver independentemente problemas relacionados à autenticação, assinatura e permissões
- Solucionar efetivamente falhas de implantação e erros de provisionamento de infraestrutura
- Depurar problemas de configuração de aplicação e problemas específicos de ambiente
- Implementar monitoramento e alertas para identificar proativamente problemas potenciais
- Aplicar as melhores práticas para logging, depuração e fluxos de trabalho de resolução de problemas

## Diagnósticos Rápidos

Antes de mergulhar em problemas específicos, execute estes comandos para coletar informações de diagnóstico:

```bash
# Verificar versão e integridade do azd
azd version
azd config list

# Verificar autenticação do Azure
az account show
az account list

# Verificar o ambiente atual
azd env show
azd env get-values

# Ativar logs de depuração
export AZD_DEBUG=true
azd <command> --debug
```

## Problemas de Autenticação

### Problema: "Failed to get access token"
**Sintomas:**
- `azd up` falha com erros de autenticação
- Comandos retornam "unauthorized" ou "access denied"

**Soluções:**
```bash
# 1. Reautenticar no Azure CLI
az login
az account show

# 2. Limpar credenciais em cache
az account clear
az login

# 3. Usar o fluxo de código do dispositivo (para sistemas sem interface gráfica)
az login --use-device-code

# 4. Definir a assinatura explicitamente
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problema: "Insufficient privileges" durante a implantação
**Sintomas:**
- A implantação falha com erros de permissão
- Não é possível criar certos recursos do Azure

**Soluções:**
```bash
# 1. Verifique suas atribuições de função no Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Certifique-se de que você possui as funções necessárias
# - Contributor (para criação de recursos)
# - User Access Administrator (para atribuições de função)

# 3. Entre em contato com o administrador do Azure para obter as permissões adequadas
```

### Problema: Problemas de autenticação multi-locatário
**Soluções:**
```bash
# 1. Fazer login com um locatário específico
az login --tenant "your-tenant-id"

# 2. Definir o locatário na configuração
azd config set auth.tenantId "your-tenant-id"

# 3. Limpar o cache do locatário ao alternar entre locatários
az account clear
```

## 🏗️ Erros de Provisionamento de Infraestrutura

### Problema: Conflitos de nome de recurso
**Sintomas:**
- Erros "The resource name already exists"
- A implantação falha durante a criação de recursos

**Soluções:**
```bash
# 1. Use nomes de recursos únicos com tokens
# No seu template Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Altere o nome do ambiente
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Remova recursos existentes
azd down --force --purge
```

### Problema: Local/Região não disponível
**Sintomas:**
- "The location 'xyz' is not available for resource type"
- Certos SKUs não estão disponíveis na região selecionada

**Soluções:**
```bash
# 1. Verifique os locais disponíveis para os tipos de recurso
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use regiões comumente disponíveis
azd config set defaults.location eastus2
# ou
azd env set AZURE_LOCATION eastus2

# 3. Verifique a disponibilidade do serviço por região
# Visite: https://azure.microsoft.com/global-infrastructure/services/
```

### Problema: Erros de cota excedida
**Sintomas:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Soluções:**
```bash
# 1. Verifique o uso atual da cota
az vm list-usage --location eastus2 -o table

# 2. Solicite aumento de cota pelo portal do Azure
# Vá para: Assinaturas > Uso + cotas

# 3. Use SKUs menores para desenvolvimento
# Em main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Remova recursos não utilizados
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problema: Erros em templates Bicep
**Sintomas:**
- Falhas de validação de template
- Erros de sintaxe em arquivos Bicep

**Soluções:**
```bash
# 1. Validar sintaxe do Bicep
az bicep build --file infra/main.bicep

# 2. Usar linter do Bicep
az bicep lint --file infra/main.bicep

# 3. Verificar sintaxe do arquivo de parâmetros
cat infra/main.parameters.json | jq '.'

# 4. Visualizar alterações de implantação
azd provision --preview
```

## 🚀 Falhas de Implantação

### Problema: Falhas de build
**Sintomas:**
- Aplicação falha ao compilar durante a implantação
- Erros na instalação de pacotes

**Soluções:**
```bash
# 1. Verificar a saída do build com a flag de depuração
azd deploy --service web --debug

# 2. Visualizar o status do serviço implantado
azd show

# 3. Testar o build localmente
cd src/web
npm install
npm run build

# 3. Verificar compatibilidade de versões do Node.js/Python
node --version  # Deve corresponder às configurações do azure.yaml
python --version

# 4. Limpar o cache de build
rm -rf node_modules package-lock.json
npm install

# 5. Verificar o Dockerfile se estiver usando contêineres
docker build -t test-image .
docker run --rm test-image
```

### Problema: Falhas na implantação de containers
**Sintomas:**
- Apps em container não inicializam
- Erros ao puxar imagem

**Soluções:**
```bash
# 1. Testar a construção da imagem Docker localmente
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Verificar os logs do contêiner usando a CLI do Azure
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitorar a aplicação com azd
azd monitor --logs

# 3. Verificar o acesso ao registro de contêineres
az acr login --name myregistry

# 4. Verificar a configuração do aplicativo de contêiner
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Falhas de conexão com o banco de dados
**Sintomas:**
- Aplicação não consegue conectar ao banco de dados
- Erros de timeout na conexão

**Soluções:**
```bash
# 1. Verifique as regras de firewall do banco de dados
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Teste a conectividade do aplicativo
# Adicione ao seu aplicativo temporariamente:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verifique o formato da string de conexão
azd env get-values | grep DATABASE

# 4. Verifique o status do servidor de banco de dados
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemas de Configuração

### Problema: Variáveis de ambiente não funcionando
**Sintomas:**
- App não consegue ler valores de configuração
- Variáveis de ambiente aparecem vazias

**Soluções:**
```bash
# 1. Verifique se as variáveis de ambiente estão definidas
azd env get-values
azd env get DATABASE_URL

# 2. Verifique os nomes das variáveis em azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Reinicie a aplicação
azd deploy --service web

# 4. Verifique a configuração do App Service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problema: Problemas com certificados SSL/TLS
**Sintomas:**
- HTTPS não funcionando
- Erros de validação de certificado

**Soluções:**
```bash
# 1. Verificar o status do certificado SSL
az webapp config ssl list --resource-group myrg

# 2. Habilitar apenas HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Adicionar domínio personalizado (se necessário)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: Problemas de configuração de CORS
**Sintomas:**
- Frontend não consegue chamar a API
- Requisição cross-origin bloqueada

**Soluções:**
```bash
# 1. Configure o CORS no App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Atualize a API para lidar com CORS
# No Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Verifique se está sendo executado nas URLs corretas
azd show
```

## 🌍 Problemas de Gerenciamento de Ambiente

### Problema: Problemas ao alternar ambientes
**Sintomas:**
- Ambiente errado sendo usado
- Configuração não alterna corretamente

**Soluções:**
```bash
# 1. Listar todos os ambientes
azd env list

# 2. Selecionar explicitamente o ambiente
azd env select production

# 3. Verificar o ambiente atual
azd env show

# 4. Criar novo ambiente se estiver corrompido
azd env new production-new
azd env select production-new
```

### Problema: Corrupção de ambiente
**Sintomas:**
- Ambiente mostra estado inválido
- Recursos não correspondem à configuração

**Soluções:**
```bash
# 1. Atualizar o estado do ambiente
azd env refresh

# 2. Redefinir a configuração do ambiente
azd env new production-reset
# Copiar as variáveis de ambiente necessárias
azd env set DATABASE_URL "your-value"

# 3. Importar recursos existentes (se possível)
# Atualize manualmente .azure/production/config.json com os IDs dos recursos
```

## 🔍 Problemas de Performance

### Problema: Tempos de implantação lentos
**Sintomas:**
- Implantações levando muito tempo
- Timeouts durante a implantação

**Soluções:**
```bash
# 1. Implantar serviços específicos para iteração mais rápida
azd deploy --service web
azd deploy --service api

# 2. Use implantação apenas de código quando a infraestrutura estiver inalterada
azd deploy  # Mais rápido que azd up

# 3. Otimize o processo de build
# No package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Verifique as localizações dos recursos (use a mesma região)
azd config set defaults.location eastus2
```

### Problema: Problemas de performance da aplicação
**Sintomas:**
- Tempos de resposta lentos
- Alto uso de recursos

**Soluções:**
```bash
# 1. Escalar recursos
# Atualize o SKU em main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Ativar o monitoramento do Application Insights
azd monitor --overview

# 3. Verificar os logs da aplicação no Azure
az webapp log tail --name myapp --resource-group myrg
# ou para Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementar cache
# Adicione um cache Redis à sua infraestrutura
```

## 🛠️ Ferramentas e Comandos de Solução de Problemas

### Comandos de Depuração
```bash
# Depuração abrangente
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Verificar a versão do azd
azd version

# Exibir configuração atual
azd config list

# Testar conectividade
curl -v https://myapp.azurewebsites.net/health
```

### Análise de Logs
```bash
# Logs do aplicativo via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitorar o aplicativo com azd
azd monitor --logs
azd monitor --live

# Logs de recursos do Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Logs de contêineres (para Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigação de Recursos
```bash
# Listar todos os recursos
az resource list --resource-group myrg -o table

# Verificar o status do recurso
az webapp show --name myapp --resource-group myrg --query state

# Diagnóstico de rede
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
# 1. Verificar o Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Criar ticket de suporte do Azure
# Acesse: https://portal.azure.com -> Ajuda e suporte

# 3. Recursos da comunidade
# - Stack Overflow: tag azure-developer-cli
# - Issues do GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informações a Reunir
Antes de contatar o suporte, colete:
- `azd version` output
- `azd config list` output
- `azd show` output (status atual da implantação)
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
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Prevenção de Problemas

### Lista de Verificação Pré-implantação
```bash
# 1. Validar autenticação
az account show

# 2. Verificar cotas e limites
az vm list-usage --location eastus2

# 3. Validar modelos
az bicep build --file infra/main.bicep

# 4. Testar localmente primeiro
npm run build
npm run test

# 5. Usar implantações em modo dry-run
azd provision --preview
```

### Configuração de Monitoramento
```bash
# Ativar o Application Insights
# Adicionar ao main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Configurar alertas
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Manutenção Regular
```bash
# Verificações de saúde semanais
./scripts/health-check.sh

# Revisão mensal de custos
az consumption usage list --billing-period-name 202401

# Revisão trimestral de segurança
az security assessment list --resource-group myrg
```

## Recursos Relacionados

- [Debugging Guide](debugging.md) - Técnicas avançadas de depuração
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Solução de problemas de infraestrutura
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Orientações para planejamento de recursos
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Recomendações de nível de serviço

---

**Dica**: Mantenha este guia nos favoritos e consulte-o sempre que encontrar problemas. A maioria dos problemas já foi vista antes e possui soluções consolidadas!

---

**Navegação**
- **Lição Anterior**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Próxima Lição**: [Guia de Depuração](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original, em seu idioma nativo, deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se uma tradução profissional realizada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->