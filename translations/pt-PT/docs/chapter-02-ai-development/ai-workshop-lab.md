# Laboratório do Workshop de IA: Tornar as suas Soluções de IA Implantáveis com AZD

**Navegação do Capítulo:**  
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)  
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First  
- **⬅️ Anterior**: [Implantação de Modelo de IA](ai-model-deployment.md)  
- **➡️ Próximo**: [Melhores Práticas para IA em Produção](production-ai-practices.md)  
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

## Visão Geral do Workshop

Este laboratório prático orienta os desenvolvedores através do processo de utilizar um template de IA existente e implantá-lo usando a Azure Developer CLI (AZD). Aprenderá padrões essenciais para implantações de IA em produção usando os serviços Microsoft Foundry.

**Duração:** 2-3 horas  
**Nível:** Intermédio  
**Pré-requisitos:** Conhecimentos básicos de Azure, familiaridade com conceitos de IA/ML

## 🎓 Objetivos de Aprendizagem

No final deste workshop, será capaz de:  
- ✅ Converter uma aplicação de IA existente para usar templates AZD  
- ✅ Configurar serviços Microsoft Foundry com AZD  
- ✅ Implementar gestão segura de credenciais para serviços de IA  
- ✅ Implantar aplicações de IA prontas para produção com monitorização  
- ✅ Diagnosticar problemas comuns em implantações de IA

## Pré-requisitos

### Ferramentas Necessárias  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado  
- [Git](https://git-scm.com/) instalado  
- Editor de código (recomendado VS Code)

### Recursos Azure  
- Subscrição Azure com acesso de colaborador  
- Acesso aos serviços Microsoft Foundry Models (ou capacidade de solicitar acesso)  
- Permissões para criação de grupos de recursos

### Conhecimentos Prévio  
- Compreensão básica dos serviços Azure  
- Familiaridade com interfaces de linha de comando  
- Conceitos básicos de IA/ML (APIs, modelos, prompts)

## Configuração do Laboratório

### Passo 1: Preparação do Ambiente

1. **Verificar instalações das ferramentas:**  
```bash
# Verificar instalação do AZD
azd version

# Verificar Azure CLI
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

Explore os ficheiros chave num template AZD preparado para IA:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```
  
### **Exercício de Laboratório 1.1: Explore a Configuração**

1. **Examine o ficheiro azure.yaml:**  
```bash
cat azure.yaml
```
  
**O que deve observar:**  
- Definições de serviços para componentes de IA  
- Mapeamentos de variáveis de ambiente  
- Configurações de hosts

2. **Revise a infraestrutura main.bicep:**  
```bash
cat infra/main.bicep
```
  
**Padrões chave de IA a identificar:**  
- Provisionamento do serviço Microsoft Foundry Models  
- Integração com Cognitive Search  
- Gestão segura de chaves  
- Configurações de segurança de rede

### **Ponto de Discussão:** Porque é que Estes Padrões São Importantes para IA

- **Dependências de Serviços:** Aplicações de IA frequentemente requerem vários serviços coordenados  
- **Segurança:** As chaves API e endpoints precisam de gestão segura  
- **Escalabilidade:** Cargas de IA têm requisitos únicos de escalabilidade  
- **Gestão de Custos:** Serviços de IA podem ser caros se não estiverem configurados corretamente

## Módulo 2: Implante a Sua Primeira Aplicação de IA

### Passo 2.1: Inicie o Ambiente

1. **Crie um novo ambiente AZD:**  
```bash
azd env new myai-workshop
```
  
2. **Defina os parâmetros necessários:**  
```bash
# Defina a sua região Azure preferida
azd env set AZURE_LOCATION eastus

# Opcional: Defina um modelo OpenAI específico
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```
  
### Passo 2.2: Implemente a Infraestrutura e a Aplicação

1. **Implemente com AZD:**  
```bash
azd up
```
  
**O que acontece durante o `azd up`:**  
- ✅ Provisiona o serviço Microsoft Foundry Models  
- ✅ Cria o serviço Cognitive Search  
- ✅ Configura App Service para a aplicação web  
- ✅ Configura rede e segurança  
- ✅ Implanta o código da aplicação  
- ✅ Configura monitorização e registos

2. **Monitorize o progresso da implantação** e note os recursos a criar.

### Passo 2.3: Verifique a Sua Implantação

1. **Verifique os recursos implantados:**  
```bash
azd show
```
  
2. **Abra a aplicação implantada:**  
```bash
azd show --output json | grep "webAppUrl"
```
  
3. **Teste a funcionalidade de IA:**  
   - Navegue para a aplicação web  
   - Experimente consultas de exemplo  
   - Verifique se as respostas de IA estão a funcionar

### **Exercício de Laboratório 2.1: Prática de Diagnóstico**

**Cenário:** A sua implantação teve sucesso mas a IA não responde.

**Problemas comuns a verificar:**  
1. **Chaves API OpenAI:** Verifique se estão definidas corretamente  
2. **Disponibilidade do modelo:** Verifique se a sua região suporta o modelo  
3. **Conectividade de rede:** Assegure que os serviços conseguem comunicar  
4. **Permissões RBAC:** Verifique se a aplicação pode aceder ao OpenAI

**Comandos de diagnóstico:**  
```bash
# Verificar variáveis de ambiente
azd env get-values

# Ver registos de implantação
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verificar o estado da implantação OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## Módulo 3: Personalizar Aplicações de IA para as Suas Necessidades

### Passo 3.1: Modifique a Configuração de IA

1. **Atualize o modelo OpenAI:**  
```bash
# Mudar para um modelo diferente (se disponível na sua região)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Redistribuir com a nova configuração
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
  
### Passo 3.2: Configurações Específicas para o Ambiente

**Melhor prática:** Configurações diferentes para desenvolvimento e produção.

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
  
### **Exercício de Laboratório 3.1: Otimização de Custos**

**Desafio:** Configure o template para desenvolvimento custo-eficaz.

**Tarefas:**  
1. Identifique quais SKUs podem ser configurados para tiers grátis/básicos  
2. Configure variáveis de ambiente para custo mínimo  
3. Implante e compare custos com a configuração de produção

**Dicas de solução:**  
- Use o tier F0 (grátis) para Cognitive Services sempre que possível  
- Use o tier Básico para Search Service em desenvolvimento  
- Considere usar o plano de Consumo para Functions

## Módulo 4: Segurança e Melhores Práticas para Produção

### Passo 4.1: Gestão Segura de Credenciais

**Desafio atual:** Muitas apps de IA codificam diretamente chaves API ou usam armazenamento inseguro.

**Solução AZD:** Managed Identity + integração com Key Vault.

1. **Revise a configuração de segurança no seu template:**  
```bash
# Procure a configuração do Key Vault e da Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Verifique se a Managed Identity está a funcionar:**  
```bash
# Verificar se a aplicação web tem a configuração de identidade correta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### Passo 4.2: Segurança de Rede

1. **Ative endpoints privados** (se ainda não estiverem configurados):

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

1. **Configure o Application Insights:**  
```bash
# O Application Insights deve ser configurado automaticamente
# Verifique a configuração:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **Configure monitorização específica para IA:**

Adicione métricas customizadas para operações de IA:  
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

**Tarefa:** Revise a sua implantação quanto às melhores práticas de segurança.

**Lista de verificação:**  
- [ ] Nenhum segredo codificado diretamente no código ou configuração  
- [ ] Managed Identity utilizada para autenticação serviço a serviço  
- [ ] Key Vault armazena a configuração sensível  
- [ ] Acesso à rede é devidamente restrito  
- [ ] Monitorização e registos estão ativados

## Módulo 5: Converter a Sua Própria Aplicação de IA

### Passo 5.1: Folha de Avaliação

**Antes de converter a sua app**, responda a estas perguntas:

1. **Arquitetura da Aplicação:**  
   - Quais serviços de IA a sua app utiliza?  
   - Quais recursos de computação são necessários?  
   - Requer uma base de dados?  
   - Quais são as dependências entre serviços?

2. **Requisitos de Segurança:**  
   - Que dados sensíveis a sua app manipula?  
   - Quais requisitos de conformidade existem?  
   - Precisa de rede privada?

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

# Inicializar modelo AZD
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

**Desafio:** Crie um template AZD para uma aplicação de IA de processamento de documentos.

**Requisitos:**  
- Microsoft Foundry Models para análise de conteúdo  
- Document Intelligence para OCR  
- Conta de armazenamento para upload de documentos  
- Function App para lógica de processamento  
- Aplicação web para interface do utilizador

**Pontos bónus:**  
- Adicionar tratamento apropriado de erros  
- Incluir estimativa de custos  
- Configurar dashboards de monitorização

## Módulo 6: Diagnóstico de Problemas Comuns

### Problemas Comuns de Implantação

#### Problema 1: Cota do Serviço OpenAI Excedida  
**Sintomas:** Implantação falha com erro de quota  
**Soluções:**  
```bash
# Verificar quotas atuais
az cognitiveservices usage list --location eastus

# Solicitar aumento de quota ou tentar região diferente
azd env set AZURE_LOCATION westus2
azd up
```
  
#### Problema 2: Modelo Não Disponível na Região  
**Sintomas:** Respostas de IA falham ou erros de implantação do modelo  
**Soluções:**  
```bash
# Verificar disponibilidade do modelo por região
az cognitiveservices model list --location eastus

# Atualizar para modelo disponível
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```
  
#### Problema 3: Problemas de Permissão  
**Sintomas:** Erros 403 Forbidden ao chamar serviços de IA  
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

#### Problema 4: Respostas de IA Lentas  
**Passos de investigação:**  
1. Verifique Application Insights para métricas de performance  
2. Revise métricas do serviço OpenAI no portal Azure  
3. Verifique conectividade e latência de rede

**Soluções:**  
- Implemente caching para consultas frequentes  
- Use o modelo OpenAI adequado ao caso de uso  
- Considere réplicas de leitura para cenários de alta carga

### **Exercício de Laboratório 6.1: Desafio de Debug**

**Cenário:** A sua implantação teve sucesso, mas a aplicação retorna erros 500.

**Tarefas de debug:**  
1. Verificar logs da aplicação  
2. Confirmar conectividade dos serviços  
3. Testar autenticação  
4. Revisar configuração

**Ferramentas para usar:**  
- `azd show` para visão geral da implantação  
- Portal Azure para registos detalhados do serviço  
- Application Insights para telemetria da aplicação

## Módulo 7: Monitorização e Otimização

### Passo 7.1: Configure Monitorização Abrangente

1. **Crie dashboards customizados:**

Navegue no portal Azure e crie um dashboard com:  
- Contagem e latência de pedidos OpenAI  
- Taxas de erro da aplicação  
- Utilização de recursos  
- Rastreio de custos

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
# Use o Azure CLI para obter dados de custo
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **Implemente controlos de custos:**  
- Configure alertas de orçamento  
- Use políticas de autoescalamento  
- Implemente caching de pedidos  
- Monitorize uso de tokens OpenAI

### **Exercício de Laboratório 7.1: Otimização de Performance**

**Tarefa:** Otimize a sua aplicação de IA para performance e custo.

**Métricas para melhorar:**  
- Reduzir o tempo médio de resposta em 20%  
- Reduzir custos mensais em 15%  
- Manter 99.9% de uptime

**Estratégias para experimentar:**  
- Implementar caching de respostas  
- Otimizar prompts para eficiência de tokens  
- Usar SKUs de computação apropriados  
- Configurar autoescalamento adequado

## Desafio Final: Implementação de Ponta a Ponta

### Cenário do Desafio

Foi-lhe confiada a tarefa de criar um chatbot de atendimento ao cliente alimentar por IA pronto para produção com os seguintes requisitos:

**Requisitos Funcionais:**  
- Interface web para interações com clientes  
- Integração com Microsoft Foundry Models para respostas  
- Capacidade de pesquisa documental usando Cognitive Search  
- Integração com base de dados de clientes existente  
- Suporte multilíngue

**Requisitos Não Funcionais:**  
- Suportar 1000 utilizadores concorrentes  
- SLA de 99.9% de uptime  
- Conformidade SOC 2  
- Custos abaixo de $500/mês  
- Implantação em múltiplos ambientes (dev, staging, prod)

### Passos de Implementação

1. **Desenhar a arquitetura**  
2. **Criar o template AZD**  
3. **Implementar medidas de segurança**  
4. **Configurar monitorização e alertas**  
5. **Criar pipelines de implantação**  
6. **Documentar a solução**

### Critérios de Avaliação

- ✅ **Funcionalidade:** Cumpre todos os requisitos?  
- ✅ **Segurança:** As melhores práticas são implementadas?  
- ✅ **Escalabilidade:** Consegue suportar a carga?  
- ✅ **Manutenibilidade:** O código e infraestrutura estão organizados?  
- ✅ **Custo:** Está dentro do orçamento?

## Recursos Adicionais

### Documentação Microsoft  
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Documentação do Serviço Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Documentação Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templates de Exemplo  
- [Aplicação de Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [Quickstart OpenAI Chat App](https://github.com/Azure-Samples/openai-chat-app-quickstart)  
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos Comunitários  
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)  
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificado de Conclusão

Parabéns! Completou o Laboratório do Workshop de IA. Agora deve ser capaz de:
- ✅ Converter aplicações AI existentes para modelos AZD
- ✅ Implementar aplicações AI prontas para produção
- ✅ Implementar as melhores práticas de segurança para cargas de trabalho AI
- ✅ Monitorizar e otimizar o desempenho das aplicações AI
- ✅ Resolver problemas comuns de implementação

### Próximos Passos
1. Aplicar estes padrões nos seus próprios projetos AI
2. Contribuir com modelos para a comunidade
3. Juntar-se ao Discord da Microsoft Foundry para suporte contínuo
4. Explorar tópicos avançados como implementações multi-região

---

**Feedback do Workshop**: Ajude-nos a melhorar este workshop partilhando a sua experiência no [canal #Azure do Discord da Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com Prioridade na AI
- **⬅️ Anterior**: [Implementação de Modelo AI](ai-model-deployment.md)
- **➡️ Seguinte**: [Melhores Práticas para AI em Produção](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de Ajuda?** Junte-se à nossa comunidade para suporte e discussões sobre AZD e implementações AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a precisão, por favor esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte oficial. Para informação crítica, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->