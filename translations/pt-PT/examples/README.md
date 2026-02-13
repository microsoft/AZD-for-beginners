# Exemplos - Modelos e Configurações Práticos do AZD

**Aprender por Exemplo - Organizado por Capítulo**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Mapeamento dos Capítulos**: Exemplos organizados por complexidade de aprendizagem
- **🚀 Exemplo Local**: [Solução Multi-Agente no Retalho](retail-scenario.md)
- **🤖 Exemplos de IA Externos**: Ligações para repositórios Azure Samples

> **📍 IMPORTANTE: Exemplos Locais vs Externos**  
> Este repositório contém **4 exemplos locais completos** com implementações totais:  
> - **Azure OpenAI Chat** (deploy GPT-4 com interface de chat)  
> - **Container Apps** (API Flask simples + microsserviços)  
> - **Aplicação de Base de Dados** (Web + Base de Dados SQL)  
> - **Retalho Multi-Agente** (Solução empresarial de IA)  
>  
> Exemplos adicionais são **referências externas** para repositórios Azure-Samples que pode clonar.

## Introdução

Este diretório fornece exemplos práticos e referências para ajudar a aprender Azure Developer CLI através de prática direta. O cenário Retail Multi-Agent é uma implementação completa e pronta para produção incluída neste repositório. Exemplos adicionais fazem referência a Azure Samples oficiais que demonstram vários padrões AZD.

### Legenda de Nível de Complexidade

- ⭐ **Iniciante** - Conceitos básicos, serviço único, 15-30 minutos
- ⭐⭐ **Intermédio** - Múltiplos serviços, integração de base de dados, 30-60 minutos
- ⭐⭐⭐ **Avançado** - Arquitetura complexa, integração de IA, 1-2 horas
- ⭐⭐⭐⭐ **Especialista** - Pronto para produção, padrões empresariais, 2+ horas

## 🎯 O Que Está Realmente Neste Repositório

### ✅ Implementação Local (Pronta a Usar)

#### [Aplicação Azure OpenAI Chat](azure-openai-chat/README.md) 🆕
**Deploy completo GPT-4 com interface de chat incluída neste repositório**

- **Localização:** `examples/azure-openai-chat/`
- **Complexidade:** ⭐⭐ (Intermédio)
- **Inclui:**
  - Deploy completo do Azure OpenAI (GPT-4)
  - Interface de chat em linha de comandos Python
  - Integração com Key Vault para chaves API seguras
  - Templates Bicep para infraestrutura
  - Monitorização de uso de tokens e custos
  - Limitação de taxa e tratamento de erros

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

**Tecnologias:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Exemplos Container App](container-app/README.md) 🆕
**Exemplos abrangentes de deployment de contentores incluídos neste repositório**

- **Localização:** `examples/container-app/`
- **Complexidade:** ⭐-⭐⭐⭐⭐ (Iniciante a Avançado)
- **Inclui:**
  - [Guia Mestre](container-app/README.md) - Vista geral completa dos deployments de contentores
  - [API Flask Simples](../../../examples/container-app/simple-flask-api) - Exemplo básico REST API
  - [Arquitetura de Microsserviços](../../../examples/container-app/microservices) - Deploy multi-serviço pronto para produção
  - Padrões de Início Rápido, Produção e Avançados
  - Monitorização, segurança e otimização de custos

**Início Rápido:**
```bash
# Ver guia principal
cd examples/container-app

# Implementar API simples Flask
cd simple-flask-api
azd up

# Implementar exemplo de microsserviços
cd ../microservices
azd up
```

**Tecnologias:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solução Retail Multi-Agente](retail-scenario.md) 🆕
**Implementação completa e pronta para produção incluída neste repositório**

- **Localização:** `examples/retail-multiagent-arm-template/`
- **Complexidade:** ⭐⭐⭐⭐ (Avançado)
- **Inclui:**
  - Template completo de deployment ARM
  - Arquitetura multi-agente (Cliente + Inventário)
  - Integração Azure OpenAI
  - Pesquisa AI com RAG
  - Monitorização abrangente
  - Script de deployment com um clique

**Início Rápido:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tecnologias:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Azure Samples Externos (Clonar para Usar)

Os exemplos seguintes são mantidos em repositórios oficiais Azure-Samples. Clone-os para explorar diferentes padrões AZD:

### Aplicações Simples (Capítulos 1-2)

| Template | Repositório | Complexidade | Serviços |
|:---------|:-----------|:-----------|:---------|
| **API Python Flask** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microsserviços** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-serviço, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Contentor Python Flask** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Como usar:**
```bash
# Clonar qualquer exemplo
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Implantar
azd up
```

### Exemplos de Aplicações de IA (Capítulos 2, 5, 8)

| Template | Repositório | Complexidade | Foco |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Deploy GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat AI básico |
| **Agentes de IA** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework de agentes |
| **Demo Search + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Padrão RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA empresarial |

### Base de Dados & Padrões Avançados (Capítulos 3-8)

| Template | Repositório | Complexidade | Foco |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integração base dados |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverless NoSQL |
| **Microsserviços Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-serviço |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objetivos de Aprendizagem

Ao trabalhar estes exemplos, irá:
- Praticar workflows Azure Developer CLI com cenários realistas de aplicação
- Compreender diferentes arquiteturas de aplicação e suas implementações azd
- Dominar padrões de Infraestrutura como Código para vários serviços Azure
- Aplicar gestão de configuração e estratégias de deployment específicas para ambiente
- Implementar monitorização, segurança e padrões de escalabilidade em contextos práticos
- Ganhar experiência em resolução de problemas e debugging de deployments reais

## Resultados de Aprendizagem

Após completar estes exemplos, será capaz de:
- Fazer deployment de vários tipos de aplicações usando Azure Developer CLI com confiança
- Adaptar templates fornecidos aos seus próprios requisitos de aplicação
- Projetar e implementar padrões de infraestrutura personalizados usando Bicep
- Configurar aplicações multi-serviço complexas com dependências corretas
- Aplicar boas práticas de segurança, monitorização e performance em cenários reais
- Diagnosticar e otimizar deployments com base na experiência prática

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

> **💡 Novo no AZD?** Comece com o exemplo #1 (API Flask) - demora cerca de 20 minutos e ensina conceitos essenciais.

### Para Iniciantes
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Faça deploy de uma API REST simples com escala para zero  
   **Tempo:** 20-25 minutos | **Custo:** 0-5$/mês  
   **Vai aprender:** Workflow básico azd, contentorização, probes de saúde  
   **Resultado esperado:** Endpoint API funcional a devolver "Hello, World!" com monitorização

2. **[Aplicação Web Simples - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Deploy de aplicação web Node.js Express com MongoDB  
   **Tempo:** 25-35 minutos | **Custo:** 10-30$/mês  
   **Vai aprender:** Integração de base de dados, variáveis de ambiente, strings de conexão  
   **Resultado esperado:** App de lista de tarefas com criar/ler/atualizar/eliminar funcionalidades

3. **[Website Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hospedagem de site React estático com Azure Static Web Apps  
   **Tempo:** 20-30 minutos | **Custo:** 0-10$/mês  
   **Vai aprender:** Hosting estático, funções serverless, deployment CDN  
   **Resultado esperado:** UI React com backend API, SSL automático, CDN global

### Para Utilizadores Intermédios
4. **[Aplicação Azure OpenAI Chat](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Deploy GPT-4 com interface de chat e gestão segura de chave API  
   **Tempo:** 35-45 minutos | **Custo:** 50-200$/mês  
   **Vai aprender:** Deploy Azure OpenAI, integração Key Vault, monitorização de tokens  
   **Resultado esperado:** Aplicação de chat funcional com GPT-4 e monitorização de custos

5. **[Container App - Microsserviços](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arquitetura multi-serviço pronta para produção  
   **Tempo:** 45-60 minutos | **Custo:** 50-150$/mês  
   **Vai aprender:** Comunicação de serviços, enfileiramento de mensagens, tracing distribuído  
   **Resultado esperado:** Sistema com 2 serviços (API Gateway + Serviço Produto) com monitorização

6. **[Aplicação Base de Dados - C# com Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicação web com API C# e Azure SQL Database  
   **Tempo:** 30-45 minutos | **Custo:** 20-80$/mês  
   **Vai aprender:** Entity Framework, migrations da base dados, segurança de conexão  
   **Resultado esperado:** API C# com backend Azure SQL, deployment automático de esquema

7. **[Função Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Azure Functions Python com triggers HTTP e Cosmos DB  
   **Tempo:** 30-40 minutos | **Custo:** 10-40$/mês  
   **Vai aprender:** Arquitectura orientada por eventos, scale serverless, integração NoSQL  
   **Resultado esperado:** App função respondendo a pedidos HTTP com armazenamento Cosmos DB

8. **[Microsserviços - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicação multi-serviço Java com Container Apps e gateway API  
   **Tempo:** 60-90 minutos | **Custo:** 80-200$/mês  
   **Vai aprender:** Deploy Spring Boot, malha de serviço, balanceamento de carga  
   **Resultado esperado:** Sistema multi-serviço Java com descoberta e roteamento de serviços

### Modelos Microsoft Foundry

1. **[Azure OpenAI Chat App - Exemplo Local](../../../examples/azure-openai-chat)** ⭐⭐  
   Deploy completo GPT-4 com interface de chat  
   **Tempo:** 35-45 minutos | **Custo:** 50-200$/mês  
   **Resultado esperado:** App chat funcional com monitorização de tokens e custos

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicação inteligente de chat com arquitetura RAG  
   **Tempo:** 60-90 minutos | **Custo:** 100-300$/mês  
   **Resultado esperado:** Interface de chat com RAG, pesquisa de documentos e citações

3. **[Processamento de Documentos IA](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Análise de documentos usando serviços Azure AI  
   **Tempo:** 40-60 minutos | **Custo:** 20-80$/mês  
   **Resultado esperado:** API a extrair texto, tabelas e entidades de documentos carregados

4. **[Pipeline Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Workflow MLOps com Azure Machine Learning  
   **Tempo:** 2-3 horas | **Custo:** 150-500$/mês  
   **Resultado esperado:** Pipeline ML automatizado com treino, deployment e monitorização

### Cenários Reais

#### **Solução Retail Multi-Agente** 🆕
**[Guia Completo de Implementação](./retail-scenario.md)**

Solução abrangente, pronta para produção, de suporte multi-agente ao cliente que demonstra deployment de aplicação IA de nível empresarial com AZD. Este cenário fornece:

- **Arquitetura Completa**: Sistema multi-agente com agentes especializados em serviço ao cliente e gestão de inventário
- **Infraestrutura de Produção**: Implantações Azure OpenAI multi-região, AI Search, Container Apps, e monitorização abrangente  
- **Template ARM Pronto a Implementar**: Implantação com um clique com múltiplos modos de configuração (Minimal/Standard/Premium)  
- **Funcionalidades Avançadas**: Validação de segurança red teaming, framework de avaliação de agentes, otimização de custos, e guias de resolução de problemas  
- **Contexto Real de Negócio**: Caso de uso de suporte ao cliente em retalho com upload de ficheiros, integração de pesquisa, e escalonamento dinâmico  

**Tecnologias**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complexidade**: ⭐⭐⭐⭐ (Avançado - Pronto para Produção Empresarial)  

**Perfeito para**: Desenvolvedores de IA, arquitetos de soluções, e equipas a construir sistemas multi-agentes de produção  

**Início Rápido**: Implemente a solução completa em menos de 30 minutos usando o template ARM incluído com `./deploy.sh -g myResourceGroup`  

## 📋 Instruções de Uso  

### Pré-requisitos  

Antes de executar qualquer exemplo:  
- ✅ Subscrição Azure com acesso Owner ou Contributor  
- ✅ Azure Developer CLI instalado ([Guia de Instalação](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop a correr (para exemplos com containers)  
- ✅ Quotas Azure adequadas (verifique os requisitos específicos de cada exemplo)  

> **💰 Aviso de Custos:** Todos os exemplos criam recursos Azure reais que geram custos. Veja os ficheiros README individuais para estimativas de custos. Lembre-se de executar `azd down` quando terminar para evitar custos contínuos.  

### Executar Exemplos Localmente  

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
  
4. **Implantar**  
   ```bash
   # Desplegar infraestrutura e aplicação
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
   - ✅ `azd up` conclui sem erros  
   - ✅ Endpoint do serviço retorna HTTP 200  
   - ✅ Portal Azure mostra estado "Running"  
   - ✅ Application Insights a receber telemetria  

> **⚠️ Problemas?** Veja [Problemas Comuns](../docs/chapter-07-troubleshooting/common-issues.md) para ajuda na resolução de problemas de implantação  

### Adaptar Exemplos  

Cada exemplo inclui:  
- **README.md** - Instruções detalhadas de configuração e personalização  
- **azure.yaml** - Configuração AZD com comentários  
- **infra/** - Templates Bicep com explicações dos parâmetros  
- **src/** - Código de exemplo da aplicação  
- **scripts/** - Scripts auxiliares para tarefas comuns  

## 🎯 Objetivos de Aprendizagem  

### Categorias de Exemplo  

#### **Implantações Básicas**  
- Aplicações single-service  
- Padrões de infraestrutura simples  
- Gestão básica de configuração  
- Configurações económicas para desenvolvimento  

#### **Cenários Avançados**  
- Arquiteturas multi-service  
- Configurações complexas de rede  
- Padrões de integração de base de dados  
- Implementações de segurança e conformidade  

#### **Padrões Prontos para Produção**  
- Configurações de alta disponibilidade  
- Monitorização e observabilidade  
- Integração CI/CD  
- Configurações de recuperação de desastre  

## 📖 Descrições dos Exemplos  

### App Web Simples - Node.js Express  
**Tecnologias**: Node.js, Express, MongoDB, Container Apps  
**Complexidade**: Iniciante  
**Conceitos**: Implantação básica, API REST, integração de base de dados NoSQL  

### Website Estático - React SPA  
**Tecnologias**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexidade**: Iniciante  
**Conceitos**: Hosting estático, backend serverless, desenvolvimento web moderno  

### Container App - Python Flask  
**Tecnologias**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexidade**: Iniciante  
**Conceitos**: Containerização, API REST, scale-to-zero, sondas de saúde, monitorização  
**Localização**: [Exemplo Local](../../../examples/container-app/simple-flask-api)  

### Container App - Arquitetura Microserviços  
**Tecnologias**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexidade**: Avançado  
**Conceitos**: Arquitetura multi-service, comunicação entre serviços, enfileiramento de mensagens, rastreio distribuído  
**Localização**: [Exemplo Local](../../../examples/container-app/microservices)  

### App Base de Dados - C# com Azure SQL  
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

#### Azure OpenAI Chat App  
**Tecnologias**: Azure OpenAI, Cognitive Search, App Service  
**Complexidade**: Intermédio  
**Conceitos**: Arquitetura RAG, pesquisa vetorial, integração LLM  

#### Processamento de Documentos AI  
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
- Configurações para ambiente de desenvolvimento  
- Configurações para ambiente de staging  
- Configurações prontas para produção  
- Implantações multi-região  

### Módulos Bicep  
- Componentes de infraestrutura reutilizáveis  
- Padrões comuns de recursos  
- Templates reforçados para segurança  
- Configurações otimizadas para custos  

### Scripts Auxiliares  
- Automação da configuração do ambiente  
- Scripts para migração de base de dados  
- Ferramentas de validação de implantação  
- Utilitários de monitorização de custos  

## 🔧 Guia de Personalização  

### Adaptar Exemplos ao Seu Caso de Uso  

1. **Rever Pré-requisitos**  
   - Verificar requisitos dos serviços Azure  
   - Confirmar limites da subscrição  
   - Compreender implicações de custo  

2. **Modificar Configuração**  
   - Atualizar definições de serviços em `azure.yaml`  
   - Personalizar templates Bicep  
   - Ajustar variáveis de ambiente  

3. **Testar Exaustivamente**  
   - Implantar primeiro no ambiente de desenvolvimento  
   - Validar funcionalidade  
   - Testar escalabilidade e desempenho  

4. **Revisão de Segurança**  
   - Rever controlos de acesso  
   - Implementar gestão de segredos  
   - Ativar monitorização e alertas  

## 📊 Matriz de Comparação  

| Exemplo                      | Serviços | Base de Dados | Autenticação | Monitorização | Complexidade          |  
|-----------------------------|----------|--------------|--------------|---------------|----------------------|  
| **Azure OpenAI Chat** (Local)      | 2        | ❌           | Key Vault    | Completa      | ⭐⭐                   |  
| **Python Flask API** (Local)       | 1        | ❌           | Básica       | Completa      | ⭐                    |  
| **Microserviços** (Local)           | 5+       | ✅           | Empresarial  | Avançada      | ⭐⭐⭐⭐                 |  
| Node.js Express Todo                | 2        | ✅           | Básica       | Básica       | ⭐                    |  
| React SPA + Functions               | 3        | ✅           | Básica       | Completa      | ⭐                    |  
| Python Flask Container              | 2        | ❌           | Básica       | Completa      | ⭐                    |  
| C# Web API + SQL                   | 2        | ✅           | Completa     | Completa      | ⭐⭐                   |  
| Python Functions + SPA             | 3        | ✅           | Completa     | Completa      | ⭐⭐                   |  
| Java Microserviços                 | 5+       | ✅           | Completa     | Completa      | ⭐⭐                   |  
| Azure OpenAI Chat                 | 3        | ✅           | Completa     | Completa      | ⭐⭐⭐                  |  
| Processamento AI Documentos        | 2        | ❌           | Básica       | Completa      | ⭐⭐                   |  
| Pipeline ML                      | 4+       | ✅           | Completa     | Completa      | ⭐⭐⭐⭐                 |  
| **Retail Multi-Agent** (Local)       | **8+**   | **✅**       | **Empresarial** | **Avançada**  | **⭐⭐⭐⭐**              |  

## 🎓 Caminho de Aprendizagem  

### Progressão Recomendada  

1. **Começar com App Web Simples**  
   - Aprender conceitos básicos AZD  
   - Compreender workflow de implantação  
   - Praticar gestão de ambiente  

2. **Experimentar Website Estático**  
   - Explorar opções de hosting  
   - Aprender sobre integração CDN  
   - Compreender configuração de DNS  

3. **Passar para Container App**  
   - Aprender fundamentos da containerização  
   - Compreender conceitos de escalonamento  
   - Praticar com Docker  

4. **Adicionar Integração de Base de Dados**  
   - Aprender provisão de base de dados  
   - Compreender strings de ligação  
   - Praticar gestão de segredos  

5. **Explorar Serverless**  
   - Compreender arquitetura orientada a eventos  
   - Aprender sobre triggers e bindings  
   - Praticar com APIs  

6. **Construir Microserviços**  
   - Aprender comunicação entre serviços  
   - Compreender sistemas distribuídos  
   - Praticar implantações complexas  

## 🔍 Encontrar o Exemplo Certo  

### Por Stack Tecnológico  
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microserviços (Local)](../../../examples/container-app/microservices), Java Microserviços  
- **Node.js**: Node.js Express Todo App, [Microserviços API Gateway (Local)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microserviços Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microserviços Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Microserviços User Service (Local)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microserviços  
- **React**: React SPA + Functions  
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microserviços (Local)](../../../examples/container-app/microservices), Java Microserviços  
- **Bases de Dados**: [Microserviços (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, Processamento AI Documentos, ML Pipeline, **Solução Multi-Agente Retalho**  
- **Sistemas Multi-Agente**: **Solução Multi-Agente Retalho**  
- **Integração OpenAI**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Solução Multi-Agente Retalho  
- **Produção Empresarial**: [Microserviços (Local)](../../../examples/container-app/microservices), **Solução Multi-Agente Retalho**  

### Por Padrão Arquitetural  
- **API REST Simples**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolítico**: Node.js Express Todo, C# Web API + SQL  
- **Estático + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microserviços**: [Microserviços Produção (Local)](../../../examples/container-app/microservices), Java Spring Boot Microserviços  
- **Containerizado**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microserviços (Local)](../../../examples/container-app/microservices)  
- **Potenciado por IA**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, Processamento AI Documentos, ML Pipeline, **Solução Multi-Agente Retalho**  
- **Arquitetura Multi-Agente**: **Solução Multi-Agente Retalho**  
- **Multi-Service Empresarial**: [Microserviços (Local)](../../../examples/container-app/microservices), **Solução Multi-Agente Retalho**  

### Por Nível de Complexidade  
- **Iniciante**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermédio**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microserviços, Azure OpenAI Chat App, Processamento AI Documentos  
- **Avançado**: ML Pipeline  
- **Pronto para Produção Empresarial**: [Microserviços (Local)](../../../examples/container-app/microservices) (Multi-service com enfileiramento de mensagens), **Solução Multi-Agente Retalho** (Sistema multi-agente completo com template ARM)  

## 📚 Recursos Adicionais  

### Links de Documentação  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Documentação Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Exemplos da Comunidade  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Galeria Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [App Todo com C# e Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [App Todo com Python e MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [App de Tarefas com Node.js e PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [App Web React com API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
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
4. Teste exaustivamente antes de submeter
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

**Dica Profissional**: Comece com o exemplo mais simples que corresponda ao seu stack tecnológico e vá avançando gradualmente para cenários mais complexos. Cada exemplo baseia-se nos conceitos dos anteriores!

## 🚀 Pronto para Começar?

### O Seu Caminho de Aprendizagem

1. **Complete Iniciante?** → Comece com [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **Tem Conhecimentos Básicos de AZD?** → Experimente [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **A Construir Apps AI?** → Comece com [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) ou explore [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ horas)
4. **Precisa de Stack Tecnológico Específico?** → Use a secção [Encontrar o Exemplo Certo](../../../examples) acima

### Próximos Passos

- ✅ Revise os [Pré-requisitos](../../../examples) acima
- ✅ Escolha um exemplo adequado ao seu nível de competência (veja a [Legenda de Complexidade](../../../examples))
- ✅ Leia atentamente o README do exemplo antes de fazer o deployment
- ✅ Defina um lembrete para executar `azd down` após os testes
- ✅ Partilhe a sua experiência via GitHub Issues ou Discussions

### Precisa de Ajuda?

- 📖 [FAQ](../resources/faq.md) - Perguntas frequentes respondidas
- 🐛 [Guia de Resolução de Problemas](../docs/chapter-07-troubleshooting/common-issues.md) - Corrija problemas de deployment
- 💬 [Discussões no GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Pergunte à comunidade
- 📚 [Guia de Estudo](../resources/study-guide.md) - Reforce o seu aprendizado

---

**Navegação**
- **📚 Início do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Materiais de Estudo**: [Guia de Estudo](../resources/study-guide.md) | [Resumo](../resources/cheat-sheet.md) | [Glossário](../resources/glossary.md)
- **🔧 Recursos**: [FAQ](../resources/faq.md) | [Resolução de Problemas](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Última Atualização: Novembro 2025 | [Reportar Problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuir com Exemplos](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor tenha em conta que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->