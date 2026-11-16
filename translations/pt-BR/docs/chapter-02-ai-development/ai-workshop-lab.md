# Laboratório de Workshop de IA: Tornando Suas Soluções de IA Implantáveis com AZD

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Anterior**: [Implantação de Modelo de IA](ai-model-deployment.md)
- **➡️ Próximo**: [Melhores Práticas de Produção para IA](../chapter-08-production/production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

## Visão Geral do Workshop

Este laboratório prático guia desenvolvedores pelo processo de pegar um modelo de IA existente e implantá-lo usando o Azure Developer CLI (AZD). Você aprenderá padrões essenciais para implantações de IA em produção usando os serviços Microsoft Foundry.

> **Revisão de lançamento (2026-11-04):** A orientação de comandos AZD e os nomes de configuração de exemplo foram verificados contra o lançamento `azd` `1.37.2` e a configuração atual do exemplo vinculado. Esta é uma revisão de documentação, não uma validação de implantação ao vivo. O laboratório RAG não requer a extensão de agente; para avaliações de agente, use a extensão separada `azure.ai.evaluations` e o [fluxo de trabalho de avaliação atual](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), não comandos de avaliação de agente legados.

**Duração:** 2-3 horas  
**Nível:** Intermediário  
**Pré-requisitos:** Conhecimento básico de Azure, familiaridade com conceitos de IA/ML

## 🎓 Objetivos de Aprendizagem

Ao final deste workshop, você será capaz de:
- ✅ Explorar um modelo AZD de IA existente e planejar a conversão de sua própria aplicação
- ✅ Configurar serviços Microsoft Foundry com AZD
- ✅ Implementar gerenciamento seguro de credenciais para serviços de IA
- ✅ Implantar uma aplicação de referência de IA com monitoramento
- ✅ Solucionar problemas comuns em implantações de IA

## Pré-requisitos

### Ferramentas Necessárias
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado
- [Git](https://git-scm.com/) instalado
- Editor de código (recomendado VS Code)

Esses blocos de comando usam sintaxe Bash (incluindo continuação de linha e `grep`). No Windows, use Git Bash/WSL ou os traduza para PowerShell. Também instale as ferramentas de linguagem, gerenciador de pacotes e contêiner listadas na [configuração local do ambiente do exemplo](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Recursos do Azure
- Assinatura Azure com permissões para provisionamento de recursos e atribuição de função (Apenas a função de Colaborador não pode criar atribuições RBAC; use um administrador de função autorizado ou o equivalente documentado do exemplo)
- Acesso aos serviços Microsoft Foundry Models (ou capacidade de solicitar acesso)
- Permissões para criação de grupo de recursos

### Conhecimentos Necessários
- Entendimento básico dos serviços Azure
- Familiaridade com interfaces de linha de comando
- Conceitos básicos de IA/ML (APIs, modelos, prompts)

## Configuração do Laboratório

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

Se você trabalhar em múltiplos locatários ou sua assinatura não for detectada automaticamente, tente novamente com `azd auth login --tenant-id <tenant-id>`.

2. **Clone o repositório do workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Compreendendo a Estrutura AZD para Aplicações de IA

### Anatomia de um Modelo AZD de IA

Explore os arquivos principais em um modelo AZD pronto para IA:

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

O exemplo baixado pode mudar; `.azure/` aparece após a inicialização do ambiente, não necessariamente num clone novo. Inspecione o checkout real em vez de criar diretórios ausentes para corresponder a este esquema.

### **Exercício do Laboratório 1.1: Explore a Configuração**

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

**Padrões chave de IA para identificar:**
- Provisionamento do serviço Microsoft Foundry Models
- Integração Azure AI Search
- Gerenciamento seguro de chaves
- Configurações de segurança de rede

### **Ponto de Discussão:** Por que Esses Padrões São Importantes para IA

- **Dependências de Serviço**: Aplicações de IA frequentemente requerem múltiplos serviços coordenados
- **Segurança**: Chaves API e endpoints precisam de gerenciamento seguro
- **Escalabilidade**: Cargas de trabalho de IA têm requisitos únicos de escala
- **Gerenciamento de Custos**: Serviços de IA podem ser caros se mal configurados

## Módulo 2: Implemente Sua Primeira Aplicação de IA

### Passo 2.1: Inicialize o Ambiente

1. **Crie um novo ambiente AZD:**
```bash
azd env new myai-workshop
```

2. **Defina os parâmetros necessários:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Passo 2.2: Implemente a Infraestrutura e Aplicação

1. **Implemente com AZD:**
```bash
azd up
```

**O que acontece durante `azd up`:**
- ✅ Provisiona o serviço Microsoft Foundry Models
- ✅ Cria o serviço Azure AI Search
- ✅ Configura Azure Container Apps para backend e frontend empacotado (padrão do exemplo atual)
- ✅ Configura rede e segurança
- ✅ Implanta o código da aplicação
- ✅ Configura monitoramento e logs

2. **Monitore o progresso da implantação** e observe os recursos criados.

### Passo 2.3: Verifique Sua Implantação

1. **Confira os recursos implantados:**
```bash
azd show
```

2. **Abra a aplicação implantada:**
```bash
azd show
```

Abra o endpoint web mostrado na saída `azd show`.

3. **Teste a funcionalidade de IA:**
   - Navegue até a aplicação web
   - Experimente consultas de exemplo
   - Verifique se as respostas de IA estão funcionando

### **Exercício do Laboratório 2.1: Prática de Solução de Problemas**

**Cenário**: Sua implantação funcionou, mas a IA não responde.

**Problemas comuns a verificar:**
1. **Autenticação**: Verifique a identidade gerenciada e atribuições de função; verifique chaves API apenas se você habilitou autenticação baseada em chave deliberadamente
2. **Disponibilidade do modelo**: Verifique se sua região suporta o modelo
3. **Conectividade de rede**: Assegure que os serviços podem se comunicar
4. **Permissões RBAC**: Verifique se o aplicativo pode acessar OpenAI

**Comandos para depuração:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalizando Aplicações de IA para Suas Necessidades

### Passo 3.1: Modifique a Configuração de IA

1. **Atualize o modelo OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Adicione serviços adicionais de IA:**

Edite `infra/main.bicep` para adicionar Document Intelligence:

O seguinte é um fragmento ilustrativo, não um modelo completo. O exemplo pode já provisionar serviços de processamento de documentos: inspecione sua infraestrutura atual antes de adicionar recursos duplicados. Adições personalizadas requerem conexão dos outputs, identidades e configuração da aplicação.

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

**Melhor Prática**: Configurações diferentes para desenvolvimento vs produção.

1. **Crie um ambiente de produção:**
```bash
azd env new myai-production
```

2. **Defina parâmetros específicos para produção:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Esses nomes vêm do [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) do exemplo. `azd env set` armazena um valor mas não torna uma variável arbitrária efetiva: o modelo deve consumi-la. Revise o [guia de isolamento de rede](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) do exemplo antes de desabilitar acesso público, e use `azd up` para aplicar mudanças na infraestrutura. SKU OpenAI `S0` sozinho não determina throughput do modelo; tipo e capacidade do modelo também importam.

### **Exercício do Laboratório 3.1: Otimização de Custos**

**Desafio**: Configure o modelo para desenvolvimento custo-efetivo.

**Tarefas:**
1. Selecione o ambiente descartável do workshop: `azd env select myai-workshop`.
2. Grave a SKU atual do Search e a capacidade do modelo de `infra/main.parameters.json` e do ambiente selecionado.
3. Use as entradas suportadas abaixo, após confirmar cota do modelo/região:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Verifique a SKU Search e a capacidade de implantação no portal e estime a diferença com a calculadora de preços. Não espere que dados de cobrança atualizem imediatamente.

**Critérios de sucesso:** Search usa Basic, a implantação do chat tem a capacidade suportada solicitada, e o app ainda responde a uma pergunta de exemplo. A capacidade `10` é uma alocação de limite de taxa, não um desconto de preço de token. Alterações no nível Search podem ser restritas ou requerer recriação; não experimente em recursos de produção. F0 é específico do serviço e não é um SKU de modelo Azure OpenAI.

## Módulo 4: Segurança e Melhores Práticas de Produção

### Passo 4.1: Gerenciamento Seguro de Credenciais

**Desafio atual**: Muitas aplicações de IA codificam chaves API ou usam armazenamento inseguro.

**Solução AZD**: Identidade Gerenciada + integração Key Vault.

1. **Revise a configuração de segurança no seu modelo:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifique se a Identidade Gerenciada está funcionando:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Passo 4.2: Segurança de Rede

1. **Habilite endpoints privados** usando a configuração de rede suportada do exemplo (se ainda não configurada).

Para seu próprio modelo, este fragmento ilustrativo mostra a conexão do endpoint OpenAI. Ele também precisa de uma VNet, configuração DNS privada e conectividade da aplicação; não cole-o sem alterações no exemplo, que já tem módulos de endpoint privado:
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
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Habilite a integração Application Insights do exemplo:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

A instrumentação do exemplo emite telemetria; uma configuração arbitrária `OPENAI_MONITOR_ENABLED` não habilita métricas de IA. Revise rastreamentos para chamadas ao modelo, latência, falhas e uso de tokens, evitando gravar prompts ou respostas sensíveis.

### **Exercício do Laboratório 4.1: Auditoria de Segurança**

**Tarefa**: Revise sua implantação para melhores práticas de segurança.

**Checklist:**
- [ ] Sem segredos codificados no código ou configuração
- [ ] Identidade Gerenciada usada para autenticação entre serviços
- [ ] Key Vault armazena configurações sensíveis
- [ ] Acesso de rede é devidamente restrito
- [ ] Monitoramento e logs estão habilitados

## Módulo 5: Convertendo Sua Própria Aplicação de IA

### Passo 5.1: Planilha de Avaliação

**Antes de converter sua aplicação**, responda estas perguntas:

1. **Arquitetura da Aplicação:**
   - Quais serviços de IA seu app usa?
   - Que recursos de computação necessita?
   - Precisa de um banco de dados?
   - Quais são as dependências entre serviços?

2. **Requisitos de Segurança:**
   - Que dados sensíveis seu app manipula?
   - Quais requisitos de conformidade você possui?
   - Precisa de rede privada?

3. **Requisitos de Escalabilidade:**
   - Qual sua carga esperada?
   - Precisa de autoescalonamento?
   - Existem requisitos regionais?

### Passo 5.2: Crie Seu Modelo AZD

**Siga este padrão para converter seu app:**

**Apenas estrutura básica:** Esta seção não fornece fonte de API/aplicação web, infraestrutura host, implantações de modelos, identidade/RBAC, ou um `main.parameters.json` finalizado. O Bicep com escopo de grupo de recursos ilustra a composição do módulo; um ponto de entrada típico AZD com escopo de assinatura deve criar um grupo de recursos e invocá-lo nesse escopo. Não espere que `azd up` implante um app completo apenas copiando esses fragmentos. Para uma base executável, continue usando o modelo RAG do Módulo 1.

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

### **Exercício do Laboratório 5.1: Desafio de Criação do Modelo**

**Desafio**: Crie um modelo AZD para um app de IA de processamento de documentos.

**Requisitos:**
- Microsoft Foundry Models para análise de conteúdo
- Document Intelligence para OCR
- Conta de Armazenamento para uploads de documentos
- Function App para lógica de processamento
- Aplicação web para interface do usuário

**Pontos extras:**
- Adicione tratamento de erros adequado
- Inclua estimativa de custos
- Configure painéis de monitoramento

## Módulo 6: Solução de Problemas Comuns

### Problemas Comuns de Implantação

#### Problema 1: Quota do Serviço OpenAI Excedida
**Sintomas:** Implantação falha com erro de cota
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
**Sintomas:** Falhas nas respostas de IA ou erros na implantação do modelo
**Soluções:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Problema 3: Questões de Permissão
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

#### Problema 4: Respostas Lentas da IA
**Passos para investigação:**
1. Verifique Application Insights para métricas de desempenho
2. Revise métricas do serviço OpenAI no portal Azure
3. Verifique conectividade e latência de rede

**Soluções:**
- Implemente cache para consultas comuns
- Use modelo OpenAI apropriado para seu caso de uso
- Escalone réplicas da aplicação apenas após verificar limites RPM/TPM do modelo; implantações Azure OpenAI não expõem configuração genérica de "réplica leitura" estilo banco de dados

### **Exercício do Laboratório 6.1: Desafio de Depuração**

**Cenário**: Sua implantação teve sucesso, mas a aplicação retorna erros 500.

**Tarefas de depuração:**
1. Verifique os logs da aplicação
2. Verifique a conectividade do serviço
3. Testar autenticação
4. Revisar configuração

**Ferramentas para usar:**
- `azd show` para visão geral do deploy
- Portal Azure para logs detalhados do serviço
- Application Insights para telemetria da aplicação

## Módulo 7: Monitoramento e Otimização

### Passo 7.1: Configurar Monitoramento Abrangente

1. **Criar dashboards personalizados:**

Navegue até o portal Azure e crie um dashboard com:
- Contagem e latência de requisições OpenAI
- Taxas de erro da aplicação
- Utilização de recursos
- Rastreamento de custos

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

Verifique se o componente emite telemetria de requisição e adicione um grupo de ação se notificações forem necessárias. A métrica é uma contagem, não uma porcentagem de falha; um alerta de taxa precisa de uma consulta adequada e denominador.

### Passo 7.2: Otimização de Custos

1. **Analisar custos atuais:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Substitua os espaços reservados para datas. O suporte da API de Consumo varia conforme o acordo de faturamento; use o Gerenciamento de Custos no portal se detalhes de uso não estiverem disponíveis. Os custos têm atraso, não são um oráculo de teste em tempo real.

2. **Implementar controles de custos:**
- Configurar alertas de orçamento
- Usar políticas de autoscaling
- Implementar cache de requisições
- Monitorar uso de tokens para OpenAI

### **Exercício de Laboratório 7.1: Otimização de Performance**

**Tarefa**: Otimize sua aplicação de IA tanto para performance quanto para custo.

**Métricas para melhorar:**
- Reduzir o tempo médio de resposta em 20%
- Reduzir custos mensais em 15%
- Definir um SLO de disponibilidade de 99,9% e uma janela de medição (um laboratório curto não pode demonstrar uptime mensal)

**Estratégias para tentar:**
- Implementar cache de respostas
- Otimizar prompts para eficiência de tokens
- Usar SKUs de computação apropriados
- Configurar autoscaling adequado

## Desafio Final: Implementação de Ponta a Ponta

### Cenário do Desafio

Este é um **desafio opcional de arquitetura/design**, não um exercício executável fornecido nem uma certificação de produção. Proponha um chatbot de atendimento ao cliente com IA e documente quais requisitos precisam de implementação adicional e evidências:

**Requisitos Funcionais:**
- Interface web para interações com clientes
- Integração com Microsoft Foundry Models para respostas
- Capacidade de busca documental usando Azure AI Search
- Integração com banco de dados de clientes existente
- Suporte multilíngue

**Requisitos Não Funcionais:**
- Suportar 1000 usuários simultâneos
- SLA de uptime de 99,9%
- Conformidade SOC 2
- Custo abaixo de $500/mês
- Implantação em múltiplos ambientes (dev, staging, prod)

Estas são restrições hipotéticas de stakeholders, não resultados garantidos simultaneamente. Defina taxa de requisição, tamanhos de prompt/output e duração da sessão antes de estimar custos; 1000 usuários simultâneos não estabelecem uma carga nem provam que um orçamento de $500 é viável. SOC 2 é um resultado de auditoria organizacional, não um recurso habilitado por um template AZD. Identifique trade-offs e rejeite restrições inviáveis com evidências.

### Passos para Implementação

1. **Desenhar a arquitetura**
2. **Criar o template AZD**
3. **Implementar medidas de segurança**
4. **Configurar monitoramento e alertas**
5. **Criar pipelines de deploy**
6. **Documentar a solução**

### Critérios de Avaliação

- ✅ **Funcionalidade**: As capacidades implementadas são demonstradas e lacunas restantes são explícitas?
- ✅ **Segurança**: As melhores práticas são implementadas?
- ✅ **Escalabilidade**: Pode suportar a carga?
- ✅ **Manutenibilidade**: O código e infraestrutura estão bem organizados?
- ✅ **Custo**: Fica dentro do orçamento?

## Recursos Adicionais

### Documentação Microsoft
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentação Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentação Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templates de Exemplo
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos da Comunidade
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Ponto de Verificação de Conclusão

Parabéns! Você concluiu o Laboratório do Workshop de IA. Agora você deverá ser capaz de:

- ✅ Explicar como adaptar uma aplicação de IA existente para um template AZD
- ✅ Fazer deploy e testar uma aplicação de referência de IA
- ✅ Implementar melhores práticas de segurança para cargas de trabalho de IA
- ✅ Monitorar e otimizar o desempenho de aplicações de IA
- ✅ Resolver problemas comuns de deploy

**Limpeza:** Execute `azd env list`, selecione cada ambiente descartável criado neste laboratório (`myai-workshop`, e se implantado `myai-production`/`myai-quota-test`), e execute `azd down` em cada um. Revise o plano de exclusão; deletar apenas a configuração local de um ambiente não apaga recursos do Azure. Evite `--purge` a menos que compreenda a remoção irreversível de recursos em soft-delete.

### Próximos Passos
1. Aplique esses padrões em seus próprios projetos de IA
2. Contribua com templates para a comunidade
3. Participe do Microsoft Foundry Discord para suporte contínuo
4. Explore tópicos avançados como deploys multi-região

---

**Feedback do Workshop**: Ajude-nos a melhorar este workshop compartilhando sua experiência no [canal #Azure do Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navegação pelo Capítulo:**
- **📚 Início do Curso**: [AZD para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Anterior**: [Deploy de Modelo AI](ai-model-deployment.md)
- **➡️ Próximo**: [Melhores Práticas para AI em Produção](../chapter-08-production/production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de Ajuda?** Junte-se à nossa comunidade para suporte e discussões sobre AZD e deploys de IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->