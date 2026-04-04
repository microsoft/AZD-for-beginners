# Problemas Comuns e Soluções

**Navegação no Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Resolução de Problemas e Depuração
- **⬅️ Capítulo Anterior**: [Capítulo 6: Verificações Prévias](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Seguinte**: [Guia de Depuração](debugging.md)
- **🚀 Próximo Capítulo**: [Capítulo 8: Padrões de Produção e Empresariais](../chapter-08-production/production-ai-practices.md)

## Introdução

Este guia abrangente de resolução de problemas cobre os problemas mais frequentemente encontrados ao usar o Azure Developer CLI. Aprenda a diagnosticar, resolver problemas e solucionar questões comuns com autenticação, implantação, provisão de infraestrutura e configuração de aplicações. Cada problema inclui sintomas detalhados, causas principais e procedimentos de resolução passo a passo.

## Objetivos de Aprendizagem

Ao completar este guia, irá:
- Dominar técnicas de diagnóstico para problemas do Azure Developer CLI
- Compreender problemas comuns de autenticação e permissões e as suas soluções
- Resolver falhas de implantação, erros de provisão de infraestrutura e problemas de configuração
- Implementar estratégias proativas de monitorização e depuração
- Aplicar metodologias sistemáticas de resolução de problemas para problemas complexos
- Configurar registos e monitorização apropriados para prevenir problemas futuros

## Resultados de Aprendizagem

Após a conclusão, será capaz de:
- Diagnosticar problemas do Azure Developer CLI utilizando ferramentas de diagnóstico incorporadas
- Resolver problemas relacionados com autenticação, subscrição e permissões de forma autónoma
- Solucionar falhas de implantação e erros de provisão de infraestrutura eficazmente
- Depurar problemas de configuração da aplicação e problemas específicos do ambiente
- Implementar monitorização e alertas para identificar proativamente potenciais problemas
- Aplicar melhores práticas para registos, depuração e fluxos de trabalho de resolução de problemas

## Diagnósticos Rápidos

Antes de aprofundar problemas específicos, execute estes comandos para recolher informações diagnósticas:

```bash
# Verificar a versão e o estado do azd
azd version
azd config show

# Verificar a autenticação Azure
az account show
az account list

# Verificar o ambiente atual
azd env list
azd env get-values

# Ativar registo de depuração
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
# 1. Reautenticar com o Azure CLI
az login
az account show

# 2. Limpar credenciais em cache
az account clear
az login

# 3. Usar fluxo de código de dispositivo (para sistemas sem interface)
az login --use-device-code

# 4. Definir subscrição explícita
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problema: "Privilégios insuficientes" durante a implantação
**Sintomas:**
- A implantação falha com erros de permissão
- Incapacidade de criar certos recursos Azure

**Soluções:**
```bash
# 1. Verifique as suas atribuições de funções no Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Certifique-se de que tem as funções necessárias
# - Contribuidor (para criação de recursos)
# - Administrador de Acesso de Utilizadores (para atribuições de funções)

# 3. Contacte o administrador do Azure para permissões adequadas
```

### Problema: Problemas de autenticação multi-inquilino
**Soluções:**
```bash
# 1. Iniciar sessão com um inquilino específico
az login --tenant "your-tenant-id"

# 2. Definir o inquilino na configuração
azd config set auth.tenantId "your-tenant-id"

# 3. Limpar a cache do inquilino ao mudar de inquilino
az account clear
```

## 🏗️ Erros de Provisão de Infraestrutura

### Problema: Conflitos de nomes de recursos
**Sintomas:**
- Erros "O nome do recurso já existe"
- Implantação falha durante a criação do recurso

**Soluções:**
```bash
# 1. Utilize nomes únicos de recursos com tokens
# No seu template Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Altere o nome do ambiente
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Limpe os recursos existentes
azd down --force --purge
```

### Problema: Localização/Região não disponível
**Sintomas:**
- "A localização 'xyz' não está disponível para tipo de recurso"
- Certos SKUs não disponíveis na região selecionada

**Soluções:**
```bash
# 1. Verificar locais disponíveis para tipos de recursos
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Utilizar regiões geralmente disponíveis
azd config set defaults.location eastus2
# ou
azd env set AZURE_LOCATION eastus2

# 3. Verificar a disponibilidade do serviço por região
# Visitar: https://azure.microsoft.com/global-infrastructure/services/
```

### Problema: Erros de excesso de quota
**Sintomas:**
- "Quota excedida para tipo de recurso"
- "Número máximo de recursos atingido"

**Soluções:**
```bash
# 1. Verificar o uso atual da quota
az vm list-usage --location eastus2 -o table

# 2. Solicitar aumento da quota através do portal Azure
# Ir para: Subscrições > Uso + quotas

# 3. Usar SKUs mais pequenos para desenvolvimento
# No main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Limpar recursos não utilizados
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problema: Erros no template Bicep
**Sintomas:**
- Falhas na validação do template
- Erros de sintaxe em ficheiros Bicep

**Soluções:**
```bash
# 1. Validar a sintaxe do Bicep
az bicep build --file infra/main.bicep

# 2. Usar o linter do Bicep
az bicep lint --file infra/main.bicep

# 3. Verificar a sintaxe do ficheiro de parâmetros
cat infra/main.parameters.json | jq '.'

# 4. Pré-visualizar alterações da implementação
azd provision --preview
```

## 🚀 Falhas na Implantação

### Problema: Falhas na construção
**Sintomas:**
- Aplicação falha a construir durante a implantação
- Erros na instalação de pacotes

**Soluções:**
```bash
# 1. Verificar saída da compilação com flag de depuração
azd deploy --service web --debug

# 2. Ver estado do serviço implantado
azd show

# 3. Testar compilação localmente
cd src/web
npm install
npm run build

# 3. Verificar compatibilidade da versão do Node.js/Python
node --version  # Deve corresponder às configurações do azure.yaml
python --version

# 4. Limpar cache da compilação
rm -rf node_modules package-lock.json
npm install

# 5. Verificar Dockerfile se estiver a usar contentores
docker build -t test-image .
docker run --rm test-image
```

### Problema: Falhas na implantação de contentores
**Sintomas:**
- Aplicações de contentores falham ao arrancar
- Erros ao puxar imagem

**Soluções:**
```bash
# 1. Testar a construção do Docker localmente
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Verificar os logs do contentor usando a Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitorizar a aplicação através do azd
azd monitor --logs

# 3. Verificar o acesso ao registo do contentor
az acr login --name myregistry

# 4. Verificar a configuração da aplicação de contentor
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Falhas na conexão à base de dados
**Sintomas:**
- Aplicação não consegue ligar à base de dados
- Erros de tempo limite de conexão

**Soluções:**
```bash
# 1. Verifique as regras do firewall da base de dados
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Teste a conectividade a partir da aplicação
# Adicione temporariamente à sua aplicação:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verifique o formato da string de conexão
azd env get-values | grep DATABASE

# 4. Verifique o estado do servidor da base de dados
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemas de Configuração

### Problema: Variáveis de ambiente não funcionam
**Sintomas:**
- App não consegue ler valores de configuração
- Variáveis de ambiente aparecem vazias

**Soluções:**
```bash
# 1. Verificar se as variáveis de ambiente estão definidas
azd env get-values
azd env get DATABASE_URL

# 2. Verificar os nomes das variáveis no azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Reiniciar a aplicação
azd deploy --service web

# 4. Verificar a configuração do serviço da aplicação
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problema: Problemas com certificado SSL/TLS
**Sintomas:**
- HTTPS não funciona
- Erros de validação do certificado

**Soluções:**
```bash
# 1. Verificar o estado do certificado SSL
az webapp config ssl list --resource-group myrg

# 2. Ativar apenas HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Adicionar domínio personalizado (se necessário)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: Problemas na configuração CORS
**Sintomas:**
- Frontend não consegue chamar API
- Pedido cross-origin bloqueado

**Soluções:**
```bash
# 1. Configurar CORS para o Serviço da Aplicação
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Atualizar API para lidar com CORS
# Em Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Verificar se está a correr nos URLs corretos
azd show
```

## 🌍 Problemas de Gestão de Ambiente

### Problema: Problemas na troca de ambiente
**Sintomas:**
- Ambiente errado a ser usado
- Configuração não troca corretamente

**Soluções:**
```bash
# 1. Listar todos os ambientes
azd env list

# 2. Selecionar ambiente explicitamente
azd env select production

# 3. Verificar ambiente atual
azd env list

# 4. Criar novo ambiente se estiver corrompido
azd env new production-new
azd env select production-new
```

### Problema: Corrupção do ambiente
**Sintomas:**
- Ambiente mostra estado inválido
- Recursos não correspondem à configuração

**Soluções:**
```bash
# 1. Atualizar o estado do ambiente
azd env refresh

# 2. Reiniciar a configuração do ambiente
azd env new production-reset
# Copiar as variáveis de ambiente necessárias
azd env set DATABASE_URL "your-value"

# 3. Importar recursos existentes (se possível)
# Atualizar manualmente o ficheiro .azure/production/config.json com os IDs dos recursos
```

## 🔍 Problemas de Performance

### Problema: Tempos de implantação lentos
**Sintomas:**
- Implantações a demorar demasiado
- Timeouts durante a implantação

**Soluções:**
```bash
# 1. Implantar serviços específicos para uma iteração mais rápida
azd deploy --service web
azd deploy --service api

# 2. Usar implantação apenas de código quando a infraestrutura não for alterada
azd deploy  # Mais rápido que azd up

# 3. Otimizar o processo de construção
# No package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Verificar localizações dos recursos (usar a mesma região)
azd config set defaults.location eastus2
```

### Problema: Problemas de performance da aplicação
**Sintomas:**
- Tempos de resposta lentos
- Uso elevado de recursos

**Soluções:**
```bash
# 1. Aumentar recursos
# Atualize o SKU em main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Ativar monitorização do Application Insights
azd monitor --overview

# 3. Verificar os registos da aplicação no Azure
az webapp log tail --name myapp --resource-group myrg
# ou para Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementar cache
# Adicione cache Redis à sua infraestrutura
```

## 🛠️ Ferramentas e Comandos de Resolução de Problemas

### Comandos de Depuração
```bash
# Depuração abrangente
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Verificar versão do azd
azd version

# Ver configuração atual
azd config show

# Testar conectividade
curl -v https://myapp.azurewebsites.net/health
```

### Análise de Logs
```bash
# Registos da aplicação via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitorizar aplicação com azd
azd monitor --logs
azd monitor --live

# Registos de recursos Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Registos do contentor (para Aplicações de Contentor)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigação de Recursos
```bash
# Listar todos os recursos
az resource list --resource-group myrg -o table

# Verificar o estado do recurso
az webapp show --name myapp --resource-group myrg --query state

# Diagnóstico de rede
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Obter Ajuda Adicional

### Quando Escalar
- Problemas de autenticação persistem após tentar todas as soluções
- Problemas de infraestrutura com serviços Azure
- Problemas relacionados com faturação ou subscrição
- Questões ou incidentes de segurança

### Canais de Suporte
```bash
# 1. Verificar o estado dos serviços Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Criar um ticket de suporte Azure
# Ir para: https://portal.azure.com -> Ajuda + suporte

# 3. Recursos da comunidade
# - Stack Overflow: etiqueta azure-developer-cli
# - Problemas no GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informação a Recolher
Antes de contactar o suporte, recolha:
- Saída de `azd version`
- Saída de `azd config show`
- Saída de `azd show` (estado atual da implantação)
- Mensagens de erro (texto completo)
- Passos para reproduzir o problema
- Detalhes do ambiente (`azd env get-values`)
- Cronologia de quando o problema começou

### Script de Recolha de Logs
```bash
#!/bin/bash
# coleccionar-informacao-de-depuracao.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
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

# 2. Verificar quotas e limites
az vm list-usage --location eastus2

# 3. Validar modelos
az bicep build --file infra/main.bicep

# 4. Testar localmente primeiro
npm run build
npm run test

# 5. Usar implantações em modo simulado
azd provision --preview
```

### Configuração de Monitorização
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

- [Guia de Depuração](debugging.md) - Técnicas avançadas de depuração
- [Provisionamento de Recursos](../chapter-04-infrastructure/provisioning.md) - Resolução de problemas de infraestrutura
- [Planeamento de Capacidade](../chapter-06-pre-deployment/capacity-planning.md) - Orientação sobre planeamento de recursos
- [Seleção de SKU](../chapter-06-pre-deployment/sku-selection.md) - Recomendações para níveis de serviço

---

**Dica**: Mantenha este guia nos favoritos e consulte-o sempre que encontrar problemas. A maioria dos problemas já foi vista antes e tem soluções estabelecidas!

---

**Navegação**
- **Lição Anterior**: [Provisionamento de Recursos](../chapter-04-infrastructure/provisioning.md)
- **Lição Seguinte**: [Guia de Depuração](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->