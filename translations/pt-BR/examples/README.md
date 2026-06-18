# Exemplos - Modelos e Configurações Práticas do AZD

**Aprendizado por Exemplo - Organizado por Capítulo**
- **📚 Início do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Mapeamento por Capítulo**: Exemplos organizados por complexidade de aprendizado
- **🚀 Exemplo Local**: [Solução Multi-Agente de Varejo](retail-scenario.md)
- **🤖 Exemplos Externos de IA**: Links para repositórios Azure Samples

> **📍 IMPORTANTE: Exemplos Locais vs Externos**  
> Este repositório contém **4 exemplos locais completos** com implementações completas:  
> - **Microsoft Foundry Models Chat** (implantação gpt-4.1 com interface de chat)  
> - **Container Apps** (API Flask simples + Microsserviços)  
> - **Database App** (Web + Banco de Dados SQL)  
> - **Retail Multi-Agent** (Solução de IA Empresarial)  
>  
> Exemplos adicionais são **referências externas** para repositórios Azure-Samples que você pode clonar.

## Introdução

Este diretório fornece exemplos práticos e referências para ajudá-lo a aprender o Azure Developer CLI por meio de prática hands-on. O cenário Retail Multi-Agent é uma implementação completa pronta para produção incluída neste repositório. Exemplos adicionais fazem referência a Azure Samples oficiais que demonstram vários padrões do AZD.

### Legenda de Nível de Complexidade

- ⭐ **Iniciante** - Conceitos básicos, serviço único, 15-30 minutos
- ⭐⭐ **Intermediário** - Múltiplos serviços, integração com banco de dados, 30-60 minutos
- ⭐⭐⭐ **Avançado** - Arquitetura complexa, integração com IA, 1-2 horas
- ⭐⭐⭐⭐ **Especialista** - Pronto para produção, padrões empresariais, 2+ horas

## 🎯 O que este repositório contém

### ✅ Implementação Local (Pronta para Uso)

#### [Aplicativo de Chat Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**Implantação completa gpt-4.1 com interface de chat incluída neste repositório**

- **Localização:** `examples/azure-openai-chat/`
- **Complexidade:** ⭐⭐ (Intermediário)
- **O que está Incluído:**
  - Implantação completa do Microsoft Foundry Models (gpt-4.1)
  - Interface de chat em linha de comando em Python
  - Integração com Key Vault para chaves de API seguras
  - Templates de infraestrutura em Bicep
  - Monitoramento de uso de tokens e custos
  - Limitação de taxa e tratamento de erros

**Início Rápido:**
```bash
# Navegue até o exemplo
cd examples/azure-openai-chat

# Implante tudo
azd up

# Instale as dependências e comece a conversar
pip install -r src/requirements.txt
python src/chat.py
```

**Tecnologias:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Exemplos de Container App](container-app/README.md) 🆕
**Exemplos abrangentes de implantação de containers incluídos neste repositório**

- **Localização:** `examples/container-app/`
- **Complexidade:** ⭐-⭐⭐⭐⭐ (Iniciante a Avançado)
- **O que está Incluído:**
  - [Guia Mestre](container-app/README.md) - Visão geral completa das implantações de containers
  - [API Flask Simples](../../../examples/container-app/simple-flask-api) - Exemplo básico de API REST
  - [Arquitetura de Microsserviços](../../../examples/container-app/microservices) - Implantação multi-serviço pronta para produção
  - Início Rápido, Padrões de Produção e Avançados
  - Monitoramento, segurança e otimização de custos

**Início Rápido:**
```bash
# Ver guia mestre
cd examples/container-app

# Implantar API Flask simples
cd simple-flask-api
azd up

# Implantar exemplo de microserviços
cd ../microservices
azd up
```

**Tecnologias:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solução Multi-Agente de Varejo](retail-scenario.md) 🆕
**Implementação completa pronta para produção incluída neste repositório**

- **Localização:** `examples/retail-multiagent-arm-template/`
- **Complexidade:** ⭐⭐⭐⭐ (Avançado)
- **O que está Incluído:**
  - Modelo ARM completo de implantação
  - Arquitetura multiagente (Cliente + Inventário)
  - Integração com Microsoft Foundry Models
  - Busca de IA com RAG
  - Monitoramento abrangente
  - Script de implantação com um clique

**Início Rápido:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tecnologias:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Exemplos Externos da Azure (Clone para Usar)

Os exemplos a seguir são mantidos em repositórios oficiais Azure-Samples. Clone-os para explorar diferentes padrões do AZD:

### Aplicações Simples (Capítulos 1-2)

| Modelo | Repositório | Complexidade | Serviços |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-serviço, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Como usar:**
```bash
# Clone qualquer exemplo
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Implantar
azd up
```

### Exemplos de Aplicações de IA (Capítulos 2, 5, 8)

| Modelo | Repositório | Complexidade | Foco |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | implantação gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat de IA básico |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework de agentes |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Padrão RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA Empresarial |

### Banco de Dados & Padrões Avançados (Capítulos 3-8)

| Modelo | Repositório | Complexidade | Foco |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integração com banco de dados |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-serviço |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objetivos de Aprendizado

Ao trabalhar com esses exemplos, você irá:
- Praticar fluxos de trabalho do Azure Developer CLI com cenários realistas de aplicação
- Entender diferentes arquiteturas de aplicações e suas implementações com azd
- Dominar padrões de Infrastructure as Code para vários serviços do Azure
- Aplicar gerenciamento de configuração e estratégias de implantação específicas por ambiente
- Implementar padrões de monitoramento, segurança e escalabilidade em contextos práticos
- Adquirir experiência com solução de problemas e depuração em cenários reais de implantação

## Resultados de Aprendizagem

Ao completar estes exemplos, você será capaz de:
- Implantar vários tipos de aplicações usando o Azure Developer CLI com confiança
- Adaptar os templates fornecidos aos requisitos da sua própria aplicação
- Projetar e implementar padrões de infraestrutura personalizados usando Bicep
- Configurar aplicações complexas multi-serviço com dependências apropriadas
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

> **💡 Novo no AZD?** Comece com o exemplo #1 (API Flask) - leva ~20 minutos e ensina os conceitos principais.

### Para Iniciantes
1. **[Container App - API Python Flask](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Faça o deploy de uma API REST simples com scale-to-zero  
   **Tempo:** 20-25 minutos | **Custo:** $0-5/mês  
   **Você aprenderá:** Fluxo de trabalho básico do azd, conteinerização, verificações de integridade  
   **Resultado Esperado:** Endpoint de API funcional retornando "Hello, World!" com monitoramento

2. **[Aplicativo Web Simples - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Faça o deploy de uma aplicação web Node.js Express com MongoDB  
   **Tempo:** 25-35 minutos | **Custo:** $10-30/mês  
   **Você aprenderá:** Integração com banco de dados, variáveis de ambiente, strings de conexão  
   **Resultado Esperado:** App de lista de tarefas com funcionalidades de criar/ler/atualizar/excluir

3. **[Website Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hospede um site estático React com Azure Static Web Apps  
   **Tempo:** 20-30 minutos | **Custo:** $0-10/mês  
   **Você aprenderá:** Hospedagem estática, funções serverless, implantação em CDN  
   **Resultado Esperado:** UI em React com backend de API, SSL automático, CDN global

### Para Usuários Intermediários
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Implante gpt-4.1 com interface de chat e gerenciamento seguro de chaves de API  
   **Tempo:** 35-45 minutos | **Custo:** $50-200/mês  
   **Você aprenderá:** Implantação Microsoft Foundry Models, integração com Key Vault, rastreamento de tokens  
   **Resultado Esperado:** Aplicação de chat funcional com gpt-4.1 e monitoramento de custos

5. **[Container App - Microsserviços](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arquitetura multi-serviço pronta para produção  
   **Tempo:** 45-60 minutos | **Custo:** $50-150/mês  
   **Você aprenderá:** Comunicação entre serviços, enfileiramento de mensagens, rastreamento distribuído  
   **Resultado Esperado:** Sistema de 2 serviços (API Gateway + Serviço de Produto) com monitoramento

6. **[Aplicação com Banco de Dados - C# com Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicação web com API em C# e Azure SQL Database  
   **Tempo:** 30-45 minutos | **Custo:** $20-80/mês  
   **Você aprenderá:** Entity Framework, migrações de banco de dados, segurança de conexão  
   **Resultado Esperado:** API em C# com backend Azure SQL, implantação automática de esquema

7. **[Função Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Azure Functions em Python com triggers HTTP e Cosmos DB  
   **Tempo:** 30-40 minutos | **Custo:** $10-40/mês  
   **Você aprenderá:** Arquitetura orientada a eventos, escalabilidade serverless, integração NoSQL  
   **Resultado Esperado:** App de funções respondendo a requisições HTTP com armazenamento em Cosmos DB

8. **[Microsserviços - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicação Java multi-serviço com Container Apps e API gateway  
   **Tempo:** 60-90 minutos | **Custo:** $80-200/mês  
   **Você aprenderá:** Implantação Spring Boot, malha de serviços, balanceamento de carga  
   **Resultado Esperado:** Sistema Java multi-serviço com descoberta e roteamento de serviços

### Templates Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Exemplo Local](../../../examples/azure-openai-chat)** ⭐⭐  
   Implantação completa gpt-4.1 com interface de chat  
   **Tempo:** 35-45 minutos | **Custo:** $50-200/mês  
   **Resultado Esperado:** Aplicação de chat funcional com rastreamento de tokens e monitoramento de custos

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicação de chat inteligente com arquitetura RAG  
   **Tempo:** 60-90 minutos | **Custo:** $100-300/mês  
   **Resultado Esperado:** Interface de chat com RAG, busca de documentos e citações

3. **[Processamento de Documentos com IA](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Análise de documentos usando serviços de IA do Azure  
   **Tempo:** 40-60 minutos | **Custo:** $20-80/mês  
   **Resultado Esperado:** API que extrai texto, tabelas e entidades de documentos enviados

4. **[Pipeline de Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Fluxo de trabalho MLOps com Azure Machine Learning  
   **Tempo:** 2-3 horas | **Custo:** $150-500/mês  
   **Resultado Esperado:** Pipeline de ML automatizado com treinamento, implantação e monitoramento

### Cenários do Mundo Real

#### **Solução Multi-Agente de Varejo** 🆕
**[Guia de Implementação Completa](./retail-scenario.md)**

Uma solução abrangente e pronta para produção de suporte ao cliente multiagente que demonstra a implantação de aplicações de IA em nível empresarial com AZD. Este cenário fornece:

- **Arquitetura Completa**: Sistema multiagente com agentes especializados em atendimento ao cliente e gerenciamento de inventário
- **Production Infrastructure**: Implantações multi-região do Microsoft Foundry Models, AI Search, Container Apps e monitoramento abrangente
- **Ready-to-Deploy ARM Template**: Implantação com um clique com múltiplos modos de configuração (Minimal/Standard/Premium)
- **Advanced Features**: Validação de segurança red teaming, framework de avaliação de agentes, otimização de custos e guias de solução de problemas
- **Real Business Context**: Caso de uso de suporte ao cliente de varejo com upload de arquivos, integração de busca e dimensionamento dinâmico

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Avançado - Pronto para Produção Empresarial)

**Perfect for**: Desenvolvedores de IA, arquitetos de soluções e equipes construindo sistemas multi-agente de produção

**Quick Start**: Implante a solução completa em menos de 30 minutos usando o template ARM incluído com `./deploy.sh -g myResourceGroup`

## 📋 Usage Instructions

### Prerequisites

Antes de executar qualquer exemplo:
- ✅ Assinatura do Azure com acesso de Owner ou Contributor
- ✅ Azure Developer CLI instalado ([Guia de Instalação](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop em execução (para exemplos com containers)
- ✅ Cotas do Azure apropriadas (verifique os requisitos específicos de cada exemplo)

> **💰 Aviso de Custo:** Todos os exemplos criam recursos reais no Azure que geram cobranças. Veja os READMEs individuais para estimativas de custo. Lembre-se de executar `azd down` quando terminar para evitar custos contínuos.

### Running Examples Locally

1. **Clone or Copy Example**
   ```bash
   # Navegue até o exemplo desejado
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # Inicialize com um modelo existente
   azd init
   
   # Ou crie um novo ambiente
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # Defina as variáveis necessárias
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # Implantar infraestrutura e aplicação
   azd up
   ```

5. **Verify Deployment**
   ```bash
   # Obter endpoints de serviço
   azd env get-values
   
   # Testar o endpoint (exemplo)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indicadores de Sucesso Esperados:**
   - ✅ `azd up` conclui sem erros
   - ✅ O endpoint do serviço retorna HTTP 200
   - ✅ O Azure Portal mostra status "Running"
   - ✅ Application Insights recebendo telemetria

> **⚠️ Problemas?** Veja [Problemas Comuns](../docs/chapter-07-troubleshooting/common-issues.md) para solução de problemas de implantação

### Adapting Examples

Cada exemplo inclui:
- **README.md** - Instruções detalhadas de configuração e personalização
- **azure.yaml** - Configuração AZD com comentários
- **infra/** - Templates Bicep com explicações dos parâmetros
- **src/** - Código de exemplo da aplicação
- **scripts/** - Scripts auxiliares para tarefas comuns

## 🎯 Learning Objectives

### Example Categories

#### **Basic Deployments**
- Aplicações de serviço único
- Padrões simples de infraestrutura
- Gerenciamento básico de configuração
- Configurações de desenvolvimento econômicas

#### **Advanced Scenarios**
- Arquiteturas multi-serviço
- Configurações de rede complexas
- Padrões de integração de banco de dados
- Implementações de segurança e conformidade

#### **Production-Ready Patterns**
- Configurações de alta disponibilidade
- Monitoramento e observabilidade
- Integração CI/CD
- Planos de recuperação de desastres

## 📖 Example Descriptions

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Iniciante  
**Concepts**: Implantação básica, REST API, integração com banco NoSQL

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Iniciante  
**Concepts**: Hospedagem estática, backend serverless, desenvolvimento web moderno

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Iniciante  
**Concepts**: Conteinerização, REST API, scale-to-zero, health probes, monitoramento  
**Location**: [Exemplo Local](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Avançado  
**Concepts**: Arquitetura multi-serviço, comunicação entre serviços, enfileiramento de mensagens, rastreamento distribuído  
**Location**: [Exemplo Local](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Intermediário  
**Concepts**: Entity Framework, conexões com banco de dados, desenvolvimento de web API

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Intermediário  
**Concepts**: Arquitetura dirigida a eventos, computação serverless, desenvolvimento full-stack

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Intermediário  
**Concepts**: Comunicação entre microserviços, sistemas distribuídos, padrões empresariais

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Azure AI Search, App Service  
**Complexity**: Intermediário  
**Concepts**: Arquitetura RAG, busca vetorial, integração com LLM

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Intermediário  
**Concepts**: Análise de documentos, OCR, extração de dados

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Avançado  
**Concepts**: Treinamento de modelos, pipelines de deployment, monitoramento

## 🛠 Configuration Examples

The `configurations/` directory contains reusable components:

### Environment Configurations
- Configurações de ambiente de desenvolvimento
- Configurações de ambiente de homologação
- Configurações prontas para produção
- Configurações de implantação multi-região

### Bicep Modules
- Componentes reutilizáveis de infraestrutura
- Padrões comuns de recursos
- Templates com foco em segurança
- Configurações otimizadas para custo

### Helper Scripts
- Automação de setup de ambiente
- Scripts de migração de banco de dados
- Ferramentas de validação de implantação
- Utilitários de monitoramento de custos

## 🔧 Customization Guide

### Adapting Examples for Your Use Case

1. **Review Prerequisites**
   - Verifique requisitos dos serviços do Azure
   - Confirme limites da assinatura
   - Entenda as implicações de custo

2. **Modify Configuration**
   - Atualize definições de serviço em `azure.yaml`
   - Personalize templates Bicep
   - Ajuste variáveis de ambiente

3. **Test Thoroughly**
   - Implemente primeiro no ambiente de desenvolvimento
   - Valide a funcionalidade
   - Teste escalabilidade e desempenho

4. **Security Review**
   - Revise controles de acesso
   - Implemente gerenciamento de segredos
   - Habilite monitoramento e alertas

## 📊 Comparison Matrix

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Completo | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Básico | Completo | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Corporativo | Avançado | ⭐⭐⭐⭐ |
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

## 🎓 Learning Path

### Recommended Progression

1. **Start with Simple Web App**
   - Aprenda conceitos básicos do AZD
   - Entenda o fluxo de deployment
   - Pratique gerenciamento de ambiente

2. **Try Static Website**
   - Explore diferentes opções de hospedagem
   - Aprenda sobre integração com CDN
   - Entenda configuração de DNS

3. **Move to Container App**
   - Aprenda fundamentos de conteinerização
   - Entenda conceitos de escalabilidade
   - Pratique com Docker

4. **Add Database Integration**
   - Aprenda provisionamento de banco de dados
   - Entenda strings de conexão
   - Pratique gerenciamento de segredos

5. **Explore Serverless**
   - Entenda arquitetura dirigida a eventos
   - Aprenda sobre triggers e bindings
   - Pratique com APIs

6. **Build Microservices**
   - Aprenda comunicação entre serviços
   - Entenda sistemas distribuídos
   - Pratique deployments complexos

## 🔍 Finding the Right Example

### By Technology Stack
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### By Architecture Pattern
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### By Complexity Level
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Sistema multi-agente completo com deployment via template ARM)

## 📚 Additional Resources

### Documentation Links
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Examples
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Melhores Práticas
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuir com Exemplos

Tem um exemplo útil para compartilhar? Acolhemos contribuições!

### Diretrizes de Envio
1. Siga a estrutura de diretórios estabelecida
2. Inclua um README.md abrangente
3. Adicione comentários aos arquivos de configuração
4. Teste exaustivamente antes de submeter
5. Inclua estimativas de custo e pré-requisitos

### Estrutura do Modelo de Exemplo
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

**Dica Profissional**: Comece com o exemplo mais simples que corresponda à sua stack de tecnologia e, em seguida, avance gradualmente para cenários mais complexos. Cada exemplo constrói conceitos dos anteriores!

## 🚀 Pronto para Começar?

### Seu Caminho de Aprendizado

1. **Iniciante Completo?** → Comece com [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Tem conhecimento básico de AZD?** → Experimente [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Desenvolvendo Apps de IA?** → Comece com [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) ou explore [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ horas)
4. **Precisa de uma pilha de tecnologia específica?** → Use a seção [Encontrando o Exemplo Certo](#-finding-the-right-example) acima

### Próximos Passos

- ✅ Revise [Pré-requisitos](#prerequisites) acima
- ✅ Escolha um exemplo que corresponda ao seu nível de habilidade (veja [Legenda de Complexidade](#legenda-de-nível-de-complexidade))
- ✅ Leia o README do exemplo cuidadosamente antes de implantar
- ✅ Defina um lembrete para executar `azd down` após os testes
- ✅ Compartilhe sua experiência via Issues ou Discussions do GitHub

### Precisa de Ajuda?

- 📖 [FAQ](../resources/faq.md) - Perguntas comuns respondidas
- 🐛 [Guia de Solução de Problemas](../docs/chapter-07-troubleshooting/common-issues.md) - Corrija problemas de implantação
- 💬 [Discussões no GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Pergunte à comunidade
- 📚 [Guia de Estudo](../resources/study-guide.md) - Reforce seu aprendizado

---

**Navegação**
- **📚 Início do Curso**: [AZD For Beginners](../README.md)
- **📖 Materiais de Estudo**: [Guia de Estudo](../resources/study-guide.md) | [Resumo](../resources/cheat-sheet.md) | [Glossário](../resources/glossary.md)
- **🔧 Recursos**: [FAQ](../resources/faq.md) | [Solução de Problemas](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Última Atualização: novembro de 2025 | [Reportar Problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuir com Exemplos](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->