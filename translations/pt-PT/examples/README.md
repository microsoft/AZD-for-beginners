# Exemplos - Modelos e Configurações Práticas AZD

**Aprender com Exemplos - Organizado por Capítulo**  
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)  
- **📖 Mapeamento de Capítulos**: Exemplos organizados por complexidade de aprendizagem  
- **🚀 Exemplo Local**: [Solução Multi-Agente para Retalho](retail-scenario.md)  
- **🤖 Exemplos Externos de IA**: Ligações para repositórios Azure Samples

> **📍 IMPORTANTE: Exemplos Locais vs Externos**  
> Este repositório contém **4 exemplos locais completos** com implementações completas:  
> - **Microsoft Foundry Models Chat** (implantação gpt-4.1 com interface de chat)  
> - **Container Apps** (API Flask simples + Microserviços)  
> - **Aplicação Base de Dados** (Web + Base de Dados SQL)  
> - **Retail Multi-Agent** (Solução Empresarial de IA)  
>  
> Exemplos adicionais são **referências externas** para repositórios Azure-Samples que pode clonar.

## Introdução

Este diretório disponibiliza exemplos práticos e referências para ajudar a aprender Azure Developer CLI através da prática. O cenário Retail Multi-Agent é uma implementação completa e pronta para produção incluída neste repositório. Exemplos adicionais referenciam os Azure Samples oficiais que demonstram vários padrões AZD.

### Legenda de Nível de Complexidade

- ⭐ **Iniciante** - Conceitos básicos, serviço único, 15-30 minutos  
- ⭐⭐ **Intermédio** - Múltiplos serviços, integração com base de dados, 30-60 minutos  
- ⭐⭐⭐ **Avançado** - Arquitetura complexa, integração IA, 1-2 horas  
- ⭐⭐⭐⭐ **Especialista** - Pronto para produção, padrões empresariais, 2+ horas

## 🎯 O Que Está Realmente Neste Repositório

### ✅ Implementação Local (Pronta a Usar)

#### [Aplicação de Chat Microsoft Foundry Models](azure-openai-chat/README.md) 🆕  
**Implantação completa gpt-4.1 com interface de chat incluída neste repo**

- **Localização:** `examples/azure-openai-chat/`  
- **Complexidade:** ⭐⭐ (Intermédio)  
- **Inclui:**  
  - Implantação completa dos Microsoft Foundry Models (gpt-4.1)  
  - Interface de chat em linha de comando Python  
  - Integração Key Vault para chaves API seguras  
  - Modelos Bicep para infraestrutura  
  - Monitorização de uso de tokens e custos  
  - Limitação de taxa e gestão de erros

**Início Rápido:**  
```bash
# Navegar para exemplo
cd examples/azure-openai-chat

# Implantar tudo
azd up

# Instalar dependências e começar a conversar
pip install -r src/requirements.txt
python src/chat.py
```
  
**Tecnologias:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Exemplos de Container App](container-app/README.md) 🆕  
**Exemplos abrangentes de implantação de containers incluídos neste repo**

- **Localização:** `examples/container-app/`  
- **Complexidade:** ⭐-⭐⭐⭐⭐ (Iniciante a Avançado)  
- **Inclui:**  
  - [Guia Mestre](container-app/README.md) - Visão completa de implantações de containers  
  - [API Flask Simples](../../../examples/container-app/simple-flask-api) - Exemplo básico de REST API  
  - [Arquitetura de Microserviços](../../../examples/container-app/microservices) - Implantação multi-serviço pronta para produção  
  - Padrões de Início Rápido, Produção e Avançados  
  - Monitorização, segurança e otimização de custos

**Início Rápido:**  
```bash
# Ver guia principal
cd examples/container-app

# Implementar API Flask simples
cd simple-flask-api
azd up

# Exemplo de implementação de microsserviços
cd ../microservices
azd up
```
  
**Tecnologias:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solução Multi-Agente para Retalho](retail-scenario.md) 🆕  
**Implementação completa pronta para produção incluída neste repo**

- **Localização:** `examples/retail-multiagent-arm-template/`  
- **Complexidade:** ⭐⭐⭐⭐ (Avançado)  
- **Inclui:**  
  - Modelo ARM de implantação completo  
  - Arquitetura multi-agente (Cliente + Inventário)  
  - Integração Microsoft Foundry Models  
  - Pesquisa com IA usando RAG  
  - Monitorização abrangente  
  - Script de implantação com um clique

**Início Rápido:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Tecnologias:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Exemplos Externos Azure Samples (Clone para Usar)

Os exemplos seguintes são mantidos em repositórios oficiais Azure-Samples. Clone-os para explorar diferentes padrões AZD:

### Aplicações Simples (Capítulos 1-2)

| Modelo | Repositório | Complexidade | Serviços |
|:-------|:------------|:-------------|:---------|
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
  

### Exemplos de Aplicações IA (Capítulos 2, 5, 8)

| Modelo | Repositório | Complexidade | Foco |
|:-------|:------------|:-------------|:-----|
| **Microsoft Foundry Models Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Implantação gpt-4.1 |
| **Exemplo Rápido AI Chat** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat IA básico |
| **Agentes IA** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework de agentes |
| **Demo Pesquisa + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Padrão RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA Empresarial |

### Base de Dados & Padrões Avançados (Capítulos 3-8)

| Modelo | Repositório | Complexidade | Foco |
|:-------|:------------|:-------------|:-----|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integração base de dados |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microserviços** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-serviço |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objetivos de Aprendizagem

Ao trabalhar nestes exemplos, irá:  
- Praticar fluxos de trabalho Azure Developer CLI com cenários reais de aplicação  
- Compreender diferentes arquiteturas de aplicações e as suas implementações azd  
- Dominar padrões de Infraestrutura como Código para vários serviços Azure  
- Aplicar gestão de configuração e estratégias de implantação específicas de ambiente  
- Implementar padrões de monitorização, segurança e escalabilidade em contextos práticos  
- Construir experiência em resolução de problemas e debugging em cenários reais de implantação

## Resultados de Aprendizagem

Ao concluir estes exemplos, será capaz de:  
- Implantar vários tipos de aplicações com confiança usando Azure Developer CLI  
- Adaptar os modelos fornecidos às suas próprias necessidades de aplicação  
- Projetar e implementar padrões de infraestrutura personalizados usando Bicep  
- Configurar aplicações multi-serviço complexas com dependências adequadas  
- Aplicar boas práticas de segurança, monitorização e desempenho em cenários reais  
- Identificar problemas e otimizar implantações com base em experiência prática

## Estrutura de Diretórios

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
  
## Exemplos para Início Rápido

> **💡 Novo no AZD?** Comece pelo exemplo #1 (API Flask) - demora cerca de 20 minutos e ensina conceitos fundamentais.

### Para Iniciantes  
1. **[Container App - API Python Flask](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Implante uma API REST simples com escala para zero  
   **Tempo:** 20-25 minutos | **Custo:** $0-5/mês  
   **Aprenderá:** Fluxo azd básico, conteinerização, sondas de saúde  
   **Resultado Esperado:** Endpoint API funcional que retorna "Hello, World!" com monitorização

2. **[Aplicação Web Simples - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implante aplicação web Node.js Express com MongoDB  
   **Tempo:** 25-35 minutos | **Custo:** $10-30/mês  
   **Aprenderá:** Integração base de dados, variáveis de ambiente, strings de conexão  
   **Resultado Esperado:** Aplicação lista de tarefas com funcionalidades CRUD

3. **[Website Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hospede site estático React com Azure Static Web Apps  
   **Tempo:** 20-30 minutos | **Custo:** $0-10/mês  
   **Aprenderá:** Hospedagem estática, funções serverless, implantação CDN  
   **Resultado Esperado:** UI React com backend API, SSL automático, CDN global

### Para Utilizadores Intermédios  
4. **[Aplicação de Chat Microsoft Foundry Models](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Implante gpt-4.1 com interface de chat e gestão segura de chave API  
   **Tempo:** 35-45 minutos | **Custo:** $50-200/mês  
   **Aprenderá:** Implantação Microsoft Foundry Models, integração Key Vault, monitorização tokens  
   **Resultado Esperado:** Aplicação de chat funcional com gpt-4.1 e monitorização de custos

5. **[Container App - Microserviços](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arquitetura multi-serviço pronta para produção  
   **Tempo:** 45-60 minutos | **Custo:** $50-150/mês  
   **Aprenderá:** Comunicação de serviço, enfileiramento de mensagens, tracing distribuído  
   **Resultado Esperado:** Sistema de 2 serviços (API Gateway + Serviço Produto) com monitorização

6. **[Aplicação Base de Dados - C# com Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicação web com API C# e Base de Dados Azure SQL  
   **Tempo:** 30-45 minutos | **Custo:** $20-80/mês  
   **Aprenderá:** Entity Framework, migrações de base dados, segurança de conexão  
   **Resultado Esperado:** API C# com back-end Azure SQL e implantação de esquema automática

7. **[Função Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Azure Functions em Python com triggers HTTP e Cosmos DB  
   **Tempo:** 30-40 minutos | **Custo:** $10-40/mês  
   **Aprenderá:** Arquitetura dirigida a eventos, escalabilidade serverless, integração NoSQL  
   **Resultado Esperado:** Função reagindo a pedidos HTTP com armazenamento Cosmos DB

8. **[Microserviços - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicação multi-serviço Java com Container Apps e gateway API  
   **Tempo:** 60-90 minutos | **Custo:** $80-200/mês  
   **Aprenderá:** Implantação Spring Boot, malha de serviços, balanceamento de carga  
   **Resultado Esperado:** Sistema multi-serviço Java com descoberta e encaminhamento de serviços

### Modelos Microsoft Foundry

1. **[Aplicação de Chat Microsoft Foundry Models - Exemplo Local](../../../examples/azure-openai-chat)** ⭐⭐  
   Implantação completa gpt-4.1 com interface de chat  
   **Tempo:** 35-45 minutos | **Custo:** $50-200/mês  
   **Resultado Esperado:** Aplicação de chat funcional com monitorização de tokens e custos

2. **[Demo Azure Search + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicação de chat inteligente com arquitetura RAG  
   **Tempo:** 60-90 minutos | **Custo:** $100-300/mês  
   **Resultado Esperado:** Interface de chat com RAG alimentada por pesquisa e citações de documentos

3. **[Processamento de Documentos IA](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Análise de documentos usando serviços Azure AI  
   **Tempo:** 40-60 minutos | **Custo:** $20-80/mês  
   **Resultado Esperado:** API a extrair texto, tabelas e entidades de documentos carregados

4. **[Pipeline de Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Workflow MLOps com Azure Machine Learning  
   **Tempo:** 2-3 horas | **Custo:** $150-500/mês  
   **Resultado Esperado:** Pipeline ML automatizado com treino, implantação e monitorização

### Cenários do Mundo Real

#### **Solução Multi-Agente para Retalho** 🆕  
**[Guia Completo de Implementação](./retail-scenario.md)**

Uma solução multi-agente para suporte ao cliente, pronta para produção, que demonstra a implantação de aplicações IA empresariais com AZD. Este cenário disponibiliza:
- **Arquitetura Completa**: Sistema multi-agente com agentes especializados em atendimento ao cliente e gestão de inventário  
- **Infraestrutura de Produção**: Implementações multi-região dos Microsoft Foundry Models, Azure AI Search, Container Apps, e monitorização abrangente  
- **Template ARM Pronto a Implantar**: Implantação com um clique com múltiplos modos de configuração (Mínimo/Standard/Premium)  
- **Funcionalidades Avançadas**: Validação de segurança red teaming, framework de avaliação de agentes, otimização de custos, e guias de resolução de problemas  
- **Contexto Real de Negócio**: Caso de uso de suporte ao cliente de retalhista com uploads de ficheiros, integração de pesquisa e escalamento dinâmico  

**Tecnologias**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complexidade**: ⭐⭐⭐⭐ (Avançado – Pronto para Produção Empresarial)  

**Ideal para**: Desenvolvedores de IA, arquitetos de soluções e equipas a construir sistemas multi-agente de produção  

**Início Rápido**: Implante a solução completa em menos de 30 minutos usando o template ARM incluído com `./deploy.sh -g myResourceGroup`  

## 📋 Instruções de Utilização  

### Pré-requisitos  

Antes de executar qualquer exemplo:  
- ✅ Subscrição Azure com acesso de Proprietário ou Contribuidor  
- ✅ Azure Developer CLI instalado ([Guia de Instalação](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop em execução (para exemplos com containers)  
- ✅ Quotas Azure apropriadas (verifique os requisitos específicos de cada exemplo)  

> **💰 Aviso de Custos:** Todos os exemplos criam recursos Azure reais que implicam custos. Consulte os ficheiros README individuais para estimativas de custo. Lembre-se de executar `azd down` quando terminar para evitar custos contínuos.  

### Executar Exemplos Localmente  

1. **Clonar ou Copiar Exemplo**  
   ```bash
   # Navegar para o exemplo desejado
   cd examples/simple-web-app
   ```
  
2. **Inicializar Ambiente AZD**  
   ```bash
   # Inicializar com template existente
   azd init
   
   # Ou criar novo ambiente
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
   # Implementar infraestrutura e aplicação
   azd up
   ```
  
5. **Verificar Implantação**  
   ```bash
   # Obter pontos finais do serviço
   azd env get-values
   
   # Testar o ponto final (exemplo)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indicadores de Sucesso Esperados:**  
   - ✅ `azd up` completa sem erros  
   - ✅ Endpoint do serviço retorna HTTP 200  
   - ✅ Portal Azure mostra estado "Em Execução"  
   - ✅ Application Insights a receber telemetria  

> **⚠️ Problemas?** Consulte [Problemas Comuns](../docs/chapter-07-troubleshooting/common-issues.md) para resolução de problemas na implantação  

### Adaptar Exemplos  

Cada exemplo inclui:  
- **README.md** - Instruções detalhadas de configuração e personalização  
- **azure.yaml** - Configuração AZD com comentários  
- **infra/** - Templates Bicep com explicações de parâmetros  
- **src/** - Código de aplicação de exemplo  
- **scripts/** - Scripts auxiliares para tarefas comuns  

## 🎯 Objetivos de Aprendizagem  

### Categorias de Exemplos  

#### **Implantações Básicas**  
- Aplicações de serviço único  
- Padrões simples de infraestrutura  
- Gestão básica de configuração  
- Configurações económicas para desenvolvimento  

#### **Cenários Avançados**  
- Arquiteturas multi-serviço  
- Configurações complexas de redes  
- Padrões de integração de base de dados  
- Implementações de segurança e conformidade  

#### **Padrões Prontos para Produção**  
- Configurações de alta disponibilidade  
- Monitorização e observabilidade  
- Integração CI/CD  
- Configurações de recuperação de desastres  

## 📖 Descrições dos Exemplos  

### Aplicação Web Simples – Node.js Express  
**Tecnologias**: Node.js, Express, MongoDB, Container Apps  
**Complexidade**: Iniciante  
**Conceitos**: Implantação básica, API REST, integração de base de dados NoSQL  

### Website Estático – React SPA  
**Tecnologias**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexidade**: Iniciante  
**Conceitos**: Hospedagem estática, backend serverless, desenvolvimento web moderno  

### Container App – Python Flask  
**Tecnologias**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexidade**: Iniciante  
**Conceitos**: Contentorização, API REST, escala a zero, sondas de saúde, monitorização  
**Localização**: [Exemplo Local](../../../examples/container-app/simple-flask-api)  

### Container App – Arquitetura de Microserviços  
**Tecnologias**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexidade**: Avançado  
**Conceitos**: Arquitetura multi-serviço, comunicação entre serviços, enfileiramento de mensagens, tracing distribuído  
**Localização**: [Exemplo Local](../../../examples/container-app/microservices)  

### Aplicação de Base de Dados – C# com Azure SQL  
**Tecnologias**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexidade**: Intermédio  
**Conceitos**: Entity Framework, ligações a base de dados, desenvolvimento de API web  

### Função Serverless – Python Azure Functions  
**Tecnologias**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexidade**: Intermédio  
**Conceitos**: Arquitetura orientada a eventos, computação serverless, desenvolvimento full-stack  

### Microserviços – Java Spring Boot  
**Tecnologias**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexidade**: Intermédio  
**Conceitos**: Comunicação de microserviços, sistemas distribuídos, padrões empresariais  

### Exemplos Microsoft Foundry  

#### Aplicação Chat com Microsoft Foundry Models  
**Tecnologias**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexidade**: Intermédio  
**Conceitos**: Arquitetura RAG, pesquisa vetorial, integração LLM  

#### Processamento de Documentos com IA  
**Tecnologias**: Azure AI Document Intelligence, Storage, Functions  
**Complexidade**: Intermédio  
**Conceitos**: Análise de documentos, OCR, extração de dados  

#### Pipeline de Machine Learning  
**Tecnologias**: Azure ML, MLOps, Container Registry  
**Complexidade**: Avançado  
**Conceitos**: Treino de modelos, pipelines de implantação, monitorização  

## 🛠 Exemplos de Configuração  

O diretório `configurations/` contém componentes reutilizáveis:  

### Configurações de Ambiente  
- Definições para ambiente de desenvolvimento  
- Configurações para ambiente de staging  
- Configurações prontas para produção  
- Implementações multi-região  

### Módulos Bicep  
- Componentes reutilizáveis de infraestrutura  
- Padrões comuns de recursos  
- Templates com endurecimento de segurança  
- Configurações otimizadas para custos  

### Scripts Auxiliares  
- Automatização de configuração de ambiente  
- Scripts de migração de base de dados  
- Ferramentas de validação de implantação  
- Utilitários de monitorização de custos  

## 🔧 Guia de Personalização  

### Adaptar Exemplos ao Seu Caso de Uso  

1. **Rever Pré-requisitos**  
   - Verificar requisitos dos serviços Azure  
   - Confirmar limites da subscrição  
   - Entender implicações de custo  

2. **Modificar Configuração**  
   - Atualizar definições de serviço em `azure.yaml`  
   - Personalizar templates Bicep  
   - Ajustar variáveis de ambiente  

3. **Testar Cuidadosamente**  
   - Implantar primeiro em ambiente de desenvolvimento  
   - Validar funcionalidades  
   - Testar escalabilidade e desempenho  

4. **Revisão de Segurança**  
   - Rever controlos de acesso  
   - Implementar gestão de segredos  
   - Ativar monitorização e alertas  

## 📊 Matriz de Comparação  

| Exemplo | Serviços | Base de Dados | Autenticação | Monitorização | Complexidade |  
|---------|----------|--------------|--------------|---------------|--------------|  
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Completo | ⭐⭐ |  
| **Python Flask API** (Local) | 1 | ❌ | Básico | Completo | ⭐ |  
| **Microserviços** (Local) | 5+ | ✅ | Empresarial | Avançado | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Básico | Básico | ⭐ |  
| React SPA + Functions | 3 | ✅ | Básico | Completo | ⭐ |  
| Python Flask Container | 2 | ❌ | Básico | Completo | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Completo | Completo | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Completo | Completo | ⭐⭐ |  
| Java Microserviços | 5+ | ✅ | Completo | Completo | ⭐⭐ |  
| Microsoft Foundry Models Chat | 3 | ✅ | Completo | Completo | ⭐⭐⭐ |  
| Processamento de Documentos IA | 2 | ❌ | Básico | Completo | ⭐⭐ |  
| Pipeline ML | 4+ | ✅ | Completo | Completo | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Empresarial** | **Avançado** | **⭐⭐⭐⭐** |  

## 🎓 Caminho de Aprendizagem  

### Progressão Recomendada  

1. **Começar com Aplicação Web Simples**  
   - Aprender conceitos básicos AZD  
   - Entender fluxo de trabalho de implantação  
   - Praticar gestão de ambiente  

2. **Experimentar Website Estático**  
   - Explorar diferentes opções de hospedagem  
   - Aprender sobre integração CDN  
   - Entender configuração DNS  

3. **Passar para Container App**  
   - Aprender noções básicas de contentorização  
   - Compreender conceitos de escalabilidade  
   - Praticar com Docker  

4. **Adicionar Integração de Base de Dados**  
   - Aprender provisionamento de base de dados  
   - Compreender strings de conexão  
   - Praticar gestão de segredos  

5. **Explorar Serverless**  
   - Entender arquitetura orientada a eventos  
   - Conhecer triggers e bindings  
   - Praticar com APIs  

6. **Construir Microserviços**  
   - Aprender comunicação entre serviços  
   - Compreender sistemas distribuídos  
   - Praticar implantações complexas  

## 🔍 Encontrar o Exemplo Adequado  

### Por Stack Tecnológico  
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
- **Contentorizado**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)  
- **Impulsionado por IA**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Arquitetura Multi-Agente**: **Retail Multi-Agent Solution**  
- **Multi-Serviço Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Por Nível de Complexidade  
- **Iniciante**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermédio**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing  
- **Avançado**: ML Pipeline  
- **Pronto para Produção Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-serviço com enfileiramento de mensagens), **Retail Multi-Agent Solution** (Sistema multi-agente completo com implantação por template ARM)  

## 📚 Recursos Adicionais  

### Links de Documentação  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Documentação Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Exemplos da Comunidade  
- [Modelos AZD de Exemplos Azure](https://github.com/Azure-Samples/azd-templates)
- [Modelos Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galeria Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Aplicação Todo com C# e Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Aplicação Todo com Python e MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplicação Todo com Node.js e PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicação Web React com API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions com Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Melhores Práticas
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuir com Exemplos

Tem um exemplo útil para partilhar? Agradecemos contribuições!

### Diretrizes para Submissão
1. Siga a estrutura de diretórios estabelecida
2. Inclua um README.md completo
3. Adicione comentários aos ficheiros de configuração
4. Teste cuidadosamente antes de submeter
5. Inclua estimativas de custo e pré-requisitos

### Estrutura de Modelo de Exemplo
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

**Dica Profissional**: Comece com o exemplo mais simples que corresponda à sua stack tecnológica e, gradualmente, avance para cenários mais complexos. Cada exemplo baseia-se nos conceitos dos anteriores!

## 🚀 Pronto para Começar?

### O Seu Percurso de Aprendizagem

1. **Totalmente Iniciante?** → Comece com [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minutos)
2. **Conhecimento Básico de AZD?** → Experimente [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minutos)
3. **A Construir Apps de IA?** → Comece com [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minutos) ou explore [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, mais de 2 horas)
4. **Precisa de Stack Tecnológica Específica?** → Use a secção [Encontrar o Exemplo Certo](#-finding-the-right-example) acima

### Próximos Passos

- ✅ Reveja os [Pré-requisitos](#pré-requisitos) acima
- ✅ Escolha um exemplo que corresponda ao seu nível de habilidade (veja a [Legenda de Complexidade](#legenda-de-nível-de-complexidade))
- ✅ Leia atentamente o README do exemplo antes de fazer o deploy
- ✅ Defina um lembrete para correr `azd down` após os testes
- ✅ Partilhe a sua experiência através dos Issues ou Discussões no GitHub

### Precisa de Ajuda?

- 📖 [FAQ](../resources/faq.md) - Perguntas frequentes respondidas
- 🐛 [Guia de Resolução de Problemas](../docs/chapter-07-troubleshooting/common-issues.md) - Corrija problemas de deploy
- 💬 [Discussões no GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Pergunte à comunidade
- 📚 [Guia de Estudo](../resources/study-guide.md) - Reforce o seu aprendizado

---

**Navegação**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Materiais de Estudo**: [Guia de Estudo](../resources/study-guide.md) | [Resumo Rápido](../resources/cheat-sheet.md) | [Glossário](../resources/glossary.md)
- **🔧 Recursos**: [FAQ](../resources/faq.md) | [Resolução de Problemas](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Última Atualização: novembro de 2025 | [Reportar Problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuir com Exemplos](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original, na sua língua nativa, deve ser considerado a fonte autorizada. Para informação crítica, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->