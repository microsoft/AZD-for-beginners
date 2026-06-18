# Laboratório Workshop de IA: Tornar as Suas Soluções de IA Implantáveis com AZD

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Anterior**: [Implantação de Modelo de IA](ai-model-deployment.md)
- **➡️ Seguinte**: [Boas Práticas de IA em Produção](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

## Visão Geral do Workshop

Este laboratório prático orienta os programadores através do processo de utilização de um template de IA existente e da sua implantação usando o Azure Developer CLI (AZD). Vai aprender padrões essenciais para implantações de IA em produção usando os serviços Microsoft Foundry.

> **Nota de validação (2026-03-25):** Este workshop foi revisto com a versão `azd` `1.23.12`. Se a sua instalação local for mais antiga, atualize o AZD antes de começar para que o fluxo de autenticação, template e implantação corresponda aos passos abaixo.

**Duração:** 2-3 horas  
**Nível:** Intermédio  
**Pré-requisitos:** Conhecimentos básicos de Azure, familiaridade com conceitos de IA/ML

## 🎓 Objetivos de Aprendizagem

No final deste workshop, será capaz de:
- ✅ Converter uma aplicação de IA existente para usar templates AZD
- ✅ Configurar serviços Microsoft Foundry com AZD
- ✅ Implementar gestão segura de credenciais para serviços de IA
- ✅ Implantar aplicações de IA prontas para produção com monitorização
- ✅ Diagnosticar problemas comuns de implantação de IA

## Pré-requisitos

### Ferramentas Necessárias
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado
- [Git](https://git-scm.com/) instalado
- Editor de código (VS Code recomendado)

### Recursos Azure
- Subscrição Azure com acesso de colaborador
- Acesso aos serviços Microsoft Foundry Models (ou capacidade para solicitar acesso)
- Permissões para criar grupos de recursos

### Conhecimentos Necessários
- Entendimento básico dos serviços Azure
- Familiaridade com interfaces de linha de comando
- Conceitos básicos de IA/ML (APIs, modelos, prompts)

## Configuração do Laboratório

### Passo 1: Preparação do Ambiente

1. **Verifique as instalações das ferramentas:**
```bash
# Verificar instalação do AZD
azd version

# Verificar Azure CLI
az --version

# Iniciar sessão no Azure para fluxos de trabalho do AZD
azd auth login

# Iniciar sessão no Azure CLI apenas se pretender executar comandos az durante o diagnóstico
az login
```

Se trabalhar em múltiplos tenants ou a sua subscrição não for detetada automaticamente, tente novamente com `azd auth login --tenant-id <tenant-id>`.

2. **Clone o repositório do workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Compreensão da Estrutura AZD para Aplicações de IA

### Anatomia de um Template AZD para IA

Explore os ficheiros principais de um template AZD preparado para IA:

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

### **Exercício do Laboratório 1.1: Explore a Configuração**

1. **Analise o ficheiro azure.yaml:**
```bash
cat azure.yaml
```

**O que deve observar:**
- Definições de serviços para componentes de IA
- Mapeamento de variáveis de ambiente
- Configurações de host

2. **Reveja a infraestrutura main.bicep:**
```bash
cat infra/main.bicep
```

**Padrões chave de IA a identificar:**
- Provisionamento do serviço Microsoft Foundry Models
- Integração com Azure AI Search
- Gestão segura de chaves
- Configurações de segurança de rede

### **Ponto de Discussão:** Por que Estes Padrões São Importantes para IA

- **Dependências de Serviços:** Aplicações de IA geralmente exigem múltiplos serviços coordenados  
- **Segurança:** As chaves API e endpoints necessitam de gestão segura  
- **Escalabilidade:** Cargas de trabalho de IA têm requisitos únicos de escalabilidade  
- **Gestão de Custos:** Serviços de IA podem ser dispendiosos se não configurados corretamente  

## Módulo 2: Implemente a Sua Primeira Aplicação de IA

### Passo 2.1: Iniciar o Ambiente

1. **Crie um novo ambiente AZD:**
```bash
azd env new myai-workshop
```

2. **Defina os parâmetros necessários:**
```bash
# Defina a sua região Azure preferida
azd env set AZURE_LOCATION eastus

# Opcional: Defina um modelo específico da OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Passo 2.2: Implante a Infraestrutura e a Aplicação

1. **Implante com AZD:**
```bash
azd up
```

**O que acontece durante o `azd up`:**
- ✅ Provisiona o serviço Microsoft Foundry Models  
- ✅ Cria o serviço Azure AI Search  
- ✅ Configura o App Service para a aplicação web  
- ✅ Configura redes e segurança  
- ✅ Implanta o código da aplicação  
- ✅ Configura monitorização e logging  

2. **Monitorize o progresso da implantação** e tome nota dos recursos criados.

### Passo 2.3: Verifique a Sua Implantação

1. **Verifique os recursos implantados:**
```bash
azd show
```

2. **Abra a aplicação implantada:**
```bash
azd show
```

Abra o endpoint web mostrado na saída do `azd show`.

3. **Teste a funcionalidade de IA:**
   - Navegue até à aplicação web  
   - Experimente consultas de exemplo  
   - Verifique se as respostas de IA funcionam correctamente  

### **Exercício do Laboratório 2.1: Prática de Resolução de Problemas**

**Cenário**: A sua implantação foi bem-sucedida, mas a IA não responde.

**Problemas comuns a verificar:**
1. **Chaves API OpenAI**: Verifique se estão corretamente definidas  
2. **Disponibilidade do modelo**: Confirme se a sua região suporta o modelo  
3. **Conectividade de rede**: Assegure que os serviços comunicam entre si  
4. **Permissões RBAC**: Verifique se a aplicação pode aceder ao OpenAI

**Comandos para depuração:**
```bash
# Verificar variáveis de ambiente
azd env get-values

# Ver registos de implantação
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verificar estado da implantação OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalização de Aplicações de IA para as Suas Necessidades

### Passo 3.1: Modificar a Configuração de IA

1. **Atualize o modelo OpenAI:**
```bash
# Mudar para um modelo diferente (se disponível na sua região)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Reimplementar com a nova configuração
azd deploy
```

2. **Adicione serviços adicionais de IA:**

Edite o `infra/main.bicep` para adicionar Document Intelligence:

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

### Passo 3.2: Configurações Específicas do Ambiente

**Boa Prática**: Configurações diferentes para desenvolvimento vs produção.

1. **Crie um ambiente de produção:**
```bash
azd env new myai-production
```

2. **Defina parâmetros específicos para produção:**
```bash
# A produção normalmente utiliza SKUs mais elevados
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ativar funcionalidades de segurança adicionais
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Exercício do Laboratório 3.1: Otimização de Custos**

**Desafio**: Configure o template para desenvolvimento com custo eficiente.

**Tarefas:**
1. Identificar quais SKUs podem ser definidos para tiers grátis/básicos  
2. Configurar variáveis de ambiente para custo mínimo  
3. Implantar e comparar custos com a configuração de produção  

**Dicas para a solução:**
- Use o tier F0 (gratuito) para Azure AI Services quando possível  
- Use o tier Básico para o serviço de Search em desenvolvimento  
- Considere usar plano Consumption para Functions  

## Módulo 4: Segurança e Boas Práticas para Produção

### Passo 4.1: Gestão Segura de Credenciais

**Desafio atual**: Muitas aplicações de IA codificam chaves API ou usam armazenamento inseguro.

**Solução AZD**: Identidade Gerida + integração com Key Vault.

1. **Reveja a configuração de segurança no seu template:**
```bash
# Procure a configuração do Key Vault e da Identidade Gerida
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifique se a Identidade Gerida está a funcionar:**
```bash
# Verificar se a aplicação web tem a configuração de identidade correta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Passo 4.2: Segurança de Rede

1. **Ative endpoints privados** (se ainda não configurados):

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

### Passo 4.3: Monitorização e Observabilidade

1. **Configure Application Insights:**
```bash
# O Application Insights deve ser configurado automaticamente
# Verifique a configuração:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Configure monitorização específica de IA:**

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

### **Exercício do Laboratório 4.1: Auditoria de Segurança**

**Tarefa**: Reveja a sua implantação quanto às melhores práticas de segurança.

**Lista de verificação:**
- [ ] Nenhum segredo codificado no código ou configuração  
- [ ] Utilização de Identidade Gerida para autenticação serviço a serviço  
- [ ] Armazenamento de configuração sensível no Key Vault  
- [ ] Acesso à rede devidamente restringido  
- [ ] Monitorização e logging ativados  

## Módulo 5: Convertendo a Sua Própria Aplicação de IA

### Passo 5.1: Folha de Avaliação

**Antes de converter a sua app**, responda a estas perguntas:

1. **Arquitetura da Aplicação:**
   - Que serviços de IA a sua app usa?  
   - Que recursos de computação necessita?  
   - Precisa de base de dados?  
   - Quais são as dependências entre serviços?

2. **Requisitos de Segurança:**
   - Que dados sensíveis a sua app manipula?  
   - Que requisitos de conformidade tem?  
   - Precisa de redes privadas?

3. **Requisitos de Escalabilidade:**
   - Qual é a carga esperada?  
   - Precisa de autoescalamento?  
   - Existem requisitos regionais?

### Passo 5.2: Crie o Seu Template AZD

**Siga este padrão para converter a sua app:**

1. **Crie a estrutura básica:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializar o modelo AZD
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

3. **Crie os templates de infraestrutura:**

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

### **Exercício do Laboratório 5.1: Desafio de Criação de Template**

**Desafio**: Crie um template AZD para uma app de processamento de documentos com IA.

**Requisitos:**
- Microsoft Foundry Models para análise de conteúdo  
- Document Intelligence para OCR  
- Conta de Armazenamento para uploads de documentos  
- Function App para lógica de processamento  
- Aplicação web para interface do utilizador  

**Pontos bónus:**
- Adicionar tratamento adequado de erros  
- Incluir estimativa de custos  
- Configurar dashboards de monitorização  

## Módulo 6: Resolução de Problemas Comuns

### Problemas Comuns de Implantação

#### Problema 1: Quota do Serviço OpenAI Excedida  
**Sintomas:** Falha na implantação com erro de quota  
**Soluções:**
```bash
# Verificar quotas atuais
az cognitiveservices usage list --location eastus

# Solicitar aumento de quota ou tentar região diferente
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelo Não Disponível na Região  
**Sintomas:** Falhas nas respostas de IA ou erros de implantação do modelo  
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
# Verificar atribuições de função
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Adicionar funções em falta
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemas de Performance

#### Problema 4: Respostas Lentas da IA  
**Passos para investigação:**
1. Verifique métricas no Application Insights  
2. Reveja métricas do serviço OpenAI no portal Azure  
3. Confirme conectividade e latência da rede  

**Soluções:**
- Implemente caching para consultas comuns  
- Use o modelo OpenAI adequado para o seu caso  
- Considere réplicas de leitura para cenários de alta carga  

### **Exercício do Laboratório 6.1: Desafio de Depuração**

**Cenário**: A implantação foi bem-sucedida, mas a aplicação retorna erros 500.

**Tarefas de depuração:**
1. Verifique os logs da aplicação  
2. Confirme conectividade dos serviços  
3. Teste autenticação  
4. Reveja a configuração

**Ferramentas para usar:**
- `azd show` para visão geral da implantação  
- Portal Azure para logs detalhados dos serviços  
- Application Insights para telemetria da aplicação  

## Módulo 7: Monitorização e Otimização

### Passo 7.1: Configure Monitorização Abrangente

1. **Crie dashboards personalizados:**

Navegue no portal Azure e crie um dashboard com:  
- Contagem e latência de pedidos OpenAI  
- Taxas de erro da aplicação  
- Utilização de recursos  
- Acompanhamento de custos  

2. **Configure alertas:**
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

1. **Analise os custos atuais:**
```bash
# Utilizar o Azure CLI para obter dados de custo
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implemente controlos de custos:**
- Configure alertas de orçamento  
- Use políticas de autoescalamento  
- Implemente caching de pedidos  
- Monitorize o uso de tokens do OpenAI  

### **Exercício do Laboratório 7.1: Otimização de Performance**

**Tarefa**: Otimize a sua aplicação de IA para desempenho e custo.

**Métricas a melhorar:**
- Reduzir o tempo médio de resposta em 20%  
- Reduzir os custos mensais em 15%  
- Manter 99.9% de disponibilidade  

**Estratégias a experimentar:**
- Implemente caching de respostas  
- Otimize prompts para eficiência de tokens  
- Use SKUs de computação apropriados  
- Configure autoescalamento adequado  

## Desafio Final: Implementação End-to-End

### Cenário do Desafio

Foi-lhe atribuída a tarefa de criar um chatbot para serviço ao cliente alimentado por IA, pronto para produção, com estes requisitos:

**Requisitos Funcionais:**
- Interface web para interações com clientes  
- Integração com Microsoft Foundry Models para respostas  
- Capacidade de pesquisa de documentos usando Azure AI Search  
- Integração com base de dados de clientes existente  
- Suporte multilingue  

**Requisitos Não Funcionais:**
- Suportar 1000 utilizadores concorrentes  
- SLA de 99.9% de uptime  
- Conformidade SOC 2  
- Custo abaixo de 500$/mês  
- Implantação em múltiplos ambientes (dev, staging, prod)  

### Passos para Implementação

1. **Desenhe a arquitetura**  
2. **Crie o template AZD**  
3. **Implemente medidas de segurança**  
4. **Configure monitorização e alertas**  
5. **Crie pipelines de implantação**  
6. **Documente a solução**  

### Critérios de Avaliação

- ✅ **Funcionalidade**: Cumpre todos os requisitos?  
- ✅ **Segurança**: As melhores práticas estão implementadas?  
- ✅ **Escalabilidade**: Pode suportar a carga?  
- ✅ **Manutenção**: Código e infraestrutura estão organizados?  
- ✅ **Custo**: Está dentro do orçamento?  

## Recursos Adicionais

### Documentação Microsoft
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentação do Serviço Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentação Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templates de Exemplo
- [Aplicação Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Quickstart Aplicação Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos da Comunidade
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificado de Conclusão

Parabéns! Terminou o Laboratório do Workshop de IA. Agora deverá ser capaz de:

- ✅ Converter aplicações de IA existentes em templates AZD
- ✅ Implementar aplicações de IA prontas para produção
- ✅ Implementar as melhores práticas de segurança para cargas de trabalho de IA
- ✅ Monitorizar e otimizar o desempenho das aplicações de IA
- ✅ Resolver problemas comuns na implementação

### Próximos Passos
1. Aplicar estes padrões nos seus próprios projetos de IA
2. Contribuir com templates para a comunidade
3. Juntar-se ao Microsoft Foundry Discord para suporte contínuo
4. Explorar tópicos avançados como implementações multi-região

---

**Feedback do Workshop**: Ajude-nos a melhorar este workshop partilhando a sua experiência no [canal #Azure do Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navegação pelo Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com IA em Primeiro Lugar
- **⬅️ Anterior**: [Implementação de Modelo de IA](ai-model-deployment.md)
- **➡️ Seguinte**: [Melhores Práticas de IA em Produção](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de Ajuda?** Junte-se à nossa comunidade para suporte e discussões sobre AZD e implementações de IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->