# Exemplos - Modelos e Configurações Práticas do AZD

**Aprender por Exemplo - Organizado por Capítulo**
- **📚 Início do Curso**: [AZD For Beginners](../README.md)
- **📖 Mapeamento de Capítulos**: Exemplos organizados por complexidade de aprendizado
- **🚀 Exemplo Local**: [Solução Multi-Agente de Varejo](retail-scenario.md)
- **🤖 Exemplos Externos de IA**: Links para repositórios Azure Samples

> **📍 IMPORTANTE: Exemplos Locais vs Externos**  
> Este repositório contém **4 exemplos locais completos** com implementações completas:  
> - **Azure OpenAI Chat** (implantação GPT-4 com interface de chat)  
> - **Container Apps** (API Flask simples + Microsserviços)  
> - **Database App** (Web + Banco de Dados SQL)  
> - **Retail Multi-Agent** (Solução de IA empresarial)  
>  
> Exemplos adicionais são **referências externas** para repositórios Azure-Samples que você pode clonar.

## Introdução

Este diretório fornece exemplos práticos e referências para ajudá-lo a aprender o Azure Developer CLI por meio da prática. O cenário Retail Multi-Agent é uma implementação completa pronta para produção incluída neste repositório. Exemplos adicionais fazem referência aos Azure Samples oficiais que demonstram vários padrões do AZD.

### Legenda de Nível de Complexidade

- ⭐ **Iniciante** - Conceitos básicos, serviço único, 15-30 minutos
- ⭐⭐ **Intermediário** - Vários serviços, integração com banco de dados, 30-60 minutos
- ⭐⭐⭐ **Avançado** - Arquitetura complexa, integração com IA, 1-2 horas
- ⭐⭐⭐⭐ **Especialista** - Pronto para produção, padrões empresariais, 2+ horas

## 🎯 O que este repositório realmente contém

### ✅ Implementação Local (Pronta para Uso)

#### [Aplicativo de Chat Azure OpenAI](azure-openai-chat/README.md) 🆕
**Implantação completa do GPT-4 com interface de chat incluída neste repositório**

- **Localização:** `examples/azure-openai-chat/`
- **Complexidade:** ⭐⭐ (Intermediário)
- **O que está incluído:**
  - Implantação completa do Azure OpenAI (GPT-4)
  - Interface de chat em linha de comando em Python
  - Integração com Key Vault para chaves de API seguras
  - Modelos de infraestrutura em Bicep
  - Monitoramento de uso de tokens e custos
  - Limitação de taxa e tratamento de erros

**Início Rápido:**
```bash
# Navegue até o exemplo
cd examples/azure-openai-chat

# Implantar tudo
azd up

# Instale as dependências e comece a conversar
pip install -r src/requirements.txt
python src/chat.py
```

**Tecnologias:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Exemplos de Container App](container-app/README.md) 🆕
**Exemplos abrangentes de implantação de contêiner incluídos neste repositório**

- **Localização:** `examples/container-app/`
- **Complexidade:** ⭐-⭐⭐⭐⭐ (Iniciante ao Avançado)
- **O que está incluído:**
  - [Guia Mestre](container-app/README.md) - Visão geral completa das implantações de contêineres
  - [API Flask Simples](../../../examples/container-app/simple-flask-api) - Exemplo básico de API REST
  - [Arquitetura de Microsserviços](../../../examples/container-app/microservices) - Implantação pronta para produção com múltiplos serviços
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
- **O que está incluído:**
  - Modelo completo de implantação ARM
  - Arquitetura multi-agente (Cliente + Inventário)
  - Integração com Azure OpenAI
  - Pesquisa de IA com RAG
  - Monitoramento abrangente
  - Script de implantação com um clique

**Início Rápido:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tecnologias:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Exemplos Externos da Azure (Clone para Usar)

Os exemplos a seguir são mantidos em repositórios oficiais Azure-Samples. Clone-os para explorar diferentes padrões do AZD:

### Aplicações Simples (Capítulos 1-2)

| Modelo | Repositório | Complexidade | Serviços |
|:---------|:-----------|:-----------|:---------|
| **API Python Flask** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microsserviços** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Múltiplos serviços, Service Bus, Cosmos DB, SQL |
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
| **Azure OpenAI Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Implantação GPT-4 |
| **Início Rápido de Chat de IA** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat de IA básico |
| **Agentes de IA** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework de agentes |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Padrão RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA empresarial |

### Banco de Dados & Padrões Avançados (Capítulos 3-8)

| Modelo | Repositório | Complexidade | Foco |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integração com banco de dados |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Microsserviços Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-serviço |
| **Pipeline de ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objetivos de Aprendizagem

Ao trabalhar com esses exemplos, você irá:
- Praticar fluxos de trabalho do Azure Developer CLI com cenários de aplicação realistas
- Entender diferentes arquiteturas de aplicação e suas implementações azd
- Dominar padrões de Infrastructure as Code para vários serviços do Azure
- Aplicar gerenciamento de configuração e estratégias de implantação específicas por ambiente
- Implementar padrões de monitoramento, segurança e escalabilidade em contextos práticos
- Adquirir experiência com solução de problemas e depuração de cenários de implantação reais

## Resultados de Aprendizagem

Ao completar estes exemplos, você será capaz de:
- Implantar vários tipos de aplicações usando o Azure Developer CLI com confiança
- Adaptar os modelos fornecidos aos requisitos da sua própria aplicação
- Projetar e implementar padrões de infraestrutura personalizados usando Bicep
- Configurar aplicações complexas com múltiplos serviços e dependências adequadas
- Aplicar práticas recomendadas de segurança, monitoramento e desempenho em cenários reais
- Solucionar problemas e otimizar implantações com base em experiência prática

## Estrutura de Diretório

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
1. **[Container App - API Python Flask](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Implemente uma API REST simples com escala para zero  
   **Tempo:** 20-25 minutos | **Custo:** $0-5/mês  
   **O que você aprenderá:** Fluxo de trabalho básico do azd, conteinerização, probes de integridade  
   **Resultado Esperado:** Endpoint da API funcionando retornando "Hello, World!" com monitoramento

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implemente uma aplicação web Node.js Express com MongoDB  
   **Tempo:** 25-35 minutos | **Custo:** $10-30/mês  
   **O que você aprenderá:** Integração com banco de dados, variáveis de ambiente, strings de conexão  
   **Resultado Esperado:** Aplicativo de lista de tarefas com funcionalidades de criar/ler/atualizar/excluir

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hospede um site estático React com Azure Static Web Apps  
   **Tempo:** 20-30 minutos | **Custo:** $0-10/mês  
   **O que você aprenderá:** Hospedagem estática, funções serverless, implantação em CDN  
   **Resultado Esperado:** UI em React com backend de API, SSL automático, CDN global

### Para Usuários Intermediários
4. **[Aplicativo de Chat Azure OpenAI](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Implemente o GPT-4 com interface de chat e gerenciamento seguro de chaves de API  
   **Tempo:** 35-45 minutos | **Custo:** $50-200/mês  
   **O que você aprenderá:** Implantação Azure OpenAI, integração com Key Vault, monitoramento de tokens  
   **Resultado Esperado:** Aplicação de chat funcional com GPT-4 e monitoramento de custos

5. **[Container App - Microsserviços](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Arquitetura multi-serviço pronta para produção  
   **Tempo:** 45-60 minutos | **Custo:** $50-150/mês  
   **O que você aprenderá:** Comunicação entre serviços, enfileiramento de mensagens, rastreamento distribuído  
   **Resultado Esperado:** Sistema com 2 serviços (API Gateway + Serviço de Produtos) com monitoramento

6. **[Database App - C# com Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplicação web com API em C# e Azure SQL Database  
   **Tempo:** 30-45 minutos | **Custo:** $20-80/mês  
   **O que você aprenderá:** Entity Framework, migrações de banco de dados, segurança de conexão  
   **Resultado Esperado:** API em C# com backend Azure SQL, implantação automática de esquema

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions com triggers HTTP e Cosmos DB  
   **Tempo:** 30-40 minutos | **Custo:** $10-40/mês  
   **O que você aprenderá:** Arquitetura orientada a eventos, escalabilidade serverless, integração NoSQL  
   **Resultado Esperado:** Function app respondendo a requisições HTTP com armazenamento no Cosmos DB

8. **[Microsserviços - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplicação Java multi-serviço com Container Apps e API gateway  
   **Tempo:** 60-90 minutos | **Custo:** $80-200/mês  
   **O que você aprenderá:** Implantação Spring Boot, malha de serviço, balanceamento de carga  
   **Resultado Esperado:** Sistema Java com múltiplos serviços, descoberta de serviços e roteamento

### Modelos Microsoft Foundry

1. **[Aplicativo de Chat Azure OpenAI - Exemplo Local](../../../examples/azure-openai-chat)** ⭐⭐  
   Implantação completa do GPT-4 com interface de chat  
   **Tempo:** 35-45 minutos | **Custo:** $50-200/mês  
   **Resultado Esperado:** Aplicação de chat funcional com monitoramento de tokens e custos

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplicação de chat inteligente com arquitetura RAG  
   **Tempo:** 60-90 minutos | **Custo:** $100-300/mês  
   **Resultado Esperado:** Interface de chat com RAG, pesquisa de documentos e citações

3. **[Processamento de Documentos com IA](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Análise de documentos usando serviços Azure AI  
   **Tempo:** 40-60 minutos | **Custo:** $20-80/mês  
   **Resultado Esperado:** API que extrai texto, tabelas e entidades de documentos enviados

4. **[Pipeline de Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Fluxo de MLOps com Azure Machine Learning  
   **Tempo:** 2-3 horas | **Custo:** $150-500/mês  
   **Resultado Esperado:** Pipeline de ML automatizado com treino, implantação e monitoramento

### Cenários do Mundo Real

#### **Solução Multi-Agente de Varejo** 🆕  
**[Guia de Implementação Completo](./retail-scenario.md)**

Uma solução abrangente e pronta para produção de suporte ao cliente multi-agente que demonstra a implantação de aplicações de IA em nível empresarial com AZD. Este cenário fornece:

- **Arquitetura Completa**: Sistema multi-agente com agentes especializados em atendimento ao cliente e gerenciamento de inventário
- **Infraestrutura de Produção**: Implantações Azure OpenAI em múltiplas regiões, AI Search, Container Apps e monitoramento abrangente
- **Modelo ARM Pronto para Implantação**: Implantação com um clique com múltiplos modos de configuração (Minimal/Standard/Premium)
- **Recursos Avançados**: Validação de segurança red teaming, framework de avaliação de agentes, otimização de custos e guias de solução de problemas
- **Contexto de Negócios Real**: Caso de uso de suporte ao cliente de varejista com upload de arquivos, integração de busca e dimensionamento dinâmico

**Tecnologias**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexidade**: ⭐⭐⭐⭐ (Avançado - Pronto para Produção Empresarial)

**Perfeito para**: Desenvolvedores de IA, arquitetos de soluções e equipes construindo sistemas multiagente em produção

**Início Rápido**: Implemente a solução completa em menos de 30 minutos usando o modelo ARM incluído com `./deploy.sh -g myResourceGroup`

## 📋 Instruções de Uso

### Pré-requisitos

Antes de executar qualquer exemplo:
- ✅ Assinatura do Azure com acesso de Owner ou Contributor
- ✅ Azure Developer CLI instalado ([Guia de Instalação](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop em execução (para exemplos com containers)
- ✅ Cotas apropriadas do Azure (verifique os requisitos específicos de cada exemplo)

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

4. **Implantar**
   ```bash
   # Implantar a infraestrutura e a aplicação
   azd up
   ```

5. **Verificar Implantação**
   ```bash
   # Obter endpoints do serviço
   azd env get-values
   
   # Testar o endpoint (exemplo)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indicadores de Sucesso Esperados:**
   - ✅ `azd up` é concluído sem erros
   - ✅ O endpoint do serviço retorna HTTP 200
   - ✅ O Azure Portal mostra o status "Running"
   - ✅ Application Insights recebendo telemetria

> **⚠️ Problemas?** Veja [Problemas Comuns](../docs/chapter-07-troubleshooting/common-issues.md) para solução de problemas de implantação

### Adaptando Exemplos

Cada exemplo inclui:
- **README.md** - Instruções detalhadas de configuração e personalização
- **azure.yaml** - Configuração AZD com comentários
- **infra/** - Templates Bicep com explicações dos parâmetros
- **src/** - Código de aplicativo de exemplo
- **scripts/** - Scripts auxiliares para tarefas comuns

## 🎯 Objetivos de Aprendizagem

### Categorias de Exemplos

#### **Implantações Básicas**
- Aplicações de serviço único
- Padrões de infraestrutura simples
- Gerenciamento básico de configuração
- Configurações de desenvolvimento com custo otimizado

#### **Cenários Avançados**
- Arquiteturas multi-serviço
- Configurações de rede complexas
- Padrões de integração de banco de dados
- Implementações de segurança e conformidade

#### **Padrões Prontos para Produção**
- Configurações de alta disponibilidade
- Monitoramento e observabilidade
- Integração CI/CD
- Configurações de recuperação de desastres

## 📖 Descrições dos Exemplos

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
**Conceitos**: Containerização, API REST, dimensionamento até zero, probes de integridade, monitoramento  
**Localização**: [Exemplo Local](../../../examples/container-app/simple-flask-api)

### Container App - Arquitetura de Microsserviços
**Tecnologias**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexidade**: Avançado  
**Conceitos**: Arquitetura multi-serviço, comunicação entre serviços, enfileiramento de mensagens, tracing distribuído  
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

### Microsoft Foundry Examples

#### Azure OpenAI Chat App
**Tecnologias**: Azure OpenAI, Cognitive Search, App Service  
**Complexidade**: Intermediário  
**Conceitos**: Arquitetura RAG, busca vetorial, integração com LLM

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
- Configurações do ambiente de desenvolvimento
- Configurações do ambiente de staging
- Configurações prontas para produção
- Configurações de implantação multirregional

### Módulos Bicep
- Componentes de infraestrutura reutilizáveis
- Padrões comuns de recursos
- Templates com hardening de segurança
- Configurações otimizadas para custo

### Scripts Auxiliares
- Automação de setup de ambiente
- Scripts de migração de banco de dados
- Ferramentas de validação de implantação
- Utilitários de monitoramento de custos

## 🔧 Guia de Personalização

### Adaptando Exemplos para Seu Caso de Uso

1. **Reveja os Pré-requisitos**
   - Verifique os requisitos de serviço do Azure
   - Confirme os limites da assinatura
   - Entenda as implicações de custo

2. **Modifique a Configuração**
   - Atualize as definições de serviço em `azure.yaml`
   - Personalize os templates Bicep
   - Ajuste as variáveis de ambiente

3. **Teste Exaustivamente**
   - Implemente primeiro no ambiente de desenvolvimento
   - Valide a funcionalidade
   - Teste escalabilidade e performance

4. **Revisão de Segurança**
   - Revise controles de acesso
   - Implemente gerenciamento de segredos
   - Habilite monitoramento e alertas

## 📊 Matriz de Comparação

| Exemplo | Serviços | Banco de Dados | Autenticação | Monitoramento | Complexidade |
|---------|----------|----------------|--------------|---------------|--------------|
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Completo | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Básico | Completo | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Empresarial | Avançado | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Básico | Básico | ⭐ |
| React SPA + Functions | 3 | ✅ | Básico | Completo | ⭐ |
| Python Flask Container | 2 | ❌ | Básico | Completo | ⭐ |
| C# Web API + SQL | 2 | ✅ | Completo | Completo | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Completo | Completo | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Completo | Completo | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Completo | Completo | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Básico | Completo | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Completo | Completo | ⭐⭐⭐⭐ |
| **Solução Multi-Agente para Varejo** (Local) | **8+** | **✅** | **Empresarial** | **Avançado** | **⭐⭐⭐⭐** |

## 🎓 Caminho de Aprendizagem

### Progressão Recomendada

1. **Comece com o Aplicativo Web Simples**
   - Aprenda conceitos básicos do AZD
   - Entenda o fluxo de implantação
   - Pratique gerenciamento de ambientes

2. **Experimente o Site Estático**
   - Explore diferentes opções de hospedagem
   - Aprenda sobre integração com CDN
   - Entenda configuração de DNS

3. **Vá para o Container App**
   - Aprenda fundamentos de containerização
   - Entenda conceitos de escalonamento
   - Pratique com Docker

4. **Adicione Integração de Banco de Dados**
   - Aprenda provisionamento de banco de dados
   - Entenda connection strings
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
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + Azure SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Solução Multi-Agente para Varejo**
- **Sistemas Multi-Agente**: **Solução Multi-Agente para Varejo**
- **Integração com OpenAI**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Solução Multi-Agente para Varejo
- **Produção Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices), **Solução Multi-Agente para Varejo**

### Por Padrão de Arquitetura
- **API REST Simples**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolítico**: Node.js Express Todo, C# Web API + SQL
- **Estático + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microsserviços**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerizado**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **Impulsionado por IA**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Solução Multi-Agente para Varejo**
- **Arquitetura Multi-Agente**: **Solução Multi-Agente para Varejo**
- **Multi-Serviço Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices), **Solução Multi-Agente para Varejo**

### Por Nível de Complexidade
- **Iniciante**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediário**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Avançado**: ML Pipeline
- **Pronto para Produção Empresarial**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-serviço com enfileiramento de mensagens), **Solução Multi-Agente para Varejo** (Sistema multiagente completo com implantação via template ARM)

## 📚 Recursos Adicionais

### Links de Documentação
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Exemplos da Comunidade
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplicativo Todo com Node.js e PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplicativo Web React com API em C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job do Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions com Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Melhores Práticas
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuindo com Exemplos

Tem um exemplo útil para compartilhar? Agradecemos contribuições!

### Diretrizes de Envio
1. Siga a estrutura de diretórios estabelecida
2. Inclua um README.md abrangente
3. Adicione comentários nos arquivos de configuração
4. Teste minuciosamente antes de enviar
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

**Dica Profissional**: Comece com o exemplo mais simples que corresponda ao seu stack de tecnologia, depois aumente gradualmente para cenários mais complexos. Cada exemplo se baseia em conceitos dos anteriores!

## 🚀 Pronto para Começar?

### Seu Caminho de Aprendizado

1. **Iniciante Completo?** → Comece com [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Tem conhecimento básico de AZD?** → Experimente [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Desenvolvendo Apps de IA?** → Comece com [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) ou explore [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ horas)
4. **Precisa de uma pilha de tecnologia específica?** → Use a seção [Encontrar o Exemplo Certo](../../../examples) acima

### Próximos Passos

- ✅ Revise os [Pré-requisitos](../../../examples) acima
- ✅ Escolha um exemplo que corresponda ao seu nível de habilidade (veja a [Legenda de Complexidade](../../../examples))
- ✅ Leia o README do exemplo cuidadosamente antes de implantar
- ✅ Defina um lembrete para executar `azd down` após os testes
- ✅ Compartilhe sua experiência via GitHub Issues ou Discussions

### Precisa de Ajuda?

- 📖 [FAQ](../resources/faq.md) - Perguntas comuns respondidas
- 🐛 [Guia de Solução de Problemas](../docs/chapter-07-troubleshooting/common-issues.md) - Corrija problemas de implantação
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Pergunte à comunidade
- 📚 [Guia de Estudo](../resources/study-guide.md) - Reforce seu aprendizado

---

**Navegação**
- **📚 Página do Curso**: [AZD For Beginners](../README.md)
- **📖 Materiais de Estudo**: [Guia de Estudo](../resources/study-guide.md) | [Resumo Rápido](../resources/cheat-sheet.md) | [Glossário](../resources/glossary.md)
- **🔧 Recursos**: [FAQ](../resources/faq.md) | [Solução de Problemas](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Última Atualização: Novembro de 2025 | [Report Issues](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribute Examples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Isenção de responsabilidade:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte oficial. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->