<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-17T14:42:37+00:00",
  "source_file": "README.md",
  "language_code": "pt"
}
-->
# AZD Para Iniciantes: Uma Jornada de Aprendizagem Estruturada

![AZD-para-iniciantes](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.pt.png) 

## Introdução a Este Curso

Siga estes passos para começar a sua jornada de aprendizagem com AZD:

1. **Faça um Fork do Repositório**: Clique [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone o Repositório**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Junte-se à Comunidade**: [Comunidades Azure Discord](https://discord.com/invite/ByRwuEEgH4) para suporte especializado
4. **Escolha o Seu Caminho de Aprendizagem**: Selecione um capítulo abaixo que corresponda ao seu nível de experiência

### Suporte Multilíngue

#### Traduções Automáticas (Sempre Atualizadas)

[Francês](../fr/README.md) | [Espanhol](../es/README.md) | [Alemão](../de/README.md) | [Russo](../ru/README.md) | [Árabe](../ar/README.md) | [Persa (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinês (Simplificado)](../zh/README.md) | [Chinês (Tradicional, Macau)](../mo/README.md) | [Chinês (Tradicional, Hong Kong)](../hk/README.md) | [Chinês (Tradicional, Taiwan)](../tw/README.md) | [Japonês](../ja/README.md) | [Coreano](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Português (Portugal)](./README.md) | [Português (Brasil)](../br/README.md) | [Italiano](../it/README.md) | [Polaco](../pl/README.md) | [Turco](../tr/README.md) | [Grego](../el/README.md) | [Tailandês](../th/README.md) | [Sueco](../sv/README.md) | [Dinamarquês](../da/README.md) | [Norueguês](../no/README.md) | [Finlandês](../fi/README.md) | [Holandês](../nl/README.md) | [Hebraico](../he/README.md) | [Vietnamita](../vi/README.md) | [Indonésio](../id/README.md) | [Malaio](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Húngaro](../hu/README.md) | [Checo](../cs/README.md) | [Eslovaco](../sk/README.md) | [Romeno](../ro/README.md) | [Búlgaro](../bg/README.md) | [Sérvio (Cirílico)](../sr/README.md) | [Croata](../hr/README.md) | [Esloveno](../sl/README.md) | [Ucraniano](../uk/README.md) | [Birmanês (Myanmar)](../my/README.md)

## Visão Geral do Curso

Domine o Azure Developer CLI (azd) através de capítulos estruturados para aprendizagem progressiva. **Foco especial na implementação de aplicações de IA com integração ao Azure AI Foundry.**

### Por Que Este Curso é Essencial para Desenvolvedores Modernos

Com base em insights da comunidade Discord do Azure AI Foundry, **45% dos desenvolvedores querem usar AZD para cargas de trabalho de IA**, mas enfrentam desafios como:
- Arquiteturas complexas de IA com múltiplos serviços
- Melhores práticas para implementação de IA em produção  
- Integração e configuração de serviços Azure AI
- Otimização de custos para cargas de trabalho de IA
- Resolução de problemas específicos de implementação de IA

### Objetivos de Aprendizagem

Ao concluir este curso estruturado, você será capaz de:
- **Dominar os Fundamentos do AZD**: Conceitos principais, instalação e configuração
- **Implementar Aplicações de IA**: Usar AZD com serviços do Azure AI Foundry
- **Implementar Infraestrutura como Código**: Gerir recursos Azure com templates Bicep
- **Resolver Problemas de Implementação**: Solucionar problemas comuns e depurar erros
- **Otimizar para Produção**: Segurança, escalabilidade, monitorização e gestão de custos
- **Construir Soluções Multi-Agente**: Implementar arquiteturas complexas de IA

## 📚 Capítulos de Aprendizagem

*Escolha o seu caminho de aprendizagem com base no nível de experiência e objetivos*

### 🚀 Capítulo 1: Fundamentos & Início Rápido
**Pré-requisitos**: Assinatura Azure, conhecimento básico de linha de comando  
**Duração**: 30-45 minutos  
**Complexidade**: ⭐

#### O Que Você Vai Aprender
- Compreender os fundamentos do Azure Developer CLI
- Instalar o AZD na sua plataforma
- Realizar a sua primeira implementação com sucesso

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [O que é o Azure Developer CLI?](../..)
- **📖 Teoria**: [Fundamentos do AZD](docs/getting-started/azd-basics.md) - Conceitos e terminologia principais
- **⚙️ Configuração**: [Instalação e Configuração](docs/getting-started/installation.md) - Guias específicos para cada plataforma
- **🛠️ Prática**: [Seu Primeiro Projeto](docs/getting-started/first-project.md) - Tutorial passo a passo
- **📋 Referência Rápida**: [Folha de Comandos](resources/cheat-sheet.md)

#### Exercícios Práticos
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resultado do Capítulo**: Implementar com sucesso uma aplicação web simples no Azure usando AZD

---

### 🤖 Capítulo 2: Desenvolvimento Focado em IA (Recomendado para Desenvolvedores de IA)
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 1-2 horas  
**Complexidade**: ⭐⭐

#### O Que Você Vai Aprender
- Integração do Azure AI Foundry com AZD
- Implementação de aplicações com IA
- Compreensão das configurações de serviços de IA

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [Integração com Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Padrões**: [Implementação de Modelos de IA](docs/ai-foundry/ai-model-deployment.md) - Implementar e gerir modelos de IA
- **🛠️ Workshop**: [Laboratório de IA](docs/ai-foundry/ai-workshop-lab.md) - Preparar soluções de IA para AZD
- **📋 Templates**: [Templates do Azure AI Foundry](../..)

#### Exercícios Práticos
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resultado do Capítulo**: Implementar e configurar uma aplicação de chat com IA e capacidades RAG

---

### ⚙️ Capítulo 3: Configuração & Autenticação
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 45-60 minutos  
**Complexidade**: ⭐⭐

#### O Que Você Vai Aprender
- Configuração e gestão de ambientes
- Melhores práticas de autenticação e segurança
- Nomeação e organização de recursos

#### Recursos de Aprendizagem
- **📖 Configuração**: [Guia de Configuração](docs/getting-started/configuration.md) - Configuração de ambientes
- **🔐 Segurança**: Padrões de autenticação e identidade gerida
- **📝 Exemplos**: [Exemplo de Aplicação com Base de Dados](../../examples/database-app) - Padrões de configuração

#### Exercícios Práticos
- Configurar múltiplos ambientes (dev, staging, prod)
- Configurar autenticação com identidade gerida
- Implementar configurações específicas para cada ambiente

**💡 Resultado do Capítulo**: Gerir múltiplos ambientes com autenticação e segurança adequadas

---

### 🏗️ Capítulo 4: Infraestrutura como Código & Implementação
**Pré-requisitos**: Capítulos 1-3 concluídos  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐⭐

#### O Que Você Vai Aprender
- Padrões avançados de implementação
- Infraestrutura como Código com Bicep
- Estratégias de provisionamento de recursos

#### Recursos de Aprendizagem
- **📖 Implementação**: [Guia de Implementação](docs/deployment/deployment-guide.md) - Fluxos de trabalho completos
- **🏗️ Provisionamento**: [Provisionamento de Recursos](docs/deployment/provisioning.md) - Gestão de recursos Azure
- **📝 Exemplos**: [Exemplo de Aplicação em Contêiner](../../examples/container-app) - Implementações em contêiner

#### Exercícios Práticos
- Criar templates personalizados em Bicep
- Implementar aplicações com múltiplos serviços
- Implementar estratégias de implementação blue-green

**💡 Resultado do Capítulo**: Implementar aplicações complexas com múltiplos serviços usando templates de infraestrutura personalizados

---

### 🎯 Capítulo 5: Soluções de IA Multi-Agente (Avançado)
**Pré-requisitos**: Capítulos 1-2 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O Que Você Vai Aprender
- Padrões de arquitetura multi-agente
- Orquestração e coordenação de agentes
- Implementações de IA prontas para produção

#### Recursos de Aprendizagem
- **🤖 Projeto em Destaque**: [Solução Multi-Agente para Retalho](examples/retail-scenario.md) - Implementação completa
- **🛠️ Templates ARM**: [Pacote de Templates ARM](../../examples/retail-multiagent-arm-template) - Implementação com um clique
- **📖 Arquitetura**: Padrões de coordenação multi-agente

#### Exercícios Práticos
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultado do Capítulo**: Implementar e gerir uma solução de IA multi-agente pronta para produção com agentes de Cliente e Inventário

---

### 🔍 Capítulo 6: Validação & Planeamento Pré-Implementação
**Pré-requisitos**: Capítulo 4 concluído  
**Duração**: 1 hora  
**Complexidade**: ⭐⭐

#### O Que Você Vai Aprender
- Planeamento de capacidade e validação de recursos
- Estratégias de seleção de SKU
- Verificações prévias e automação

#### Recursos de Aprendizagem
- **📊 Planeamento**: [Planeamento de Capacidade](docs/pre-deployment/capacity-planning.md) - Validação de recursos
- **💰 Seleção**: [Seleção de SKU](docs/pre-deployment/sku-selection.md) - Escolhas económicas
- **✅ Validação**: [Verificações Prévias](docs/pre-deployment/preflight-checks.md) - Scripts automatizados

#### Exercícios Práticos
- Executar scripts de validação de capacidade
- Otimizar seleções de SKU para custo
- Implementar verificações prévias automatizadas

**💡 Resultado do Capítulo**: Validar e otimizar implementações antes da execução

---

### 🚨 Capítulo 7: Resolução de Problemas & Depuração
**Pré-requisitos**: Qualquer capítulo de implementação concluído  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐

#### O Que Você Vai Aprender
- Abordagens sistemáticas de depuração
- Problemas comuns e soluções
- Resolução de problemas específicos de IA

#### Recursos de Aprendizagem
- **🔧 Problemas Comuns**: [Problemas Comuns](docs/troubleshooting/common-issues.md) - FAQ e soluções
- **🕵️ Depuração**: [Guia de Depuração](docs/troubleshooting/debugging.md) - Estratégias passo a passo
- **🤖 Problemas de IA**: [Resolução de Problemas de IA](docs/troubleshooting/ai-troubleshooting.md) - Problemas com serviços de IA

#### Exercícios Práticos
- Diagnosticar falhas de implementação
- Resolver problemas de autenticação
- Depurar conectividade de serviços de IA

**💡 Resultado do Capítulo**: Diagnosticar e resolver problemas comuns de implementação de forma independente

---

### 🏢 Capítulo 8: Padrões de Produção & Empresariais
**Pré-requisitos**: Capítulos 1-4 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O Que Você Vai Aprender
- Estratégias de implementação em produção
- Padrões de segurança empresariais
- Monitorização e otimização de custos

#### Recursos de Aprendizagem
- **🏭 Produção**: [Melhores Práticas de IA em Produção](docs/ai-foundry/production-ai-practices.md) - Padrões empresariais
- **📝 Exemplos**: [Exemplo de Microserviços](../../examples/microservices) - Arquiteturas complexas
- **📊 Monitorização**: Integração com Application Insights

#### Exercícios Práticos
- Implementar padrões de segurança empresariais
- Configurar monitorização abrangente
- Fazer o deployment para produção com governança adequada

**💡 Resultado do Capítulo**: Implementar aplicações preparadas para o ambiente empresarial com capacidades completas de produção

---

## 📖 O que é o Azure Developer CLI?

Azure Developer CLI (azd) é uma interface de linha de comandos centrada no programador que acelera o processo de criação e deployment de aplicações no Azure. Ele oferece:

- **Deployments baseados em templates** - Utilize templates pré-construídos para padrões comuns de aplicações
- **Infraestrutura como Código** - Gerencie recursos do Azure usando Bicep ou Terraform  
- **Workflows integrados** - Provisione, implemente e monitore aplicações de forma integrada
- **Amigável para programadores** - Otimizado para produtividade e experiência do programador

### **AZD + Azure AI Foundry: Ideal para Deployments de IA**

**Por que usar AZD para soluções de IA?** AZD aborda os principais desafios enfrentados por programadores de IA:

- **Templates prontos para IA** - Templates pré-configurados para Azure OpenAI, Cognitive Services e workloads de ML
- **Deployments seguros de IA** - Padrões de segurança integrados para serviços de IA, chaves de API e endpoints de modelos  
- **Padrões de IA em produção** - Melhores práticas para deployments de aplicações de IA escaláveis e rentáveis
- **Workflows completos de IA** - Desde o desenvolvimento de modelos até o deployment em produção com monitorização adequada
- **Otimização de custos** - Estratégias inteligentes de alocação e escalonamento de recursos para workloads de IA
- **Integração com Azure AI Foundry** - Conexão perfeita com o catálogo de modelos e endpoints do AI Foundry

---

## 🎯 Biblioteca de Templates e Exemplos

### Destaque: Templates do Azure AI Foundry
**Comece aqui se estiver a implementar aplicações de IA!**

| Template | Capítulo | Complexidade | Serviços |
|----------|---------|------------|----------|
| [**Introdução ao chat de IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Introdução a agentes de IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Automatização de workflows multi-agente**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Gerar documentos a partir dos seus dados**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Melhorar reuniões com clientes usando agentes**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernizar o seu código com agentes**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Construir o seu agente conversacional**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Descobrir insights a partir de dados conversacionais**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Processamento de conteúdo multimodal**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Destaque: Cenários de Aprendizagem Completa
**Templates de aplicações prontos para produção mapeados para capítulos de aprendizagem**

| Template | Capítulo de Aprendizagem | Complexidade | Aprendizagem Principal |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Padrões básicos de deployment de IA |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementação RAG com Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capítulo 4 | ⭐⭐ | Integração de Inteligência Documental |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agentes e chamadas de função |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestração de IA empresarial |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitetura multi-agente com agentes de Cliente e Inventário |

### Aprender por Tipo de Exemplo

#### Aplicações Simples (Capítulos 1-2)
- [Aplicação Web Simples](../../examples/simple-web-app) - Padrões básicos de deployment
- [Website Estático](../../examples/static-site) - Deployment de conteúdo estático
- [API Básica](../../examples/basic-api) - Deployment de API REST

#### Integração com Base de Dados (Capítulos 3-4)  
- [Aplicação com Base de Dados](../../examples/database-app) - Padrões de conectividade com bases de dados
- [Processamento de Dados](../../examples/data-processing) - Deployment de workflows ETL

#### Padrões Avançados (Capítulos 4-8)
- [Aplicações em Containers](../../examples/container-app) - Deployments containerizados
- [Microserviços](../../examples/microservices) - Arquiteturas multi-serviço  
- [Soluções Empresariais](../../examples/enterprise) - Padrões prontos para produção

### Coleções de Templates Externos
- [**Templates AZD do Azure-Samples**](https://github.com/Azure-Samples/azd-templates) - Exemplos oficiais da Microsoft
- [**Galeria Awesome AZD**](https://azure.github.io/awesome-azd/) - Templates contribuídos pela comunidade
- [**Diretório de Exemplos**](examples/README.md) - Exemplos locais de aprendizagem com explicações detalhadas

---

## 📚 Recursos de Aprendizagem e Referências

### Referências Rápidas
- [**Folha de Comandos**](resources/cheat-sheet.md) - Comandos essenciais do azd organizados por capítulo
- [**Glossário**](resources/glossary.md) - Terminologia do Azure e azd  
- [**FAQ**](resources/faq.md) - Perguntas frequentes organizadas por capítulo de aprendizagem
- [**Guia de Estudo**](resources/study-guide.md) - Exercícios práticos abrangentes

### Workshops Práticos
- [**Laboratório de Workshop de IA**](docs/ai-foundry/ai-workshop-lab.md) - Torne as suas soluções de IA implementáveis com AZD
- [**Workshop AZD para Iniciantes**](workshop/README.md) - Materiais completos para workshops práticos

### Recursos de Aprendizagem Externos
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculadora de Preços do Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status do Azure](https://status.azure.com/)

---

## 🎓 Conclusão do Curso e Certificação

### Acompanhamento de Progresso
Acompanhe o seu progresso de aprendizagem em cada capítulo:

- [ ] **Capítulo 1**: Fundamentos e Introdução ✅
- [ ] **Capítulo 2**: Desenvolvimento com foco em IA ✅  
- [ ] **Capítulo 3**: Configuração e Autenticação ✅
- [ ] **Capítulo 4**: Infraestrutura como Código e Deployment ✅
- [ ] **Capítulo 5**: Soluções de IA Multi-Agente ✅
- [ ] **Capítulo 6**: Validação e Planeamento Pré-Deployment ✅
- [ ] **Capítulo 7**: Resolução de Problemas e Depuração ✅
- [ ] **Capítulo 8**: Padrões Empresariais e de Produção ✅

### Verificação de Aprendizagem
Após concluir cada capítulo, verifique o seu conhecimento através de:
1. **Exercício Prático**: Complete o deployment prático do capítulo
2. **Revisão de Conhecimento**: Consulte a seção FAQ do capítulo
3. **Discussão na Comunidade**: Partilhe a sua experiência no Discord do Azure
4. **Próximo Capítulo**: Avance para o próximo nível de complexidade

### Benefícios da Conclusão do Curso
Ao concluir todos os capítulos, você terá:
- **Experiência em Produção**: Implementado aplicações reais de IA no Azure
- **Competências Profissionais**: Capacidades de deployment prontas para o ambiente empresarial  
- **Reconhecimento na Comunidade**: Membro ativo da comunidade de programadores do Azure
- **Avanço na Carreira**: Expertise em AZD e deployment de IA em alta demanda

---

## 🤝 Comunidade e Suporte

### Obter Ajuda e Suporte
- **Problemas Técnicos**: [Relatar bugs e solicitar funcionalidades](https://github.com/microsoft/azd-for-beginners/issues)
- **Dúvidas de Aprendizagem**: [Comunidade Microsoft Azure no Discord](https://discord.gg/microsoft-azure)
- **Ajuda Específica de IA**: Participe no [canal #Azure](https://discord.gg/microsoft-azure) para discussões sobre AZD + AI Foundry
- **Documentação**: [Documentação oficial do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insights da Comunidade no Discord do Azure AI Foundry

**Resultados Recentes de Enquetes no Canal #Azure:**
- **45%** dos programadores querem usar AZD para workloads de IA
- **Principais desafios**: Deployments multi-serviço, gestão de credenciais, preparação para produção  
- **Mais solicitado**: Templates específicos para IA, guias de resolução de problemas, melhores práticas

**Participe na nossa comunidade para:**
- Partilhar as suas experiências com AZD + IA e obter ajuda
- Aceder a pré-visualizações de novos templates de IA
- Contribuir para melhores práticas de deployment de IA
- Influenciar o desenvolvimento futuro de funcionalidades AZD + IA

### Contribuir para o Curso
Aceitamos contribuições! Leia o nosso [Guia de Contribuição](CONTRIBUTING.md) para detalhes sobre:
- **Melhorias de Conteúdo**: Aprimore capítulos e exemplos existentes
- **Novos Exemplos**: Adicione cenários e templates do mundo real  
- **Tradução**: Ajude a manter o suporte multilíngue
- **Relatórios de Bugs**: Melhore a precisão e clareza
- **Padrões da Comunidade**: Siga as nossas diretrizes inclusivas

---

## 📄 Informações do Curso

### Licença
Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](../../LICENSE) para detalhes.

### Recursos de Aprendizagem Relacionados da Microsoft

A nossa equipa produz outros cursos abrangentes de aprendizagem:

- [**NOVO** Protocolo de Contexto de Modelo (MCP) para Iniciantes](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Agentes de IA para Iniciantes](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [IA Generativa para Iniciantes usando .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [IA Generativa para Iniciantes](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [IA Generativa para Iniciantes usando Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML para Iniciantes](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Ciência de Dados para Iniciantes](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [IA para Iniciantes](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cibersegurança para Iniciantes](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Desenvolvimento Web para Iniciantes](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT para Iniciantes](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Desenvolvimento XR para Iniciantes](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Dominar o GitHub Copilot para Programação em Par com IA](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Dominar o GitHub Copilot para Programadores C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Escolha a Sua Própria Aventura com Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Navegação do Curso

**🚀 Pronto para começar a aprender?**

**Iniciantes**: Comece com [Capítulo 1: Fundamentos e Introdução](../..)  
**Programadores de IA**: Avance para [Capítulo 2: Desenvolvimento com foco em IA](../..)
**Desenvolvedores Experientes**: Comece com [Capítulo 3: Configuração e Autenticação](../..)

**Próximos Passos**: [Comece o Capítulo 1 - Fundamentos do AZD](docs/getting-started/azd-basics.md) →

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante ter em conta que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.