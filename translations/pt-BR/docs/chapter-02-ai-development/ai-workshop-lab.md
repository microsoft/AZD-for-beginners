# Laboratório do Workshop de IA: Tornando suas soluções de IA implantáveis com AZD

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com Foco em IA
- **⬅️ Anterior**: [Implantação de Modelos de IA](ai-model-deployment.md)
- **➡️ Próximo**: [Melhores Práticas para IA em Produção](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

## Visão Geral do Workshop

Este laboratório prático orienta desenvolvedores através do processo de pegar um template de IA existente e implantá-lo usando o Azure Developer CLI (AZD). Você aprenderá padrões essenciais para implantações de IA em produção usando os serviços Microsoft Foundry.

**Duração:** 2-3 horas  
**Nível:** Intermediário  
**Pré-requisitos:** Conhecimento básico de Azure, familiaridade com conceitos de IA/ML

## 🎓 Objetivos de Aprendizagem

Ao final deste workshop, você será capaz de:
- ✅ Converter uma aplicação de IA existente para usar templates AZD
- ✅ Configurar os serviços Microsoft Foundry com AZD
- ✅ Implementar gerenciamento seguro de credenciais para serviços de IA
- ✅ Implantar aplicações de IA prontas para produção com monitoramento
- ✅ Solucionar problemas comuns de implantação de IA

## Pré-requisitos

### Ferramentas Necessárias
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado
- [Git](https://git-scm.com/) instalado
- Editor de código (recomendado VS Code)

### Recursos do Azure
- Assinatura do Azure com acesso de colaborador
- Acesso aos serviços Azure OpenAI (ou possibilidade de solicitar acesso)
- Permissões para criação de grupos de recursos

### Conhecimentos Necessários
- Entendimento básico dos serviços Azure
- Familiaridade com interfaces de linha de comando
- Conceitos básicos de IA/ML (APIs, modelos, prompts)

## Configuração do Laboratório

### Passo 1: Preparação do Ambiente

1. **Verificar instalações das ferramentas:**
```bash
# Verificar a instalação do AZD
azd version

# Verificar o Azure CLI
az --version

# Fazer login no Azure
az login
azd auth login
```

2. **Clonar o repositório do workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Entendendo a Estrutura AZD para Aplicações de IA

### Anatomia de um Template AZD para IA

Explore os arquivos-chave em um template AZD pronto para IA:

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

### **Exercício de Lab 1.1: Explore a Configuração**

1. **Examinar o arquivo azure.yaml:**
```bash
cat azure.yaml
```

**O que procurar:**
- Definições de serviço para componentes de IA
- Mapeamentos de variáveis de ambiente
- Configurações de host

2. **Revisar a infraestrutura main.bicep:**
```bash
cat infra/main.bicep
```

**Padrões-chave de IA para identificar:**
- Provisionamento do serviço Azure OpenAI
- Integração com Cognitive Search
- Gerenciamento seguro de chaves
- Configurações de segurança de rede

### **Ponto de Discussão:** Por que Esses Padrões Importam para IA

- **Dependências de Serviço**: Aplicações de IA frequentemente requerem múltiplos serviços coordenados
- **Segurança**: Chaves de API e endpoints precisam de gerenciamento seguro
- **Escalabilidade**: Cargas de trabalho de IA têm requisitos únicos de escalonamento
- **Gerenciamento de Custos**: Serviços de IA podem ser caros se não configurados corretamente

## Módulo 2: Implemente sua Primeira Aplicação de IA

### Passo 2.1: Inicializar o Ambiente

1. **Criar um novo ambiente AZD:**
```bash
azd env new myai-workshop
```

2. **Definir parâmetros necessários:**
```bash
# Defina sua região preferida do Azure
azd env set AZURE_LOCATION eastus

# Opcional: Defina um modelo OpenAI específico
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
- ✅ Configura monitoramento e registros

2. **Monitore o progresso da implantação** e observe os recursos que estão sendo criados.

### Passo 2.3: Verificar sua Implantação

1. **Verificar os recursos implantados:**
```bash
azd show
```

2. **Abrir a aplicação implantada:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testar a funcionalidade de IA:**
   - Navegue até a aplicação web
   - Tente consultas de exemplo
   - Verifique se as respostas da IA estão funcionando

### **Exercício de Lab 2.1: Prática de Solução de Problemas**

**Cenário**: Sua implantação teve sucesso, mas a IA não está respondendo.

**Problemas comuns para verificar:**
1. **Chaves da API OpenAI**: Verifique se estão configuradas corretamente
2. **Disponibilidade do modelo**: Verifique se sua região suporta o modelo
3. **Conectividade de rede**: Garanta que os serviços possam se comunicar
4. **Permissões RBAC**: Verifique se o app pode acessar o OpenAI

**Comandos de depuração:**
```bash
# Verificar variáveis de ambiente
azd env get-values

# Visualizar logs de implantação
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verificar status da implantação do OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalizando Aplicações de IA para Suas Necessidades

### Passo 3.1: Modificar a Configuração de IA

1. **Atualizar o modelo OpenAI:**
```bash
# Mude para um modelo diferente (se disponível na sua região)
azd env set AZURE_OPENAI_MODEL gpt-4

# Reimplante com a nova configuração
azd deploy
```

2. **Adicionar serviços de IA adicionais:**

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

### Passo 3.2: Configurações Específicas por Ambiente

**Melhor Prática**: Configurações diferentes para desenvolvimento vs produção.

1. **Criar um ambiente de produção:**
```bash
azd env new myai-production
```

2. **Definir parâmetros específicos de produção:**
```bash
# A produção normalmente usa SKUs mais altos
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Habilitar recursos de segurança adicionais
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Exercício de Lab 3.1: Otimização de Custos**

**Desafio**: Configure o template para desenvolvimento econômico.

**Tarefas:**
1. Identificar quais SKUs podem ser definidos em níveis gratuitos/básicos
2. Configurar variáveis de ambiente para custo mínimo
3. Implantar e comparar custos com a configuração de produção

**Dicas de solução:**
- Use a camada F0 (gratuita) para Cognitive Services quando possível
- Use a camada Basic para o Search Service em desenvolvimento
- Considere usar o plano Consumption para Functions

## Módulo 4: Segurança e Melhores Práticas para Produção

### Passo 4.1: Gerenciamento Seguro de Credenciais

**Desafio atual**: Muitas aplicações de IA codificam chaves de API ou usam armazenamento inseguro.

**Solução AZD**: Integração Managed Identity + Key Vault.

1. **Revisar a configuração de segurança em seu template:**
```bash
# Procure pela configuração do Key Vault e da Identidade Gerenciada
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verificar se o Managed Identity está funcionando:**
```bash
# Verifique se o aplicativo web possui a configuração de identidade correta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Passo 4.2: Segurança de Rede

1. **Ativar private endpoints** (se ainda não configurado):

Adicione ao seu bicep template:
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

### Passo 4.3: Monitoramento e Observabilidade

1. **Configurar Application Insights:**
```bash
# O Application Insights deve ser configurado automaticamente
# Verifique a configuração:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Configurar monitoramento específico para IA:**

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

### **Exercício de Lab 4.1: Auditoria de Segurança**

**Tarefa**: Revise sua implantação quanto às melhores práticas de segurança.

**Lista de verificação:**
- [ ] Nenhum segredo codificado no código ou na configuração
- [ ] Managed Identity usado para autenticação serviço-a-serviço
- [ ] Key Vault armazena configurações sensíveis
- [ ] O acesso à rede está adequadamente restrito
- [ ] Monitoramento e registros estão habilitados

## Módulo 5: Convertendo sua Própria Aplicação de IA

### Passo 5.1: Questionário de Avaliação

**Antes de converter sua aplicação**, responda a estas perguntas:

1. **Arquitetura da Aplicação:**
   - Quais serviços de IA sua aplicação usa?
   - Quais recursos de computação ela precisa?
   - Requer um banco de dados?
   - Quais são as dependências entre os serviços?

2. **Requisitos de Segurança:**
   - Quais dados sensíveis sua aplicação manipula?
   - Quais requisitos de conformidade você possui?
   - Você precisa de rede privada?

3. **Requisitos de Escalonamento:**
   - Qual é a carga esperada?
   - Você precisa de autoescalonamento?
   - Existem requisitos regionais?

### Passo 5.2: Criar seu Template AZD

**Siga este padrão para converter sua aplicação:**

1. **Criar a estrutura básica:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializar o template AZD
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

### **Exercício de Lab 5.1: Desafio de Criação de Template**

**Desafio**: Crie um template AZD para um app de IA de processamento de documentos.

**Requisitos:**
- Azure OpenAI para análise de conteúdo
- Document Intelligence para OCR
- Storage Account para upload de documentos
- Function App para lógica de processamento
- Aplicação web para interface do usuário

**Pontos bônus:**
- Adicionar tratamento de erros adequado
- Incluir estimativa de custos
- Configurar dashboards de monitoramento

## Módulo 6: Solução de Problemas Comuns

### Problemas Comuns de Implantação

#### Problema 1: Cota do Serviço OpenAI Excedida
**Sintomas:** A implantação falha com erro de cota
**Soluções:**
```bash
# Verificar as cotas atuais
az cognitiveservices usage list --location eastus

# Solicitar aumento de cotas ou tentar outra região
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelo Não Disponível na Região
**Sintomas:** Respostas de IA falham ou há erros na implantação do modelo
**Soluções:**
```bash
# Verificar disponibilidade do modelo por região
az cognitiveservices model list --location eastus

# Atualizar para o modelo disponível
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problema 3: Questões de Permissão
**Sintomas:** Erros 403 Forbidden ao chamar serviços de IA
**Soluções:**
```bash
# Verificar atribuições de papéis
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Adicionar papéis ausentes
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemas de Desempenho

#### Problema 4: Respostas de IA Lentas
**Passos de investigação:**
1. Verificar o Application Insights por métricas de desempenho
2. Revisar métricas do serviço OpenAI no portal do Azure
3. Verificar conectividade de rede e latência

**Soluções:**
- Implementar cache para consultas comuns
- Usar modelo OpenAI apropriado para seu caso de uso
- Considerar réplicas de leitura para cenários de alta carga

### **Exercício de Lab 6.1: Desafio de Depuração**

**Cenário**: Sua implantação teve sucesso, mas a aplicação retorna erros 500.

**Tarefas de depuração:**
1. Verificar logs da aplicação
2. Verificar conectividade dos serviços
3. Testar autenticação
4. Revisar configuração

**Ferramentas a usar:**
- `azd show` para visão geral da implantação
- Portal do Azure para logs detalhados dos serviços
- Application Insights para telemetria da aplicação

## Módulo 7: Monitoramento e Otimização

### Passo 7.1: Configurar Monitoramento Abrangente

1. **Criar dashboards personalizados:**

Navegue até o portal do Azure e crie um dashboard com:
- Contagem de requisições e latência do OpenAI
- Taxas de erro da aplicação
- Utilização de recursos
- Acompanhamento de custos

2. **Configurar alertas:**
```bash
# Alerta de alta taxa de erro
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
# Use a CLI do Azure para obter dados de custo
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementar controles de custo:**
- Configurar alertas de orçamento
- Usar políticas de autoescala
- Implementar cache de requisições
- Monitorar uso de tokens do OpenAI

### **Exercício de Lab 7.1: Otimização de Desempenho**

**Tarefa**: Otimize sua aplicação de IA tanto para desempenho quanto para custo.

**Métricas para melhorar:**
- Reduzir o tempo médio de resposta em 20%
- Reduzir custos mensais em 15%
- Manter 99,9% de disponibilidade

**Estratégias para tentar:**
- Implementar cache de resposta
- Otimizar prompts para eficiência de tokens
- Usar SKUs de computação apropriados
- Configurar autoescalonamento adequado

## Desafio Final: Implementação de Ponta a Ponta

### Cenário do Desafio

Sua tarefa é criar um chatbot de atendimento ao cliente com IA pronto para produção com os seguintes requisitos:

**Requisitos Funcionais:**
- Interface web para interações com clientes
- Integração com Azure OpenAI para respostas
- Capacidade de busca de documentos usando Cognitive Search
- Integração com o banco de dados de clientes existente
- Suporte a múltiplos idiomas

**Requisitos Não Funcionais:**
- Suportar 1000 usuários concorrentes
- SLA de 99,9% de disponibilidade
- Conformidade SOC 2
- Custo abaixo de $500/mês
- Implantar em múltiplos ambientes (dev, staging, prod)

### Passos de Implementação

1. **Projetar a arquitetura**
2. **Criar o template AZD**
3. **Implementar medidas de segurança**
4. **Configurar monitoramento e alertas**
5. **Criar pipelines de implantação**
6. **Documentar a solução**

### Critérios de Avaliação

- ✅ **Funcionalidade**: Atende a todos os requisitos?
- ✅ **Segurança**: As melhores práticas estão implementadas?
- ✅ **Escalabilidade**: Pode lidar com a carga?
- ✅ **Mantenabilidade**: O código e a infraestrutura estão bem organizados?
- ✅ **Custo**: Está dentro do orçamento?

## Recursos Adicionais

### Documentação Microsoft
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentação do Azure OpenAI Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentação do Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos da Comunidade
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificado de Conclusão
Parabéns! Você concluiu o AI Workshop Lab. Agora você deve ser capaz de:

- ✅ Converter aplicações de IA existentes para templates AZD
- ✅ Implantar aplicações de IA prontas para produção
- ✅ Implementar melhores práticas de segurança para cargas de trabalho de IA
- ✅ Monitorar e otimizar o desempenho de aplicações de IA
- ✅ Solucionar problemas comuns de implantação

### Próximos Passos
1. Aplique esses padrões em seus próprios projetos de IA
2. Contribua com templates para a comunidade
3. Participe do Discord do Microsoft Foundry para suporte contínuo
4. Explore tópicos avançados como implantações multi-região

---

**Feedback do Workshop**: Ajude-nos a melhorar este workshop compartilhando sua experiência no [canal #Azure do Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com Foco em IA
- **⬅️ Anterior**: [Implantação de Modelos de IA](ai-model-deployment.md)
- **➡️ Próximo**: [Melhores Práticas de IA em Produção](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de ajuda?** Participe da nossa comunidade para suporte e discussões sobre AZD e implantações de IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional feita por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->