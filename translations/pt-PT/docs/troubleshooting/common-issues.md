# Problemas Comuns e Soluções

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Resolução de Problemas e Depuração
- **⬅️ Capítulo Anterior**: [Capítulo 6: Verificações Prévias](../pre-deployment/preflight-checks.md)
- **➡️ Próximo**: [Guia de Depuração](debugging.md)
- **🚀 Próximo Capítulo**: [Capítulo 8: Padrões de Produção e Empresariais](../microsoft-foundry/production-ai-practices.md)

## Introdução

Este guia abrangente de resolução de problemas aborda as questões mais frequentemente encontradas ao usar o Azure Developer CLI. Aprenda a diagnosticar, solucionar e resolver problemas comuns relacionados à autenticação, implementação, provisionamento de infraestrutura e configuração de aplicações. Cada problema inclui sintomas detalhados, causas principais e procedimentos passo a passo para resolução.

## Objetivos de Aprendizagem

Ao concluir este guia, você irá:
- Dominar técnicas de diagnóstico para problemas no Azure Developer CLI
- Compreender problemas comuns de autenticação e permissões e suas soluções
- Resolver falhas de implementação, erros de provisionamento de infraestrutura e problemas de configuração
- Implementar estratégias proativas de monitorização e depuração
- Aplicar metodologias sistemáticas de resolução de problemas complexos
- Configurar registos e monitorização adequados para prevenir problemas futuros

## Resultados de Aprendizagem

Após a conclusão, você será capaz de:
- Diagnosticar problemas no Azure Developer CLI usando ferramentas de diagnóstico integradas
- Resolver problemas relacionados a autenticação, subscrição e permissões de forma independente
- Solucionar falhas de implementação e erros de provisionamento de infraestrutura de forma eficaz
- Depurar problemas de configuração de aplicações e problemas específicos de ambiente
- Implementar monitorização e alertas para identificar proativamente potenciais problemas
- Aplicar as melhores práticas para fluxos de trabalho de registo, depuração e resolução de problemas

## Diagnósticos Rápidos

Antes de mergulhar em problemas específicos, execute estes comandos para reunir informações de diagnóstico:

```bash
# Verificar a versão e o estado do azd
azd version
azd config list

# Verificar a autenticação do Azure
az account show
az account list

# Verificar o ambiente atual
azd env show
azd env get-values

# Ativar o registo de depuração
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

# 3. Usar o fluxo de código de dispositivo (para sistemas sem interface gráfica)
az login --use-device-code

# 4. Definir subscrição explícita
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problema: "Privilégios insuficientes" durante a implementação
**Sintomas:**
- Implementação falha com erros de permissão
- Não é possível criar certos recursos do Azure

**Soluções:**
```bash
# 1. Verifique as suas atribuições de funções no Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Certifique-se de que tem as funções necessárias
# - Contribuidor (para criação de recursos)
# - Administrador de Acesso de Utilizador (para atribuições de funções)

# 3. Contacte o administrador do Azure para obter as permissões adequadas
```

### Problema: Problemas de autenticação multi-inquilino
**Soluções:**
```bash
# 1. Iniciar sessão com um inquilino específico
az login --tenant "your-tenant-id"

# 2. Definir inquilino na configuração
azd config set auth.tenantId "your-tenant-id"

# 3. Limpar a cache do inquilino ao mudar de inquilinos
az account clear
```

## 🏗️ Erros de Provisionamento de Infraestrutura

### Problema: Conflitos de nomes de recursos
**Sintomas:**
- Erros "O nome do recurso já existe"
- Implementação falha durante a criação de recursos

**Soluções:**
```bash
# 1. Use nomes de recursos únicos com tokens
# No seu modelo Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Alterar o nome do ambiente
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Limpar os recursos existentes
azd down --force --purge
```

### Problema: Localização/Região não disponível
**Sintomas:**
- "A localização 'xyz' não está disponível para o tipo de recurso"
- Certos SKUs não disponíveis na região selecionada

**Soluções:**
```bash
# 1. Verificar locais disponíveis para tipos de recursos
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Usar regiões comumente disponíveis
azd config set defaults.location eastus2
# ou
azd env set AZURE_LOCATION eastus2

# 3. Verificar a disponibilidade do serviço por região
# Visitar: https://azure.microsoft.com/global-infrastructure/services/
```

### Problema: Erros de limite excedido
**Sintomas:**
- "Limite excedido para o tipo de recurso"
- "Número máximo de recursos atingido"

**Soluções:**
```bash
# 1. Verificar a utilização atual da quota
az vm list-usage --location eastus2 -o table

# 2. Solicitar aumento de quota através do portal Azure
# Ir para: Subscrições > Utilização + quotas

# 3. Utilizar SKUs menores para desenvolvimento
# Em main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Limpar recursos não utilizados
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problema: Erros em templates Bicep
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

# 4. Pré-visualizar as alterações de implementação
azd provision --preview
```

## 🚀 Falhas de Implementação

### Problema: Falhas na construção
**Sintomas:**
- Aplicação falha ao construir durante a implementação
- Erros na instalação de pacotes

**Soluções:**
```bash
# 1. Verificar os registos de compilação
azd logs --service web
azd deploy --service web --debug

# 2. Testar a compilação localmente
cd src/web
npm install
npm run build

# 3. Verificar a compatibilidade das versões do Node.js/Python
node --version  # Deve corresponder às definições do azure.yaml
python --version

# 4. Limpar a cache de compilação
rm -rf node_modules package-lock.json
npm install

# 5. Verificar o Dockerfile se estiver a usar contentores
docker build -t test-image .
docker run --rm test-image
```

### Problema: Falhas na implementação de contentores
**Sintomas:**
- Aplicações em contentores falham ao iniciar
- Erros ao puxar imagens

**Soluções:**
```bash
# 1. Testar a construção do Docker localmente
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Verificar os logs do contentor
azd logs --service api --follow

# 3. Verificar o acesso ao registo do contentor
az acr login --name myregistry

# 4. Verificar a configuração da aplicação do contentor
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Falhas de conexão com a base de dados
**Sintomas:**
- Aplicação não consegue conectar-se à base de dados
- Erros de tempo limite de conexão

**Soluções:**
```bash
# 1. Verificar as regras do firewall da base de dados
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testar a conectividade a partir da aplicação
# Adicionar temporariamente à sua aplicação:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verificar o formato da string de conexão
azd env get-values | grep DATABASE

# 4. Verificar o estado do servidor da base de dados
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemas de Configuração

### Problema: Variáveis de ambiente não funcionam
**Sintomas:**
- Aplicação não consegue ler valores de configuração
- Variáveis de ambiente aparecem vazias

**Soluções:**
```bash
# 1. Verificar se as variáveis de ambiente estão definidas
azd env get-values
azd env get DATABASE_URL

# 2. Verificar os nomes das variáveis em azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Reiniciar a aplicação
azd deploy --service web

# 4. Verificar a configuração do serviço da aplicação
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problema: Problemas com certificados SSL/TLS
**Sintomas:**
- HTTPS não funciona
- Erros de validação de certificado

**Soluções:**
```bash
# 1. Verificar o estado do certificado SSL
az webapp config ssl list --resource-group myrg

# 2. Ativar apenas HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Adicionar domínio personalizado (se necessário)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: Problemas de configuração CORS
**Sintomas:**
- Frontend não consegue chamar a API
- Pedido de origem cruzada bloqueado

**Soluções:**
```bash
# 1. Configurar CORS para o App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Atualizar a API para lidar com CORS
# No Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Verificar se está a executar nos URLs corretos
azd show
```

## 🌍 Problemas de Gestão de Ambientes

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

### Problema: Corrupção do ambiente
**Sintomas:**
- Ambiente mostra estado inválido
- Recursos não correspondem à configuração

**Soluções:**
```bash
# 1. Atualizar o estado do ambiente
azd env refresh

# 2. Repor a configuração do ambiente
azd env new production-reset
# Copiar as variáveis de ambiente necessárias
azd env set DATABASE_URL "your-value"

# 3. Importar recursos existentes (se possível)
# Atualizar manualmente .azure/production/config.json com os IDs dos recursos
```

## 🔍 Problemas de Desempenho

### Problema: Tempos de implementação lentos
**Sintomas:**
- Implementações demoram muito
- Tempos limite durante a implementação

**Soluções:**
```bash
# 1. Ativar implementação paralela
azd config set deploy.parallelism 5

# 2. Usar implementações incrementais
azd deploy --incremental

# 3. Otimizar o processo de construção
# No package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Verificar localizações de recursos (usar a mesma região)
azd config set defaults.location eastus2
```

### Problema: Problemas de desempenho da aplicação
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

# 2. Ativar monitorização do Application Insights
azd monitor

# 3. Verificar os registos da aplicação para identificar gargalos
azd logs --service api --follow

# 4. Implementar cache
# Adicionar cache Redis à sua infraestrutura
```

## 🛠️ Ferramentas e Comandos de Resolução de Problemas

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

### Análise de Registos
```bash
# Registos da aplicação
azd logs --service web --follow
azd logs --service api --since 1h

# Registos de recursos do Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Registos de contentores (para Aplicações de Contentores)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigação de Recursos
```bash
# Listar todos os recursos
az resource list --resource-group myrg -o table

# Verificar o estado do recurso
az webapp show --name myapp --resource-group myrg --query state

# Diagnósticos de rede
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Obter Ajuda Adicional

### Quando Escalar
- Problemas de autenticação persistem após tentar todas as soluções
- Problemas de infraestrutura com serviços do Azure
- Questões relacionadas a faturação ou subscrição
- Preocupações ou incidentes de segurança

### Canais de Suporte
```bash
# 1. Verificar o estado do serviço Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Criar um pedido de suporte no Azure
# Ir para: https://portal.azure.com -> Ajuda + suporte

# 3. Recursos da comunidade
# - Stack Overflow: etiqueta azure-developer-cli
# - Problemas no GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informações a Reunir
Antes de contactar o suporte, recolha:
- Saída de `azd version`
- Saída de `azd info`
- Mensagens de erro (texto completo)
- Passos para reproduzir o problema
- Detalhes do ambiente (`azd env show`)
- Linha do tempo de quando o problema começou

### Script de Coleta de Registos
```bash
#!/bin/bash
# recolher-info-de-depuração.sh

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

### Lista de Verificação Pré-implementação
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

# 5. Usar implementações de teste (dry-run)
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
- [Provisionamento de Recursos](../deployment/provisioning.md) - Resolução de problemas de infraestrutura
- [Planeamento de Capacidade](../pre-deployment/capacity-planning.md) - Orientação para planeamento de recursos
- [Seleção de SKU](../pre-deployment/sku-selection.md) - Recomendações de níveis de serviço

---

**Dica**: Mantenha este guia nos seus favoritos e consulte-o sempre que encontrar problemas. A maioria dos problemas já foi vista antes e possui soluções estabelecidas!

---

**Navegação**
- **Lição Anterior**: [Provisionamento de Recursos](../deployment/provisioning.md)
- **Próxima Lição**: [Guia de Depuração](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->