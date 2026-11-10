# Laboratório AI Workshop: Tornar as suas Soluções de IA Deployáveis com AZD

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Anterior**: [Desdobramento de Modelo de IA](ai-model-deployment.md)
- **➡️ Seguinte**: [Melhores Práticas para IA em Produção](../chapter-08-production/production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

## Visão Geral do Workshop

Este laboratório prático guia os desenvolvedores pelo processo de utilização de um modelo de IA existente e do seu desdobramento usando Azure Developer CLI (AZD). Aprenderá padrões essenciais para desdobramentos de IA em produção utilizando serviços Microsoft Foundry.

> **Revisão da versão (2026-11-04):** A orientação dos comandos AZD e os exemplos dos nomes de configuração foram verificados contra a versão `azd` `1.37.2` e a configuração atual do exemplo ligado. Esta é uma revisão de documentação, não uma validação de desdobramento ao vivo. O laboratório RAG não requer a extensão agent; para avaliações de agente, utilize a extensão `azure.ai.evaluations` separada e o [fluxo de trabalho de avaliação atual](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), não os comandos legados de avaliação de agente.

**Duração:** 2-3 horas  
**Nível:** Intermédio  
**Pré-requisitos:** Conhecimentos básicos em Azure, familiaridade com conceitos de IA/ML

## 🎓 Objetivos de Aprendizagem

No final deste workshop, será capaz de:
- ✅ Explorar um modelo AZD de IA existente e planear a conversão da sua própria aplicação
- ✅ Configurar serviços Microsoft Foundry com AZD
- ✅ Implementar gestão segura de credenciais para serviços de IA
- ✅ Desdobrar uma aplicação de referência de IA com monitorização
- ✅ Diagnosticar problemas comuns de desdobramento de IA

## Pré-Requisitos

### Ferramentas Necessárias
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado
- [Git](https://git-scm.com/) instalado
- Editor de código (VS Code recomendado)

Estes blocos de comando usam sintaxe Bash (incluindo continuações de linha e `grep`). No Windows, utilize Git Bash/WSL ou converta-os para PowerShell. Instale também as ferramentas de linguagem, gestor de pacotes e de contentores indicadas na [configuração local do ambiente do exemplo](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Recursos Azure
- Subscrição Azure com permissões para provisionamento de recursos e atribuição de papéis (Contribuinte sozinho não pode criar atribuições RBAC; utilize um administrador de papéis autorizado ou o equivalente documentado do exemplo)
- Acesso aos serviços Microsoft Foundry Models (ou capacidade para solicitar acesso)
- Permissões para criação de grupos de recursos

### Conhecimentos Pré-Requisitos
- Compreensão básica dos serviços Azure
- Familiaridade com interfaces de linha de comandos
- Conceitos básicos de IA/ML (APIs, modelos, prompts)

## Preparação do Laboratório

### Passo 1: Preparação do Ambiente

1. **Verifique as instalações das ferramentas:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Se trabalhar em múltiplos tenants ou se a sua subscrição não for detectada automaticamente, tente novamente com `azd auth login --tenant-id <tenant-id>`.

2. **Clone o repositório do workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Compreender a Estrutura AZD para Aplicações de IA

### Anatomia de um Modelo AZD para IA

Explore os ficheiros chave num modelo AZD preparado para IA:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

O exemplo em checkout pode variar; `.azure/` aparece após a inicialização do ambiente, não necessariamente num clone fresco. Inspecione a checkout real em vez de criar diretórios ausentes para coincidir com este esquema.

### **Exercício de Laboratório 1.1: Explore a Configuração**

1. **Examine o ficheiro azure.yaml:**
```bash
cat azure.yaml
```

**O que procurar:**
- Definições de serviços para componentes de IA
- Mapeamentos de variáveis de ambiente
- Configurações de hosts

2. **Revise a infraestrutura main.bicep:**
```bash
cat infra/main.bicep
```

**Padrões principais de IA a identificar:**
- Provisionamento do serviço Microsoft Foundry Models
- Integração Azure AI Search
- Gestão segura de chaves
- Configurações de segurança de rede

### **Ponto de Discussão:** Porquê Estes Padrões São Importantes para IA

- **Dependências de Serviço**: Apps de IA frequentemente requerem múltiplos serviços coordenados
- **Segurança**: Chaves API e endpoints precisam de gestão segura
- **Escalabilidade**: Cargas de trabalho IA têm requisitos únicos de escalonamento
- **Gestão de Custos**: Serviços IA podem ser dispendiosos se mal configurados

## Módulo 2: Desdobre a Sua Primeira Aplicação de IA

### Passo 2.1: Inicializar o Ambiente

1. **Crie um novo ambiente AZD:**
```bash
azd env new myai-workshop
```

2. **Defina os parâmetros requeridos:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Passo 2.2: Desdobre a Infraestrutura e a Aplicação

1. **Desdobre com AZD:**
```bash
azd up
```

**O que acontece durante `azd up`:**
- ✅ Provisiona o serviço Microsoft Foundry Models
- ✅ Cria serviço Azure AI Search
- ✅ Configura Azure Container Apps para backend e frontend embalados (padrão do exemplo atual)
- ✅ Configura rede e segurança
- ✅ Desdobra código da aplicação
- ✅ Configura monitorização e logging

2. **Monitorize o progresso do desdobramento** e note os recursos a serem criados.

### Passo 2.3: Verifique o Seu Desdobramento

1. **Verifique os recursos desdobrados:**
```bash
azd show
```

2. **Abra a aplicação desdobrada:**
```bash
azd show
```

Abra o endpoint web mostrado na saída `azd show`.

3. **Teste a funcionalidade IA:**
   - Navegue até à aplicação web
   - Experimente consultas de exemplo
   - Verifique se as respostas IA estão a funcionar

### **Exercício de Laboratório 2.1: Prática de Diagnóstico**

**Cenário**: O seu desdobramento teve sucesso, mas a IA não está a responder.

**Problemas comuns a verificar:**
1. **Autenticação**: Verifique a identidade gerida e as atribuições de papéis; só verifique as chaves API se tiver ativado autenticação baseada em chaves intencionalmente
2. **Disponibilidade do modelo**: Confirme se a sua região suporta o modelo
3. **Conectividade de rede**: Assegure que os serviços conseguem comunicar
4. **Permissões RBAC**: Verifique se a app pode aceder ao OpenAI

**Comandos de depuração:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalizar Aplicações de IA para as Suas Necessidades

### Passo 3.1: Modificar a Configuração IA

1. **Atualize o modelo OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Adicione serviços IA adicionais:**

Edite `infra/main.bicep` para adicionar Document Intelligence:

O seguinte é um fragmento ilustrativo, não um modelo completo. O exemplo pode já provisionar serviços de processamento de documentos: inspecione a infraestrutura atual antes de adicionar recursos duplicados. Adições personalizadas requerem ligação de outputs, identidades e configuração da aplicação.

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Passo 3.2: Configurações Específicas de Ambiente

**Melhor Prática**: Configurações diferentes para desenvolvimento vs produção.

1. **Crie um ambiente de produção:**
```bash
azd env new myai-production
```

2. **Defina parâmetros específicos de produção:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Estes nomes vêm do [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) do exemplo. `azd env set` guarda um valor mas não torna uma variável arbitrária efetiva: o modelo deve consumi-la. Reveja o [guia de isolamento de rede](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) do exemplo antes de desativar acesso público, e use `azd up` para aplicar alterações de infraestrutura. SKU OpenAI `S0` só não determina débito do modelo; tipo de desdobramento e capacidade também importam.

### **Exercício de Laboratório 3.1: Otimização de Custos**

**Desafio**: Configure o modelo para desenvolvimento económico.

**Tarefas:**
1. Selecione o ambiente descartável do workshop: `azd env select myai-workshop`.
2. Registe SKU Search atual e capacidade do modelo de `infra/main.parameters.json` e dos ambientes selecionados.
3. Use os inputs suportados abaixo, após confirmar quota de modelo/região:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Verifique o SKU Search e a capacidade de desdobramento no portal e estime a diferença com o calculador de preços. Não espere atualizações imediatas nos dados de faturação.

**Critérios de sucesso:** Search usa Basic, o desdobramento de chat tem a capacidade suportada e pedida, e a app ainda responde a uma questão exemplo. Capacidade `10` é uma alocação de limite de taxa, não um desconto de preço por token. Alterações no nível Search podem ser restritas ou requerer recriação; não experimente em recursos de produção. F0 é específico do serviço e não um SKU de modelo Azure OpenAI.

## Módulo 4: Segurança e Melhores Práticas em Produção

### Passo 4.1: Gestão Segura de Credenciais

**Desafio atual**: Muitas apps IA codificam chaves API ou usam armazenamento inseguro.

**Solução AZD**: Identidade Gerida + Integração Key Vault.

1. **Revise a configuração de segurança no seu modelo:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifique se a Identidade Gerida funciona:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Passo 4.2: Segurança de Rede

1. **Ative endpoints privados** usando a configuração de rede suportada no exemplo (se ainda não estiver configurada).

Para o seu próprio modelo, este fragmento ilustrativo mostra a ligação ao endpoint OpenAI. Precisa também de uma VNet, configuração DNS privada e conectividade da aplicação; não cole tal qual no exemplo que já inclui módulos de endpoints privados:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Passo 4.3: Monitorização e Observabilidade

1. **Configure Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Ative a integração de Application Insights do exemplo:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

A instrumentação do exemplo emite telemetria; uma configuração arbitrária `OPENAI_MONITOR_ENABLED` não ativa métricas IA. Reveja traços para chamadas de modelos, latência, falhas e uso tokens, e evite gravar prompts ou respostas sensíveis.

### **Exercício de Laboratório 4.1: Auditoria de Segurança**

**Tarefa**: Reveja o seu desdobramento quanto a melhores práticas de segurança.

**Lista de verificação:**
- [ ] Não há segredos codificados no código ou configuração
- [ ] Utilização de Identidade Gerida para autenticação serviço-a-serviço
- [ ] Key Vault guarda configuração sensível
- [ ] Acesso à rede está restrito corretamente
- [ ] Monitorização e logging estão ativados

## Módulo 5: Converter a Sua Própria Aplicação IA

### Passo 5.1: Folha de Avaliação

**Antes de converter a sua app**, responda a estas perguntas:

1. **Arquitetura da Aplicação:**
   - Quais serviços IA a sua app utiliza?
   - Que recursos de computação necessita?
   - Necessita de base de dados?
   - Quais as dependências entre os serviços?

2. **Requisitos de Segurança:**
   - Que dados sensíveis a sua app trata?
   - Que requisitos de conformidade possui?
   - Necessita de rede privada?

3. **Requisitos de Escalonamento:**
   - Qual a carga esperada?
   - Precisa de escalonamento automático?
   - Existem requisitos regionais?

### Passo 5.2: Crie o Seu Modelo AZD

**Siga este padrão para converter a sua app:**

**Só estrutura:** Esta secção não fornece fonte de API/web application, infraestrutura host, desdobramentos de modelos, identidade/RBAC, nem um `main.parameters.json` acabado. O Bicep ao nível do grupo de recursos ilustra composição modular; um ponto de entrada AZD típico ao nível da subscrição deve criar um recurso e invocá-lo nesse âmbito. Não espere que `azd up` desdobre uma app completa apenas copiando estes fragmentos. Para linha base executável, continue a usar o modelo RAG do Módulo 1.

1. **Crie a estrutura básica:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **Crie azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Crie modelos de infraestrutura:**

**infra/main.bicep** - Modelo principal:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - Módulo OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Exercício de Laboratório 5.1: Desafio de Criação de Modelo**

**Desafio**: Crie um modelo AZD para uma app de processamento de documentos com IA.

**Requisitos:**
- Microsoft Foundry Models para análise de conteúdo
- Document Intelligence para OCR
- Conta de Armazenamento para upload de documentos
- Function App para lógica de processamento
- App web para interface de utilizador

**Pontos extra:**
- Adicione tratamento de erros apropriado
- Inclua estimativa de custos
- Configure dashboards de monitorização

## Módulo 6: Diagnóstico de Problemas Comuns

### Problemas Comuns de Desdobramento

#### Problema 1: Quota do Serviço OpenAI Excedida
**Sintomas:** Falha no desdobramento com erro de quota
**Soluções:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelo Não Disponível na Região
**Sintomas:** Respostas IA falham ou erros no desdobramento do modelo
**Soluções:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Problema 3: Problemas de Permissão
**Sintomas:** Erros 403 Forbidden ao chamar serviços IA
**Soluções:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemas de Desempenho

#### Problema 4: Respostas IA Lentamente
**Passos para investigação:**
1. Verifique Application Insights para métricas de desempenho
2. Reveja métricas do serviço OpenAI no portal Azure
3. Verifique conectividade e latência de rede

**Soluções:**
- Implemente caching para consultas comuns
- Use modelo OpenAI adequado ao caso de uso
- Escalone réplicas da aplicação só após verificar limites RPM/TPM do modelo; desdobramentos Azure OpenAI não expõem uma configuração genérica "réplica de leitura" estilo base de dados

### **Exercício de Laboratório 6.1: Desafio de Depuração**

**Cenário**: O seu desdobramento teve sucesso, mas a aplicação retorna erros 500.

**Tarefas de depuração:**
1. Verifique logs da aplicação
2. Verifique conectividade do serviço
3. Testar autenticação
4. Rever configuração

**Ferramentas a utilizar:**
- `azd show` para visão geral do deployment
- Portal Azure para logs detalhados do serviço
- Application Insights para telemetria da aplicação

## Módulo 7: Monitorização e Otimização

### Passo 7.1: Configurar Monitorização Abrangente

1. **Criar dashboards personalizados:**

Navegue até ao portal Azure e crie um dashboard com:
- Contagem e latência dos pedidos OpenAI
- Taxas de erros da aplicação
- Utilização de recursos
- Monitorização de custos

2. **Configurar alertas:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Verifique se o componente envia telemetria de pedidos e adicione um grupo de ação se forem necessárias notificações. A métrica é uma contagem, não uma percentagem de falha; um alerta de taxa precisa de uma query adequada e denominador.

### Passo 7.2: Otimização de Custos

1. **Analisar custos atuais:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Substitua os espaços reservados de datas. O suporte da API de Consumo varia de acordo com o contrato de faturação; utilize o Cost Management no portal se os detalhes de uso não estiverem disponíveis. Os custos estão atrasados, não são um oráculo de teste em tempo real.

2. **Implementar controlos de custos:**
- Configurar alertas de orçamento
- Utilizar políticas de autoscaling
- Implementar cache de pedidos
- Monitorizar o uso de tokens para OpenAI

### **Exercício de Laboratório 7.1: Otimização de Performance**

**Tarefa**: Otimize a sua aplicação AI tanto para performance como para custo.

**Métricas para melhorar:**
- Reduzir o tempo médio de resposta em 20%
- Reduzir custos mensais em 15%
- Definir um SLO de disponibilidade de 99,9% e uma janela de medição (um laboratório curto não pode demonstrar uptime mensal)

**Estratégias para tentar:**
- Implementar cache de resposta
- Otimizar prompts para eficiência de tokens
- Utilizar SKUs de computação apropriados
- Configurar autoscaling adequado

## Desafio Final: Implementação de ponta a ponta

### Cenário do Desafio

Este é um **desafio opcional de arquitetura/design**, não um exercício executável fornecido nem uma certificação de produção. Proponha um chatbot de atendimento ao cliente com IA e documente quais requisitos necessitam de implementação e evidência adicionais:

**Requisitos Funcionais:**
- Interface web para interações com clientes
- Integração com Microsoft Foundry Models para respostas
- Capacidade de pesquisa documental usando Azure AI Search
- Integração com base de dados de clientes existente
- Suporte multilíngue

**Requisitos Não Funcionais:**
- Suportar 1000 utilizadores concorrentes
- SLA de 99,9% de uptime
- Conformidade SOC 2
- Custos inferiores a $500/mês
- Deploy em múltiplos ambientes (dev, staging, prod)

Estas são restrições hipotéticas do stakeholder, não resultados garantidos simultaneamente. Defina a taxa de pedidos, tamanhos de prompt/output e duração de sessão antes de estimar custos; 1.000 utilizadores concorrentes não estabelecem uma workload nem provam que um orçamento de $500 é exequível. SOC 2 é o resultado de uma auditoria organizacional, não um interruptor ativado por um template AZD. Identifique trade-offs e rejeite restrições inviáveis com evidências.

### Passos de Implementação

1. **Projetar a arquitetura**
2. **Criar o template AZD**
3. **Implementar medidas de segurança**
4. **Configurar monitorização e alertas**
5. **Criar pipelines de deployment**
6. **Documentar a solução**

### Critérios de Avaliação

- ✅ **Funcionalidade**: São demonstradas capazes implementadas e lacunas restantes explícitas?
- ✅ **Segurança**: São as melhores práticas implementadas?
- ✅ **Escalabilidade**: Consegue suportar a carga?
- ✅ **Manutenibilidade**: Está o código e infraestrutura bem organizados?
- ✅ **Custo**: Mantém-se dentro do orçamento?

## Recursos Adicionais

### Documentação Microsoft
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentação Serviço Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentação Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templates Exemplares
- [Aplicação Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos Comunitários
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Marco de Conclusão

Parabéns! Concluiu o Laboratório AI Workshop. Agora deverá ser capaz de:

- ✅ Explicar como adaptar uma aplicação AI existente a um template AZD
- ✅ Fazer o deploy e testar uma aplicação de referência AI
- ✅ Implementar melhores práticas de segurança para workloads AI
- ✅ Monitorizar e otimizar performance da aplicação AI
- ✅ Resolver problemas comuns de deployment

**Limpeza:** Execute `azd env list`, selecione cada ambiente descartável criado neste laboratório (`myai-workshop`, e se for deployado `myai-production`/`myai-quota-test`), e execute `azd down` em cada um. Reveja o plano de eliminação; eliminar apenas a configuração local de um ambiente não elimina os recursos Azure. Evite `--purge` a menos que compreenda a remoção irreversível de recursos apagados temporariamente.

### Passos Seguintes
1. Aplique estes padrões nos seus próprios projetos AI
2. Contribua templates para a comunidade
3. Junte-se ao Microsoft Foundry Discord para suporte contínuo
4. Explore tópicos avançados como deployments multi-região

---

**Feedback do Workshop**: Ajude-nos a melhorar este workshop partilhando a sua experiência no [Microsoft Foundry Discord canal #Azure](https://discord.gg/microsoft-azure).

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Anterior**: [Deployment de Modelo AI](ai-model-deployment.md)
- **➡️ Seguinte**: [Melhores Práticas AI em Produção](../chapter-08-production/production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de Ajuda?** Junte-se à nossa comunidade para suporte e discussões sobre AZD e deployments AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->