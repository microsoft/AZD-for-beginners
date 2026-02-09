# AI Workshop Lab: Tornar as Suas Soluções de IA Implantáveis com AZD

**Navegação do Capítulo:**
- **📚 Página do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Anterior**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Seguinte**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Visão Geral do Workshop

Este laboratório prático orienta os desenvolvedores através do processo de pegar um template de IA existente e implantá-lo usando o Azure Developer CLI (AZD). Vai aprender padrões essenciais para implantações de IA em produção utilizando os serviços Microsoft Foundry.

**Duração:** 2-3 horas  
**Nível:** Intermédio  
**Pré-requisitos:** Conhecimentos básicos de Azure, familiaridade com conceitos de IA/ML

## 🎓 Objetivos de Aprendizagem

No final deste workshop, será capaz de:
- ✅ Converter uma aplicação de IA existente para usar templates AZD
- ✅ Configurar serviços Microsoft Foundry com AZD
- ✅ Implementar gestão segura de credenciais para serviços de IA
- ✅ Implantar aplicações de IA prontas para produção com monitorização
- ✅ Resolver problemas comuns de implantação de IA

## Pré-requisitos

### Ferramentas Necessárias
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado
- [Git](https://git-scm.com/) instalado
- Editor de código (recomendado VS Code)

### Recursos Azure
- Subscrição Azure com acesso de contributor
- Acesso aos serviços Azure OpenAI (ou possibilidade de solicitar acesso)
- Permissões para criar resource groups

### Conhecimentos Pré-requisitos
- Compreensão básica dos serviços Azure
- Familiaridade com interfaces de linha de comandos
- Conceitos básicos de IA/ML (APIs, modelos, prompts)

## Configuração do Laboratório

### Passo 1: Preparação do Ambiente

1. **Verificar instalações das ferramentas:**
```bash
# Verificar a instalação do AZD
azd version

# Verificar a CLI do Azure
az --version

# Iniciar sessão no Azure
az login
azd auth login
```

2. **Clonar o repositório do workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Compreender a Estrutura AZD para Aplicações de IA

### Anatomia de um Template AZD para IA

Explore os ficheiros chave num template AZD pronto para IA:

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

1. **Examinar o ficheiro azure.yaml:**
```bash
cat azure.yaml
```

**O que procurar:**
- Definições de serviços para componentes de IA
- Mapeamentos de variáveis de ambiente
- Configurações de host

2. **Rever o main.bicep da infraestrutura:**
```bash
cat infra/main.bicep
```

**Padrões chave de IA a identificar:**
- Provisionamento do serviço Azure OpenAI
- Integração com Cognitive Search
- Gestão segura de chaves
- Configurações de segurança de rede

### **Ponto de Discussão:** Porque é que Estes Padrões Importam para a IA

- **Dependências de Serviço**: As aplicações de IA frequentemente requerem múltiplos serviços coordenados
- **Segurança**: Chaves de API e endpoints precisam de gestão segura
- **Escalabilidade**: Workloads de IA têm requisitos de escalabilidade únicos
- **Gestão de Custos**: Serviços de IA podem ser dispendiosos se não forem configurados corretamente

## Módulo 2: Implantar a Sua Primeira Aplicação de IA

### Passo 2.1: Inicializar o Ambiente

1. **Criar um novo ambiente AZD:**
```bash
azd env new myai-workshop
```

2. **Definir parâmetros necessários:**
```bash
# Defina a sua região Azure preferida
azd env set AZURE_LOCATION eastus

# Opcional: Defina um modelo específico da OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Passo 2.2: Implantar a Infraestrutura e a Aplicação

1. **Implantar com AZD:**
```bash
azd up
```

**O que acontece durante o `azd up`:**
- ✅ Provisiona o serviço Azure OpenAI
- ✅ Cria o serviço Cognitive Search
- ✅ Configura o App Service para a aplicação web
- ✅ Configura a rede e a segurança
- ✅ Implanta o código da aplicação
- ✅ Configura monitorização e logging

2. **Monitorizar o progresso da implantação** e notar os recursos que estão a ser criados.

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
   - Tentar consultas de exemplo
   - Verificar que as respostas de IA estão a funcionar

### **Exercício de Laboratório 2.1: Prática de Resolução de Problemas**

**Cenário**: A sua implantação teve sucesso mas a IA não responde.

**Problemas comuns a verificar:**
1. **Chaves da API OpenAI**: Verificar se estão corretamente definidas
2. **Disponibilidade do modelo**: Verificar se a sua região suporta o modelo
3. **Conectividade de rede**: Garantir que os serviços conseguem comunicar
4. **Permissões RBAC**: Verificar se a aplicação consegue aceder ao OpenAI

**Comandos de debugging:**
```bash
# Verificar variáveis de ambiente
azd env get-values

# Ver registos de implantação
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verificar estado da implantação da OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalizar Aplicações de IA para as Suas Necessidades

### Passo 3.1: Modificar a Configuração de IA

1. **Atualizar o modelo OpenAI:**
```bash
# Mudar para um modelo diferente (se disponível na sua região)
azd env set AZURE_OPENAI_MODEL gpt-4

# Reimplantar com a nova configuração
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

**Boa Prática**: Configurações diferentes para desenvolvimento vs produção.

1. **Criar um ambiente de produção:**
```bash
azd env new myai-production
```

2. **Definir parâmetros específicos para produção:**
```bash
# A produção normalmente utiliza SKUs mais elevados
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ativar funcionalidades de segurança adicionais
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Exercício de Laboratório 3.1: Otimização de Custos**

**Desafio**: Configurar o template para desenvolvimento com custos reduzidos.

**Tarefas:**
1. Identificar quais os SKUs que podem ser definidos para tiers free/basic
2. Configurar variáveis de ambiente para custo mínimo
3. Implantar e comparar custos com a configuração de produção

**Dicas de solução:**
- Usar a tier F0 (grátis) para Cognitive Services quando possível
- Usar a tier Basic para Search Service em desenvolvimento
- Considerar o uso do plano Consumption para Functions

## Módulo 4: Segurança e Boas Práticas para Produção

### Passo 4.1: Gestão Segura de Credenciais

**Desafio atual**: Muitas aplicações de IA codificam chaves de API ou usam armazenamento inseguro.

**Solução AZD**: Managed Identity + integração com Key Vault.

1. **Rever a configuração de segurança no seu template:**
```bash
# Procure a configuração do Key Vault e da Identidade Gerida
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verificar se a Managed Identity está a funcionar:**
```bash
# Verificar se a aplicação web tem a configuração de identidade correta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Passo 4.2: Segurança de Rede

1. **Ativar endpoints privados** (se ainda não estiverem configurados):

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

1. **Configurar o Application Insights:**
```bash
# O Application Insights deve ser configurado automaticamente
# Verifique a configuração:
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

**Tarefa**: Rever a sua implantação quanto às melhores práticas de segurança.

**Lista de verificação:**
- [ ] Sem segredos hardcoded no código ou configuração
- [ ] Managed Identity utilizada para autenticação serviço-a-serviço
- [ ] Key Vault armazena a configuração sensível
- [ ] Acesso à rede está devidamente restringido
- [ ] Monitorização e logging estão ativados

## Módulo 5: Converter a Sua Própria Aplicação de IA

### Passo 5.1: Ficha de Avaliação

**Antes de converter a sua app**, responda a estas perguntas:

1. **Arquitetura da Aplicação:**
   - Que serviços de IA a sua app utiliza?
   - Que recursos de computação necessita?
   - Requer uma base de dados?
   - Quais as dependências entre serviços?

2. **Requisitos de Segurança:**
   - Que dados sensíveis a sua app lida?
   - Que requisitos de conformidade tem?
   - Precisa de rede privada?

3. **Requisitos de Escalonamento:**
   - Qual a carga esperada?
   - Precisa de auto-escalamento?
   - Existem requisitos regionais?

### Passo 5.2: Criar o Seu Template AZD

**Siga este padrão para converter a sua app:**

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

### **Exercício de Laboratório 5.1: Desafio de Criação de Template**

**Desafio**: Criar um template AZD para uma app de IA de processamento de documentos.

**Requisitos:**
- Azure OpenAI para análise de conteúdo
- Document Intelligence para OCR
- Storage Account para carregamentos de documentos
- Function App para lógica de processamento
- App web para interface de utilizador

**Pontos bónus:**
- Adicionar tratamento de erros adequado
- Incluir estimativa de custos
- Configurar dashboards de monitorização

## Módulo 6: Resolução de Problemas Comuns

### Problemas Comuns de Implantação

#### Problema 1: Quota do Serviço OpenAI Excedida
**Sintomas:** A implantação falha com erro de quota
**Soluções:**
```bash
# Verificar quotas atuais
az cognitiveservices usage list --location eastus

# Solicitar aumento da quota ou tentar outra região
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelo Não Disponível na Região
**Sintomas:** Respostas de IA falham ou há erros na implantação do modelo
**Soluções:**
```bash
# Verificar a disponibilidade do modelo por região
az cognitiveservices model list --location eastus

# Atualizar para um modelo disponível
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problema 3: Problemas de Permissões
**Sintomas:** Erros 403 Forbidden ao chamar serviços de IA
**Soluções:**
```bash
# Verificar as atribuições de papéis
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Adicionar papéis em falta
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemas de Performance

#### Problema 4: Respostas de IA Lentas
**Passos de investigação:**
1. Verificar o Application Insights para métricas de performance
2. Rever métricas do serviço OpenAI no portal Azure
3. Verificar conectividade de rede e latência

**Soluções:**
- Implementar caching para consultas comuns
- Usar o modelo OpenAI apropriado para o seu caso de uso
- Considerar réplicas de leitura para cenários de alta carga

### **Exercício de Laboratório 6.1: Desafio de Debugging**

**Cenário**: A sua implantação teve sucesso, mas a aplicação retorna erros 500.

**Tarefas de debugging:**
1. Verificar logs da aplicação
2. Verificar conectividade entre serviços
3. Testar autenticação
4. Rever a configuração

**Ferramentas a utilizar:**
- `azd show` para visão geral da implantação
- Portal Azure para logs detalhados dos serviços
- Application Insights para telemetria da aplicação

## Módulo 7: Monitorização e Otimização

### Passo 7.1: Configurar Monitorização Abrangente

1. **Criar dashboards personalizados:**

Navegar até ao portal Azure e criar um dashboard com:
- Contagem e latência de pedidos OpenAI
- Taxas de erro da aplicação
- Utilização de recursos
- Acompanhamento de custos

2. **Configurar alertas:**
```bash
# Alerta para taxa de erro elevada
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
# Utilize a CLI do Azure para obter dados de custos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementar controlos de custos:**
- Configurar alertas de orçamento
- Usar políticas de autoscaling
- Implementar caching de pedidos
- Monitorizar o uso de tokens para o OpenAI

### **Exercício de Laboratório 7.1: Otimização de Performance**

**Tarefa**: Otimizar a sua aplicação de IA tanto para performance como para custo.

**Métricas a melhorar:**
- Reduzir o tempo médio de resposta em 20%
- Reduzir os custos mensais em 15%
- Manter 99.9% de uptime

**Estratégias a experimentar:**
- Implementar caching de respostas
- Otimizar prompts para eficiência de tokens
- Usar SKUs de computação apropriados
- Configurar autoscaling adequado

## Desafio Final: Implementação End-to-End

### Cenário do Desafio

Foi-lhe atribuída a tarefa de criar um chatbot de suporte ao cliente pronto para produção com estes requisitos:

**Requisitos Funcionais:**
- Interface web para interações com clientes
- Integração com Azure OpenAI para respostas
- Capacidade de pesquisa de documentos usando Cognitive Search
- Integração com base de dados de clientes existente
- Suporte multilingue

**Requisitos Não Funcionais:**
- Suportar 1000 utilizadores concorrentes
- SLA de 99.9% de uptime
- Conformidade SOC 2
- Custo abaixo de $500/mês
- Implantar em múltiplos ambientes (dev, staging, prod)

### Passos de Implementação

1. **Desenhar a arquitetura**
2. **Criar o template AZD**
3. **Implementar medidas de segurança**
4. **Configurar monitorização e alertas**
5. **Criar pipelines de implantação**
6. **Documentar a solução**

### Critérios de Avaliação

- ✅ **Funcionalidade**: Cumpre todos os requisitos?
- ✅ **Segurança**: Estão implementadas as melhores práticas?
- ✅ **Escalabilidade**: Consegue aguentar a carga?
- ✅ **Manutenibilidade**: O código e a infraestrutura estão bem organizados?
- ✅ **Custo**: Mantém-se dentro do orçamento?

## Recursos Adicionais

### Documentação Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Templates de Exemplo
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos da Comunidade
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificado de Conclusão
Parabéns! Concluiu o Laboratório do Workshop de IA. Agora deverá ser capaz de:

- ✅ Converter aplicações de IA existentes para modelos AZD
- ✅ Implantar aplicações de IA prontas para produção
- ✅ Implementar as melhores práticas de segurança para cargas de trabalho de IA
- ✅ Monitorizar e otimizar o desempenho de aplicações de IA
- ✅ Resolver problemas comuns de implantação

### Próximos Passos
1. Aplique estes padrões aos seus próprios projetos de IA
2. Contribua com os modelos para a comunidade
3. Junte-se ao Discord da Microsoft Foundry para suporte contínuo
4. Explore tópicos avançados como implantações multi-região

---

**Feedback do Workshop**: Ajude-nos a melhorar este workshop partilhando a experiência no [canal #Azure do Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Anterior**: [Implantação de Modelos de IA](ai-model-deployment.md)
- **➡️ Seguinte**: [Melhores Práticas de IA em Produção](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de ajuda?** Junte-se à nossa comunidade para obter suporte e discutir implantações AZD e IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a exatidão, tenha em atenção que as traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte autorizada. Para informação crítica, recomenda-se uma tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->