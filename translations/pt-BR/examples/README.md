# Exemplos - Modelos e Configurações Práticas do AZD

**Aprendendo com Exemplos - Organizados por Capítulo**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Mapeamento de Capítulos**: Exemplos organizados por complexidade de aprendizado
- **🚀 Exemplo Local**: [Solução de Varejo com Multi-Agentes](retail-scenario.md)
- **🤖 Exemplos Externos de IA**: Links para repositórios de Azure Samples

> **📍 IMPORTANTE: Exemplos Locais vs Externos**  
> Este repositório contém **4 exemplos locais completos** com implementações completas:  
> - **Azure OpenAI Chat** (Implantação GPT-4 com interface de chat)  
> - **Container Apps** (API Flask simples + Microsserviços)  
> - **Aplicativo de Banco de Dados** (Web + Banco de Dados SQL)  
> - **Multi-Agente de Varejo** (Solução de IA Empresarial)  
>  
> Exemplos adicionais são **referências externas** para repositórios Azure-Samples que você pode clonar.

## Introdução

Este diretório fornece exemplos práticos e referências para ajudar você a aprender Azure Developer CLI por meio de prática prática. O cenário Multi-Agente de Varejo é uma implementação completa e pronta para produção incluída neste repositório. Exemplos adicionais fazem referência a Azure Samples oficiais que demonstram vários padrões do AZD.

### Legenda de Classificação de Complexidade

- ⭐ **Iniciante** - Conceitos básicos, serviço único, 15-30 minutos
- ⭐⭐ **Intermediário** - Múltiplos serviços, integração com banco de dados, 30-60 minutos
- ⭐⭐⭐ **Avançado** - Arquitetura complexa, integração de IA, 1-2 horas
- ⭐⭐⭐⭐ **Especialista** - Pronto para produção, padrões empresariais, 2+ horas

## 🎯 O Que Realmente Está Neste Repositório

### ✅ Implementação Local (Pronta para Uso)

#### [Aplicativo de Chat Azure OpenAI](azure-openai-chat/README.md) 🆕
**Implantação completa do GPT-4 com interface de chat incluída neste repositório**

- **Localização:** `examples/azure-openai-chat/`
- **Complexidade:** ⭐⭐ (Intermediário)
- **O Que Está Incluído:**
  - Implantação completa do Azure OpenAI (GPT-4)
  - Interface de chat em Python via linha de comando
  - Integração com Key Vault para chaves de API seguras
  - Modelos de infraestrutura Bicep
  - Rastreamento de uso de tokens e custos
  - Limitação de taxa e tratamento de erros

**Início Rápido:**
```bash
# Navegar para o exemplo
cd examples/azure-openai-chat

# Implantar tudo
azd up

# Instalar dependências e começar a conversar
pip install -r src/requirements.txt
python src/chat.py
```

**Tecnologias:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Exemplos de Container App](container-app/README.md) 🆕
**Exemplos abrangentes de implantação de contêiner incluídos neste repositório**

- **Localização:** `examples/container-app/`
- **Complexidade:** ⭐-⭐⭐⭐⭐ (Iniciante a Avançado)
- **O Que Está Incluído:**
  - [Guia Mestre](container-app/README.md) - Visão geral completa das implantações de contêiner
  - [API Flask Simples](../../../examples/container-app/simple-flask-api) - Exemplo básico de API REST
  - [Arquitetura de Microsserviços](../../../examples/container-app/microservices) - Implantação multi-serviço pronta para produção
  - Padrões de Início Rápido, Produção e Avançados
  - Monitoramento, segurança e otimização de custos

**Início Rápido:**
```bash
# Visualizar guia mestre
cd examples/container-app

# Implantar API Flask simples
cd simple-flask-api
azd up

# Implantar exemplo de microsserviços
cd ../microservices
azd up
```

**Tecnologias:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solução Multi-Agente de Varejo](retail-scenario.md) 🆕
**Implementação completa pronta para produção incluída neste repositório**

- **Localização:** `examples/retail-multiagent-arm-template/`
- **Complexidade:** ⭐⭐⭐⭐ (Avançado)
- **O Que Está Incluído:**
  - Modelo completo de implantação ARM
  - Arquitetura de multi-agentes (Cliente + Inventário)
  - Integração com Azure OpenAI
  - Busca com IA usando RAG
  - Monitoramento abrangente
  - Script de implantação com um clique

**Início Rápido:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tecnologias:** Azure OpenAI, Busca com IA, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Exemplos Externos do Azure Samples (Clonar para Usar)

Os seguintes exemplos são mantidos em repositórios oficiais do Azure-Samples. Clone-os para explorar diferentes padrões do AZD:

### Aplicativos Simples (Capítulos 1-2)

| Modelo | Repositório | Complexidade | Serviços |
|:-------|:------------|:-------------|:---------|
| **API Flask em Python** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microsserviços** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-serviço, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Container Flask em Python** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Como usar:**
```bash
# Clone qualquer exemplo
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Implantar
azd up
```

### Exemplos de Aplicativos de IA (Capítulos 2, 5, 8)

| Modelo | Repositório | Complexidade | Foco |
|:-------|:------------|:-------------|:-----|
| **Azure OpenAI Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Implantação GPT-4 |
| **Início Rápido de Chat com IA** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat básico com IA |
| **Agentes de IA** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework de agentes |
| **Busca + Demo OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Padrão RAG |
| **Chat Contoso** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA Empresarial |

### Banco de Dados & Padrões Avançados (Capítulos 3-8)

| Modelo | Repositório | Complexidade | Foco |
|:-------|:------------|:-------------|:-----|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integração com banco de dados |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Microsserviços em Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-serviço |
| **Pipeline de ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objetivos de Aprendizado

Ao trabalhar com esses exemplos, você irá:
- Praticar fluxos de trabalho do Azure Developer CLI com cenários de aplicativos realistas
- Entender diferentes arquiteturas de aplicativos e suas implementações no AZD
- Dominar padrões de Infraestrutura como Código para vários serviços do Azure
- Aplicar gerenciamento de configuração e estratégias de implantação específicas para ambientes
- Implementar padrões de monitoramento, segurança e escalabilidade em contextos práticos
- Ganhar experiência com solução de problemas e depuração de cenários reais de implantação

## Resultados de Aprendizado

Ao concluir esses exemplos, você será capaz de:
- Implantar vários tipos de aplicativos usando o Azure Developer CLI com confiança
- Adaptar os modelos fornecidos às suas próprias necessidades de aplicativos
- Projetar e implementar padrões de infraestrutura personalizados usando Bicep
- Configurar aplicativos complexos de multi-serviços com dependências adequadas
- Aplicar práticas recomendadas de segurança, monitoramento e desempenho em cenários reais
- Solucionar problemas e otimizar implantações com base em experiência prática

## Estrutura do Diretório

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Exemplos de Início Rápido

> **💡 Novo no AZD?** Comece com o exemplo #1 (API Flask) - leva ~20 minutos e ensina conceitos básicos.

### Para Iniciantes
1. **[Container App - API Flask em Python](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Implante uma API REST simples com escala para zero  
   **Tempo:** 20-25 minutos | **Custo:** $0-5/mês  
   **Você Aprenderá:** Fluxo de trabalho básico do azd, conteinerização, sondas de saúde  
   **Resultado Esperado:** Endpoint de API funcional retornando "Hello, World!" com monitoramento

2. **[Aplicativo Web Simples - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implante um aplicativo web Node.js Express com MongoDB  
   **Tempo:** 25-35 minutos | **Custo:** $10-30/mês  
   **Você Aprenderá:** Integração com banco de dados, variáveis de ambiente, strings de conexão  
   **Resultado Esperado:** Aplicativo de lista de tarefas com funcionalidade de criar/ler/atualizar/excluir

3. **[Site Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hospede um site estático React com Azure Static Web Apps  
   **Tempo:** 20-30 minutos | **Custo:** $0-10/mês  
   **Você Aprenderá:** Hospedagem estática, funções serverless, implantação de CDN  
   **Resultado Esperado:** UI React com backend de API, SSL automático, CDN global

### Para Usuários Intermediários
4. **[Aplicativo de Chat Azure OpenAI](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Implante GPT-4 com interface de chat e gerenciamento seguro de chaves de API  
   **Tempo:** 35-45 minutos | **Custo:** $50-200/mês  
   **Você Aprenderá:** Implantação do Azure OpenAI, integração com Key Vault, rastreamento de tokens  
   **Resultado Esperado:** Aplicativo de chat funcional com GPT-4 e monitoramento de custos

5. **[Container App - Microsserviços](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arquitetura multi-serviço pronta para produção  
   **Tempo:** 45-60 minutos | **Custo:** $50-150/mês  
   **Você Aprenderá:** Comunicação entre serviços, filas de mensagens, rastreamento distribuído  
   **Resultado Esperado:** Sistema de 2 serviços (API Gateway + Serviço de Produtos) com monitoramento

6. **[Aplicativo de Banco de Dados - C# com Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicativo web com API em C# e Banco de Dados Azure SQL  
   **Tempo:** 30-45 minutos | **Custo:** $20-80/mês  
   **Você Aprenderá:** Entity Framework, migrações de banco de dados, segurança de conexão  
   **Resultado Esperado:** API em C# com backend Azure SQL, implantação automática de esquema

7. **[Função Serverless - Azure Functions em Python](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Azure Functions em Python com gatilhos HTTP e Cosmos DB  
   **Tempo:** 30-40 minutos | **Custo:** $10-40/mês  
   **Você Aprenderá:** Arquitetura orientada a eventos, escalabilidade serverless, integração NoSQL  
   **Resultado Esperado:** Aplicativo de função respondendo a solicitações HTTP com armazenamento Cosmos DB

8. **[Microsserviços - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicativo Java multi-serviço com Container Apps e API Gateway  
   **Tempo:** 60-90 minutos | **Custo:** $80-200/mês  
   **Você Aprenderá:** Implantação Spring Boot, malha de serviços, balanceamento de carga  
   **Resultado Esperado:** Sistema Java multi-serviço com descoberta de serviços e roteamento

### Modelos de Fundição de IA do Azure

1. **[Aplicativo de Chat Azure OpenAI - Exemplo Local](../../../examples/azure-openai-chat)** ⭐⭐  
   Implantação completa do GPT-4 com interface de chat  
   **Tempo:** 35-45 minutos | **Custo:** $50-200/mês  
   **Resultado Esperado:** Aplicativo de chat funcional com rastreamento de tokens e monitoramento de custos

2. **[Busca Azure + Demo OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicativo de chat inteligente com arquitetura RAG  
   **Tempo:** 60-90 minutos | **Custo:** $100-300/mês  
   **Resultado Esperado:** Interface de chat com RAG, busca de documentos e citações

3. **[Processamento de Documentos com IA](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Análise de documentos usando serviços de IA do Azure  
   **Tempo:** 40-60 minutos | **Custo:** $20-80/mês  
   **Resultado Esperado:** API extraindo texto, tabelas e entidades de documentos enviados

4. **[Pipeline de Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Fluxo de trabalho MLOps com Azure Machine Learning  
   **Tempo:** 2-3 horas | **Custo:** $150-500/mês  
   **Resultado Esperado:** Pipeline de ML automatizado com treinamento, implantação e monitoramento

### Cenários do Mundo Real

#### **Solução Multi-Agente de Varejo** 🆕
**[Guia de Implementação Completo](./retail-scenario.md)**

Uma solução abrangente e pronta para produção de suporte ao cliente com multi-agentes que demonstra a implantação de aplicativos de IA de nível empresarial com AZD. Este cenário fornece:

- **Arquitetura Completa**: Sistema de multi-agentes com agentes especializados em atendimento ao cliente e gerenciamento de inventário
- **Infraestrutura de Produção**: Implementações do Azure OpenAI em várias regiões, Pesquisa de IA, Container Apps e monitoramento abrangente  
- **Template ARM Pronto para Implantação**: Implantação com um clique e modos de configuração múltiplos (Minimal/Standard/Premium)  
- **Recursos Avançados**: Validação de segurança com red teaming, framework de avaliação de agentes, otimização de custos e guias de solução de problemas  
- **Contexto Real de Negócios**: Caso de uso de suporte ao cliente para varejistas com upload de arquivos, integração de pesquisa e escalonamento dinâmico  

**Tecnologias**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complexidade**: ⭐⭐⭐⭐ (Avançado - Pronto para Produção Empresarial)  

**Ideal para**: Desenvolvedores de IA, arquitetos de soluções e equipes que constroem sistemas multiagentes de produção  

**Início Rápido**: Implante a solução completa em menos de 30 minutos usando o template ARM incluído com `./deploy.sh -g myResourceGroup`  

## 📋 Instruções de Uso  

### Pré-requisitos  

Antes de executar qualquer exemplo:  
- ✅ Assinatura do Azure com acesso de Proprietário ou Colaborador  
- ✅ CLI do Azure Developer instalada ([Guia de Instalação](../docs/getting-started/installation.md))  
- ✅ Docker Desktop em execução (para exemplos de contêiner)  
- ✅ Quotas apropriadas do Azure (ver requisitos específicos de cada exemplo)  

> **💰 Aviso de Custos:** Todos os exemplos criam recursos reais no Azure que geram custos. Consulte os arquivos README individuais para estimativas de custo. Lembre-se de executar `azd down` ao finalizar para evitar custos contínuos.  

### Executando Exemplos Localmente  

1. **Clonar ou Copiar o Exemplo**  
   ```bash
   # Navegue para o exemplo desejado
   cd examples/simple-web-app
   ```
  
2. **Inicializar Ambiente AZD**  
   ```bash
   # Inicializar com o modelo existente
   azd init
   
   # Ou criar um novo ambiente
   azd env new my-environment
   ```
  
3. **Configurar Ambiente**  
   ```bash
   # Definir variáveis necessárias
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Implantar**  
   ```bash
   # Implantar infraestrutura e aplicação
   azd up
   ```
  
5. **Verificar Implantação**  
   ```bash
   # Obter endpoints de serviço
   azd env get-values
   
   # Testar o endpoint (exemplo)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Indicadores de Sucesso Esperados:**  
   - ✅ `azd up` concluído sem erros  
   - ✅ Endpoint do serviço retorna HTTP 200  
   - ✅ Portal do Azure mostra status "Running"  
   - ✅ Application Insights recebendo telemetria  

> **⚠️ Problemas?** Consulte [Problemas Comuns](../docs/troubleshooting/common-issues.md) para solução de problemas de implantação  

### Adaptando Exemplos  

Cada exemplo inclui:  
- **README.md** - Instruções detalhadas de configuração e personalização  
- **azure.yaml** - Configuração AZD com comentários  
- **infra/** - Templates Bicep com explicações de parâmetros  
- **src/** - Código de aplicação de exemplo  
- **scripts/** - Scripts auxiliares para tarefas comuns  

## 🎯 Objetivos de Aprendizado  

### Categorias de Exemplos  

#### **Implantações Básicas**  
- Aplicações de serviço único  
- Padrões simples de infraestrutura  
- Gerenciamento básico de configuração  
- Configurações econômicas para desenvolvimento  

#### **Cenários Avançados**  
- Arquiteturas de múltiplos serviços  
- Configurações complexas de rede  
- Padrões de integração de banco de dados  
- Implementações de segurança e conformidade  

#### **Padrões Prontos para Produção**  
- Configurações de alta disponibilidade  
- Monitoramento e observabilidade  
- Integração CI/CD  
- Configurações de recuperação de desastres  

## 📖 Descrições de Exemplos  

### Aplicativo Web Simples - Node.js Express  
**Tecnologias**: Node.js, Express, MongoDB, Container Apps  
**Complexidade**: Iniciante  
**Conceitos**: Implantação básica, API REST, integração com banco de dados NoSQL  

### Site Estático - React SPA  
**Tecnologias**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexidade**: Iniciante  
**Conceitos**: Hospedagem estática, backend serverless, desenvolvimento web moderno  

### Container App - Python Flask  
**Tecnologias**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexidade**: Iniciante  
**Conceitos**: Containerização, API REST, escala para zero, sondas de saúde, monitoramento  
**Localização**: [Exemplo Local](../../../examples/container-app/simple-flask-api)  

### Container App - Arquitetura de Microsserviços  
**Tecnologias**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexidade**: Avançado  
**Conceitos**: Arquitetura de múltiplos serviços, comunicação entre serviços, filas de mensagens, rastreamento distribuído  
**Localização**: [Exemplo Local](../../../examples/container-app/microservices)  

### Aplicativo de Banco de Dados - C# com Azure SQL  
**Tecnologias**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexidade**: Intermediário  
**Conceitos**: Entity Framework, conexões de banco de dados, desenvolvimento de API web  

### Função Serverless - Python Azure Functions  
**Tecnologias**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexidade**: Intermediário  
**Conceitos**: Arquitetura orientada a eventos, computação serverless, desenvolvimento full-stack  

### Microsserviços - Java Spring Boot  
**Tecnologias**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexidade**: Intermediário  
**Conceitos**: Comunicação entre microsserviços, sistemas distribuídos, padrões empresariais  

### Exemplos do Azure AI Foundry  

#### Aplicativo de Chat Azure OpenAI  
**Tecnologias**: Azure OpenAI, Cognitive Search, App Service  
**Complexidade**: Intermediário  
**Conceitos**: Arquitetura RAG, pesquisa vetorial, integração LLM  

#### Processamento de Documentos com IA  
**Tecnologias**: Azure AI Document Intelligence, Storage, Functions  
**Complexidade**: Intermediário  
**Conceitos**: Análise de documentos, OCR, extração de dados  

#### Pipeline de Machine Learning  
**Tecnologias**: Azure ML, MLOps, Container Registry  
**Complexidade**: Avançado  
**Conceitos**: Treinamento de modelos, pipelines de implantação, monitoramento  

## 🛠 Exemplos de Configuração  

O diretório `configurations/` contém componentes reutilizáveis:  

### Configurações de Ambiente  
- Configurações de ambiente de desenvolvimento  
- Configurações de ambiente de staging  
- Configurações prontas para produção  
- Configurações de implantação em várias regiões  

### Módulos Bicep  
- Componentes de infraestrutura reutilizáveis  
- Padrões comuns de recursos  
- Templates reforçados para segurança  
- Configurações otimizadas para custos  

### Scripts Auxiliares  
- Automação de configuração de ambiente  
- Scripts de migração de banco de dados  
- Ferramentas de validação de implantação  
- Utilitários de monitoramento de custos  

## 🔧 Guia de Personalização  

### Adaptando Exemplos para Seu Caso de Uso  

1. **Revisar Pré-requisitos**  
   - Verificar requisitos de serviços do Azure  
   - Confirmar limites de assinatura  
   - Entender implicações de custo  

2. **Modificar Configuração**  
   - Atualizar definições de serviço em `azure.yaml`  
   - Personalizar templates Bicep  
   - Ajustar variáveis de ambiente  

3. **Testar Minuciosamente**  
   - Implantar primeiro no ambiente de desenvolvimento  
   - Validar funcionalidade  
   - Testar escalonamento e desempenho  

4. **Revisão de Segurança**  
   - Revisar controles de acesso  
   - Implementar gerenciamento de segredos  
   - Habilitar monitoramento e alertas  

## 📊 Matriz de Comparação  

| Exemplo | Serviços | Banco de Dados | Autenticação | Monitoramento | Complexidade |  
|---------|----------|----------------|--------------|---------------|--------------|  
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Completo | ⭐⭐ |  
| **Python Flask API** (Local) | 1 | ❌ | Básico | Completo | ⭐ |  
| **Microsserviços** (Local) | 5+ | ✅ | Empresarial | Avançado | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Básico | Básico | ⭐ |  
| React SPA + Functions | 3 | ✅ | Básico | Completo | ⭐ |  
| Python Flask Container | 2 | ❌ | Básico | Completo | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Completo | Completo | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Completo | Completo | ⭐⭐ |  
| Java Microsserviços | 5+ | ✅ | Completo | Completo | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Completo | Completo | ⭐⭐⭐ |  
| Processamento de Documentos com IA | 2 | ❌ | Básico | Completo | ⭐⭐ |  
| Pipeline de ML | 4+ | ✅ | Completo | Completo | ⭐⭐⭐⭐ |  
| **Multi-Agente para Varejo** (Local) | **8+** | **✅** | **Empresarial** | **Avançado** | **⭐⭐⭐⭐** |  

## 🎓 Caminho de Aprendizado  

### Progressão Recomendada  

1. **Comece com Aplicativo Web Simples**  
   - Aprenda conceitos básicos do AZD  
   - Entenda o fluxo de implantação  
   - Pratique gerenciamento de ambiente  

2. **Experimente Site Estático**  
   - Explore diferentes opções de hospedagem  
   - Aprenda sobre integração de CDN  
   - Entenda configuração de DNS  

3. **Avance para Container App**  
   - Aprenda fundamentos de containerização  
   - Entenda conceitos de escalonamento  
   - Pratique com Docker  

4. **Adicione Integração com Banco de Dados**  
   - Aprenda provisionamento de banco de dados  
   - Entenda strings de conexão  
   - Pratique gerenciamento de segredos  

5. **Explore Serverless**  
   - Entenda arquitetura orientada a eventos  
   - Aprenda sobre gatilhos e bindings  
   - Pratique com APIs  

6. **Construa Microsserviços**  
   - Aprenda comunicação entre serviços  
   - Entenda sistemas distribuídos  
   - Pratique implantações complexas  

## 🔍 Encontrando o Exemplo Certo  

### Por Stack de Tecnologia  
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microsserviços (Local)](../../../examples/container-app/microservices), Java Microsserviços  
- **Node.js**: Node.js Express Todo App, [Microsserviços API Gateway (Local)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microsserviços Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microsserviços Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, Pipeline de ML  
- **Go**: [Microsserviços User Service (Local)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microsserviços  
- **React**: React SPA + Functions  
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microsserviços (Local)](../../../examples/container-app/microservices), Java Microsserviços  
- **Bancos de Dados**: [Microsserviços (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **IA/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, Processamento de Documentos com IA, Pipeline de ML, **Solução Multi-Agente para Varejo**  
- **Sistemas Multi-Agente**: **Solução Multi-Agente para Varejo**  
- **Integração OpenAI**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Solução Multi-Agente para Varejo  
- **Produção Empresarial**: [Microsserviços (Local)](../../../examples/container-app/microservices), **Solução Multi-Agente para Varejo**  

### Por Padrão de Arquitetura  
- **API REST Simples**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolítico**: Node.js Express Todo, C# Web API + SQL  
- **Estático + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microsserviços**: [Microsserviços de Produção (Local)](../../../examples/container-app/microservices), Java Spring Boot Microsserviços  
- **Containerizado**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microsserviços (Local)](../../../examples/container-app/microservices)  
- **IA-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, Processamento de Documentos com IA, Pipeline de ML, **Solução Multi-Agente para Varejo**  
- **Arquitetura Multi-Agente**: **Solução Multi-Agente para Varejo**  
- **Multi-Serviço Empresarial**: [Microsserviços (Local)](../../../examples/container-app/microservices), **Solução Multi-Agente para Varejo**  

### Por Nível de Complexidade  
- **Iniciante**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermediário**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microsserviços, Azure OpenAI Chat App, Processamento de Documentos com IA  
- **Avançado**: Pipeline de ML  
- **Pronto para Produção Empresarial**: [Microsserviços (Local)](../../../examples/container-app/microservices) (Multi-serviço com filas de mensagens), **Solução Multi-Agente para Varejo** (Sistema multi-agente completo com implantação via template ARM)  

## 📚 Recursos Adicionais  

### Links de Documentação  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Templates AZD do Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Documentação Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Exemplos da Comunidade  
- [Templates AZD do Azure Samples](https://github.com/Azure-Samples/azd-templates)  
- [Templates do Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Galeria CLI do Azure Developer](https://azure.github.io/awesome-azd/)  
- [Aplicativo Todo com C# e Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Aplicativo Todo com Python e MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Aplicativo de Tarefas com Node.js e PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicativo Web React com API em C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job de Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions com Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Melhores Práticas
- [Framework Bem-Arquitetado do Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Framework de Adoção de Nuvem](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Exemplos de Contribuição

Tem um exemplo útil para compartilhar? Aceitamos contribuições!

### Diretrizes para Submissão
1. Siga a estrutura de diretórios estabelecida
2. Inclua um README.md abrangente
3. Adicione comentários aos arquivos de configuração
4. Teste completamente antes de enviar
5. Inclua estimativas de custo e pré-requisitos

### Estrutura de Template de Exemplo
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Dica Profissional**: Comece com o exemplo mais simples que corresponda à sua stack de tecnologia e, gradualmente, avance para cenários mais complexos. Cada exemplo constrói conceitos a partir dos anteriores!

## 🚀 Pronto para Começar?

### Seu Caminho de Aprendizado

1. **Completamente Iniciante?** → Comece com [API Flask](../../../examples/container-app/simple-flask-api) (⭐, 20 minutos)
2. **Tem Conhecimento Básico de AZD?** → Experimente [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minutos)
3. **Construindo Aplicativos de IA?** → Comece com [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minutos) ou explore [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ horas)
4. **Precisa de uma Stack de Tecnologia Específica?** → Use a seção [Encontrando o Exemplo Certo](../../../examples) acima

### Próximos Passos

- ✅ Revise os [Pré-requisitos](../../../examples) acima
- ✅ Escolha um exemplo que corresponda ao seu nível de habilidade (veja [Legenda de Complexidade](../../../examples))
- ✅ Leia o README do exemplo cuidadosamente antes de implantar
- ✅ Defina um lembrete para executar `azd down` após os testes
- ✅ Compartilhe sua experiência via Issues ou Discussões no GitHub

### Precisa de Ajuda?

- 📖 [FAQ](../resources/faq.md) - Perguntas comuns respondidas
- 🐛 [Guia de Solução de Problemas](../docs/troubleshooting/common-issues.md) - Corrija problemas de implantação
- 💬 [Discussões no GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Pergunte à comunidade
- 📚 [Guia de Estudos](../resources/study-guide.md) - Reforce seu aprendizado

---

**Navegação**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Materiais de Estudo**: [Guia de Estudos](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossário](../resources/glossary.md)
- **🔧 Recursos**: [FAQ](../resources/faq.md) | [Solução de Problemas](../docs/troubleshooting/common-issues.md)

---

*Última Atualização: Novembro de 2025 | [Reportar Problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuir com Exemplos](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->