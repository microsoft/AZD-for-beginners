<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-20T21:35:40+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "br"
}
-->
# Problemas Comuns e Soluções

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Solução de Problemas & Depuração
- **⬅️ Capítulo Anterior**: [Capítulo 6: Verificações Pré-implantação](../pre-deployment/preflight-checks.md)
- **➡️ Próximo**: [Guia de Depuração](debugging.md)
- **🚀 Próximo Capítulo**: [Capítulo 8: Padrões de Produção & Corporativos](../microsoft-foundry/production-ai-practices.md)

## Introdução

Este guia abrangente de solução de problemas aborda os problemas mais frequentemente encontrados ao usar o Azure Developer CLI. Aprenda a diagnosticar, solucionar e resolver problemas comuns relacionados à autenticação, implantação, provisionamento de infraestrutura e configuração de aplicativos. Cada problema inclui sintomas detalhados, causas principais e procedimentos passo a passo para resolução.

## Objetivos de Aprendizado

Ao concluir este guia, você irá:
- Dominar técnicas de diagnóstico para problemas no Azure Developer CLI
- Compreender problemas comuns de autenticação e permissões e suas soluções
- Resolver falhas de implantação, erros de provisionamento de infraestrutura e problemas de configuração
- Implementar estratégias proativas de monitoramento e depuração
- Aplicar metodologias sistemáticas de solução de problemas para questões complexas
- Configurar registros e monitoramento adequados para prevenir problemas futuros

## Resultados de Aprendizado

Após a conclusão, você será capaz de:
- Diagnosticar problemas no Azure Developer CLI usando ferramentas de diagnóstico integradas
- Resolver problemas relacionados à autenticação, assinatura e permissões de forma independente
- Solucionar falhas de implantação e erros de provisionamento de infraestrutura de maneira eficaz
- Depurar problemas de configuração de aplicativos e problemas específicos de ambiente
- Implementar monitoramento e alertas para identificar proativamente possíveis problemas
- Aplicar as melhores práticas para fluxos de trabalho de registro, depuração e resolução de problemas

## Diagnósticos Rápidos

Antes de mergulhar em problemas específicos, execute estes comandos para coletar informações de diagnóstico:

```bash
# Verificar a versão e a saúde do azd
azd version
azd config list

# Verificar autenticação do Azure
az account show
az account list

# Verificar ambiente atual
azd env show
azd env get-values

# Ativar registro de depuração
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
# 1. Reautenticar com Azure CLI
az login
az account show

# 2. Limpar credenciais em cache
az account clear
az login

# 3. Usar fluxo de código de dispositivo (para sistemas sem interface gráfica)
az login --use-device-code

# 4. Definir assinatura explícita
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problema: "Privilégios insuficientes" durante a implantação
**Sintomas:**
- Implantação falha com erros de permissão
- Não é possível criar certos recursos do Azure

**Soluções:**
```bash
# 1. Verifique suas atribuições de função no Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Certifique-se de que possui as funções necessárias
# - Contribuidor (para criação de recursos)
# - Administrador de Acesso de Usuário (para atribuições de função)

# 3. Entre em contato com o administrador do Azure para obter as permissões adequadas
```

### Problema: Problemas de autenticação multi-locatário
**Soluções:**
```bash
# 1. Faça login com um locatário específico
az login --tenant "your-tenant-id"

# 2. Defina o locatário na configuração
azd config set auth.tenantId "your-tenant-id"

# 3. Limpe o cache do locatário ao trocar de locatários
az account clear
```

## 🏗️ Erros de Provisionamento de Infraestrutura

### Problema: Conflitos de nome de recurso
**Sintomas:**
- Erros "O nome do recurso já existe"
- Implantação falha durante a criação de recursos

**Soluções:**
```bash
# 1. Use nomes de recursos únicos com tokens
# No seu template Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Alterar o nome do ambiente
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Limpar os recursos existentes
azd down --force --purge
```

### Problema: Local/Região não disponível
**Sintomas:**
- "A localização 'xyz' não está disponível para o tipo de recurso"
- Certos SKUs não estão disponíveis na região selecionada

**Soluções:**
```bash
# 1. Verifique locais disponíveis para tipos de recursos
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
- "Cota excedida para o tipo de recurso"
- "Número máximo de recursos atingido"

**Soluções:**
```bash
# 1. Verificar o uso atual de cota
az vm list-usage --location eastus2 -o table

# 2. Solicitar aumento de cota através do portal do Azure
# Ir para: Assinaturas > Uso + cotas

# 3. Usar SKUs menores para desenvolvimento
# Em main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Limpar recursos não utilizados
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problema: Erros de template Bicep
**Sintomas:**
- Falhas na validação do template
- Erros de sintaxe em arquivos Bicep

**Soluções:**
```bash
# 1. Validar a sintaxe do Bicep
az bicep build --file infra/main.bicep

# 2. Usar o linter do Bicep
az bicep lint --file infra/main.bicep

# 3. Verificar a sintaxe do arquivo de parâmetros
cat infra/main.parameters.json | jq '.'

# 4. Visualizar as alterações de implantação
azd provision --preview
```

## 🚀 Falhas de Implantação

### Problema: Falhas de build
**Sintomas:**
- Aplicativo falha ao construir durante a implantação
- Erros na instalação de pacotes

**Soluções:**
```bash
# 1. Verificar os logs de build
azd logs --service web
azd deploy --service web --debug

# 2. Testar o build localmente
cd src/web
npm install
npm run build

# 3. Verificar a compatibilidade de versão do Node.js/Python
node --version  # Deve corresponder às configurações do azure.yaml
python --version

# 4. Limpar o cache de build
rm -rf node_modules package-lock.json
npm install

# 5. Verificar o Dockerfile se estiver usando containers
docker build -t test-image .
docker run --rm test-image
```

### Problema: Falhas na implantação de contêineres
**Sintomas:**
- Aplicativos em contêiner falham ao iniciar
- Erros ao puxar imagens

**Soluções:**
```bash
# 1. Testar a construção do Docker localmente
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Verificar os logs do contêiner
azd logs --service api --follow

# 3. Verificar acesso ao registro do contêiner
az acr login --name myregistry

# 4. Verificar a configuração do aplicativo do contêiner
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Falhas de conexão com banco de dados
**Sintomas:**
- Aplicativo não consegue se conectar ao banco de dados
- Erros de tempo limite de conexão

**Soluções:**
```bash
# 1. Verificar regras de firewall do banco de dados
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testar conectividade a partir do aplicativo
# Adicionar ao seu aplicativo temporariamente:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verificar formato da string de conexão
azd env get-values | grep DATABASE

# 4. Verificar status do servidor do banco de dados
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemas de Configuração

### Problema: Variáveis de ambiente não funcionam
**Sintomas:**
- Aplicativo não consegue ler valores de configuração
- Variáveis de ambiente aparecem vazias

**Soluções:**
```bash
# 1. Verifique se as variáveis de ambiente estão definidas
azd env get-values
azd env get DATABASE_URL

# 2. Verifique os nomes das variáveis no azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Reinicie o aplicativo
azd deploy --service web

# 4. Verifique a configuração do serviço do aplicativo
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problema: Problemas com certificados SSL/TLS
**Sintomas:**
- HTTPS não funciona
- Erros de validação de certificado

**Soluções:**
```bash
# 1. Verificar o status do certificado SSL
az webapp config ssl list --resource-group myrg

# 2. Ativar apenas HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Adicionar domínio personalizado (se necessário)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: Problemas de configuração de CORS
**Sintomas:**
- Frontend não consegue chamar API
- Solicitação de origem cruzada bloqueada

**Soluções:**
```bash
# 1. Configure o CORS para o App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Atualize a API para lidar com o CORS
# No Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Verifique se está sendo executado nos URLs corretos
azd show
```

## 🌍 Problemas de Gerenciamento de Ambiente

### Problema: Problemas ao alternar ambientes
**Sintomas:**
- Ambiente errado sendo usado
- Configuração não alterna corretamente

**Soluções:**
```bash
# 1. Liste todos os ambientes
azd env list

# 2. Selecione explicitamente o ambiente
azd env select production

# 3. Verifique o ambiente atual
azd env show

# 4. Crie um novo ambiente se estiver corrompido
azd env new production-new
azd env select production-new
```

### Problema: Corrupção de ambiente
**Sintomas:**
- Ambiente mostra estado inválido
- Recursos não correspondem à configuração

**Soluções:**
```bash
# 1. Atualizar estado do ambiente
azd env refresh

# 2. Redefinir configuração do ambiente
azd env new production-reset
# Copiar as variáveis de ambiente necessárias
azd env set DATABASE_URL "your-value"

# 3. Importar recursos existentes (se possível)
# Atualizar manualmente .azure/production/config.json com IDs de recursos
```

## 🔍 Problemas de Desempenho

### Problema: Tempos de implantação lentos
**Sintomas:**
- Implantações demorando muito
- Erros de tempo limite durante a implantação

**Soluções:**
```bash
# 1. Habilitar implantação paralela
azd config set deploy.parallelism 5

# 2. Usar implantações incrementais
azd deploy --incremental

# 3. Otimizar o processo de build
# No package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Verificar locais de recursos (usar mesma região)
azd config set defaults.location eastus2
```

### Problema: Problemas de desempenho do aplicativo
**Sintomas:**
- Tempos de resposta lentos
- Alto uso de recursos

**Soluções:**
```bash
# 1. Escalar recursos
# Atualizar SKU em main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Habilitar monitoramento do Application Insights
azd monitor

# 3. Verificar os logs da aplicação para identificar gargalos
azd logs --service api --follow

# 4. Implementar cache
# Adicionar cache Redis à sua infraestrutura
```

## 🛠️ Ferramentas e Comandos de Solução de Problemas

### Comandos de Depuração
```bash
# Depuração abrangente
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Verificar informações do sistema
azd info

# Validar configuração
azd config validate

# Testar conectividade
curl -v https://myapp.azurewebsites.net/health
```

### Análise de Logs
```bash
# Logs de aplicação
azd logs --service web --follow
azd logs --service api --since 1h

# Logs de recursos do Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Logs de contêiner (para Aplicativos de Contêiner)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigação de Recursos
```bash
# Listar todos os recursos
az resource list --resource-group myrg -o table

# Verificar o status do recurso
az webapp show --name myapp --resource-group myrg --query state

# Diagnósticos de rede
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
# 1. Verificar a Saúde do Serviço Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Criar um ticket de suporte do Azure
# Vá para: https://portal.azure.com -> Ajuda + suporte

# 3. Recursos da comunidade
# - Stack Overflow: tag azure-developer-cli
# - Problemas no GitHub: https://github.com/Azure/azure-dev/issues
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
# coletar-info-de-depuração.sh

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
# 1. Validar autenticação
az account show

# 2. Verificar cotas e limites
az vm list-usage --location eastus2

# 3. Validar modelos
az bicep build --file infra/main.bicep

# 4. Testar localmente primeiro
npm run build
npm run test

# 5. Usar implantações de teste
azd provision --preview
```

### Configuração de Monitoramento
```bash
# Habilitar o Application Insights
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

# Revisão de custos mensais
az consumption usage list --billing-period-name 202401

# Revisão de segurança trimestral
az security assessment list --resource-group myrg
```

## Recursos Relacionados

- [Guia de Depuração](debugging.md) - Técnicas avançadas de depuração
- [Provisionamento de Recursos](../deployment/provisioning.md) - Solução de problemas de infraestrutura
- [Planejamento de Capacidade](../pre-deployment/capacity-planning.md) - Orientação para planejamento de recursos
- [Seleção de SKU](../pre-deployment/sku-selection.md) - Recomendações de níveis de serviço

---

**Dica**: Mantenha este guia nos favoritos e consulte-o sempre que encontrar problemas. A maioria dos problemas já foi vista antes e possui soluções estabelecidas!

---

**Navegação**
- **Lição Anterior**: [Provisionamento de Recursos](../deployment/provisioning.md)
- **Próxima Lição**: [Guia de Depuração](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional feita por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->