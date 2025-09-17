<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ed84aca3294b926341ef9e0a5a78059e",
  "translation_date": "2025-09-17T21:21:52+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "br"
}
-->
# Laboratório de Workshop de IA: Tornando Suas Soluções de IA Implantáveis com AZD

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com Foco em IA
- **⬅️ Anterior**: [Implantação de Modelos de IA](ai-model-deployment.md)
- **➡️ Próximo**: [Práticas de IA em Produção](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../getting-started/configuration.md)

## Visão Geral do Workshop

Este laboratório prático orienta os desenvolvedores no processo de transformar um aplicativo de IA existente em uma solução implantável usando o Azure Developer CLI (AZD). Você aprenderá padrões essenciais para implantações de IA em produção utilizando os serviços do Azure AI Foundry.

**Duração:** 2-3 horas  
**Nível:** Intermediário  
**Pré-requisitos:** Conhecimento básico de Azure, familiaridade com conceitos de IA/ML

## 🎓 Objetivos de Aprendizagem

Ao final deste workshop, você será capaz de:
- ✅ Converter um aplicativo de IA existente para usar templates AZD
- ✅ Configurar serviços do Azure AI Foundry com AZD
- ✅ Implementar gerenciamento seguro de credenciais para serviços de IA
- ✅ Implantar aplicativos de IA prontos para produção com monitoramento
- ✅ Solucionar problemas comuns de implantação de IA

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

### Etapa 1: Preparação do Ambiente

1. **Verifique as instalações das ferramentas:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Clone o repositório do workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Compreendendo a Estrutura AZD para Aplicativos de IA

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

### **Exercício de Laboratório 1.1: Explore a Configuração**

1. **Examine o arquivo azure.yaml:**
```bash
cat azure.yaml
```

**O que observar:**
- Definições de serviços para componentes de IA
- Mapeamentos de variáveis de ambiente
- Configurações de host

2. **Revise a infraestrutura main.bicep:**
```bash
cat infra/main.bicep
```

**Padrões de IA importantes para identificar:**
- Provisionamento do serviço Azure OpenAI
- Integração com Cognitive Search
- Gerenciamento seguro de chaves
- Configurações de segurança de rede

### **Ponto de Discussão:** Por que Esses Padrões São Importantes para IA

- **Dependências de Serviços**: Aplicativos de IA frequentemente requerem múltiplos serviços coordenados
- **Segurança**: Chaves de API e endpoints precisam de gerenciamento seguro
- **Escalabilidade**: Workloads de IA têm requisitos únicos de escalabilidade
- **Gestão de Custos**: Serviços de IA podem ser caros se não configurados corretamente

## Módulo 2: Implante Seu Primeiro Aplicativo de IA

### Etapa 2.1: Inicialize o Ambiente

1. **Crie um novo ambiente AZD:**
```bash
azd env new myai-workshop
```

2. **Defina os parâmetros necessários:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Etapa 2.2: Implante a Infraestrutura e o Aplicativo

1. **Implante com AZD:**
```bash
azd up
```

**O que acontece durante `azd up`:**
- ✅ Provisiona o serviço Azure OpenAI
- ✅ Cria o serviço Cognitive Search
- ✅ Configura o App Service para o aplicativo web
- ✅ Configura rede e segurança
- ✅ Implanta o código do aplicativo
- ✅ Configura monitoramento e registro

2. **Monitore o progresso da implantação** e observe os recursos sendo criados.

### Etapa 2.3: Verifique Sua Implantação

1. **Verifique os recursos implantados:**
```bash
azd show
```

2. **Abra o aplicativo implantado:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Teste a funcionalidade de IA:**
   - Navegue até o aplicativo web
   - Experimente consultas de exemplo
   - Verifique se as respostas de IA estão funcionando

### **Exercício de Laboratório 2.1: Prática de Solução de Problemas**

**Cenário**: Sua implantação foi bem-sucedida, mas a IA não está respondendo.

**Problemas comuns para verificar:**
1. **Chaves de API do OpenAI**: Verifique se estão configuradas corretamente
2. **Disponibilidade do modelo**: Confirme se sua região suporta o modelo
3. **Conectividade de rede**: Certifique-se de que os serviços podem se comunicar
4. **Permissões RBAC**: Verifique se o aplicativo pode acessar o OpenAI

**Comandos de depuração:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalizando Aplicativos de IA para Suas Necessidades

### Etapa 3.1: Modifique a Configuração de IA

1. **Atualize o modelo OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Adicione serviços adicionais de IA:**

Edite `infra/main.bicep` para adicionar Document Intelligence:

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

### Etapa 3.2: Configurações Específicas de Ambiente

**Melhor Prática**: Configurações diferentes para desenvolvimento e produção.

1. **Crie um ambiente de produção:**
```bash
azd env new myai-production
```

2. **Defina parâmetros específicos de produção:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Exercício de Laboratório 3.1: Otimização de Custos**

**Desafio**: Configure o template para um desenvolvimento econômico.

**Tarefas:**
1. Identifique quais SKUs podem ser configurados para níveis gratuitos/básicos
2. Configure variáveis de ambiente para custo mínimo
3. Implante e compare os custos com a configuração de produção

**Dicas de solução:**
- Use o nível F0 (gratuito) para Cognitive Services quando possível
- Use o nível Básico para Search Service no desenvolvimento
- Considere usar o plano de Consumo para Functions

## Módulo 4: Segurança e Melhores Práticas para Produção

### Etapa 4.1: Gerenciamento Seguro de Credenciais

**Desafio atual**: Muitos aplicativos de IA codificam chaves de API ou usam armazenamento inseguro.

**Solução AZD**: Identidade Gerenciada + Integração com Key Vault.

1. **Revise a configuração de segurança no seu template:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifique se a Identidade Gerenciada está funcionando:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Etapa 4.2: Segurança de Rede

1. **Habilite endpoints privados** (se ainda não configurados):

Adicione ao seu template bicep:
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

### Etapa 4.3: Monitoramento e Observabilidade

1. **Configure o Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Configure monitoramento específico para IA:**

Adicione métricas personalizadas para operações de IA:
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

**Tarefa**: Revise sua implantação para melhores práticas de segurança.

**Lista de verificação:**
- [ ] Nenhum segredo codificado no código ou configuração
- [ ] Identidade Gerenciada usada para autenticação entre serviços
- [ ] Key Vault armazena configurações sensíveis
- [ ] O acesso à rede está devidamente restrito
- [ ] Monitoramento e registro estão habilitados

## Módulo 5: Convertendo Seu Próprio Aplicativo de IA

### Etapa 5.1: Planilha de Avaliação

**Antes de converter seu aplicativo**, responda a estas perguntas:

1. **Arquitetura do Aplicativo:**
   - Quais serviços de IA seu aplicativo usa?
   - Quais recursos de computação ele precisa?
   - Ele requer um banco de dados?
   - Quais são as dependências entre os serviços?

2. **Requisitos de Segurança:**
   - Quais dados sensíveis seu aplicativo manipula?
   - Quais requisitos de conformidade você possui?
   - Você precisa de rede privada?

3. **Requisitos de Escalabilidade:**
   - Qual é a carga esperada?
   - Você precisa de autoescalonamento?
   - Existem requisitos regionais?

### Etapa 5.2: Crie Seu Template AZD

**Siga este padrão para converter seu aplicativo:**

1. **Crie a estrutura básica:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Crie o azure.yaml:**
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

3. **Crie templates de infraestrutura:**

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

**Desafio**: Crie um template AZD para um aplicativo de IA de processamento de documentos.

**Requisitos:**
- Azure OpenAI para análise de conteúdo
- Document Intelligence para OCR
- Storage Account para uploads de documentos
- Function App para lógica de processamento
- Aplicativo web para interface do usuário

**Pontos bônus:**
- Adicione tratamento adequado de erros
- Inclua estimativa de custos
- Configure painéis de monitoramento

## Módulo 6: Solução de Problemas Comuns

### Problemas Comuns de Implantação

#### Problema 1: Cota do Serviço OpenAI Excedida
**Sintomas:** Implantação falha com erro de cota
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
1. Verifique métricas de desempenho no Application Insights
2. Revise métricas do serviço OpenAI no portal do Azure
3. Confirme conectividade de rede e latência

**Soluções:**
- Implemente cache para consultas comuns
- Use o modelo OpenAI apropriado para seu caso de uso
- Considere réplicas de leitura para cenários de alta carga

### **Exercício de Laboratório 6.1: Desafio de Depuração**

**Cenário**: Sua implantação foi bem-sucedida, mas o aplicativo retorna erros 500.

**Tarefas de depuração:**
1. Verifique os logs do aplicativo
2. Confirme a conectividade dos serviços
3. Teste a autenticação
4. Revise a configuração

**Ferramentas para usar:**
- `azd show` para visão geral da implantação
- Portal do Azure para logs detalhados dos serviços
- Application Insights para telemetria do aplicativo

## Módulo 7: Monitoramento e Otimização

### Etapa 7.1: Configure Monitoramento Abrangente

1. **Crie painéis personalizados:**

Navegue até o portal do Azure e crie um painel com:
- Contagem de solicitações e latência do OpenAI
- Taxas de erro do aplicativo
- Utilização de recursos
- Rastreamento de custos

2. **Configure alertas:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Etapa 7.2: Otimização de Custos

1. **Analise os custos atuais:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implemente controles de custo:**
- Configure alertas de orçamento
- Use políticas de autoescalonamento
- Implemente cache de solicitações
- Monitore o uso de tokens para OpenAI

### **Exercício de Laboratório 7.1: Otimização de Desempenho**

**Tarefa**: Otimize seu aplicativo de IA para desempenho e custo.

**Métricas para melhorar:**
- Reduzir o tempo médio de resposta em 20%
- Reduzir os custos mensais em 15%
- Manter 99,9% de tempo de atividade

**Estratégias para tentar:**
- Implemente cache de respostas
- Otimize prompts para eficiência de tokens
- Use SKUs de computação apropriados
- Configure autoescalonamento adequado

## Desafio Final: Implementação de Ponta a Ponta

### Cenário do Desafio

Você foi encarregado de criar um chatbot de atendimento ao cliente com IA pronto para produção com os seguintes requisitos:

**Requisitos Funcionais:**
- Interface web para interações com clientes
- Integração com Azure OpenAI para respostas
- Capacidade de busca em documentos usando Cognitive Search
- Integração com banco de dados de clientes existente
- Suporte multilíngue

**Requisitos Não Funcionais:**
- Suportar 1000 usuários simultâneos
- SLA de 99,9% de tempo de atividade
- Conformidade SOC 2
- Custo abaixo de $500/mês
- Implantação em múltiplos ambientes (dev, staging, prod)

### Etapas de Implementação

1. **Desenhe a arquitetura**
2. **Crie o template AZD**
3. **Implemente medidas de segurança**
4. **Configure monitoramento e alertas**
5. **Crie pipelines de implantação**
6. **Documente a solução**

### Critérios de Avaliação

- ✅ **Funcionalidade**: Atende a todos os requisitos?
- ✅ **Segurança**: As melhores práticas foram implementadas?
- ✅ **Escalabilidade**: Pode lidar com a carga?
- ✅ **Manutenibilidade**: O código e a infraestrutura estão bem organizados?
- ✅ **Custo**: Permanece dentro do orçamento?

## Recursos Adicionais

### Documentação da Microsoft
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentação do Serviço Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentação do Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templates de Exemplo
- [Aplicativo de Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Quickstart do Aplicativo de Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos da Comunidade
- [Discord do Azure AI Foundry](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificado de Conclusão

Parabéns! Você concluiu o Laboratório do Workshop de IA. Agora você deve ser capaz de:

- ✅ Converter aplicativos de IA existentes em templates AZD
- ✅ Implantar aplicativos de IA prontos para produção
- ✅ Implementar práticas recomendadas de segurança para cargas de trabalho de IA
- ✅ Monitorar e otimizar o desempenho de aplicativos de IA
- ✅ Solucionar problemas comuns de implantação

### Próximos Passos
1. Aplique esses padrões aos seus próprios projetos de IA
2. Contribua com templates para a comunidade
3. Participe do Discord do Azure AI Foundry para suporte contínuo
4. Explore tópicos avançados como implantações em várias regiões

---

**Feedback do Workshop**: Ajude-nos a melhorar este workshop compartilhando sua experiência no [canal #Azure do Discord do Azure AI Foundry](https://discord.gg/microsoft-azure).

---

**Navegação por Capítulos:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com Foco em IA
- **⬅️ Anterior**: [Implantação de Modelos de IA](ai-model-deployment.md)
- **➡️ Próximo**: [Práticas Recomendadas para IA em Produção](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../getting-started/configuration.md)

**Precisa de Ajuda?** Junte-se à nossa comunidade para suporte e discussões sobre AZD e implantações de IA.

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.