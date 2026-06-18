# Laboratório Prático de IA: Tornando Suas Soluções de IA Implantáveis com AZD

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com foco em IA
- **⬅️ Anterior**: [Implantação de Modelos de IA](ai-model-deployment.md)
- **➡️ Próximo**: [Melhores Práticas para IA em Produção](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

## Visão Geral do Workshop

Este laboratório prático guia desenvolvedores pelo processo de pegar um template de IA existente e implantá-lo usando o Azure Developer CLI (AZD). Você aprenderá padrões essenciais para implantações de IA em produção usando os serviços Microsoft Foundry.

> **Nota de validação (2026-03-25):** Este workshop foi revisado com `azd` `1.23.12`. Se sua instalação local for mais antiga, atualize o AZD antes de começar para que o fluxo de autenticação, template e implantação corresponda aos passos abaixo.

**Duração:** 2-3 horas  
**Nível:** Intermediário  
**Pré-requisitos:** Conhecimento básico de Azure, familiaridade com conceitos de IA/ML

## 🎓 Objetivos de Aprendizagem

Ao final deste workshop, você será capaz de:
- ✅ Converter uma aplicação de IA existente para usar templates AZD
- ✅ Configurar serviços Microsoft Foundry com AZD
- ✅ Implementar gerenciamento seguro de credenciais para serviços de IA
- ✅ Implantar aplicações de IA prontas para produção com monitoramento
- ✅ Solucionar problemas comuns de implantação de IA

## Pré-requisitos

### Ferramentas Necessárias
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado
- [Git](https://git-scm.com/) instalado
- Editor de código (recomendado VS Code)

### Recursos Azure
- Assinatura Azure com acesso de colaborador
- Acesso aos serviços Microsoft Foundry Models (ou capacidade de solicitar acesso)
- Permissões para criação de resource group

### Conhecimentos Pré-requisitos
- Entendimento básico dos serviços Azure
- Familiaridade com interfaces de linha de comando
- Conceitos básicos de IA/ML (APIs, modelos, prompts)

## Configuração do Lab

### Passo 1: Preparação do Ambiente

1. **Verifique as instalações das ferramentas:**
```bash
# Verifique a instalação do AZD
azd version

# Verifique a CLI do Azure
az --version

# Faça login no Azure para fluxos de trabalho do AZD
azd auth login

# Faça login na CLI do Azure somente se você planeja executar comandos 'az' durante o diagnóstico
az login
```

Se você trabalhar em múltiplos tenants ou sua assinatura não for detectada automaticamente, tente novamente com `azd auth login --tenant-id <tenant-id>`.

2. **Clone o repositório do workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Compreendendo a Estrutura do AZD para Aplicações de IA

### Anatomia de um Template AZD para IA

Explore os arquivos principais em um template AZD pronto para IA:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
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
- Definições de serviço para componentes de IA
- Mapeamentos de variáveis de ambiente
- Configurações de host

2. **Revise o main.bicep de infraestrutura:**
```bash
cat infra/main.bicep
```

**Principais padrões de IA a identificar:**
- Provisionamento do serviço Microsoft Foundry Models
- Integração com Azure AI Search
- Gerenciamento seguro de chaves
- Configurações de segurança de rede

### **Ponto de Discussão:** Por que Esses Padrões Importam para IA

- **Dependências de Serviço**: Aplicações de IA frequentemente exigem múltiplos serviços coordenados
- **Segurança**: Chaves de API e endpoints precisam de gerenciamento seguro
- **Escalabilidade**: Workloads de IA têm requisitos únicos de escalonamento
- **Gerenciamento de Custos**: Serviços de IA podem ser caros se não configurados adequadamente

## Módulo 2: Implemente Sua Primeira Aplicação de IA

### Passo 2.1: Inicialize o Ambiente

1. **Crie um novo ambiente AZD:**
```bash
azd env new myai-workshop
```

2. **Defina os parâmetros necessários:**
```bash
# Defina sua região preferida do Azure
azd env set AZURE_LOCATION eastus

# Opcional: Defina um modelo OpenAI específico
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Passo 2.2: Implemente a Infraestrutura e a Aplicação

1. **Implemente com AZD:**
```bash
azd up
```

**O que acontece durante o `azd up`:**
- ✅ Provisiona o serviço Microsoft Foundry Models
- ✅ Cria o serviço Azure AI Search
- ✅ Configura App Service para a aplicação web
- ✅ Configura rede e segurança
- ✅ Faz o deploy do código da aplicação
- ✅ Configura monitoramento e logging

2. **Monitore o progresso da implantação** e observe os recursos que estão sendo criados.

### Passo 2.3: Verifique Sua Implantação

1. **Verifique os recursos implantados:**
```bash
azd show
```

2. **Abra a aplicação implantada:**
```bash
azd show
```

Abra o endpoint web mostrado na saída de `azd show`.

3. **Teste a funcionalidade de IA:**
   - Navegue até a aplicação web
   - Faça consultas de exemplo
   - Verifique se as respostas de IA estão funcionando

### **Exercício de Laboratório 2.1: Prática de Solução de Problemas**

**Cenário**: Sua implantação sucedeu mas a IA não está respondendo.

**Problemas comuns a verificar:**
1. **Chaves de API do OpenAI**: Verifique se estão definidas corretamente
2. **Disponibilidade do modelo**: Verifique se sua região suporta o modelo
3. **Conectividade de rede**: Garanta que os serviços possam se comunicar
4. **Permissões RBAC**: Verifique se o aplicativo pode acessar o OpenAI

**Comandos de depuração:**
```bash
# Verificar variáveis de ambiente
azd env get-values

# Ver logs de implantação
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verificar status de implantação do OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalizando Aplicações de IA para Suas Necessidades

### Passo 3.1: Modifique a Configuração de IA

1. **Atualize o modelo OpenAI:**
```bash
# Mude para um modelo diferente (se disponível em sua região)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Reimplante com a nova configuração
azd deploy
```

2. **Adicione serviços de IA adicionais:**

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

1. **Crie um ambiente de produção:**
```bash
azd env new myai-production
```

2. **Defina parâmetros específicos de produção:**
```bash
# Em produção geralmente são usadas SKUs mais altas
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ativar recursos de segurança adicionais
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Exercício de Laboratório 3.1: Otimização de Custos**

**Desafio**: Configure o template para desenvolvimento com custo efetivo.

**Tarefas:**
1. Identificar quais SKUs podem ser definidos em níveis free/basic
2. Configurar variáveis de ambiente para custo mínimo
3. Implantar e comparar os custos com a configuração de produção

**Dicas de solução:**
- Use o nível F0 (free) para Azure AI Services quando possível
- Use o nível Basic para o Search Service em desenvolvimento
- Considere usar o plano Consumption para Functions

## Módulo 4: Segurança e Melhores Práticas para Produção

### Passo 4.1: Gerenciamento Seguro de Credenciais

**Desafio atual**: Muitas aplicações de IA codificam chaves de API ou usam armazenamento inseguro.

**Solução AZD**: Managed Identity + integração com Key Vault.

1. **Revise a configuração de segurança no seu template:**
```bash
# Procure pela configuração do Key Vault e da Identidade Gerenciada
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifique se o Managed Identity está funcionando:**
```bash
# Verifique se o aplicativo web possui a configuração de identidade correta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Passo 4.2: Segurança de Rede

1. **Habilite private endpoints** (se ainda não configurado):

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

### Passo 4.3: Monitoramento e Observabilidade

1. **Configure o Application Insights:**
```bash
# O Application Insights deve ser configurado automaticamente
# Verifique a configuração:
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

**Tarefa**: Revise sua implantação em busca das melhores práticas de segurança.

**Lista de verificação:**
- [ ] Sem segredos hardcoded no código ou configuração
- [ ] Managed Identity usado para autenticação entre serviços
- [ ] Key Vault armazena configurações sensíveis
- [ ] Acesso à rede está devidamente restrito
- [ ] Monitoramento e logging estão habilitados

## Módulo 5: Convertendo Sua Própria Aplicação de IA

### Passo 5.1: Planilha de Avaliação

**Antes de converter sua aplicação**, responda a estas perguntas:

1. **Arquitetura da Aplicação:**
   - Quais serviços de IA sua aplicação usa?
   - Quais recursos de compute ela necessita?
   - Requer um banco de dados?
   - Quais são as dependências entre serviços?

2. **Requisitos de Segurança:**
   - Quais dados sensíveis sua aplicação manipula?
   - Quais requisitos de conformidade você possui?
   - Precisa de rede privada?

3. **Requisitos de Escalonamento:**
   - Qual é a carga esperada?
   - Precisa de auto-scaling?
   - Há requisitos regionais?

### Passo 5.2: Crie Seu Template AZD

**Siga este padrão para converter sua aplicação:**

1. **Crie a estrutura básica:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializar o template AZD
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

**Desafio**: Crie um template AZD para um app de IA de processamento de documentos.

**Requisitos:**
- Microsoft Foundry Models para análise de conteúdo
- Document Intelligence para OCR
- Storage Account para uploads de documentos
- Function App para lógica de processamento
- Web app para a interface do usuário

**Pontos extras:**
- Adicione tratamento de erros adequado
- Inclua estimativa de custos
- Configure dashboards de monitoramento

## Módulo 6: Solução de Problemas Comuns

### Problemas Comuns de Implantação

#### Problema 1: Cota do Serviço OpenAI Excedida
**Sintomas:** Implantação falha com erro de cota
**Soluções:**
```bash
# Verificar cotas atuais
az cognitiveservices usage list --location eastus

# Solicitar aumento de cota ou tentar outra região
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelo Não Disponível na Região
**Sintomas:** Respostas de IA falham ou erros de implantação do modelo
**Soluções:**
```bash
# Verificar a disponibilidade do modelo por região
az cognitiveservices model list --location eastus

# Atualizar para o modelo disponível
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problema 3: Problemas de Permissão
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

### Problemas de Performance

#### Problema 4: Respostas de IA Lentas
**Passos de investigação:**
1. Verifique o Application Insights para métricas de performance
2. Revise as métricas do serviço OpenAI no portal do Azure
3. Verifique conectividade de rede e latência

**Soluções:**
- Implemente cache para consultas comuns
- Use o modelo OpenAI apropriado para seu caso de uso
- Considere réplicas de leitura para cenários de alta carga

### **Exercício de Laboratório 6.1: Desafio de Depuração**

**Cenário**: Sua implantação sucedeu, mas a aplicação retorna erros 500.

**Tarefas de depuração:**
1. Verifique os logs da aplicação
2. Verifique a conectividade entre serviços
3. Teste a autenticação
4. Revise a configuração

**Ferramentas para usar:**
- `azd show` para visão geral da implantação
- Portal do Azure para logs detalhados dos serviços
- Application Insights para telemetria da aplicação

## Módulo 7: Monitoramento e Otimização

### Passo 7.1: Configure Monitoramento Abrangente

1. **Crie dashboards personalizados:**

Navegue até o portal do Azure e crie um dashboard com:
- Contagem e latência de requisições OpenAI
- Taxas de erro da aplicação
- Utilização de recursos
- Rastreamento de custos

2. **Configure alertas:**
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

1. **Analise os custos atuais:**
```bash
# Use o Azure CLI para obter dados de custo
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implemente controles de custo:**
- Configure alertas de orçamento
- Use políticas de autoscaling
- Implemente cache de requisições
- Monitore uso de tokens para OpenAI

### **Exercício de Laboratório 7.1: Otimização de Performance**

**Tarefa**: Otimize sua aplicação de IA tanto para performance quanto para custo.

**Métricas a melhorar:**
- Reduzir o tempo médio de resposta em 20%
- Reduzir custos mensais em 15%
- Manter 99,9% de uptime

**Estratégias para experimentar:**
- Implemente cache de respostas
- Otimize prompts para eficiência de tokens
- Use SKUs de compute apropriados
- Configure autoscaling adequado

## Desafio Final: Implementação de Ponta a Ponta

### Cenário do Desafio

Você foi encarregado de criar um chatbot de atendimento ao cliente pronto para produção com estes requisitos:

**Requisitos Funcionais:**
- Interface web para interações com clientes
- Integração com Microsoft Foundry Models para respostas
- Capacidade de busca em documentos usando Azure AI Search
- Integração com banco de dados de clientes existente
- Suporte multilíngue

**Requisitos Não Funcionais:**
- Atender 1000 usuários concorrentes
- SLA de 99,9% de uptime
- Conformidade SOC 2
- Custo abaixo de $500/mês
- Implantar em múltiplos ambientes (dev, staging, prod)

### Passos de Implementação

1. **Desenhe a arquitetura**
2. **Crie o template AZD**
3. **Implemente as medidas de segurança**
4. **Configure monitoramento e alertas**
5. **Crie pipelines de implantação**
6. **Documente a solução**

### Critérios de Avaliação

- ✅ **Funcionalidade**: Atende a todos os requisitos?
- ✅ **Segurança**: As melhores práticas foram implementadas?
- ✅ **Escalabilidade**: Consegue suportar a carga?
- ✅ **Manutenibilidade**: O código e a infraestrutura estão bem organizados?
- ✅ **Custo**: Mantém-se dentro do orçamento?

## Recursos Adicionais

### Documentação Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Templates de Exemplo
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos da Comunidade
- [Discord do Microsoft Foundry](https://discord.gg/microsoft-azure)
- [Azure Developer CLI no GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificado de Conclusão

Parabéns! Você concluiu o Laboratório do Workshop de IA. Agora você deve ser capaz de:

- ✅ Converter aplicações de IA existentes em templates AZD
- ✅ Implantar aplicações de IA prontas para produção
- ✅ Implementar as melhores práticas de segurança para cargas de trabalho de IA
- ✅ Monitorar e otimizar o desempenho de aplicações de IA
- ✅ Resolver problemas comuns de implantação

### Próximos Passos
1. Aplique esses padrões aos seus próprios projetos de IA
2. Contribua com templates para a comunidade
3. Participe do Discord do Microsoft Foundry para suporte contínuo
4. Explore tópicos avançados como implantações multi-região

---

**Feedback do Workshop**: Ajude-nos a melhorar este workshop compartilhando sua experiência no [canal #Azure do Discord do Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com IA em Primeiro Lugar
- **⬅️ Anterior**: [Implantação de Modelos de IA](ai-model-deployment.md)
- **➡️ Próximo**: [Melhores Práticas para IA em Produção](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de Ajuda?** Participe da nossa comunidade para obter suporte e discussões sobre AZD e implantações de IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->