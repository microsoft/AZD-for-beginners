<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:19:26+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "pt"
}
-->
# Laboratório de Workshop de IA: Tornando as suas Soluções de IA Implantáveis com AZD

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com Foco em IA
- **⬅️ Anterior**: [Implantação de Modelos de IA](ai-model-deployment.md)
- **➡️ Próximo**: [Melhores Práticas para IA em Produção](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../getting-started/configuration.md)

## Visão Geral do Workshop

Este laboratório prático orienta os desenvolvedores no processo de pegar um modelo de IA existente e implantá-lo usando o Azure Developer CLI (AZD). Aprenderá padrões essenciais para implantações de IA em produção utilizando os serviços do Azure AI Foundry.

**Duração:** 2-3 horas  
**Nível:** Intermediário  
**Pré-requisitos:** Conhecimento básico de Azure, familiaridade com conceitos de IA/ML

## 🎓 Objetivos de Aprendizagem

Ao final deste workshop, será capaz de:
- ✅ Converter uma aplicação de IA existente para usar templates AZD
- ✅ Configurar serviços do Azure AI Foundry com AZD
- ✅ Implementar gestão segura de credenciais para serviços de IA
- ✅ Implantar aplicações de IA prontas para produção com monitorização
- ✅ Resolver problemas comuns de implantação de IA

## Pré-requisitos

### Ferramentas Necessárias
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado
- [Git](https://git-scm.com/) instalado
- Editor de código (VS Code recomendado)

### Recursos do Azure
- Assinatura do Azure com acesso de colaborador
- Acesso aos serviços do Azure OpenAI (ou capacidade de solicitar acesso)
- Permissões para criar grupos de recursos

### Conhecimentos Necessários
- Compreensão básica dos serviços do Azure
- Familiaridade com interfaces de linha de comando
- Conceitos básicos de IA/ML (APIs, modelos, prompts)

## Configuração do Laboratório

### Passo 1: Preparação do Ambiente

1. **Verificar instalações das ferramentas:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Clonar o repositório do workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Compreendendo a Estrutura AZD para Aplicações de IA

### Anatomia de um Template AZD Pronto para IA

Explore os arquivos principais em um template AZD preparado para IA:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Exercício de Laboratório 1.1: Explorar a Configuração**

1. **Examinar o arquivo azure.yaml:**
```bash
cat azure.yaml
```

**O que procurar:**
- Definições de serviços para componentes de IA
- Mapeamentos de variáveis de ambiente
- Configurações de host

2. **Revisar a infraestrutura main.bicep:**
```bash
cat infra/main.bicep
```

**Padrões de IA importantes para identificar:**
- Provisionamento do serviço Azure OpenAI
- Integração com Cognitive Search
- Gestão segura de chaves
- Configurações de segurança de rede

### **Ponto de Discussão:** Por que esses padrões são importantes para IA

- **Dependências de Serviços**: Aplicações de IA frequentemente requerem múltiplos serviços coordenados
- **Segurança**: Chaves de API e endpoints precisam de gestão segura
- **Escalabilidade**: Cargas de trabalho de IA têm requisitos únicos de escalabilidade
- **Gestão de Custos**: Serviços de IA podem ser caros se não configurados corretamente

## Módulo 2: Implantar a Sua Primeira Aplicação de IA

### Passo 2.1: Inicializar o Ambiente

1. **Criar um novo ambiente AZD:**
```bash
azd env new myai-workshop
```

2. **Definir os parâmetros necessários:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Passo 2.2: Implantar a Infraestrutura e a Aplicação

1. **Implantar com AZD:**
```bash
azd up
```

**O que acontece durante `azd up`:**
- ✅ Provisiona o serviço Azure OpenAI
- ✅ Cria o serviço Cognitive Search
- ✅ Configura o App Service para a aplicação web
- ✅ Configura rede e segurança
- ✅ Implanta o código da aplicação
- ✅ Configura monitorização e registo

2. **Monitorizar o progresso da implantação** e observar os recursos sendo criados.

### Passo 2.3: Verificar a Sua Implantação

1. **Verificar os recursos implantados:**
```bash
azd show
```

2. **Abrir a aplicação implantada:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testar a funcionalidade de IA:**
   - Navegar até à aplicação web
   - Experimentar consultas de exemplo
   - Verificar se as respostas de IA estão funcionando

### **Exercício de Laboratório 2.1: Prática de Resolução de Problemas**

**Cenário**: A sua implantação foi bem-sucedida, mas a IA não está respondendo.

**Problemas comuns a verificar:**
1. **Chaves de API do OpenAI**: Verificar se estão configuradas corretamente
2. **Disponibilidade do modelo**: Confirmar se a sua região suporta o modelo
3. **Conectividade de rede**: Garantir que os serviços podem comunicar
4. **Permissões RBAC**: Verificar se a aplicação pode acessar o OpenAI

**Comandos de depuração:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalizando Aplicações de IA para as Suas Necessidades

### Passo 3.1: Modificar a Configuração de IA

1. **Atualizar o modelo OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Adicionar serviços adicionais de IA:**

Editar `infra/main.bicep` para adicionar Document Intelligence:

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

### Passo 3.2: Configurações Específicas para o Ambiente

**Melhor Prática**: Configurações diferentes para desenvolvimento e produção.

1. **Criar um ambiente de produção:**
```bash
azd env new myai-production
```

2. **Definir parâmetros específicos para produção:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Exercício de Laboratório 3.1: Otimização de Custos**

**Desafio**: Configurar o template para um desenvolvimento com custo reduzido.

**Tarefas:**
1. Identificar quais SKUs podem ser configurados para níveis gratuitos/básicos
2. Configurar variáveis de ambiente para custo mínimo
3. Implantar e comparar custos com a configuração de produção

**Dicas de solução:**
- Usar o nível F0 (gratuito) para Cognitive Services sempre que possível
- Usar o nível Básico para Search Service no desenvolvimento
- Considerar usar o plano de Consumo para Functions

## Módulo 4: Segurança e Melhores Práticas para Produção

### Passo 4.1: Gestão Segura de Credenciais

**Desafio atual**: Muitas aplicações de IA codificam chaves de API ou usam armazenamento inseguro.

**Solução AZD**: Identidade Gerida + Integração com Key Vault.

1. **Revisar a configuração de segurança no seu template:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verificar se a Identidade Gerida está funcionando:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Passo 4.2: Segurança de Rede

1. **Ativar endpoints privados** (se ainda não configurados):

Adicionar ao seu template bicep:
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

1. **Configurar Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Configurar monitorização específica para IA:**

Adicionar métricas personalizadas para operações de IA:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Exercício de Laboratório 4.1: Auditoria de Segurança**

**Tarefa**: Revisar a sua implantação para melhores práticas de segurança.

**Lista de verificação:**
- [ ] Nenhum segredo codificado no código ou configuração
- [ ] Identidade Gerida usada para autenticação entre serviços
- [ ] Key Vault armazena configurações sensíveis
- [ ] Acesso à rede está devidamente restrito
- [ ] Monitorização e registo estão ativados

## Módulo 5: Convertendo a Sua Própria Aplicação de IA

### Passo 5.1: Folha de Avaliação

**Antes de converter a sua aplicação**, responda a estas perguntas:

1. **Arquitetura da Aplicação:**
   - Quais serviços de IA a sua aplicação utiliza?
   - Quais recursos de computação ela precisa?
   - Requer um banco de dados?
   - Quais são as dependências entre os serviços?

2. **Requisitos de Segurança:**
   - Que dados sensíveis a sua aplicação manipula?
   - Quais requisitos de conformidade você tem?
   - Precisa de rede privada?

3. **Requisitos de Escalabilidade:**
   - Qual é a carga esperada?
   - Precisa de autoescalonamento?
   - Existem requisitos regionais?

### Passo 5.2: Criar o Seu Template AZD

**Siga este padrão para converter a sua aplicação:**

1. **Criar a estrutura básica:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Criar azure.yaml:**
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

3. **Criar templates de infraestrutura:**

**infra/main.bicep** - Template principal:
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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Exercício de Laboratório 5.1: Desafio de Criação de Template**

**Desafio**: Criar um template AZD para uma aplicação de IA de processamento de documentos.

**Requisitos:**
- Azure OpenAI para análise de conteúdo
- Document Intelligence para OCR
- Storage Account para uploads de documentos
- Function App para lógica de processamento
- Aplicação web para interface do utilizador

**Pontos bônus:**
- Adicionar tratamento de erros adequado
- Incluir estimativa de custos
- Configurar dashboards de monitorização

## Módulo 6: Resolução de Problemas Comuns

### Problemas Comuns de Implantação

#### Problema 1: Quota do Serviço OpenAI Excedida
**Sintomas:** Implantação falha com erro de quota
**Soluções:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelo Não Disponível na Região
**Sintomas:** Respostas de IA falham ou erros de implantação do modelo
**Soluções:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problema 3: Problemas de Permissão
**Sintomas:** Erros 403 Forbidden ao chamar serviços de IA
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

#### Problema 4: Respostas de IA Lentas
**Passos de investigação:**
1. Verificar métricas de desempenho no Application Insights
2. Revisar métricas do serviço OpenAI no portal do Azure
3. Confirmar conectividade de rede e latência

**Soluções:**
- Implementar cache para consultas comuns
- Usar o modelo OpenAI apropriado para o seu caso de uso
- Considerar réplicas de leitura para cenários de alta carga

### **Exercício de Laboratório 6.1: Desafio de Depuração**

**Cenário**: A sua implantação foi bem-sucedida, mas a aplicação retorna erros 500.

**Tarefas de depuração:**
1. Verificar registos da aplicação
2. Confirmar conectividade dos serviços
3. Testar autenticação
4. Revisar configuração

**Ferramentas para usar:**
- `azd show` para visão geral da implantação
- Portal do Azure para registos detalhados dos serviços
- Application Insights para telemetria da aplicação

## Módulo 7: Monitorização e Otimização

### Passo 7.1: Configurar Monitorização Abrangente

1. **Criar dashboards personalizados:**

Navegar até ao portal do Azure e criar um dashboard com:
- Contagem de pedidos e latência do OpenAI
- Taxas de erro da aplicação
- Utilização de recursos
- Rastreamento de custos

2. **Configurar alertas:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Passo 7.2: Otimização de Custos

1. **Analisar custos atuais:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementar controles de custos:**
- Configurar alertas de orçamento
- Usar políticas de autoescalonamento
- Implementar cache de pedidos
- Monitorizar uso de tokens para OpenAI

### **Exercício de Laboratório 7.1: Otimização de Desempenho**

**Tarefa**: Otimizar a sua aplicação de IA para desempenho e custo.

**Métricas para melhorar:**
- Reduzir o tempo médio de resposta em 20%
- Reduzir custos mensais em 15%
- Manter 99,9% de tempo de atividade

**Estratégias para tentar:**
- Implementar cache de respostas
- Otimizar prompts para eficiência de tokens
- Usar SKUs de computação apropriados
- Configurar autoescalonamento adequado

## Desafio Final: Implementação de Ponta a Ponta

### Cenário do Desafio

Foi encarregado de criar um chatbot de atendimento ao cliente com IA pronto para produção com os seguintes requisitos:

**Requisitos Funcionais:**
- Interface web para interações com clientes
- Integração com Azure OpenAI para respostas
- Capacidade de pesquisa de documentos usando Cognitive Search
- Integração com base de dados de clientes existente
- Suporte multilíngue

**Requisitos Não Funcionais:**
- Suportar 1000 utilizadores simultâneos
- SLA de 99,9% de tempo de atividade
- Conformidade com SOC 2
- Custo abaixo de $500/mês
- Implantação em múltiplos ambientes (dev, staging, prod)

### Passos de Implementação

1. **Desenhar a arquitetura**
2. **Criar o template AZD**
3. **Implementar medidas de segurança**
4. **Configurar monitorização e alertas**
5. **Criar pipelines de implantação**
6. **Documentar a solução**

### Critérios de Avaliação

- ✅ **Funcionalidade**: Atende a todos os requisitos?
- ✅ **Segurança**: As melhores práticas foram implementadas?
- ✅ **Escalabilidade**: Consegue lidar com a carga?
- ✅ **Manutenção**: O código e a infraestrutura estão bem organizados?
- ✅ **Custo**: Mantém-se dentro do orçamento?

## Recursos Adicionais

### Documentação da Microsoft
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentação do Serviço Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentação do Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templates de Exemplo
- [Aplicação de Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Quickstart de Aplicação de Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos da Comunidade
- [Discord do Azure AI Foundry](https://discord.gg/microsoft-azure)
- [GitHub do Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Templates AZD Incríveis](https://azure.github.io/awesome-azd/)

## 🎓 Certificado de Conclusão
Parabéns! Concluíste o Laboratório do Workshop de IA. Agora deverás ser capaz de:

- ✅ Converter aplicações de IA existentes em templates AZD
- ✅ Implementar aplicações de IA prontas para produção
- ✅ Aplicar as melhores práticas de segurança em cargas de trabalho de IA
- ✅ Monitorizar e otimizar o desempenho de aplicações de IA
- ✅ Resolver problemas comuns de implementação

### Próximos Passos
1. Aplica estes padrões aos teus próprios projetos de IA
2. Contribui com templates para a comunidade
3. Junta-te ao Discord do Azure AI Foundry para suporte contínuo
4. Explora tópicos avançados como implementações em várias regiões

---

**Feedback do Workshop**: Ajuda-nos a melhorar este workshop partilhando a tua experiência no [canal #Azure do Discord do Azure AI Foundry](https://discord.gg/microsoft-azure).

---

**Navegação por Capítulos:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com Foco em IA
- **⬅️ Anterior**: [Implementação de Modelos de IA](ai-model-deployment.md)
- **➡️ Próximo**: [Melhores Práticas para IA em Produção](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../getting-started/configuration.md)

**Precisas de Ajuda?** Junta-te à nossa comunidade para suporte e discussões sobre AZD e implementações de IA.

---

