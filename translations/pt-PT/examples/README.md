# Exemplos - Modelos AZD Práticos e Configurações

**Aprendizagem por Exemplo - Organizado por Capítulo**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Mapeamento dos Capítulos**: Exemplos organizados por complexidade
- **🚀 Exemplo Local**: [Solução Multi-Agente para o Varejo](retail-scenario.md)
- **🤖 Exemplos Externos de IA**: Ligações para repositórios Azure Samples

> **📍 IMPORTANTE: Exemplos Locais vs Externos**  
> Este repositório contém **4 exemplos locais completos** com implementações totais:  
> - **Microsoft Foundry Models Chat** (implantação gpt-4.1 com interface de chat)  
> - **Container Apps** (API Flask simples + Microserviços)  
> - **Aplicação de Base de Dados** (Web + Base de Dados SQL)  
> - **Multi-Agente para o Varejo** (Solução AI Empresarial)  
>  
> Exemplos adicionais são **referências externas** para repositórios Azure-Samples que pode clonar.

## Introdução

Este diretório fornece exemplos práticos e referências para ajudar a aprender Azure Developer CLI através de prática direta. O cenário Multi-Agente para o Varejo é uma implementação completa e pronta para produção incluída neste repositório. Exemplos adicionais referenciam Azure Samples oficiais que demonstram vários padrões AZD.

### Legenda de Nível de Complexidade

- ⭐ **Iniciante** - Conceitos básicos, serviço único, 15-30 minutos
- ⭐⭐ **Intermédio** - Vários serviços, integração com base de dados, 30-60 minutos
- ⭐⭐⭐ **Avançado** - Arquitetura complexa, integração com IA, 1-2 horas
- ⭐⭐⭐⭐ **Especialista** - Pronto para produção, padrões empresariais, 2+ horas

## 🎯 O Que Realmente Está Neste Repositório

### ✅ Implementação Local (Pronto a Usar)

#### [Aplicação de Chat Microsoft Foundry Models](azure-openai-chat/README.md) 🆕  
**Implantação completa gpt-4.1 com interface de chat incluída neste repositório**

- **Localização:** `examples/azure-openai-chat/`
- **Complexidade:** ⭐⭐ (Intermédio)
- **Inclui:**
  - Implantação completa Microsoft Foundry Models (gpt-4.1)
  - Interface de chat em linha de comandos Python
  - Integração com Key Vault para chaves API seguras
  - Modelos Bicep para infraestrutura
  - Monitorização de uso de tokens e custos
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
  
**Tecnologias:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Exemplos Container App](container-app/README.md) 🆕  
**Exemplos abrangentes de implantação de containers incluídos neste repositório**

- **Localização:** `examples/container-app/`
- **Complexidade:** ⭐-⭐⭐⭐⭐ (Iniciante a Avançado)
- **Inclui:**
  - [Guia Mestre](container-app/README.md) - Visão geral completa de implantações de containers
  - [API Flask Simples](../../../examples/container-app/simple-flask-api) - Exemplo básico de REST API
  - [Arquitetura Microserviços](../../../examples/container-app/microservices) - Implantação multi-serviço pronta para produção
  - Início Rápido, padrões para Produção e Avançados
  - Monitorização, segurança e otimização de custos

**Início Rápido:**  
```bash
# Ver guia principal
cd examples/container-app

# Desplegar API Flask simples
cd simple-flask-api
azd up

# Desplegar exemplo de microserviços
cd ../microservices
azd up
```
  
**Tecnologias:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solução Multi-Agente Para o Varejo](retail-scenario.md) 🆕  
**Implementação completa pronta para produção incluída neste repositório**

- **Localização:** `examples/retail-multiagent-arm-template/`
- **Complexidade:** ⭐⭐⭐⭐ (Avançado)
- **Inclui:**
  - Modelo ARM completo para implantação
  - Arquitetura multi-agente (Cliente + Inventário)
  - Integração com Microsoft Foundry Models
  - Pesquisa AI com RAG
  - Monitorização abrangente
  - Script de implantação com um clique

**Início Rápido:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Tecnologias:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Azure Samples Externos (Clone para Usar)

Os exemplos seguintes são mantidos em repositórios oficiais Azure-Samples. Clone-os para explorar diferentes padrões AZD:

### Aplicações Simples (Capítulos 1-2)

| Modelo | Repositório | Complexidade | Serviços |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microserviços** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-serviço, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Como usar:**  
```bash
# Clonar qualquer exemplo
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Implantar
azd up
```
  
### Exemplos de Aplicações AI (Capítulos 2, 5, 8)

| Modelo | Repositório | Complexidade | Foco |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | implantação gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | chat AI básico |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | estrutura de agentes |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | padrão RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA empresarial |

### Base de Dados & Padrões Avançados (Capítulos 3-8)

| Modelo | Repositório | Complexidade | Foco |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | integração base de dados |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | serverless NoSQL |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | multi-serviço |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Metas de Aprendizagem

Trabalhando com estes exemplos, irá:
- Praticar fluxos de trabalho Azure Developer CLI com cenários realistas de aplicação
- Compreender diferentes arquiteturas de aplicação e suas implementações azd
- Dominar padrões de Infrastructure as Code para vários serviços Azure
- Aplicar gestão de configuração e estratégias de implantação específicas para ambientes
- Implementar padrões de monitorização, segurança e escalabilidade em contextos práticos
- Desenvolver experiência em resolução de problemas e depuração em cenários reais de implantação

## Resultados de Aprendizagem

Ao completar estes exemplos, será capaz de:
- Implantar vários tipos de aplicação usando Azure Developer CLI com confiança
- Adaptar os modelos fornecidos aos requisitos da sua própria aplicação
- Projetar e implementar padrões personalizados de infraestrutura usando Bicep
- Configurar aplicações multi-serviço complexas com dependências corretas
- Aplicar práticas recomendadas de segurança, monitorização e desempenho em cenários reais
- Diagnosticar e otimizar implantações com base em experiência prática

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

> **💡 Novo no AZD?** Comece pelo exemplo #1 (Flask API) – dura ~20 minutos e ensina conceitos fundamentais.

### Para Iniciantes
1. **[Container App - API Python Flask](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Implemente uma API REST simples com escala para zero  
   **Tempo:** 20-25 minutos | **Custo:** 0-5$/mês  
   **Aprende:** Fluxo básico azd, conteinerização, probes de saúde  
   **Resultado Esperado:** Endpoint API funcional que retorna "Hello, World!" com monitorização

2. **[Aplicação Web Simples - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implante aplicação Node.js Express com MongoDB  
   **Tempo:** 25-35 minutos | **Custo:** 10-30$/mês  
   **Aprende:** Integração base de dados, variáveis de ambiente, cadeias de conexão  
   **Resultado Esperado:** Aplicação lista de tarefas com funcionalidades CRUD

3. **[Site Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hospede site React estático com Azure Static Web Apps  
   **Tempo:** 20-30 minutos | **Custo:** 0-10$/mês  
   **Aprende:** Hospedagem estática, funções serverless, implantação CDN  
   **Resultado Esperado:** UI React com backend API, SSL automático, CDN global

### Para Utilizadores Intermédios
4. **[Aplicação de Chat Microsoft Foundry Models](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Implemente gpt-4.1 com interface de chat e gestão segura de chave API  
   **Tempo:** 35-45 minutos | **Custo:** 50-200$/mês  
   **Aprende:** Implantação Microsoft Foundry Models, integração com Key Vault, monitorização de tokens  
   **Resultado Esperado:** Aplicação de chat a funcionar com gpt-4.1 e monitorização de custos

5. **[Container App - Microserviços](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arquitetura multi-serviço pronta para produção  
   **Tempo:** 45-60 minutos | **Custo:** 50-150$/mês  
   **Aprende:** Comunicação entre serviços, enfileiramento de mensagens, tracing distribuído  
   **Resultado Esperado:** Sistema 2-serviços (API Gateway + Serviço Produto) com monitorização

6. **[Aplicação Base de Dados - C# com Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicação web com API C# e base de dados Azure SQL  
   **Tempo:** 30-45 minutos | **Custo:** 20-80$/mês  
   **Aprende:** Entity Framework, migrações de base de dados, segurança de conexão  
   **Resultado Esperado:** API C# com backend Azure SQL, implantação automática de esquema

7. **[Função Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions com triggers HTTP e Cosmos DB  
   **Tempo:** 30-40 minutos | **Custo:** 10-40$/mês  
   **Aprende:** Arquitetura baseada em eventos, escalabilidade serverless, integração NoSQL  
   **Resultado Esperado:** App de funções respondendo a pedidos HTTP com armazenamento Cosmos DB

8. **[Microserviços - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicação multi-serviço Java com Container Apps e API gateway  
   **Tempo:** 60-90 minutos | **Custo:** 80-200$/mês  
   **Aprende:** Implantação Spring Boot, malha de serviços, balanceamento de carga  
   **Resultado Esperado:** Sistema Java multi-serviço com descoberta e roteamento de serviços

### Modelos Microsoft Foundry

1. **[App Chat Microsoft Foundry Models - Exemplo Local](../../../examples/azure-openai-chat)** ⭐⭐  
   Implantação completa gpt-4.1 com interface de chat  
   **Tempo:** 35-45 minutos | **Custo:** 50-200$/mês  
   **Resultado Esperado:** Aplicação de chat funcional com monitorização de tokens e custos

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicação de chat inteligente com arquitetura RAG  
   **Tempo:** 60-90 minutos | **Custo:** 100-300$/mês  
   **Resultado Esperado:** Interface de chat baseada em RAG com pesquisa de documentos e citações

3. **[Processamento de Documentos AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Análise de documentos com serviços Azure AI  
   **Tempo:** 40-60 minutos | **Custo:** 20-80$/mês  
   **Resultado Esperado:** API extraindo texto, tabelas e entidades de documentos carregados

4. **[Pipeline de Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Workflow MLOps com Azure Machine Learning  
   **Tempo:** 2-3 horas | **Custo:** 150-500$/mês  
   **Resultado Esperado:** Pipeline ML automatizado com treino, implantação e monitorização

### Cenários do Mundo Real

#### **Solução Multi-Agente para o Varejo** 🆕  
**[Guia Completo de Implementação](./retail-scenario.md)**

Uma solução multi-agente de suporte ao cliente pronta para produção que demonstra implantação de aplicação AI empresarial com AZD. Este cenário inclui:

- **Arquitetura Completa**: Sistema multi-agente com agentes especializados para serviço ao cliente e gestão de inventário
- **Infraestrutura de Produção**: Implementações multi-região dos Microsoft Foundry Models, AI Search, Container Apps e monitorização abrangente  
- **Template ARM Pronto a Desdobrar**: Implementação com um clique com múltiplos modos de configuração (Mínimo/Padrão/Premium)  
- **Funcionalidades Avançadas**: Validação de segurança red teaming, framework de avaliação de agentes, otimização de custos e guias de resolução de problemas  
- **Contexto Empresarial Real**: Caso de uso de suporte ao cliente do retalho com carregamento de ficheiros, integração de pesquisa e escalabilidade dinâmica  

**Tecnologias**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complexidade**: ⭐⭐⭐⭐ (Avançado - Pronto para Produção Empresarial)  

**Perfeito para**: desenvolvedores de IA, arquitetos de soluções e equipas a construir sistemas multi-agente para produção  

**Início Rápido**: Implemente a solução completa em menos de 30 minutos usando o template ARM incluído com `./deploy.sh -g myResourceGroup`  

## 📋 Instruções de Utilização

### Pré-requisitos  

Antes de executar qualquer exemplo:  
- ✅ Subscrição Azure com acesso de Proprietário ou Contribuinte  
- ✅ Azure Developer CLI instalado ([Guia de Instalação](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop em execução (para exemplos com containers)  
- ✅ Quotas Azure adequadas (verifique os requisitos específicos de cada exemplo)  

> **💰 Aviso de Custo:** Todos os exemplos criam recursos Azure reais que geram custos. Consulte os ficheiros README individuais para estimativas de custos. Lembre-se de executar `azd down` quando terminar para evitar custos contínuos.  

### Execução dos Exemplos Localmente  

1. **Clonar ou Copiar Exemplo**  
   ```bash
   # Navegar para o exemplo desejado
   cd examples/simple-web-app
   ```
  
2. **Inicializar Ambiente AZD**  
   ```bash
   # Inicializar com modelo existente
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
  
4. **Implementar**  
   ```bash
   # Implantar infraestrutura e aplicação
   azd up
   ```
  
5. **Verificar Implementação**  
   ```bash
   # Obter endpoints de serviço
   azd env get-values
   
   # Testar o endpoint (exemplo)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indicadores de Sucesso Esperados:**  
   - ✅ `azd up` conclui sem erros  
   - ✅ Endpoint do serviço retorna HTTP 200  
   - ✅ Portal Azure mostra estado "Running"  
   - ✅ Application Insights recebe telemetria  

> **⚠️ Problemas?** Veja [Problemas Comuns](../docs/chapter-07-troubleshooting/common-issues.md) para resolução de problemas de implementação  

### Adaptar Exemplos  

Cada exemplo inclui:  
- **README.md** - Instruções detalhadas de configuração e personalização  
- **azure.yaml** - Configuração AZD com comentários  
- **infra/** - Templates Bicep com explicações de parâmetros  
- **src/** - Código da aplicação de exemplo  
- **scripts/** - Scripts auxiliares para tarefas comuns  

## 🎯 Objetivos de Aprendizagem

### Categorias de Exemplos  

#### **Implementações Básicas**  
- Aplicações de serviço único  
- Padrões simples de infraestrutura  
- Gestão básica de configuração  
- Configurações de desenvolvimento custo-efetivas  

#### **Cenários Avançados**  
- Arquiteturas multi-serviço  
- Configurações complexas de redes  
- Padrões de integração de bases de dados  
- Implementações de segurança e conformidade  

#### **Padrões Prontos para Produção**  
- Configurações de alta disponibilidade  
- Monitorização e observabilidade  
- Integração CI/CD  
- Configurações de recuperação de desastres  

## 📖 Descrições dos Exemplos

### Aplicação Web Simples - Node.js Express  
**Tecnologias**: Node.js, Express, MongoDB, Container Apps  
**Complexidade**: Iniciante  
**Conceitos**: Implementação básica, API REST, integração com base de dados NoSQL  

### Website Estático - React SPA  
**Tecnologias**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexidade**: Iniciante  
**Conceitos**: Alojamento estático, backend serverless, desenvolvimento web moderno  

### Container App - Python Flask  
**Tecnologias**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexidade**: Iniciante  
**Conceitos**: Conteinerização, API REST, scale-to-zero, sondas de saúde, monitorização  
**Localização**: [Exemplo Local](../../../examples/container-app/simple-flask-api)  

### Container App - Arquitetura Microserviços  
**Tecnologias**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexidade**: Avançado  
**Conceitos**: Arquitetura multi-serviço, comunicação entre serviços, enfileiramento de mensagens, tracing distribuído  
**Localização**: [Exemplo Local](../../../examples/container-app/microservices)  

### Aplicação de Base de Dados - C# com Azure SQL  
**Tecnologias**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexidade**: Intermédio  
**Conceitos**: Entity Framework, ligações a base de dados, desenvolvimento de API web  

### Função Serverless - Python Azure Functions  
**Tecnologias**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexidade**: Intermédio  
**Conceitos**: Arquitetura orientada a eventos, computação serverless, desenvolvimento full-stack  

### Microserviços - Java Spring Boot  
**Tecnologias**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexidade**: Intermédio  
**Conceitos**: Comunicação entre microserviços, sistemas distribuídos, padrões empresariais  

### Exemplos Microsoft Foundry  

#### Aplicação de Chat Microsoft Foundry Models  
**Tecnologias**: Microsoft Foundry Models, Azure AI Search, App Service  
**Complexidade**: Intermédio  
**Conceitos**: Arquitetura RAG, pesquisa vetorial, integração LLM  

#### Processamento de Documentos AI  
**Tecnologias**: Azure AI Document Intelligence, Storage, Functions  
**Complexidade**: Intermédio  
**Conceitos**: Análise de documentos, OCR, extração de dados  

#### Pipeline de Machine Learning  
**Tecnologias**: Azure ML, MLOps, Container Registry  
**Complexidade**: Avançado  
**Conceitos**: Treino de modelos, pipelines de implementação, monitorização  

## 🛠 Exemplos de Configuração

O diretório `configurations/` contém componentes reutilizáveis:  

### Configurações de Ambiente  
- Configurações para ambiente de desenvolvimento  
- Configurações para ambiente de staging  
- Configurações prontas para produção  
- Configurações para implementação multi-região  

### Módulos Bicep  
- Componentes de infraestrutura reutilizáveis  
- Padrões comuns de recursos  
- Templates com segurança reforçada  
- Configurações otimizadas para custos  

### Scripts Auxiliares  
- Automação de configuração de ambiente  
- Scripts de migração de base de dados  
- Ferramentas de validação de implementação  
- Utilitários de monitorização de custos  

## 🔧 Guia de Personalização

### Adaptar Exemplos para o Seu Caso de Uso  

1. **Rever Pré-requisitos**  
   - Verificar requisitos dos serviços Azure  
   - Confirmar limites da subscrição  
   - Compreender implicações de custo  

2. **Modificar Configuração**  
   - Atualizar definições de serviço em `azure.yaml`  
   - Personalizar templates Bicep  
   - Ajustar variáveis de ambiente  

3. **Testar Cuidadosamente**  
   - Implementar primeiro no ambiente de desenvolvimento  
   - Validar funcionalidades  
   - Testar escalabilidade e desempenho  

4. **Revisão de Segurança**  
   - Rever controlos de acesso  
   - Implementar gestão de segredos  
   - Ativar monitorização e alertas  

## 📊 Matriz de Comparação

| Exemplo                           | Serviços | Base de Dados | Auth          | Monitorização | Complexidade |
|----------------------------------|----------|--------------|---------------|---------------|-------------|
| **Microsoft Foundry Models Chat** (Local) | 2        | ❌            | Key Vault     | Completa      | ⭐⭐          |
| **Python Flask API** (Local)      | 1        | ❌            | Básico        | Completa      | ⭐           |
| **Microservices** (Local)         | 5+       | ✅            | Empresarial   | Avançada      | ⭐⭐⭐⭐        |
| Node.js Express Todo              | 2        | ✅            | Básico        | Básica        | ⭐           |
| React SPA + Functions             | 3        | ✅            | Básico        | Completa      | ⭐           |
| Python Flask Container            | 2        | ❌            | Básico        | Completa      | ⭐           |
| C# Web API + SQL                 | 2        | ✅            | Completa      | Completa      | ⭐⭐          |
| Python Functions + SPA            | 3        | ✅            | Completa      | Completa      | ⭐⭐          |
| Java Microservices                | 5+       | ✅            | Completa      | Completa      | ⭐⭐          |
| Microsoft Foundry Models Chat     | 3        | ✅            | Completa      | Completa      | ⭐⭐⭐         |
| AI Document Processing            | 2        | ❌            | Básico        | Completa      | ⭐⭐          |
| ML Pipeline                      | 4+       | ✅            | Completa      | Completa      | ⭐⭐⭐⭐        |
| **Retail Multi-Agent** (Local)     | **8+**   | **✅**        | **Empresarial**| **Avançada**  | **⭐⭐⭐⭐**    |

## 🎓 Caminho de Aprendizagem  

### Progressão Recomendada  

1. **Começar com Aplicação Web Simples**  
   - Aprender conceitos básicos AZD  
   - Compreender fluxo de implementação  
   - Praticar gestão de ambiente  

2. **Experimentar Website Estático**  
   - Explorar diferentes opções de alojamento  
   - Aprender sobre integração CDN  
   - Compreender configuração DNS  

3. **Avançar para Container App**  
   - Aprender noções básicas de conteinerização  
   - Compreender conceitos de escalabilidade  
   - Praticar com Docker  

4. **Adicionar Integração de Base de Dados**  
   - Aprender provisionamento de base de dados  
   - Compreender strings de ligação  
   - Praticar gestão de segredos  

5. **Explorar Serverless**  
   - Compreender arquitetura orientada a eventos  
   - Aprender sobre triggers e bindings  
   - Praticar APIs  

6. **Construir Microserviços**  
   - Aprender comunicação entre serviços  
   - Compreender sistemas distribuídos  
   - Praticar implementações complexas  

## 🔍 Encontrar o Exemplo Certo

### Por Stack Tecnológica  
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Bases de Dados**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **IA/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Sistemas Multi-Agente**: **Retail Multi-Agent Solution**  
- **Integração OpenAI**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Produção Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Por Padrão de Arquitetura  
- **API REST Simples**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolítico**: Node.js Express Todo, C# Web API + SQL  
- **Estático + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microserviços**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Conteinerizado**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)  
- **Impulsionado por IA**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Arquitetura Multi-Agente**: **Retail Multi-Agent Solution**  
- **Multi-Serviço Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Por Nível de Complexidade  
- **Iniciante**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermédio**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing  
- **Avançado**: ML Pipeline  
- **Pronto para Produção Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-serviço com enfileiramento de mensagens), **Retail Multi-Agent Solution** (Sistema multi-agente completo com deployment ARM template)  

## 📚 Recursos Adicionais

### Links de Documentação  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Documentação Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Exemplos da Comunidade  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App com C# e Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App com Python e MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo App com Node.js e PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [Aplicação Web React com API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Tarefa Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions com Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Melhores Práticas
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Framework de Adoção da Cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuir com Exemplos

Tem um exemplo útil para partilhar? Agradecemos contribuições!

### Diretrizes de Submissão
1. Siga a estrutura de diretórios estabelecida
2. Inclua um README.md completo
3. Adicione comentários aos ficheiros de configuração
4. Teste exaustivamente antes de submeter
5. Inclua estimativas de custos e pré-requisitos

### Estrutura Modelo de Exemplo
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

**Dica Profissional**: Comece pelo exemplo mais simples que corresponda ao seu stack tecnológico, depois avance gradualmente para cenários mais complexos. Cada exemplo baseia-se nos conceitos do anterior!

## 🚀 Pronto para Começar?

### O Seu Roteiro de Aprendizagem

1. **Iniciante Completo?** → Comece com [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minutos)
2. **Tem Conhecimentos Básicos de AZD?** → Experimente [Microserviços](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minutos)
3. **A Construir Aplicações de IA?** → Comece com [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minutos) ou explore [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ horas)
4. **Precisa de Stack Tecnológico Específico?** → Use a secção [Encontrar o Exemplo Certo](#-finding-the-right-example) acima

### Próximos Passos

- ✅ Reveja os [Pré-requisitos](#pré-requisitos) acima
- ✅ Escolha um exemplo que corresponda ao seu nível de habilidade (veja [Legenda de Complexidade](#legenda-de-nível-de-complexidade))
- ✅ Leia atentamente o README do exemplo antes de fazer o deployment
- ✅ Defina um lembrete para executar `azd down` após os testes
- ✅ Partilhe a sua experiência via GitHub Issues ou Discussions

### Precisa de Ajuda?

- 📖 [FAQ](../resources/faq.md) - Perguntas frequentes respondidas
- 🐛 [Guia de Resolução de Problemas](../docs/chapter-07-troubleshooting/common-issues.md) - Solucione problemas de deployment
- 💬 [Discussões no GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Pergunte à comunidade
- 📚 [Guia de Estudo](../resources/study-guide.md) - Reforce o seu aprendizado

---

**Navegação**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Materiais de Estudo**: [Guia de Estudo](../resources/study-guide.md) | [Folha de Cola](../resources/cheat-sheet.md) | [Glossário](../resources/glossary.md)
- **🔧 Recursos**: [FAQ](../resources/faq.md) | [Resolução de Problemas](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Última Atualização: Novembro 2025 | [Reportar Problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuir com Exemplos](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->