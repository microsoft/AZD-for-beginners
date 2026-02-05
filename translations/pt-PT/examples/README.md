# Exemplos - Modelos e Configurações Práticas do AZD

**Aprender com Exemplos - Organizado por Capítulo**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Mapeamento de Capítulos**: Exemplos organizados por complexidade de aprendizado
- **🚀 Exemplo Local**: [Solução de Varejo Multi-Agente](retail-scenario.md)
- **🤖 Exemplos Externos de IA**: Links para repositórios de Exemplos Azure

> **📍 IMPORTANTE: Exemplos Locais vs Externos**  
> Este repositório contém **4 exemplos locais completos** com implementações completas:  
> - **Azure OpenAI Chat** (Implantação GPT-4 com interface de chat)  
> - **Container Apps** (API Flask Simples + Microsserviços)  
> - **Aplicação de Base de Dados** (Web + Base de Dados SQL)  
> - **Varejo Multi-Agente** (Solução de IA Empresarial)  
>  
> Exemplos adicionais são **referências externas** para repositórios Azure-Samples que você pode clonar.

## Introdução

Este diretório fornece exemplos práticos e referências para ajudar você a aprender CLI do Desenvolvedor Azure através de prática prática. O cenário de Varejo Multi-Agente é uma implementação completa e pronta para produção incluída neste repositório. Exemplos adicionais referenciam Exemplos Oficiais Azure que demonstram vários padrões AZD.

### Legenda de Classificação de Complexidade

- ⭐ **Iniciante** - Conceitos básicos, serviço único, 15-30 minutos
- ⭐⭐ **Intermediário** - Múltiplos serviços, integração de base de dados, 30-60 minutos
- ⭐⭐⭐ **Avançado** - Arquitetura complexa, integração de IA, 1-2 horas
- ⭐⭐⭐⭐ **Especialista** - Pronto para produção, padrões empresariais, 2+ horas

## 🎯 O Que Realmente Está Neste Repositório

### ✅ Implementação Local (Pronta para Uso)

#### [Aplicação de Chat Azure OpenAI](azure-openai-chat/README.md) 🆕
**Implantação completa do GPT-4 com interface de chat incluída neste repositório**

- **Localização:** `examples/azure-openai-chat/`
- **Complexidade:** ⭐⭐ (Intermediário)
- **O Que Está Incluído:**
  - Implantação completa do Azure OpenAI (GPT-4)
  - Interface de chat em linha de comando Python
  - Integração com Key Vault para chaves de API seguras
  - Modelos de infraestrutura Bicep
  - Rastreamento de uso de tokens e custos
  - Limitação de taxa e tratamento de erros

**Início Rápido:**
```bash
# Navegar para o exemplo
cd examples/azure-openai-chat

# Implementar tudo
azd up

# Instalar dependências e começar a conversar
pip install -r src/requirements.txt
python src/chat.py
```

**Tecnologias:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Exemplos de Aplicações em Container](container-app/README.md) 🆕
**Exemplos abrangentes de implantação de containers incluídos neste repositório**

- **Localização:** `examples/container-app/`
- **Complexidade:** ⭐-⭐⭐⭐⭐ (Iniciante a Avançado)
- **O Que Está Incluído:**
  - [Guia Mestre](container-app/README.md) - Visão geral completa das implantações de containers
  - [API Flask Simples](../../../examples/container-app/simple-flask-api) - Exemplo básico de API REST
  - [Arquitetura de Microsserviços](../../../examples/container-app/microservices) - Implantação multi-serviço pronta para produção
  - Padrões de Início Rápido, Produção e Avançados
  - Monitoramento, segurança e otimização de custos

**Início Rápido:**
```bash
# Ver guia principal
cd examples/container-app

# Implementar API Flask simples
cd simple-flask-api
azd up

# Implementar exemplo de microsserviços
cd ../microservices
azd up
```

**Tecnologias:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solução de Varejo Multi-Agente](retail-scenario.md) 🆕
**Implementação completa e pronta para produção incluída neste repositório**

- **Localização:** `examples/retail-multiagent-arm-template/`
- **Complexidade:** ⭐⭐⭐⭐ (Avançado)
- **O Que Está Incluído:**
  - Modelo completo de implantação ARM
  - Arquitetura multi-agente (Cliente + Inventário)
  - Integração Azure OpenAI
  - Pesquisa de IA com RAG
  - Monitoramento abrangente
  - Script de implantação com um clique

**Início Rápido:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tecnologias:** Azure OpenAI, Pesquisa de IA, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Exemplos Externos Azure Samples (Clonar para Usar)

Os seguintes exemplos são mantidos em repositórios oficiais Azure-Samples. Clone-os para explorar diferentes padrões AZD:

### Aplicações Simples (Capítulos 1-2)

| Modelo | Repositório | Complexidade | Serviços |
|:-------|:------------|:-------------|:---------|
| **API Flask Python** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microsserviços** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-serviço, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Container Flask Python** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Como usar:**
```bash
# Clonar qualquer exemplo
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Implementar
azd up
```

### Exemplos de Aplicações de IA (Capítulos 2, 5, 8)

| Modelo | Repositório | Complexidade | Foco |
|:-------|:------------|:-------------|:-----|
| **Azure OpenAI Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Implantação GPT-4 |
| **Início Rápido de Chat IA** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat IA básico |
| **Agentes de IA** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework de agentes |
| **Demo de Pesquisa + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Padrão RAG |
| **Chat Contoso** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA Empresarial |

### Base de Dados & Padrões Avançados (Capítulos 3-8)

| Modelo | Repositório | Complexidade | Foco |
|:-------|:------------|:-------------|:-----|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integração de base de dados |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Microsserviços Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-serviço |
| **Pipeline de ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objetivos de Aprendizado

Ao trabalhar com esses exemplos, você irá:
- Praticar fluxos de trabalho CLI do Desenvolvedor Azure com cenários de aplicação realistas
- Compreender diferentes arquiteturas de aplicação e suas implementações azd
- Dominar padrões de Infraestrutura como Código para vários serviços Azure
- Aplicar gestão de configuração e estratégias de implantação específicas para ambientes
- Implementar padrões de monitoramento, segurança e escalabilidade em contextos práticos
- Ganhar experiência com solução de problemas e depuração de cenários reais de implantação

## Resultados de Aprendizado

Ao concluir esses exemplos, você será capaz de:
- Implantar vários tipos de aplicação usando CLI do Desenvolvedor Azure com confiança
- Adaptar os modelos fornecidos às suas próprias necessidades de aplicação
- Projetar e implementar padrões de infraestrutura personalizados usando Bicep
- Configurar aplicações complexas multi-serviço com dependências adequadas
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

> **💡 Novo no AZD?** Comece com o exemplo #1 (API Flask) - leva ~20 minutos e ensina conceitos principais.

### Para Iniciantes
1. **[Aplicação em Container - API Flask Python](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Implante uma API REST simples com escala para zero  
   **Tempo:** 20-25 minutos | **Custo:** $0-5/mês  
   **Você Aprenderá:** Fluxo de trabalho básico azd, conteinerização, sondas de saúde  
   **Resultado Esperado:** Endpoint de API funcional retornando "Hello, World!" com monitoramento

2. **[Aplicação Web Simples - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implante uma aplicação web Node.js Express com MongoDB  
   **Tempo:** 25-35 minutos | **Custo:** $10-30/mês  
   **Você Aprenderá:** Integração de base de dados, variáveis de ambiente, strings de conexão  
   **Resultado Esperado:** Aplicação de lista de tarefas com funcionalidade de criar/ler/atualizar/excluir

3. **[Website Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hospede um website estático React com Azure Static Web Apps  
   **Tempo:** 20-30 minutos | **Custo:** $0-10/mês  
   **Você Aprenderá:** Hospedagem estática, funções serverless, implantação de CDN  
   **Resultado Esperado:** UI React com backend API, SSL automático, CDN global

### Para Usuários Intermediários
4. **[Aplicação de Chat Azure OpenAI](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Implante GPT-4 com interface de chat e gestão segura de chaves de API  
   **Tempo:** 35-45 minutos | **Custo:** $50-200/mês  
   **Você Aprenderá:** Implantação Azure OpenAI, integração Key Vault, rastreamento de tokens  
   **Resultado Esperado:** Aplicação de chat funcional com GPT-4 e monitoramento de custos

5. **[Aplicação em Container - Microsserviços](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arquitetura multi-serviço pronta para produção  
   **Tempo:** 45-60 minutos | **Custo:** $50-150/mês  
   **Você Aprenderá:** Comunicação entre serviços, filas de mensagens, rastreamento distribuído  
   **Resultado Esperado:** Sistema de 2 serviços (API Gateway + Serviço de Produtos) com monitoramento

6. **[Aplicação de Base de Dados - C# com Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicação web com API C# e Base de Dados Azure SQL  
   **Tempo:** 30-45 minutos | **Custo:** $20-80/mês  
   **Você Aprenderá:** Entity Framework, migrações de base de dados, segurança de conexão  
   **Resultado Esperado:** API C# com backend Azure SQL, implantação automática de esquema

7. **[Função Serverless - Funções Azure Python](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Funções Azure Python com gatilhos HTTP e Cosmos DB  
   **Tempo:** 30-40 minutos | **Custo:** $10-40/mês  
   **Você Aprenderá:** Arquitetura orientada a eventos, escalabilidade serverless, integração NoSQL  
   **Resultado Esperado:** Aplicação de função respondendo a solicitações HTTP com armazenamento Cosmos DB

8. **[Microsserviços - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicação Java multi-serviço com Container Apps e gateway de API  
   **Tempo:** 60-90 minutos | **Custo:** $80-200/mês  
   **Você Aprenderá:** Implantação Spring Boot, malha de serviços, balanceamento de carga  
   **Resultado Esperado:** Sistema Java multi-serviço com descoberta de serviços e roteamento

### Modelos de Fundição Azure AI

1. **[Aplicação de Chat Azure OpenAI - Exemplo Local](../../../examples/azure-openai-chat)** ⭐⭐  
   Implantação completa do GPT-4 com interface de chat  
   **Tempo:** 35-45 minutos | **Custo:** $50-200/mês  
   **Resultado Esperado:** Aplicação de chat funcional com rastreamento de tokens e monitoramento de custos

2. **[Demo de Pesquisa Azure + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicação de chat inteligente com arquitetura RAG  
   **Tempo:** 60-90 minutos | **Custo:** $100-300/mês  
   **Resultado Esperado:** Interface de chat com RAG alimentada por pesquisa de documentos e citações

3. **[Processamento de Documentos IA](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Análise de documentos usando serviços Azure AI  
   **Tempo:** 40-60 minutos | **Custo:** $20-80/mês  
   **Resultado Esperado:** API extraindo texto, tabelas e entidades de documentos carregados

4. **[Pipeline de Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Fluxo de trabalho MLOps com Azure Machine Learning  
   **Tempo:** 2-3 horas | **Custo:** $150-500/mês  
   **Resultado Esperado:** Pipeline ML automatizado com treinamento, implantação e monitoramento

### Cenários do Mundo Real

#### **Solução de Varejo Multi-Agente** 🆕
**[Guia Completo de Implementação](./retail-scenario.md)**

Uma solução abrangente e pronta para produção de suporte ao cliente multi-agente que demonstra implantação de aplicação de IA de nível empresarial com AZD. Este cenário fornece:

- **Arquitetura Completa**: Sistema multi-agente com agentes especializados em atendimento ao cliente e gestão de inventário
- **Infraestrutura de Produção**: Implementações do Azure OpenAI em várias regiões, Pesquisa AI, Container Apps e monitorização abrangente  
- **Modelo ARM Pronto para Implementação**: Implementação com um clique e vários modos de configuração (Minimal/Standard/Premium)  
- **Funcionalidades Avançadas**: Validação de segurança com red teaming, framework de avaliação de agentes, otimização de custos e guias de resolução de problemas  
- **Contexto Real de Negócio**: Caso de uso de suporte ao cliente para retalhistas com upload de ficheiros, integração de pesquisa e escalabilidade dinâmica  

**Tecnologias**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complexidade**: ⭐⭐⭐⭐ (Avançado - Pronto para Produção Empresarial)  

**Ideal para**: Desenvolvedores de IA, arquitetos de soluções e equipas que constroem sistemas multi-agentes de produção  

**Início Rápido**: Implemente a solução completa em menos de 30 minutos usando o modelo ARM incluído com `./deploy.sh -g myResourceGroup`  

## 📋 Instruções de Utilização  

### Pré-requisitos  

Antes de executar qualquer exemplo:  
- ✅ Subscrição Azure com acesso de Proprietário ou Contribuidor  
- ✅ CLI do Azure Developer instalada ([Guia de Instalação](../docs/getting-started/installation.md))  
- ✅ Docker Desktop em execução (para exemplos de containers)  
- ✅ Quotas adequadas do Azure (ver requisitos específicos de cada exemplo)  

> **💰 Aviso de Custos:** Todos os exemplos criam recursos reais no Azure que geram custos. Consulte os ficheiros README individuais para estimativas de custos. Lembre-se de executar `azd down` ao terminar para evitar custos contínuos.  

### Executar Exemplos Localmente  

1. **Clonar ou Copiar Exemplo**  
   ```bash
   # Navegar para o exemplo desejado
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
  
4. **Implementar**  
   ```bash
   # Implementar infraestrutura e aplicação
   azd up
   ```
  
5. **Verificar Implementação**  
   ```bash
   # Obter os endpoints do serviço
   azd env get-values
   
   # Testar o endpoint (exemplo)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Indicadores de Sucesso Esperados:**  
   - ✅ `azd up` concluído sem erros  
   - ✅ Endpoint do serviço retorna HTTP 200  
   - ✅ Portal Azure mostra status "Running"  
   - ✅ Application Insights recebendo telemetria  

> **⚠️ Problemas?** Consulte [Problemas Comuns](../docs/troubleshooting/common-issues.md) para resolução de problemas de implementação  

### Adaptar Exemplos  

Cada exemplo inclui:  
- **README.md** - Instruções detalhadas de configuração e personalização  
- **azure.yaml** - Configuração AZD com comentários  
- **infra/** - Modelos Bicep com explicações de parâmetros  
- **src/** - Código de aplicação de exemplo  
- **scripts/** - Scripts auxiliares para tarefas comuns  

## 🎯 Objetivos de Aprendizagem  

### Categorias de Exemplos  

#### **Implementações Básicas**  
- Aplicações de serviço único  
- Padrões simples de infraestrutura  
- Gestão básica de configuração  
- Configurações de desenvolvimento económicas  

#### **Cenários Avançados**  
- Arquiteturas de múltiplos serviços  
- Configurações complexas de rede  
- Padrões de integração de bases de dados  
- Implementações de segurança e conformidade  

#### **Padrões Prontos para Produção**  
- Configurações de alta disponibilidade  
- Monitorização e observabilidade  
- Integração CI/CD  
- Configurações de recuperação de desastres  

## 📖 Descrições de Exemplos  

### Aplicação Web Simples - Node.js Express  
**Tecnologias**: Node.js, Express, MongoDB, Container Apps  
**Complexidade**: Iniciante  
**Conceitos**: Implementação básica, API REST, integração de base de dados NoSQL  

### Website Estático - React SPA  
**Tecnologias**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexidade**: Iniciante  
**Conceitos**: Hospedagem estática, backend serverless, desenvolvimento web moderno  

### Container App - Python Flask  
**Tecnologias**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexidade**: Iniciante  
**Conceitos**: Containerização, API REST, escala para zero, sondas de saúde, monitorização  
**Localização**: [Exemplo Local](../../../examples/container-app/simple-flask-api)  

### Container App - Arquitetura de Microserviços  
**Tecnologias**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexidade**: Avançado  
**Conceitos**: Arquitetura de múltiplos serviços, comunicação entre serviços, filas de mensagens, rastreamento distribuído  
**Localização**: [Exemplo Local](../../../examples/container-app/microservices)  

### Aplicação de Base de Dados - C# com Azure SQL  
**Tecnologias**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexidade**: Intermediário  
**Conceitos**: Entity Framework, conexões de base de dados, desenvolvimento de API web  

### Função Serverless - Python Azure Functions  
**Tecnologias**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexidade**: Intermediário  
**Conceitos**: Arquitetura orientada a eventos, computação serverless, desenvolvimento full-stack  

### Microserviços - Java Spring Boot  
**Tecnologias**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexidade**: Intermediário  
**Conceitos**: Comunicação entre microserviços, sistemas distribuídos, padrões empresariais  

### Exemplos do Azure AI Foundry  

#### Aplicação de Chat Azure OpenAI  
**Tecnologias**: Azure OpenAI, Cognitive Search, App Service  
**Complexidade**: Intermediário  
**Conceitos**: Arquitetura RAG, pesquisa vetorial, integração LLM  

#### Processamento de Documentos AI  
**Tecnologias**: Azure AI Document Intelligence, Storage, Functions  
**Complexidade**: Intermediário  
**Conceitos**: Análise de documentos, OCR, extração de dados  

#### Pipeline de Machine Learning  
**Tecnologias**: Azure ML, MLOps, Container Registry  
**Complexidade**: Avançado  
**Conceitos**: Treinamento de modelos, pipelines de implementação, monitorização  

## 🛠 Exemplos de Configuração  

O diretório `configurations/` contém componentes reutilizáveis:  

### Configurações de Ambiente  
- Configurações de ambiente de desenvolvimento  
- Configurações de ambiente de staging  
- Configurações prontas para produção  
- Configurações de implementação em várias regiões  

### Módulos Bicep  
- Componentes de infraestrutura reutilizáveis  
- Padrões comuns de recursos  
- Modelos reforçados em segurança  
- Configurações otimizadas para custos  

### Scripts Auxiliares  
- Automação de configuração de ambiente  
- Scripts de migração de base de dados  
- Ferramentas de validação de implementação  
- Utilitários de monitorização de custos  

## 🔧 Guia de Personalização  

### Adaptar Exemplos ao Seu Caso de Uso  

1. **Revisar Pré-requisitos**  
   - Verificar requisitos de serviços Azure  
   - Confirmar limites de subscrição  
   - Compreender implicações de custos  

2. **Modificar Configuração**  
   - Atualizar definições de serviços em `azure.yaml`  
   - Personalizar modelos Bicep  
   - Ajustar variáveis de ambiente  

3. **Testar Minuciosamente**  
   - Implementar primeiro no ambiente de desenvolvimento  
   - Validar funcionalidade  
   - Testar escalabilidade e desempenho  

4. **Revisão de Segurança**  
   - Revisar controlos de acesso  
   - Implementar gestão de segredos  
   - Ativar monitorização e alertas  

## 📊 Matriz de Comparação  

| Exemplo | Serviços | Base de Dados | Autenticação | Monitorização | Complexidade |  
|---------|----------|---------------|--------------|---------------|--------------|  
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Completa | ⭐⭐ |  
| **Python Flask API** (Local) | 1 | ❌ | Básica | Completa | ⭐ |  
| **Microserviços** (Local) | 5+ | ✅ | Empresarial | Avançada | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Básica | Básica | ⭐ |  
| React SPA + Functions | 3 | ✅ | Básica | Completa | ⭐ |  
| Python Flask Container | 2 | ❌ | Básica | Completa | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Completa | Completa | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Completa | Completa | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | Completa | Completa | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Completa | Completa | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | Básica | Completa | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | Completa | Completa | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Empresarial** | **Avançada** | **⭐⭐⭐⭐** |  

## 🎓 Caminho de Aprendizagem  

### Progressão Recomendada  

1. **Comece com Aplicação Web Simples**  
   - Aprenda conceitos básicos do AZD  
   - Compreenda o fluxo de implementação  
   - Pratique gestão de ambientes  

2. **Experimente Website Estático**  
   - Explore diferentes opções de hospedagem  
   - Aprenda sobre integração de CDN  
   - Compreenda configuração de DNS  

3. **Avance para Container App**  
   - Aprenda fundamentos de containerização  
   - Compreenda conceitos de escalabilidade  
   - Pratique com Docker  

4. **Adicione Integração de Base de Dados**  
   - Aprenda provisionamento de bases de dados  
   - Compreenda strings de conexão  
   - Pratique gestão de segredos  

5. **Explore Serverless**  
   - Compreenda arquitetura orientada a eventos  
   - Aprenda sobre triggers e bindings  
   - Pratique com APIs  

6. **Construa Microserviços**  
   - Aprenda comunicação entre serviços  
   - Compreenda sistemas distribuídos  
   - Pratique implementações complexas  

## 🔍 Encontrar o Exemplo Certo  

### Por Stack Tecnológico  
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Bases de Dados**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Sistemas Multi-Agente**: **Retail Multi-Agent Solution**  
- **Integração OpenAI**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Produção Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Por Padrão de Arquitetura  
- **API REST Simples**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolítico**: Node.js Express Todo, C# Web API + SQL  
- **Estático + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microserviços**: [Microservices de Produção (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Containerizado**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)  
- **IA-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Arquitetura Multi-Agente**: **Retail Multi-Agent Solution**  
- **Multi-Serviço Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Por Nível de Complexidade  
- **Iniciante**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermediário**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing  
- **Avançado**: ML Pipeline  
- **Pronto para Produção Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-serviço com filas de mensagens), **Retail Multi-Agent Solution** (Sistema multi-agente completo com implementação via modelo ARM)  

## 📚 Recursos Adicionais  

### Links de Documentação  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Documentação Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Exemplos da Comunidade  
- [Templates AZD do Azure Samples](https://github.com/Azure-Samples/azd-templates)  
- [Templates do Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Galeria CLI do Azure Developer](https://azure.github.io/awesome-azd/)  
- [Aplicação Todo com C# e Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Aplicação Todo com Python e MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Aplicação Todo com Node.js e PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicação Web React com API em C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job de Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions com Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Melhores Práticas
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Exemplos de Contribuição

Tem um exemplo útil para partilhar? Aceitamos contribuições!

### Diretrizes para Submissão
1. Siga a estrutura de diretórios estabelecida
2. Inclua um README.md detalhado
3. Adicione comentários aos ficheiros de configuração
4. Teste exaustivamente antes de submeter
5. Inclua estimativas de custos e pré-requisitos

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

**Dica Profissional**: Comece com o exemplo mais simples que corresponda à sua stack tecnológica e, gradualmente, avance para cenários mais complexos. Cada exemplo constrói conceitos com base nos anteriores!

## 🚀 Pronto para Começar?

### O Seu Caminho de Aprendizagem

1. **Completamente Iniciante?** → Comece com [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minutos)
2. **Tem Conhecimentos Básicos de AZD?** → Experimente [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minutos)
3. **A Construir Aplicações de IA?** → Comece com [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minutos) ou explore [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ horas)
4. **Precisa de uma Stack Tecnológica Específica?** → Utilize a secção [Encontrar o Exemplo Certo](../../../examples) acima

### Próximos Passos

- ✅ Revise os [Pré-requisitos](../../../examples) acima
- ✅ Escolha um exemplo que corresponda ao seu nível de habilidade (veja [Legenda de Complexidade](../../../examples))
- ✅ Leia o README do exemplo cuidadosamente antes de implementar
- ✅ Defina um lembrete para executar `azd down` após os testes
- ✅ Partilhe a sua experiência via GitHub Issues ou Discussões

### Precisa de Ajuda?

- 📖 [FAQ](../resources/faq.md) - Respostas às perguntas mais comuns
- 🐛 [Guia de Resolução de Problemas](../docs/troubleshooting/common-issues.md) - Resolva problemas de implementação
- 💬 [Discussões no GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Pergunte à comunidade
- 📚 [Guia de Estudo](../resources/study-guide.md) - Reforce o seu aprendizado

---

**Navegação**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Materiais de Estudo**: [Guia de Estudo](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossário](../resources/glossary.md)
- **🔧 Recursos**: [FAQ](../resources/faq.md) | [Resolução de Problemas](../docs/troubleshooting/common-issues.md)

---

*Última Atualização: Novembro de 2025 | [Reportar Problemas](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuir com Exemplos](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->