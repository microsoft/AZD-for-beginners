# Examples - Practical AZD Templates and Configurations

**Learning by Example - Organized by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Chapter Mapping**: Examples organized by learning complexity
- **🚀 Local Example**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 External AI Examples**: Links to Azure Samples repositories

> **📍 IMPORTANT: Local vs External Examples**  
> This repository contains **4 complete local examples** with full implementations:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 deployment with chat interface)  
> - **Container Apps** (Simple Flask API + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI Solution)  
>  
> Additional examples are **external references** to Azure-Samples repositories that you can clone.

## Introduction

This directory provides practical examples and references to help you learn Azure Developer CLI through hands-on practice. The Retail Multi-Agent scenario is a complete, production-ready implementation included in this repository. Additional examples reference official Azure Samples that demonstrate various AZD patterns.

### Complexity Rating Legend

- ⭐ **Beginner** - Basic concepts, single service, 15-30 minutes
- ⭐⭐ **Intermediate** - Multiple services, database integration, 30-60 minutes
- ⭐⭐⭐ **Advanced** - Complex architecture, AI integration, 1-2 hours
- ⭐⭐⭐⭐ **Expert** - Production-ready, enterprise patterns, 2+ hours

## 🎯 What's Actually in This Repository

### ✅ Local Implementation (Ready to Use)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Complete gpt-4.1 deployment with chat interface included in this repo**

- **Location:** `examples/azure-openai-chat/`
- **Complexity:** ⭐⭐ (Intermediate)
- **What's Included:**
  - Complete Microsoft Foundry Models deployment (gpt-4.1)
  - Python command-line chat interface
  - Key Vault integration for secure API keys
  - Bicep infrastructure templates
  - Token usage and cost tracking
  - Rate limiting and error handling

**Quick Start:**
```bash
# Navegue até o exemplo
cd examples/azure-openai-chat

# Implantar tudo
azd up

# Instale as dependências e comece a conversar
pip install -r src/requirements.txt
python src/chat.py
```

**Technologies:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Comprehensive container deployment examples included in this repo**

- **Location:** `examples/container-app/`
- **Complexity:** ⭐-⭐⭐⭐⭐ (Beginner to Advanced)
- **What's Included:**
  - [Master Guide](container-app/README.md) - Complete overview of container deployments
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Basic REST API example
  - [Microservices Architecture](../../../examples/container-app/microservices) - Production-ready multi-service deployment
  - Quick Start, Production, and Advanced patterns
  - Monitoring, security, and cost optimization

**Quick Start:**
```bash
# Ver guia principal
cd examples/container-app

# Implantar API Flask simples
cd simple-flask-api
azd up

# Implantar exemplo de microsserviços
cd ../microservices
azd up
```

**Technologies:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Complete production-ready implementation included in this repo**

- **Location:** `examples/retail-multiagent-arm-template/`
- **Complexity:** ⭐⭐⭐⭐ (Advanced)
- **What's Included:**
  - Complete ARM deployment template
  - Multi-agent architecture (Customer + Inventory)
  - Microsoft Foundry Models integration
  - AI Search with RAG
  - Comprehensive monitoring
  - One-click deployment script

**Quick Start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologies:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 External Azure Samples (Clone to Use)

The following examples are maintained in official Azure-Samples repositories. Clone them to explore different AZD patterns:

### Simple Applications (Chapters 1-2)

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**How to use:**
```bash
# Clone qualquer exemplo
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Implantar
azd up
```

### AI Application Examples (Chapters 2, 5, 8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basic AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Advanced Patterns (Chapters 3-8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database integration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Learning Goals

By working through these examples, you will:
- Practice Azure Developer CLI workflows with realistic application scenarios
- Understand different application architectures and their azd implementations
- Master Infrastructure as Code patterns for various Azure services
- Apply configuration management and environment-specific deployment strategies
- Implement monitoring, security, and scaling patterns in practical contexts
- Build experience with troubleshooting and debugging real deployment scenarios

## Learning Outcomes

Upon completing these examples, you will be able to:
- Deploy various application types using Azure Developer CLI confidently
- Adapt provided templates to your own application requirements
- Design and implement custom infrastructure patterns using Bicep
- Configure complex multi-service applications with proper dependencies
- Apply security, monitoring, and performance best practices in real scenarios
- Troubleshoot and optimize deployments based on practical experience

## Directory Structure

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

## Quick Start Examples

> **💡 New to AZD?** Start with example #1 (Flask API) - it takes ~20 minutes and teaches core concepts.

### For Beginners
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Deploy a simple REST API with scale-to-zero  
   **Time:** 20-25 minutes | **Cost:** $0-5/month  
   **You'll Learn:** Basic azd workflow, containerization, health probes  
   **Expected Outcome:** Working API endpoint returning "Hello, World!" with monitoring

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Deploy a Node.js Express web application with MongoDB  
   **Time:** 25-35 minutes | **Cost:** $10-30/month  
   **You'll Learn:** Database integration, environment variables, connection strings  
   **Expected Outcome:** Todo list app with create/read/update/delete functionality

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host a React static website with Azure Static Web Apps  
   **Time:** 20-30 minutes | **Cost:** $0-10/month  
   **You'll Learn:** Static hosting, serverless functions, CDN deployment  
   **Expected Outcome:** React UI with API backend, automatic SSL, global CDN

### For Intermediate Users
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Deploy gpt-4.1 with chat interface and secure API key management  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **You'll Learn:** Microsoft Foundry Models deployment, Key Vault integration, token tracking  
   **Expected Outcome:** Working chat application with gpt-4.1 and cost monitoring

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Production-ready multi-service architecture  
   **Time:** 45-60 minutes | **Cost:** $50-150/month  
   **You'll Learn:** Service communication, message queuing, distributed tracing  
   **Expected Outcome:** 2-service system (API Gateway + Product Service) with monitoring

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web application with C# API and Azure SQL Database  
   **Time:** 30-45 minutes | **Cost:** $20-80/month  
   **You'll Learn:** Entity Framework, database migrations, connection security  
   **Expected Outcome:** C# API with Azure SQL backend, automatic schema deployment

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions with HTTP triggers and Cosmos DB  
   **Time:** 30-40 minutes | **Cost:** $10-40/month  
   **You'll Learn:** Event-driven architecture, serverless scaling, NoSQL integration  
   **Expected Outcome:** Function app responding to HTTP requests with Cosmos DB storage

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java application with Container Apps and API gateway  
   **Time:** 60-90 minutes | **Cost:** $80-200/month  
   **You'll Learn:** Spring Boot deployment, service mesh, load balancing  
   **Expected Outcome:** Multi-service Java system with service discovery and routing

### Microsoft Foundry Templates

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Complete gpt-4.1 deployment with chat interface  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **Expected Outcome:** Working chat application with token tracking and cost monitoring

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chat application with RAG architecture  
   **Time:** 60-90 minutes | **Cost:** $100-300/month  
   **Expected Outcome:** RAG-powered chat interface with document search and citations

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Document analysis using Azure AI services  
   **Time:** 40-60 minutes | **Cost:** $20-80/month  
   **Expected Outcome:** API extracting text, tables, and entities from uploaded documents

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow with Azure Machine Learning  
   **Time:** 2-3 hours | **Cost:** $150-500/month  
   **Expected Outcome:** Automated ML pipeline with training, deployment, and monitoring

### Real-World Scenarios

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

A comprehensive, production-ready multi-agent customer support solution that demonstrates enterprise-grade AI application deployment with AZD. This scenario provides:
- **Arquitetura Completa**: Sistema multiagente com agentes especializados em atendimento ao cliente e gerenciamento de inventário
- **Infraestrutura de Produção**: Implantações de Microsoft Foundry Models em várias regiões, AI Search, Container Apps e monitoramento abrangente
- **Template ARM Pronto para Implantação**: Implantação com um clique com múltiplos modos de configuração (Minimal/Standard/Premium)
- **Recursos Avançados**: Validação de segurança tipo red teaming, framework de avaliação de agentes, otimização de custos e guias de solução de problemas
- **Contexto Empresarial Real**: Caso de uso de suporte ao cliente no varejo com uploads de arquivos, integração de busca e escala dinâmica

**Tecnologias**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexidade**: ⭐⭐⭐⭐ (Avançado - Pronto para Produção Empresarial)

**Perfeito para**: desenvolvedores de IA, arquitetos de soluções e equipes construindo sistemas multiagente em produção

**Início Rápido**: Implante a solução completa em menos de 30 minutos usando o template ARM incluído com `./deploy.sh -g myResourceGroup`

## 📋 Instruções de Uso

### Pré-requisitos

Antes de executar qualquer exemplo:
- ✅ Assinatura Azure com acesso Owner ou Contributor
- ✅ Azure Developer CLI instalado ([Guia de Instalação](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop em execução (para exemplos em container)
- ✅ Cotas Azure apropriadas (verifique requisitos específicos de cada exemplo)

> **💰 Aviso de Custo:** Todos os exemplos criam recursos reais no Azure que geram cobranças. Veja os arquivos README individuais para estimativas de custo. Lembre-se de executar `azd down` quando terminar para evitar custos contínuos.

### Executando Exemplos Localmente

1. **Clone ou Copie o Exemplo**
   ```bash
   # Navegue até o exemplo desejado
   cd examples/simple-web-app
   ```

2. **Inicialize o Ambiente AZD**
   ```bash
   # Inicialize com um modelo existente
   azd init
   
   # Ou crie um novo ambiente
   azd env new my-environment
   ```

3. **Configure o Ambiente**
   ```bash
   # Defina as variáveis necessárias
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Implemente**
   ```bash
   # Implantar infraestrutura e aplicação
   azd up
   ```

5. **Verifique a Implantação**
   ```bash
   # Obter endpoints do serviço
   azd env get-values
   
   # Testar o endpoint (exemplo)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indicadores de Sucesso Esperados:**
   - ✅ `azd up` conclui sem erros
   - ✅ Endpoint do serviço retorna HTTP 200
   - ✅ Azure Portal mostra status "Running"
   - ✅ Application Insights recebendo telemetria

> **⚠️ Problemas?** Veja [Problemas Comuns](../docs/chapter-07-troubleshooting/common-issues.md) para solução de problemas de implantação

### Adaptando Exemplos

Cada exemplo inclui:
- **README.md** - Instruções detalhadas de configuração e personalização
- **azure.yaml** - Configuração AZD com comentários
- **infra/** - Templates Bicep com explicações dos parâmetros
- **src/** - Código de exemplo da aplicação
- **scripts/** - Scripts utilitários para tarefas comuns

## 🎯 Objetivos de Aprendizado

### Categorias de Exemplos

#### **Implantações Básicas**
- Aplicações de serviço único
- Padrões de infraestrutura simples
- Gerenciamento de configuração básico
- Configurações de desenvolvimento econômicas

#### **Cenários Avançados**
- Arquiteturas multi-serviço
- Configurações de rede complexas
- Padrões de integração de banco de dados
- Implementações de segurança e conformidade

#### **Padrões Prontos para Produção**
- Configurações de alta disponibilidade
- Monitoramento e observabilidade
- Integração CI/CD
- Planos de recuperação de desastres

## 📖 Descrições dos Exemplos

### Simple Web App - Node.js Express
**Tecnologias**: Node.js, Express, MongoDB, Container Apps  
**Complexidade**: Iniciante  
**Conceitos**: Implantação básica, API REST, integração com banco NoSQL

### Static Website - React SPA
**Tecnologias**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexidade**: Iniciante  
**Conceitos**: Hospedagem estática, backend serverless, desenvolvimento web moderno

### Container App - Python Flask
**Tecnologias**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexidade**: Iniciante  
**Conceitos**: Containerização, API REST, scale-to-zero, probes de integridade, monitoramento  
**Localização**: [Exemplo Local](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Tecnologias**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexidade**: Avançado  
**Conceitos**: Arquitetura multi-serviço, comunicação entre serviços, enfileiramento de mensagens, rastreamento distribuído  
**Localização**: [Exemplo Local](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Tecnologias**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexidade**: Intermediário  
**Conceitos**: Entity Framework, conexões de banco de dados, desenvolvimento de web API

### Serverless Function - Python Azure Functions
**Tecnologias**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexidade**: Intermediário  
**Conceitos**: Arquitetura orientada a eventos, computação serverless, desenvolvimento full-stack

### Microservices - Java Spring Boot
**Tecnologias**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexidade**: Intermediário  
**Conceitos**: Comunicação entre microsserviços, sistemas distribuídos, padrões empresariais

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Tecnologias**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexidade**: Intermediário  
**Conceitos**: Arquitetura RAG, busca vetorial, integração de LLM

#### AI Document Processing
**Tecnologias**: Azure AI Document Intelligence, Storage, Functions  
**Complexidade**: Intermediário  
**Conceitos**: Análise de documentos, OCR, extração de dados

#### Machine Learning Pipeline
**Tecnologias**: Azure ML, MLOps, Container Registry  
**Complexidade**: Avançado  
**Conceitos**: Treinamento de modelos, pipelines de implantação, monitoramento

## 🛠 Exemplos de Configuração

O diretório `configurations/` contém componentes reutilizáveis:

### Configurações de Ambiente
- Configurações de ambiente de desenvolvimento
- Configurações de ambiente de staging
- Configurações prontas para produção
- Configurações de implantação multi-região

### Módulos Bicep
- Componentes de infraestrutura reutilizáveis
- Padrões comuns de recursos
- Templates reforçados para segurança
- Configurações otimizadas para custo

### Scripts Auxiliares
- Automação de setup de ambiente
- Scripts de migração de banco de dados
- Ferramentas de validação de implantação
- Utilitários de monitoramento de custos

## 🔧 Guia de Personalização

### Adaptando Exemplos para seu Caso de Uso

1. **Revise os Pré-requisitos**
   - Verifique requisitos de serviço do Azure
   - Confirme limites da assinatura
   - Entenda as implicações de custo

2. **Modifique a Configuração**
   - Atualize definições de serviço em `azure.yaml`
   - Personalize templates Bicep
   - Ajuste variáveis de ambiente

3. **Teste Exaustivamente**
   - Implemente primeiro no ambiente de desenvolvimento
   - Valide a funcionalidade
   - Teste escalabilidade e desempenho

4. **Revisão de Segurança**
   - Revise controles de acesso
   - Implemente gerenciamento de segredos
   - Habilite monitoramento e alertas

## 📊 Matriz de Comparação

| Exemplo | Serviços | Banco de Dados | Autenticação | Monitoramento | Complexidade |
|---------|----------|----------------|--------------|---------------|--------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Completo | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Básico | Completo | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Avançado | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Básico | Básico | ⭐ |
| React SPA + Functions | 3 | ✅ | Básico | Completo | ⭐ |
| Python Flask Container | 2 | ❌ | Básico | Completo | ⭐ |
| C# Web API + SQL | 2 | ✅ | Completo | Completo | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Completo | Completo | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Completo | Completo | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Completo | Completo | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Básico | Completo | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Completo | Completo | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Corporativo** | **Avançado** | **⭐⭐⭐⭐** |

## 🎓 Rota de Aprendizado

### Progressão Recomendada

1. **Comece com o Aplicativo Web Simples**
   - Aprenda conceitos básicos do AZD
   - Entenda o fluxo de implantação
   - Pratique gerenciamento de ambientes

2. **Experimente o Website Estático**
   - Explore diferentes opções de hospedagem
   - Aprenda sobre integração com CDN
   - Entenda configuração de DNS

3. **Passe para o Container App**
   - Aprenda conceitos básicos de containerização
   - Entenda conceitos de escala
   - Pratique com Docker

4. **Adicione Integração com Banco de Dados**
   - Aprenda provisionamento de bancos
   - Entenda strings de conexão
   - Pratique gerenciamento de segredos

5. **Explore Serverless**
   - Entenda arquitetura orientada a eventos
   - Aprenda sobre triggers e bindings
   - Pratique com APIs

6. **Construa Microsserviços**
   - Aprenda comunicação entre serviços
   - Entenda sistemas distribuídos
   - Pratique implantações complexas

## 🔍 Encontrando o Exemplo Certo

### Por Pilha de Tecnologia
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Bancos de Dados**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Sistemas Multi-Agente**: **Retail Multi-Agent Solution**
- **Integração OpenAI**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Pronto para Produção Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Por Padrão de Arquitetura
- **API REST Simples**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolítico**: Node.js Express Todo, C# Web API + SQL
- **Estático + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microsserviços**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerizado**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **Potencializado por IA**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Arquitetura Multi-Agente**: **Retail Multi-Agent Solution**
- **Empresa Multi-Serviço**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Por Nível de Complexidade
- **Iniciante**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediário**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Avançado**: ML Pipeline
- **Pronto para Produção Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service com enfileiramento de mensagens), **Retail Multi-Agent Solution** (Sistema multiagente completo com implantação via template ARM)

## 📚 Recursos Adicionais

### Links de Documentação
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Exemplos da Comunidade
- [Modelos AZD do Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Modelos Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galeria do Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Aplicativo Todo com C# e Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Aplicativo Todo com Python e MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplicativo Todo com Node.js e PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicativo Web React com API em C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job do Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions com Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Melhores Práticas
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribua com Exemplos

Tem um exemplo útil para compartilhar? Aceitamos contribuições!

### Diretrizes para Submissão
1. Siga a estrutura de diretórios estabelecida
2. Inclua um README.md abrangente
3. Adicione comentários aos arquivos de configuração
4. Teste minuciosamente antes de enviar
5. Inclua estimativas de custo e pré-requisitos

### Estrutura do Template de Exemplo
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

**Dica Profissional**: Comece com o exemplo mais simples que corresponda à sua stack de tecnologia, e então avance gradualmente para cenários mais complexos. Cada exemplo se baseia em conceitos dos anteriores!

## 🚀 Pronto para Começar?

### Seu Caminho de Aprendizagem

1. **Iniciante completo?** → Comece com [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Já tem conhecimentos básicos de AZD?** → Experimente [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Desenvolvendo aplicativos de IA?** → Comece com [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) ou explore [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ horas)
4. **Precisa de uma pilha tecnológica específica?** → Use a seção [Finding the Right Example](#-finding-the-right-example) acima

### Próximos Passos

- ✅ Revise os [Pré-requisitos](#pré-requisitos) acima
- ✅ Escolha um exemplo que corresponda ao seu nível de habilidade (veja a [Legenda de Complexidade](#complexity-rating-legend))
- ✅ Leia o README do exemplo cuidadosamente antes de implantar
- ✅ Defina um lembrete para executar `azd down` após os testes
- ✅ Compartilhe sua experiência via GitHub Issues ou Discussions

### Precisa de Ajuda?

- 📖 [FAQ](../resources/faq.md) - Perguntas comuns respondidas
- 🐛 [Guia de Solução de Problemas](../docs/chapter-07-troubleshooting/common-issues.md) - Corrija problemas de implantação
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Pergunte à comunidade
- 📚 [Guia de Estudo](../resources/study-guide.md) - Reforce seu aprendizado

---

**Navigation**
- **📚 Página do Curso**: [AZD For Beginners](../README.md)
- **📖 Materiais de Estudo**: [Guia de Estudo](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossário](../resources/glossary.md)
- **🔧 Recursos**: [FAQ](../resources/faq.md) | [Solução de Problemas](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Última atualização: Novembro de 2025 | [Reportar Problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuir com Exemplos](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional realizada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->