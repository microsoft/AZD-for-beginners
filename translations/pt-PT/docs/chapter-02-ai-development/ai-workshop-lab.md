# Laboratório Oficina de IA: Tornar as suas Soluções de IA Implantáveis com AZD  

**Navegação do Capítulo:**  
- **📚 Início do Curso**: [AZD Para Principiantes](../../README.md)  
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First  
- **⬅️ Anterior**: [Implantação de Modelos de IA](ai-model-deployment.md)  
- **➡️ Seguinte**: [Melhores Práticas para IA em Produção](production-ai-practices.md)  
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)  

## Visão Geral da Oficina  

Este laboratório prático guia os desenvolvedores através do processo de usar um modelo de IA existente e implantá-lo usando o Azure Developer CLI (AZD). Vai aprender padrões essenciais para implantações de IA em produção utilizando os serviços Microsoft Foundry.  

> **Nota de validação (2026-07-13):** Esta oficina foi revista com a versão `azd` `1.27.1`. Se a sua instalação local for mais antiga, atualize o AZD antes de começar para que o fluxo de autenticação, template e implantação esteja conforme os passos abaixo.  

**Duração:** 2-3 horas  
**Nível:** Intermédio  
**Pré-requisitos:** Conhecimentos básicos de Azure, familiaridade com conceitos de IA/Machine Learning  

## 🎓 Objetivos de Aprendizagem  

No final desta oficina, será capaz de:  
- ✅ Converter uma aplicação de IA existente para usar modelos AZD  
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
- Subscrição Azure com acesso de colaborador  
- Acesso aos serviços Microsoft Foundry Models (ou possibilidade de solicitar acesso)  
- Permissões para criação de grupos de recurso  

### Conhecimentos Pré-requisitos  
- Compreensão básica dos serviços Azure  
- Familiaridade com interfaces de linha de comando  
- Conceitos básicos de IA/ML (APIs, modelos, prompts)  

## Configuração do Laboratório  

### Passo 1: Preparação do Ambiente  

1. **Verifique as instalações das ferramentas:**  
```bash
# Verificar a instalação do AZD
azd version

# Verificar o Azure CLI
az --version

# Iniciar sessão no Azure para os fluxos de trabalho do AZD
azd auth login

# Iniciar sessão no Azure CLI apenas se pretender executar comandos az durante o diagnóstico
az login
```

Se trabalhar com múltiplos tenants ou se a sua subscrição não for detectada automaticamente, tente novamente com `azd auth login --tenant-id <tenant-id>`.  

2. **Clone o repositório da oficina:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Compreendendo a Estrutura AZD para Aplicações de IA  

### Anatomia de um Template AZD preparado para IA  

Explore os ficheiros chave num template AZD pronto para IA:  

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

### **Exercício de Laboratório 1.1: Explorar a Configuração**  

1. **Examine o ficheiro azure.yaml:**  
```bash
cat azure.yaml
```

**O que deve procurar:**  
- Definições dos serviços para componentes IA  
- Mapeamentos das variáveis de ambiente  
- Configurações de hosts  

2. **Reveja a infraestrutura main.bicep:**  
```bash
cat infra/main.bicep
```

**Padrões chave de IA a identificar:**  
- Provisionamento do serviço Microsoft Foundry Models  
- Integração com Azure AI Search  
- Gestão segura das chaves  
- Configurações de segurança de rede  

### **Ponto de Discussão:** Porque é que Estes Padrões São Importantes para IA  

- **Dependências de Serviços**: aplicações de IA frequentemente requerem múltiplos serviços coordenados  
- **Segurança**: chaves de API e endpoints necessitam de gestão segura  
- **Escalabilidade**: cargas de trabalho em IA têm requisitos de escalonamento únicos  
- **Gestão de Custos**: serviços de IA podem ser dispendiosos se configurados incorretamente  

## Módulo 2: Implemente a Sua Primeira Aplicação IA  

### Passo 2.1: Inicializar o Ambiente  

1. **Crie um novo ambiente AZD:**  
```bash
azd env new myai-workshop
```

2. **Defina os parâmetros necessários:**  
```bash
# Defina a sua região Azure preferida
azd env set AZURE_LOCATION eastus

# Opcional: Defina um modelo OpenAI específico
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Passo 2.2: Implemente a Infraestrutura e a Aplicação  

1. **Implemente com AZD:**  
```bash
azd up
```

**O que acontece durante `azd up`:**  
- ✅ Provisiona o serviço Microsoft Foundry Models  
- ✅ Cria o serviço Azure AI Search  
- ✅ Configura o App Service para a aplicação web  
- ✅ Configura rede e segurança  
- ✅ Implanta o código da aplicação  
- ✅ Configura monitorização e registos  

2. **Monitorize o progresso da implantação** e observe os recursos a serem criados.  

### Passo 2.3: Verifique a Sua Implantação  

1. **Verifique os recursos implantados:**  
```bash
azd show
```

2. **Abra a aplicação implantada:**  
```bash
azd show
```

Abra o endpoint web indicado na saída do `azd show`.  

3. **Teste a funcionalidade de IA:**  
   - Navegue para a aplicação web  
   - Experimente consultas de exemplo  
   - Verifique se as respostas de IA funcionam  

### **Exercício de Laboratório 2.1: Prática de Resolução de Problemas**  

**Cenário**: A sua implantação teve sucesso, mas a IA não responde.  

**Problemas comuns a verificar:**  
1. **Chaves API OpenAI**: Verifique se estão corretamente definidas  
2. **Disponibilidade de modelo**: Confirme se a sua região suporta o modelo  
3. **Conetividade de rede**: Certifique-se que os serviços comunicam  
4. **Permissões RBAC**: Verifique se a aplicação pode aceder ao OpenAI  

**Comandos para debug:**  
```bash
# Verificar variáveis de ambiente
azd env get-values

# Ver registos de implantação
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verificar estado da implantação OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalizar Aplicações IA para as Suas Necessidades  

### Passo 3.1: Modifique a Configuração IA  

1. **Atualize o modelo OpenAI:**  
```bash
# Mudar para um modelo diferente (se disponível na sua região)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Reimplantar com a nova configuração
azd deploy
```

2. **Adicione serviços IA adicionais:**  

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

### Passo 3.2: Configurações Específicas do Ambiente  

**Boa prática**: Configurações distintas para desenvolvimento vs produção.  

1. **Crie um ambiente de produção:**  
```bash
azd env new myai-production
```

2. **Defina parâmetros específicos para produção:**  
```bash
# Produção normalmente utiliza SKUs mais elevados
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ativar funcionalidades de segurança adicionais
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Exercício de Laboratório 3.1: Otimização de Custos**  

**Desafio**: Configure o template para um desenvolvimento economicamente eficiente.  

**Tarefas:**  
1. Identifique quais SKUs podem ser definidos para níveis gratuito/básico  
2. Configure variáveis de ambiente para custo mínimo  
3. Implemente e compare os custos com a configuração de produção  

**Dicas para solução:**  
- Use o nível F0 (gratuito) para os Serviços Azure AI sempre que possível  
- Use o nível Básico para o Serviço de Pesquisa durante o desenvolvimento  
- Considere usar o plano Consumo para as Funções  

## Módulo 4: Segurança e Melhores Práticas para Produção  

### Passo 4.1: Gestão Segura de Credenciais  

**Desafio atual**: Muitas aplicações IA codificam chaves API ou usam armazenamento inseguro.  

**Solução AZD**: Identidade Gerida + integração com Key Vault.  

1. **Reveja a configuração de segurança no seu template:**  
```bash
# Procurar configuração de Key Vault e Identidade Gerida
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifique se a Identidade Gerida está a funcionar:**  
```bash
# Verificar se a aplicação web tem a configuração de identidade correta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Passo 4.2: Segurança de Rede  

1. **Ative endpoints privados** (se ainda não estiver configurado):  

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

2. **Configure monitorização específica para IA:**  

Adicione métricas personalizadas para operações IA:  
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

**Tarefa**: Revise a sua implantação para melhores práticas de segurança.  

**Lista de verificação:**  
- [ ] Sem segredos codificados no código ou configuração  
- [ ] Identidade Gerida usada para autenticação serviço-a-serviço  
- [ ] Key Vault armazena configuração sensível  
- [ ] O acesso à rede está devidamente restringido  
- [ ] Monitorização e registos estão ativados  

## Módulo 5: Converter a Sua Própria Aplicação IA  

### Passo 5.1: Folha de Avaliação  

**Antes de converter a sua aplicação**, responda às seguintes perguntas:  

1. **Arquitetura da Aplicação:**  
   - Que serviços IA a sua aplicação usa?  
   - Que recursos de computação necessita?  
   - Requer base de dados?  
   - Quais as dependências entre serviços?  

2. **Requisitos de Segurança:**  
   - Que dados sensíveis a sua aplicação manipula?  
   - Quais os requisitos de conformidade que tem?  
   - Precisa de rede privada?  

3. **Requisitos de Escalonamento:**  
   - Qual a carga esperada?  
   - Precisa de autoescalonamento?  
   - Existem requisitos regionais?  

### Passo 5.2: Crie o Seu Template AZD  

**Siga este padrão para converter a sua aplicação:**  

1. **Crie a estrutura básica:**  
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializar o template AZD
azd init --template minimal
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

**Desafio**: Crie um template AZD para uma aplicação IA de processamento de documentos.  

**Requisitos:**  
- Microsoft Foundry Models para análise de conteúdo  
- Document Intelligence para OCR  
- Conta de Armazenamento para uploads de documentos  
- Function App para lógica de processamento  
- Aplicação web para interface do utilizador  

**Pontos extra:**  
- Adicione tratamento adequado de erros  
- Inclua estimativa de custos  
- Configure dashboards de monitorização  

## Módulo 6: Resolução de Problemas Comuns  

### Problemas Comuns em Implantação  

#### Problema 1: Quota do Serviço OpenAI Excedida  
**Sintomas:** Implantação falha com erro de quota  
**Soluções:**  
```bash
# Verificar quotas atuais
az cognitiveservices usage list --location eastus

# Solicitar aumento de quota ou tentar uma região diferente
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelo Não Disponível na Região  
**Sintomas:** Respostas de IA falham ou erro de implantação do modelo  
**Soluções:**  
```bash
# Verificar a disponibilidade do modelo por região
az cognitiveservices model list --location eastus

# Atualizar para o modelo disponível
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problema 3: Falhas de Permissão  
**Sintomas:** Erros 403 Forbidden ao chamar serviços IA  
**Soluções:**  
```bash
# Verificar atribuições de funções
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Adicionar funções em falta
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemas de Performance  

#### Problema 4: Respostas Lentas da IA  
**Passos de investigação:**  
1. Verifique Application Insights para métricas de performance  
2. Reveja métricas do serviço OpenAI no portal Azure  
3. Verifique conectividade e latência da rede  

**Soluções:**  
- Implemente caching para consultas frequentes  
- Use o modelo OpenAI adequado ao seu caso  
- Considere réplicas de leitura para cenários de alta carga  

### **Exercício de Laboratório 6.1: Desafio de Debug**  

**Cenário**: A implantação teve sucesso, mas a aplicação retorna erros 500.  

**Tarefas de Debug:**  
1. Verifique os registos da aplicação  
2. Verifique conectividade dos serviços  
3. Teste a autenticação  
4. Reveja a configuração  

**Ferramentas a usar:**  
- `azd show` para resumo da implantação  
- Portal Azure para registos de serviço detalhados  
- Application Insights para telemetria da aplicação  

## Módulo 7: Monitorização e Otimização  

### Passo 7.1: Configure uma Monitorização Abrangente  

1. **Crie dashboards personalizados:**  

Navegue até ao portal Azure e crie um dashboard com:  
- Contagem e latência de pedidos OpenAI  
- Taxas de erros da aplicação  
- Utilização de recursos  
- Monitorização de custos  

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
# Use o Azure CLI para obter dados de custos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implemente controlos de custo:**  
- Configure alertas de orçamento  
- Use políticas de autoescalonamento  
- Implemente caching de pedidos  
- Monitorize o uso de tokens para OpenAI  

### **Exercício de Laboratório 7.1: Otimização de Performance**  

**Tarefa**: Otimize a sua aplicação IA para desempenho e custo.  

**Métricas para melhorar:**  
- Reduza o tempo médio de resposta em 20%  
- Reduza os custos mensais em 15%  
- Mantenha 99.9% de uptime  

**Estratégias a experimentar:**  
- Implemente caching de respostas  
- Otimize prompts para eficiência em tokens  
- Use SKUs de computação adequados  
- Configure autoescalonamento apropriado  

## Desafio Final: Implementação Completa  

### Cenário do Desafio  

Está encarregue de criar um chatbot de atendimento ao cliente com IA pronto para produção, com estes requisitos:  

**Requisitos Funcionais:**  
- Interface web para interações com clientes  
- Integração com Microsoft Foundry Models para respostas  
- Capacidade de pesquisa de documentos usando Azure AI Search  
- Integração com base de dados de clientes existente  
- Suporte multilingue  

**Requisitos Não Funcionais:**  
- Capacidade para 1000 utilizadores concorrentes  
- SLA de 99.9% uptime  
- Conformidade SOC 2  
- Custos abaixo de $500/mês  
- Implantação em múltiplos ambientes (dev, staging, prod)  

### Passos de Implementação  

1. **Desenhe a arquitetura**  
2. **Crie o template AZD**  
3. **Implemente medidas de segurança**  
4. **Configure monitorização e alertas**  
5. **Crie pipelines de implantação**  
6. **Documente a solução**  

### Critérios de Avaliação  

- ✅ **Funcionalidade**: Cumpre todos os requisitos?  
- ✅ **Segurança**: Estão implementadas as melhores práticas?  
- ✅ **Escalabilidade**: Consegue lidar com a carga?  
- ✅ **Manutenção**: O código e infraestrutura estão bem organizados?  
- ✅ **Custos**: Mantém-se dentro do orçamento?  

## Recursos Adicionais  

### Documentação Microsoft  
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Documentação Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Documentação Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)  

### Templates de Exemplo  
- [Aplicação Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [Quickstart Aplicação Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)  

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos da Comunidade
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Modelos AZD Incríveis](https://azure.github.io/awesome-azd/)

## 🎓 Certificado de Conclusão

Parabéns! Concluiu o Laboratório do Workshop AI. Agora deverá ser capaz de:

- ✅ Converter aplicações AI existentes em modelos AZD
- ✅ Implantar aplicações AI prontas para produção
- ✅ Implementar as melhores práticas de segurança para cargas de trabalho AI
- ✅ Monitorizar e otimizar o desempenho da aplicação AI
- ✅ Resolver problemas comuns de implantação

### Próximos Passos
1. Aplicar estes padrões aos seus próprios projetos AI
2. Contribuir com modelos para a comunidade
3. Juntar-se ao Microsoft Foundry Discord para suporte contínuo
4. Explorar tópicos avançados como implantações multi-região

---

**Feedback do Workshop**: Ajude-nos a melhorar este workshop partilhando a sua experiência no [canal #Azure do Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Anterior**: [Implantação de Modelo AI](ai-model-deployment.md)
- **➡️ Seguinte**: [Melhores Práticas AI para Produção](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de Ajuda?** Junte-se à nossa comunidade para suporte e discussões sobre AZD e implantações AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->