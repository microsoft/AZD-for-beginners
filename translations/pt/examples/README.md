<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T14:53:05+00:00",
  "source_file": "examples/README.md",
  "language_code": "pt"
}
-->
# Exemplos - Modelos e Configurações Práticas do AZD

**Aprender com Exemplos - Organizado por Capítulo**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Mapeamento de Capítulos**: Exemplos organizados por complexidade de aprendizado
- **🚀 Comece Simples**: [Exemplos do Capítulo 1](../../../examples)
- **🤖 Exemplos de IA**: [Capítulos 2 e 5 Soluções de IA](../../../examples)

## Introdução

Este diretório contém exemplos práticos, modelos e cenários reais para ajudá-lo a aprender o Azure Developer CLI através de prática prática. Cada exemplo fornece código funcional completo, modelos de infraestrutura e instruções detalhadas para diferentes arquiteturas de aplicação e padrões de implantação.

## Objetivos de Aprendizado

Ao trabalhar com esses exemplos, você irá:
- Praticar fluxos de trabalho do Azure Developer CLI com cenários de aplicação realistas
- Compreender diferentes arquiteturas de aplicação e suas implementações no AZD
- Dominar padrões de Infraestrutura como Código para vários serviços do Azure
- Aplicar estratégias de gerenciamento de configuração e implantação específicas para ambientes
- Implementar padrões de monitoramento, segurança e escalabilidade em contextos práticos
- Ganhar experiência com solução de problemas e depuração de cenários reais de implantação

## Resultados de Aprendizado

Ao concluir esses exemplos, você será capaz de:
- Implantar diferentes tipos de aplicações usando o Azure Developer CLI com confiança
- Adaptar os modelos fornecidos às suas próprias necessidades de aplicação
- Projetar e implementar padrões de infraestrutura personalizados usando Bicep
- Configurar aplicações complexas com múltiplos serviços e dependências adequadas
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

### Para Iniciantes
1. **[Aplicação Web Simples - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Implante uma aplicação web Node.js Express com MongoDB
2. **[Site Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Hospede um site estático React com Azure Static Web Apps
3. **[Aplicação em Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Implante uma aplicação Python Flask containerizada

### Para Usuários Intermediários
4. **[Aplicação com Base de Dados - C# com Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Aplicação web com API em C# e Banco de Dados Azure SQL
5. **[Função Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Funções Azure em Python com gatilhos HTTP e Cosmos DB
6. **[Microserviços - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Aplicação Java com múltiplos serviços, Container Apps e gateway de API

### Modelos do Azure AI Foundry

1. **[Aplicação de Chat com Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Aplicação de chat inteligente com Azure OpenAI
2. **[Processamento de Documentos com IA](https://github.com/Azure-Samples/azure-ai-document-processing)** - Análise de documentos usando serviços de IA do Azure
3. **[Pipeline de Machine Learning](https://github.com/Azure-Samples/mlops-v2)** - Fluxo de trabalho MLOps com Azure Machine Learning

### Cenários do Mundo Real

#### **Solução Multi-Agente para Varejo** 🆕
**[Guia Completo de Implementação](./retail-scenario.md)**

Uma solução abrangente e pronta para produção de suporte ao cliente com múltiplos agentes que demonstra a implantação de aplicações de IA de nível empresarial com AZD. Este cenário fornece:

- **Arquitetura Completa**: Sistema multi-agente com agentes especializados em suporte ao cliente e gestão de inventário
- **Infraestrutura de Produção**: Implantações multi-região do Azure OpenAI, AI Search, Container Apps e monitoramento abrangente
- **Modelo ARM Pronto para Implantação**: Implantação com um clique e múltiplos modos de configuração (Mínimo/Padrão/Premium)
- **Recursos Avançados**: Validação de segurança com red teaming, framework de avaliação de agentes, otimização de custos e guias de solução de problemas
- **Contexto Empresarial Real**: Caso de uso de suporte ao cliente para varejo com upload de arquivos, integração de busca e escalabilidade dinâmica

**Tecnologias**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexidade**: ⭐⭐⭐⭐ (Avançado - Pronto para Produção Empresarial)

**Perfeito para**: Desenvolvedores de IA, arquitetos de soluções e equipes que constroem sistemas multi-agente de produção

**Início Rápido**: Implante a solução completa em menos de 30 minutos usando o modelo ARM incluído com `./deploy.sh -g myResourceGroup`

## 📋 Instruções de Uso

### Executando Exemplos Localmente

1. **Clone ou Copie o Exemplo**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicialize o Ambiente AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configure o Ambiente**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Implante**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Adaptando Exemplos

Cada exemplo inclui:
- **README.md** - Instruções detalhadas de configuração e personalização
- **azure.yaml** - Configuração do AZD com comentários
- **infra/** - Modelos Bicep com explicações de parâmetros
- **src/** - Código de aplicação de exemplo
- **scripts/** - Scripts auxiliares para tarefas comuns

## 🎯 Objetivos de Aprendizado

### Categorias de Exemplos

#### **Implantações Básicas**
- Aplicações com um único serviço
- Padrões simples de infraestrutura
- Gerenciamento básico de configuração
- Configurações econômicas para desenvolvimento

#### **Cenários Avançados**
- Arquiteturas com múltiplos serviços
- Configurações complexas de rede
- Padrões de integração com bases de dados
- Implementações de segurança e conformidade

#### **Padrões Prontos para Produção**
- Configurações de alta disponibilidade
- Monitoramento e observabilidade
- Integração com CI/CD
- Configurações de recuperação de desastres

## 📖 Descrições dos Exemplos

### Aplicação Web Simples - Node.js Express
**Tecnologias**: Node.js, Express, MongoDB, Container Apps  
**Complexidade**: Iniciante  
**Conceitos**: Implantação básica, API REST, integração com banco de dados NoSQL

### Site Estático - React SPA
**Tecnologias**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexidade**: Iniciante  
**Conceitos**: Hospedagem estática, backend serverless, desenvolvimento web moderno

### Aplicação em Container - Python Flask
**Tecnologias**: Python Flask, Docker, Container Apps, Container Registry  
**Complexidade**: Iniciante  
**Conceitos**: Containerização, arquitetura de microserviços, desenvolvimento de APIs

### Aplicação com Base de Dados - C# com Azure SQL
**Tecnologias**: C# ASP.NET Core, Banco de Dados Azure SQL, App Service  
**Complexidade**: Intermediário  
**Conceitos**: Entity Framework, conexões com banco de dados, desenvolvimento de API web

### Função Serverless - Python Azure Functions
**Tecnologias**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexidade**: Intermediário  
**Conceitos**: Arquitetura orientada a eventos, computação serverless, desenvolvimento full-stack

### Microserviços - Java Spring Boot
**Tecnologias**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexidade**: Intermediário  
**Conceitos**: Comunicação entre microserviços, sistemas distribuídos, padrões empresariais

### Exemplos do Azure AI Foundry

#### Aplicação de Chat com Azure OpenAI
**Tecnologias**: Azure OpenAI, Cognitive Search, App Service  
**Complexidade**: Intermediário  
**Conceitos**: Arquitetura RAG, busca vetorial, integração com LLM

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
- Configurações de implantação multi-região

### Módulos Bicep
- Componentes de infraestrutura reutilizáveis
- Padrões comuns de recursos
- Modelos reforçados em segurança
- Configurações otimizadas para custo

### Scripts Auxiliares
- Automação de configuração de ambiente
- Scripts de migração de banco de dados
- Ferramentas de validação de implantação
- Utilitários de monitoramento de custos

## 🔧 Guia de Personalização

### Adaptando Exemplos para Seu Caso de Uso

1. **Revise os Pré-requisitos**
   - Verifique os requisitos de serviços do Azure
   - Confirme os limites da assinatura
   - Compreenda as implicações de custo

2. **Modifique a Configuração**
   - Atualize as definições de serviço no `azure.yaml`
   - Personalize os modelos Bicep
   - Ajuste as variáveis de ambiente

3. **Teste Minuciosamente**
   - Implante primeiro no ambiente de desenvolvimento
   - Valide a funcionalidade
   - Teste escalabilidade e desempenho

4. **Revisão de Segurança**
   - Revise os controles de acesso
   - Implemente gerenciamento de segredos
   - Ative monitoramento e alertas

## 📊 Matriz de Comparação

| Exemplo | Serviços | Base de Dados | Autenticação | Monitoramento | Complexidade |
|---------|----------|---------------|--------------|---------------|--------------|
| Node.js Express Todo | 2 | ✅ | Básico | Básico | ⭐ |
| React SPA + Functions | 3 | ✅ | Básico | Completo | ⭐ |
| Python Flask Container | 2 | ❌ | Básico | Completo | ⭐ |
| C# Web API + SQL | 2 | ✅ | Completo | Completo | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Completo | Completo | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Completo | Completo | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Completo | Completo | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Básico | Completo | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Completo | Completo | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Empresarial** | **Avançado** | **⭐⭐⭐⭐** |

## 🎓 Caminho de Aprendizado

### Progressão Recomendada

1. **Comece com Aplicação Web Simples**
   - Aprenda conceitos básicos do AZD
   - Compreenda o fluxo de trabalho de implantação
   - Pratique gerenciamento de ambiente

2. **Experimente Site Estático**
   - Explore diferentes opções de hospedagem
   - Aprenda sobre integração de CDN
   - Compreenda configuração de DNS

3. **Avance para Aplicação em Container**
   - Aprenda os fundamentos da containerização
   - Compreenda conceitos de escalabilidade
   - Pratique com Docker

4. **Adicione Integração com Base de Dados**
   - Aprenda provisionamento de banco de dados
   - Compreenda strings de conexão
   - Pratique gerenciamento de segredos

5. **Explore Serverless**
   - Compreenda arquitetura orientada a eventos
   - Aprenda sobre gatilhos e bindings
   - Pratique com APIs

6. **Construa Microserviços**
   - Aprenda comunicação entre serviços
   - Compreenda sistemas distribuídos
   - Pratique implantações complexas

## 🔍 Encontrando o Exemplo Certo

### Por Stack Tecnológico
- **Node.js**: Aplicação Node.js Express Todo
- **Python**: Aplicação Python Flask Container, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Aplicação de Chat com Azure OpenAI, Pipeline de ML
- **Java**: Microserviços Java Spring Boot
- **React**: React SPA + Functions
- **Containers**: Aplicação Python Flask Container, Microserviços Java
- **Bases de Dados**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **IA/ML**: Aplicação de Chat com Azure OpenAI, Processamento de Documentos com IA, Pipeline de ML, **Solução Multi-Agente para Varejo**
- **Sistemas Multi-Agente**: **Solução Multi-Agente para Varejo**
- **Produção Empresarial**: **Solução Multi-Agente para Varejo**

### Por Padrão de Arquitetura
- **Monolítico**: Node.js Express Todo, C# Web API + SQL
- **Estático + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microserviços**: Microserviços Java Spring Boot
- **Containerizado**: Aplicação Python Flask Container
- **IA-Powered**: Aplicação de Chat com Azure OpenAI, Processamento de Documentos com IA, Pipeline de ML, **Solução Multi-Agente para Varejo**
- **Arquitetura Multi-Agente**: **Solução Multi-Agente para Varejo**
- **Multi-Serviço Empresarial**: **Solução Multi-Agente para Varejo**

### Por Nível de Complexidade
- **Iniciante**: Node.js Express Todo, React SPA + Functions, Aplicação Python Flask Container
- **Intermediário**: C# Web API + SQL, Python Functions + SPA, Microserviços Java, Aplicação de Chat com Azure OpenAI, Processamento de Documentos com IA
- **Avançado**: Pipeline de ML
- **Pronto para Produção Empresarial**: **Solução Multi-Agente para Varejo** (Sistema multi-agente completo com implantação via modelo ARM)

## 📚 Recursos Adicionais

### Links de Documentação
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Modelos do Azure AI Foundry AZD](https://github.com/Azure/ai-foundry-templates)
- [Documentação do Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Exemplos da Comunidade
- [Modelos AZD de Exemplos do Azure](https://github.com/Azure-Samples/azd-templates)
- [Modelos do Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galeria do Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Aplicação Todo com C# e Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Aplicação Todo com Python e MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Aplicação Todo com Node.js e PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [Aplicação Web React com API em C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [Job do Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)  
- [Azure Functions com Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### Boas Práticas  
- [Framework de Boas Práticas do Azure](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Framework de Adoção da Cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 Contribuir com Exemplos  

Tem um exemplo útil para partilhar? Aceitamos contribuições!  

### Diretrizes para Submissão  
1. Siga a estrutura de diretórios estabelecida  
2. Inclua um README.md completo  
3. Adicione comentários aos ficheiros de configuração  
4. Teste exaustivamente antes de submeter  
5. Inclua estimativas de custos e pré-requisitos  

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

**Dica Profissional**: Comece com o exemplo mais simples que corresponda à sua stack tecnológica e, gradualmente, avance para cenários mais complexos. Cada exemplo baseia-se em conceitos apresentados nos anteriores!  

**Próximos Passos**:  
- Escolha um exemplo que corresponda ao seu nível de habilidade  
- Siga as instruções de configuração no README do exemplo  
- Experimente personalizações  
- Partilhe as suas aprendizagens com a comunidade  

---  

**Navegação**  
- **Lição Anterior**: [Guia de Estudo](../resources/study-guide.md)  
- **Voltar para**: [README Principal](../README.md)  

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte oficial. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes do uso desta tradução.