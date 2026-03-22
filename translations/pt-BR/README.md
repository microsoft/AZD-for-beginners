# AZD Para Iniciantes: Uma Jornada de Aprendizado Estruturada

![AZD para iniciantes](../../translated_images/pt-BR/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduções Automatizadas (Sempre Atualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Árabe](../ar/README.md) | [Bengalês](../bn/README.md) | [Búlgaro](../bg/README.md) | [Birmanês (Myanmar)](../my/README.md) | [Chinês (Simplificado)](../zh-CN/README.md) | [Chinês (Tradicional, Hong Kong)](../zh-HK/README.md) | [Chinês (Tradicional, Macau)](../zh-MO/README.md) | [Chinês (Tradicional, Taiwan)](../zh-TW/README.md) | [Croata](../hr/README.md) | [Tcheco](../cs/README.md) | [Dinamarquês](../da/README.md) | [Holandês](../nl/README.md) | [Estoniano](../et/README.md) | [Finlandês](../fi/README.md) | [Francês](../fr/README.md) | [Alemão](../de/README.md) | [Grego](../el/README.md) | [Hebraico](../he/README.md) | [Hindi](../hi/README.md) | [Húngaro](../hu/README.md) | [Indonésio](../id/README.md) | [Italiano](../it/README.md) | [Japonês](../ja/README.md) | [Canarês (Kannada)](../kn/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malaio](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalês](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Norueguês](../no/README.md) | [Persa (Farsi)](../fa/README.md) | [Polonês](../pl/README.md) | [Português (Brasil)](./README.md) | [Português (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romeno](../ro/README.md) | [Russo](../ru/README.md) | [Sérvio (Cirílico)](../sr/README.md) | [Eslovaco](../sk/README.md) | [Esloveno](../sl/README.md) | [Espanhol](../es/README.md) | [Suaíli](../sw/README.md) | [Sueco](../sv/README.md) | [Tagalo (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Tailandês](../th/README.md) | [Turco](../tr/README.md) | [Ucraniano](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Prefere clonar localmente?**
>
> Este repositório inclui mais de 50 traduções, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, use sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Isso fornece tudo que você precisa para concluir o curso com um download muito mais rápido.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Novidades do azd hoje

Azure Developer CLI cresceu além de aplicativos web tradicionais e APIs. Hoje, o azd é a ferramenta única para implantar qualquer aplicação no Azure — incluindo aplicações com IA e agentes inteligentes.

Aqui está o que isso significa para você:

- **Agentes de IA agora são cargas de trabalho de primeira classe no azd.** Você pode inicializar, implantar e gerenciar projetos de agente de IA usando o mesmo fluxo `azd init` → `azd up` que você já conhece.
- **A integração com o Microsoft Foundry** traz implantação de modelos, hospedagem de agentes e configuração de serviços de IA diretamente para o ecossistema de templates do azd.
- **O fluxo de trabalho principal não mudou.** Quer você esteja implantando um app de tarefas, um microsserviço ou uma solução de IA multiagente, os comandos são os mesmos.

Se você já usou o azd antes, o suporte a IA é uma extensão natural — não uma ferramenta separada ou uma trilha avançada. Se estiver começando do zero, você aprenderá um fluxo de trabalho que funciona para tudo.

---

## 🚀 O que é o Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** é uma ferramenta de linha de comando amigável para desenvolvedores que facilita implantar aplicações no Azure. Em vez de criar e conectar manualmente dezenas de recursos do Azure, você pode implantar aplicações inteiras com um único comando.

### A mágica do `azd up`

```bash
# Este único comando faz tudo:
# ✅ Cria todos os recursos do Azure
# ✅ Configura rede e segurança
# ✅ Compila o código da sua aplicação
# ✅ Realiza o deploy no Azure
# ✅ Fornece uma URL funcional
azd up
```

**É isso!** Sem cliques no Azure Portal, sem templates ARM complexos para aprender primeiro, sem configuração manual - apenas aplicações funcionando no Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual é a diferença?

Esta é a pergunta mais comum que iniciantes fazem. Aqui está a resposta simples:

| Recurso | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Propósito** | Gerenciar recursos individuais do Azure | Implantar aplicações completas |
| **Mentalidade** | Focada em infraestrutura | Focada em aplicações |
| **Exemplo** | `az webapp create --name myapp...` | `azd up` |
| **Curva de aprendizado** | É preciso conhecer os serviços do Azure | Basta conhecer sua aplicação |
| **Melhor para** | DevOps, Infraestrutura | Desenvolvedores, Prototipagem |

### Analogia simples

- **Azure CLI** é como ter todas as ferramentas para construir uma casa - martelos, serras, pregos. Você pode construir qualquer coisa, mas precisa saber construção.
- **Azure Developer CLI** é como contratar um empreiteiro - você descreve o que quer, e ele cuida da construção.

### Quando usar cada um

| Cenário | Use isto |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Eles funcionam juntos!

O AZD usa o Azure CLI por baixo dos panos. Você pode usar ambos:
```bash
# Faça o deploy do seu app com AZD
azd up

# Então ajuste recursos específicos com Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Encontre templates no Awesome AZD

Não comece do zero! **Awesome AZD** é a coleção comunitária de templates prontos para implantar:

| Recurso | Descrição |
|----------|-------------|
| 🔗 [**Galeria Awesome AZD**](https://azure.github.io/awesome-azd/) | Navegue por mais de 200 templates com implantação com um clique |
| 🔗 [**Enviar um template**](https://github.com/Azure/awesome-azd/issues) | Contribua com seu próprio template para a comunidade |
| 🔗 [**Repositório no GitHub**](https://github.com/Azure/awesome-azd) | Dê uma estrela e explore o código-fonte |

### Templates de IA populares do Awesome AZD

```bash
# Chat RAG com modelos Microsoft Foundry + Pesquisa AI
azd init --template azure-search-openai-demo

# Aplicação rápida de chat com IA
azd init --template openai-chat-app-quickstart

# Agentes de IA com agentes Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Começando em 3 Passos

### Passo 1: Instalar o AZD (2 minutos)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Passo 2: Fazer login no Azure

```bash
azd auth login
```

### Passo 3: Implantar seu primeiro aplicativo

```bash
# Inicializar a partir de um modelo
azd init --template todo-nodejs-mongo

# Implantar no Azure (cria tudo!)
azd up
```

**🎉 É isso!** Seu aplicativo já está ativo no Azure.

### Limpeza (Não esqueça!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Como usar este curso

Este curso foi projetado para **aprendizado progressivo** - comece de onde se sente confortável e avance no seu ritmo:

| Sua experiência | Comece aqui |
|-----------------|------------|
| **Novo no Azure** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Conhece o Azure, novo no AZD** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Quer implantar aplicativos de IA** | [Capítulo 2: Desenvolvimento com foco em IA](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Deseja colocar em prática** | [🎓 Oficina interativa](workshop/README.md) - laboratório guiado de 3-4 horas |
| **Precisa de padrões para produção** | [Capítulo 8: Produção e Empresa](#-chapter-8-production--enterprise-patterns) |

### Configuração rápida

1. **Faça um fork deste repositório**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone-o**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtenha ajuda**: [Comunidade Azure no Discord](https://discord.com/invite/ByRwuEEgH4)

> **Prefere clonar localmente?**
>
> Este repositório inclui mais de 50 traduções, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, use sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Isso fornece tudo que você precisa para concluir o curso com um download muito mais rápido.


## Visão geral do curso

Domine o Azure Developer CLI (azd) através de capítulos estruturados projetados para aprendizado progressivo. **Foco especial na implantação de aplicações de IA com integração ao Microsoft Foundry.**

### Por que este curso é essencial para desenvolvedores modernos

Com base em insights da comunidade Microsoft Foundry no Discord, **45% dos desenvolvedores querem usar o AZD para cargas de trabalho de IA** mas enfrentam desafios com:
- Arquiteturas complexas de IA com múltiplos serviços
- Melhores práticas de implantação de IA em produção  
- Integração e configuração de serviços de IA do Azure
- Otimização de custos para cargas de trabalho de IA
- Solução de problemas específicos de implantação de IA

### Objetivos de Aprendizagem

Ao completar este curso estruturado, você irá:
- **Dominar os fundamentos do AZD**: Conceitos fundamentais, instalação e configuração
- **Implantar aplicações de IA**: Usar o AZD com os serviços do Microsoft Foundry
- **Implementar Infraestrutura como Código**: Gerenciar recursos do Azure com templates Bicep
- **Solucionar problemas de implantação**: Resolver problemas comuns e depurar falhas
- **Otimizar para produção**: Segurança, escalabilidade, monitoramento e gestão de custos
- **Construir soluções multiagente**: Implantar arquiteturas de IA complexas

## 🗺️ Mapa do Curso: Navegação rápida por capítulo

Cada capítulo tem um README dedicado com objetivos de aprendizagem, guias rápidos e exercícios:

| Capítulo | Tópico | Lições | Duração | Complexidade |
|---------|-------|---------|----------|------------|
| **[Capítulo 1: Fundamentos](docs/chapter-01-foundation/README.md)** | Introdução | [Conceitos Básicos do AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalação](docs/chapter-01-foundation/installation.md) &#124; [Primeiro Projeto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | Apps com foco em IA | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Autenticação & Segurança | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Implantação | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Soluções com Agentes de IA | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planejamento & Validação | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Depurar & Corrigir | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Padrões Corporativos | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratório Prático | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Total Course Duration:** ~10-14 hours | **Skill Progression:** Beginner → Production-Ready

---

## 📚 Learning Chapters

*Selecione seu caminho de aprendizado com base no nível de experiência e objetivos*

### 🚀 Chapter 1: Foundation & Quick Start
**Prerequisites**: Azure subscription, basic command line knowledge  
**Duration**: 30-45 minutes  
**Complexity**: ⭐

#### What You'll Learn
- Entendendo os fundamentos do Azure Developer CLI
- Instalando o AZD na sua plataforma
- Sua primeira implantação bem-sucedida

#### Learning Resources
- **🎯 Start Here**: [What is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Theory**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Conceitos e terminologia principais
- **⚙️ Setup**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Guias específicos por plataforma
- **🛠️ Hands-On**: [Your First Project](docs/chapter-01-foundation/first-project.md) - Tutorial passo a passo
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Practical Exercises
```bash
# Verificação rápida da instalação
azd version

# Implante sua primeira aplicação
azd init --template todo-nodejs-mongo
azd up
```

**💡 Chapter Outcome**: Implantar com sucesso uma aplicação web simples no Azure usando AZD

**✅ Success Validation:**
```bash
# Ao concluir o Capítulo 1, você deverá ser capaz de:
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                  # Realiza o deploy no Azure
azd show                # Exibe a URL do aplicativo em execução
# O aplicativo abre no navegador e funciona
azd down --force --purge  # Limpa os recursos
```

**📊 Time Investment:** 30-45 minutes  
**📈 Skill Level After:** Pode implantar aplicações básicas de forma independente
**📈 Skill Level After:** Pode implantar aplicações básicas de forma independente

---

### 🤖 Chapter 2: AI-First Development (Recommended for AI Developers)
**Prerequisites**: Chapter 1 completed  
**Duration**: 1-2 hours  
**Complexity**: ⭐⭐

#### What You'll Learn
- Integração do Microsoft Foundry com o AZD
- Implantação de aplicações movidas a IA
- Entendendo configurações de serviços de IA

#### Learning Resources
- **🎯 Start Here**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Implantar agentes inteligentes com AZD
- **📖 Patterns**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Implantar e gerenciar modelos de IA
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Deixe suas soluções de IA prontas para AZD
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Aprendizado baseado em navegador com MkDocs * DevContainer Environment
- **📋 Templates**: [Microsoft Foundry Templates](#recursos-do-workshop)
- **📝 Examples**: [AZD Deployment Examples](examples/README.md)

#### Practical Exercises
```bash
# Implemente seu primeiro aplicativo de IA
azd init --template azure-search-openai-demo
azd up

# Experimente modelos adicionais de IA
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Chapter Outcome**: Implantar e configurar uma aplicação de chat movida a IA com capacidades RAG

**✅ Success Validation:**
```bash
# Após o Capítulo 2, você deverá ser capaz de:
azd init --template azure-search-openai-demo
azd up
# Testar a interface de chat da IA
# Fazer perguntas e obter respostas geradas por IA com fontes
# Verificar se a integração de pesquisa funciona
azd monitor  # Verificar se o Application Insights mostra telemetria
azd down --force --purge
```

**📊 Time Investment:** 1-2 hours  
**📈 Skill Level After:** Pode implantar e configurar aplicações de IA prontas para produção  
**💰 Cost Awareness:** Entender custos de desenvolvimento $80-150/mês, custos de produção $300-3500/mês

#### 💰 Cost Considerations for AI Deployments

**Development Environment (Estimated $80-150/month):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/month (based on token usage)
- AI Search (Basic tier): $75/month
- Container Apps (Consumption): $0-20/month
- Storage (Standard): $1-5/month

**Production Environment (Estimated $300-3,500+/month):**
- Microsoft Foundry Models (PTU for consistent performance): $3,000+/month OR Pay-as-go with high volume
- AI Search (Standard tier): $250/month
- Container Apps (Dedicated): $50-100/month
- Application Insights: $5-50/month
- Storage (Premium): $10-50/month

**💡 Cost Optimization Tips:**
- Use **Free Tier** Microsoft Foundry Models for learning (Azure OpenAI 50,000 tokens/month included)
- Run `azd down` to deallocate resources when not actively developing
- Start with consumption-based billing, upgrade to PTU only for production
- Use `azd provision --preview` to estimate costs before deployment
- Enable auto-scaling: pay only for actual usage

**Cost Monitoring:**
```bash
# Verifique os custos mensais estimados
azd provision --preview

# Monitore os custos reais no Portal do Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: Configuration & Authentication
**Prerequisites**: Chapter 1 completed  
**Duration**: 45-60 minutes  
**Complexity**: ⭐⭐

#### What You'll Learn
- Configuração e gerenciamento de ambientes
- Boas práticas de autenticação e segurança
- Nomeação e organização de recursos

#### Learning Resources
- **📖 Configuration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Configuração de ambiente
- **🔐 Security**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Padrões de autenticação e identidade gerenciada
- **📝 Examples**: [Database App Example](examples/database-app/README.md) - Exemplos de Banco de Dados AZD

#### Practical Exercises
- Configurar múltiplos ambientes (dev, staging, prod)
- Configurar autenticação com identidade gerenciada
- Implementar configurações específicas por ambiente

**💡 Chapter Outcome**: Gerenciar múltiplos ambientes com autenticação e segurança adequadas

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**Prerequisites**: Chapters 1-3 completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐⭐

#### What You'll Learn
- Padrões avançados de implantação
- Infraestrutura como Código com Bicep
- Estratégias de provisionamento de recursos

#### Learning Resources
- **📖 Deployment**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Workflows completos
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Gerenciamento de recursos Azure
- **📝 Examples**: [Container App Example](../../examples/container-app) - Implantações conteinerizadas

#### Practical Exercises
- Criar templates Bicep personalizados
- Implantar aplicações multi-serviço
- Implementar estratégias de implantação blue-green

**💡 Chapter Outcome**: Implantar aplicações complexas multi-serviço usando templates de infraestrutura personalizados

---

### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**Prerequisites**: Chapters 1-2 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- Padrões de arquitetura multi-agente
- Orquestração e coordenação de agentes
- Implantações de IA prontas para produção

#### Learning Resources
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Implementação completa
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Implantação com um clique
- **📖 Architecture**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Padrões

#### Practical Exercises
```bash
# Implantar a solução multiagente completa para o varejo
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorar configurações de agentes
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Chapter Outcome**: Implantar e gerenciar uma solução multi-agente de IA pronta para produção com agentes de Cliente e Inventário

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Prerequisites**: Chapter 4 completed  
**Duration**: 1 hour  
**Complexity**: ⭐⭐

#### What You'll Learn
- Planejamento de capacidade e validação de recursos
- Estratégias de seleção de SKU
- Verificações pré-implantação e automação

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validação de recursos
- **💰 Selection**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Escolhas custo-efetivas
- **✅ Validation**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatizados

#### Practical Exercises
- Executar scripts de validação de capacidade
- Otimizar seleções de SKU para custo
- Implementar verificações automatizadas pré-implantação

**💡 Chapter Outcome**: Validar e otimizar implantações antes da execução

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**Prerequisites**: Any deployment chapter completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐

#### What You'll Learn
- Abordagens sistemáticas de depuração
- Problemas comuns e soluções
- Solução de problemas específica para IA

#### Learning Resources
- **🔧 Common Issues**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluções
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Estratégias passo a passo
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas de serviços de IA

#### Practical Exercises
- Diagnosticar falhas de implantação
- Resolver problemas de autenticação
- Depurar conectividade de serviços de IA

**💡 Chapter Outcome**: Diagnosticar e resolver de forma independente problemas comuns de implantação

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**Prerequisites**: Chapters 1-4 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- Estratégias de implantação em produção
- Padrões de segurança corporativa
- Monitoramento e otimização de custos

#### Learning Resources
- **🏭 Produção**: [Práticas recomendadas de IA em Produção](docs/chapter-08-production/production-ai-practices.md) - Padrões empresariais
- **📝 Exemplos**: [Exemplo de Microserviços](../../examples/microservices) - Arquiteturas complexas
- **📊 Monitoramento**: [Integração com Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoramento

#### Exercícios Práticos
- Implemente padrões de segurança empresariais
- Configure monitoramento abrangente
- Implemente em produção com governança adequada

**💡 Resultado do Capítulo**: Implemente aplicações prontas para o ambiente corporativo com capacidades completas de produção

---

## 🎓 Visão Geral do Workshop: Experiência de Aprendizado Prática

> **⚠️ STATUS DO WORKSHOP: Em Desenvolvimento Ativo**  
> Os materiais do workshop estão atualmente sendo desenvolvidos e refinados. Módulos principais estão funcionais, mas algumas seções avançadas estão incompletas. Estamos trabalhando ativamente para completar todo o conteúdo. [Acompanhe o progresso →](workshop/README.md)

### Materiais Interativos do Workshop
**Aprendizado prático abrangente com ferramentas baseadas em navegador e exercícios guiados**

Nossos materiais do workshop oferecem uma experiência de aprendizado estruturada e interativa que complementa o currículo baseado em capítulos acima. O workshop foi projetado tanto para aprendizado no próprio ritmo quanto para sessões conduzidas por instrutores.

#### 🛠️ Recursos do Workshop
- **Interface Baseada em Navegador**: Workshop completo com MkDocs com recursos de busca, cópia e temas
- **Integração com GitHub Codespaces**: Configuração do ambiente de desenvolvimento com um clique
- **Caminho de Aprendizado Estruturado**: Exercícios guiados em 8 módulos (3-4 horas no total)
- **Metodologia Progressiva**: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Encerramento → Conclusão
- **Ambiente DevContainer Interativo**: Ferramentas e dependências pré-configuradas

#### 📚 Estrutura dos Módulos do Workshop
O workshop segue uma **metodologia progressiva de 8 módulos** que o leva da descoberta à maestria em implantação:

| Módulo | Tópico | O que você fará | Duração |
|--------|--------|-----------------|---------|
| **0. Introdução** | Visão geral do workshop | Entenda objetivos de aprendizagem, pré-requisitos e estrutura do workshop | 15 min |
| **1. Seleção** | Descoberta de templates | Explore templates AZD e selecione o template de IA adequado para seu cenário | 20 min |
| **2. Validação** | Deploy e Verificação | Implemente o template com `azd up` e valide que a infraestrutura funciona | 30 min |
| **3. Desconstrução** | Entender a Estrutura | Use o GitHub Copilot para explorar a arquitetura do template, arquivos Bicep e organização do código | 30 min |
| **4. Configuração** | Mergulho Profundo em azure.yaml | Domine a configuração `azure.yaml`, hooks de ciclo de vida e variáveis de ambiente | 30 min |
| **5. Personalização** | Personalize | Habilite AI Search, tracing, avaliação e personalize para seu cenário | 45 min |
| **6. Encerramento** | Limpeza | Desprovisione recursos com segurança com `azd down --purge` | 15 min |
| **7. Conclusão** | Próximos Passos | Revise conquistas, conceitos-chave e continue sua jornada de aprendizado | 15 min |

**Fluxo do Workshop:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Começando com o Workshop
```bash
# Opção 1: GitHub Codespaces (Recomendado)
# Clique em "Code" → "Criar codespace na branch main" no repositório

# Opção 2: Desenvolvimento local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Siga as instruções de configuração em workshop/README.md
```

#### 🎯 Resultados de Aprendizagem do Workshop
Ao completar o workshop, os participantes irão:
- **Implantar Aplicações de IA em Produção**: Use AZD com os serviços Microsoft Foundry
- **Dominar Arquiteturas Multi-Agente**: Implemente soluções coordenadas com agentes de IA
- **Implementar Melhores Práticas de Segurança**: Configure autenticação e controle de acesso
- **Otimizar para Escala**: Projete implantações econômicas e de alto desempenho
- **Solução de Problemas em Implantações**: Resolva problemas comuns de forma independente

#### 📖 Recursos do Workshop
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Ambiente de aprendizado baseado em navegador
- **📋 Instruções Módulo a Módulo**:
  - [0. Introdução](workshop/docs/instructions/0-Introduction.md) - Visão geral e objetivos do workshop
  - [1. Seleção](workshop/docs/instructions/1-Select-AI-Template.md) - Encontre e selecione templates de IA
  - [2. Validação](workshop/docs/instructions/2-Validate-AI-Template.md) - Implemente e verifique templates
  - [3. Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explore a arquitetura do template
  - [4. Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) - Domine o azure.yaml
  - [5. Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalize para o seu cenário
  - [6. Encerramento](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Limpe os recursos
  - [7. Conclusão](workshop/docs/instructions/7-Wrap-up.md) - Revisão e próximos passos
- **🛠️ Laboratório do Workshop de IA**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercícios voltados para IA
- **💡 Início Rápido**: [Workshop Setup Guide](workshop/README.md#quick-start) - Configuração do ambiente

**Perfeito para**: Treinamento corporativo, cursos universitários, aprendizado autodirigido e bootcamps de desenvolvedores.

---

## 📖 Mergulho Profundo: Capacidades do AZD

Além do básico, o AZD fornece recursos poderosos para implantações em produção:

- **Implantações baseadas em templates** - Use templates pré-construídos para padrões comuns de aplicação
- **Infraestrutura como Código** - Gerencie recursos do Azure usando Bicep ou Terraform  
- **Workflows integrados** - Provisione, implemente e monitore aplicações de forma contínua
- **Amigável para desenvolvedores** - Otimizado para produtividade e experiência do desenvolvedor

### **AZD + Microsoft Foundry: Perfeito para Implantações de IA**

**Por que AZD para Soluções de IA?** O AZD aborda os principais desafios enfrentados por desenvolvedores de IA:

- **Templates Prontos para IA** - Templates pré-configurados para Microsoft Foundry Models, Cognitive Services e cargas de trabalho de ML
- **Implantações de IA Seguras** - Padrões de segurança integrados para serviços de IA, chaves de API e endpoints de modelos  
- **Padrões de IA para Produção** - Melhores práticas para implantações de aplicações de IA escaláveis e custo-efetivas
- **Workflows de IA de Ponta a Ponta** - Do desenvolvimento de modelos à implantação em produção com monitoramento adequado
- **Otimização de Custos** - Alocação inteligente de recursos e estratégias de escalonamento para cargas de trabalho de IA
- **Integração com Microsoft Foundry** - Conexão contínua ao catálogo de modelos e endpoints do Microsoft Foundry

---

## 🎯 Biblioteca de Templates & Exemplos

### Em destaque: Templates Microsoft Foundry
**Comece aqui se você estiver implantando aplicações de IA!**

> **Observação:** Estes templates demonstram vários padrões de IA. Alguns são Azure Samples externos, outros são implementações locais.

| Template | Capítulo | Complexidade | Serviços | Tipo |
|----------|----------|--------------|----------|------|
| [**Comece com chat de IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externo |
| [**Comece com agentes de IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externo |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externo |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externo |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externo |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externo |
| [**Solução Multi-Agente para Varejo**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Em destaque: Cenários de Aprendizado Completos
**Templates de aplicação prontos para produção mapeados para capítulos de aprendizagem**

| Template | Capítulo de Aprendizado | Complexidade | Aprendizado-chave |
|----------|-------------------------|--------------|-------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Padrões básicos de implantação de IA |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementação RAG com Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capítulo 4 | ⭐⭐ | Integração com Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agentes e chamada de funções |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestração de IA empresarial |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitetura multi-agente com agentes de Cliente e Inventário |

### Aprendizado por Tipo de Exemplo

> **📌 Exemplos Locais vs Externos:**  
> **Exemplos Locais** (neste repositório) = Prontos para uso imediato  
> **Exemplos Externos** (Azure Samples) = Clone dos repositórios vinculados

#### Exemplos Locais (Prontos para Uso)
- [**Solução Multi-Agente para Varejo**](examples/retail-scenario.md) - Implementação completa pronta para produção com templates ARM
  - Arquitetura multi-agente (agentes Cliente + Inventário)
  - Monitoramento e avaliação abrangentes
  - Implantação com um clique via template ARM

#### Exemplos Locais - Aplicações em Container (Capítulos 2-5)
**Exemplos abrangentes de implantação de containers neste repositório:**
- [**Exemplos de Aplicativos em Container**](examples/container-app/README.md) - Guia completo para implantações containerizadas
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST básica com scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Implantação multi-serviço pronta para produção
  - Quick Start, Production, and Advanced deployment patterns
  - Orientações de monitoramento, segurança e otimização de custos

#### Exemplos Externos - Aplicações Simples (Capítulos 1-2)
**Clone estes repositórios Azure Samples para começar:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Padrões básicos de implantação
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implantação de conteúdo estático
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implantação de API REST

#### Exemplos Externos - Integração com Banco de Dados (Capítulos 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Padrões de conectividade com banco de dados
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Fluxo de trabalho de dados serverless

#### Exemplos Externos - Padrões Avançados (Capítulos 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquiteturas multi-serviço
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Processamento em segundo plano  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Padrões de ML prontos para produção

### Coleções de Templates Externas
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Coleção selecionada de templates oficiais e da comunidade
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentação de templates Microsoft Learn
- [**Examples Directory**](examples/README.md) - Exemplos locais de aprendizado com explicações detalhadas

---

## 📚 Recursos de Aprendizagem & Referências

### Referências Rápidas
- [**Guia Rápido de Comandos**](resources/cheat-sheet.md) - Comandos essenciais do azd organizados por capítulo
- [**Glossário**](resources/glossary.md) - Terminologia do Azure e do azd  
- [**FAQ**](resources/faq.md) - Perguntas comuns organizadas por capítulo de aprendizado
- [**Guia de Estudo**](resources/study-guide.md) - Exercícios práticos abrangentes

### Workshops Práticos
- [**Laboratório do Workshop de IA**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Torne suas soluções de IA implantáveis com AZD (2-3 horas)
- [**Workshop Interativo**](workshop/README.md) - Exercícios guiados em 8 módulos com MkDocs e GitHub Codespaces
  - Segue: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Encerramento → Conclusão

### Recursos de Aprendizagem Externos
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculadora de Preços do Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status do Azure](https://status.azure.com/)

### Habilidades de Agentes de IA para seu Editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 skills de agente abertas para Azure AI, Foundry, implantação, diagnóstico, otimização de custos e mais. Instale-as no GitHub Copilot, Cursor, Claude Code, ou em qualquer agente suportado:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guia Rápido de Solução de Problemas

**Problemas comuns que iniciantes enfrentam e soluções imediatas:**

<details>
<summary><strong>❌ "azd: comando não encontrado"</strong></summary>

```bash
# Instale o AZD primeiro
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifique a instalação
azd version
```
</details>

<details>
<summary><strong>❌ "Nenhuma assinatura encontrada" ou "Assinatura não definida"</strong></summary>

```bash
# Listar assinaturas disponíveis
az account list --output table

# Definir assinatura padrão
az account set --subscription "<subscription-id-or-name>"

# Definir para o ambiente AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verificar
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" ou "Cota excedida"</strong></summary>

```bash
# Tente uma região diferente do Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ou use SKUs menores em desenvolvimento
# Edite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "falha do azd up" no meio do processo</strong></summary>

```bash
# Opção 1: Limpar e tentar novamente
azd down --force --purge
azd up

# Opção 2: Apenas corrigir a infraestrutura
azd provision

# Opção 3: Verificar o status detalhado
azd show

# Opção 4: Verificar logs no Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autenticação falhou" ou "Token expirado"</strong></summary>

```bash
# Reautenticar
az logout
az login

azd auth logout
azd auth login

# Verificar a autenticação
az account show
```
</details>

<details>
<summary><strong>❌ "Recurso já existe" ou conflitos de nome</strong></summary>

```bash
# AZD gera nomes únicos, mas se houver conflito:
azd down --force --purge

# Então tente novamente com um ambiente novo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Implantação do template demorando muito</strong></summary>

**Tempos de espera normais:**
- Aplicativo web simples: 5-10 minutos
- Aplicativo com banco de dados: 10-15 minutos
- Aplicações de IA: 15-25 minutos (o provisionamento do OpenAI é lento)

```bash
# Verificar o progresso
azd show

# Se estiver travado por mais de 30 minutos, verifique o Portal do Azure:
azd monitor
# Procure por implantações com falha
```
</details>

<details>
<summary><strong>❌ "Permissão negada" ou "Proibido"</strong></summary>

```bash
# Verifique sua função no Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Você precisa, no mínimo, da função "Contributor"
# Peça ao administrador do Azure que conceda:
# - Contributor (para recursos)
# - User Access Administrator (para atribuições de função)
```
</details>

<details>
<summary><strong>❌ Não consegue encontrar a URL da aplicação implantada</strong></summary>

```bash
# Mostrar todos os endpoints de serviço
azd show

# Ou abra o Portal do Azure
azd monitor

# Verificar serviço específico
azd env get-values
# Procure pelas variáveis *_URL
```
</details>

### 📚 Recursos completos de solução de problemas

- **Guia de Problemas Comuns:** [Soluções Detalhadas](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemas Específicos de IA:** [Solução de Problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guia de Depuração:** [Depuração passo a passo](docs/chapter-07-troubleshooting/debugging.md)
- **Obtenha ajuda:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Conclusão do Curso e Certificação

### Acompanhamento do Progresso
Acompanhe seu progresso de aprendizado em cada capítulo:

- [ ] **Capítulo 1**: Fundamentos & Início Rápido ✅
- [ ] **Capítulo 2**: Desenvolvimento com foco em IA ✅  
- [ ] **Capítulo 3**: Configuração & Autenticação ✅
- [ ] **Capítulo 4**: Infraestrutura como Código & Implantação ✅
- [ ] **Capítulo 5**: Soluções de IA Multi-Agente ✅
- [ ] **Capítulo 6**: Validação & Planejamento pré-implantação ✅
- [ ] **Capítulo 7**: Solução de Problemas & Depuração ✅
- [ ] **Capítulo 8**: Padrões de Produção & Empresariais ✅

### Verificação de Aprendizado
Após concluir cada capítulo, verifique seu conhecimento por meio de:
1. **Exercício Prático**: Complete a implantação prática do capítulo
2. **Verificação de Conhecimento**: Revise a seção de FAQ do seu capítulo
3. **Discussão na Comunidade**: Compartilhe sua experiência no Azure Discord
4. **Próximo Capítulo**: Avance para o próximo nível de complexidade

### Benefícios ao Concluir o Curso
Ao concluir todos os capítulos, você terá:
- **Experiência de Produção**: Implantado aplicativos reais de IA no Azure
- **Habilidades Profissionais**: Capacidades de implantação prontas para o ambiente empresarial  
- **Reconhecimento na Comunidade**: Membro ativo da comunidade de desenvolvedores Azure
- **Avanço na Carreira**: Expertise em AZD e implantação de IA em alta demanda

---

## 🤝 Comunidade & Suporte

### Obter Ajuda & Suporte
- **Problemas Técnicos**: [Reporte bugs e solicite recursos](https://github.com/microsoft/azd-for-beginners/issues)
- **Dúvidas de Aprendizado**: [Comunidade Microsoft Azure no Discord](https://discord.gg/microsoft-azure) e [![Discord do Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajuda Específica de IA**: Junte-se ao [![Discord do Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentação**: [Documentação oficial do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insights da Comunidade no Discord do Microsoft Foundry

**Resultados recentes da enquete no canal #Azure:**
- **45%** dos desenvolvedores querem usar AZD para cargas de trabalho de IA
- **Principais desafios**: Implantações multi-serviço, gerenciamento de credenciais, prontidão para produção  
- **Mais pedidos**: Templates específicos para IA, guias de solução de problemas, melhores práticas

**Junte-se à nossa comunidade para:**
- Compartilhar suas experiências com AZD + IA e obter ajuda
- Acessar prévias antecipadas de novos templates de IA
- Contribuir para as melhores práticas de implantação de IA
- Influenciar o desenvolvimento futuro de recursos de IA + AZD

### Contribuindo para o Curso
Contribuições são bem-vindas! Leia nosso [Guia de Contribuição](CONTRIBUTING.md) para detalhes sobre:
- **Melhorias de Conteúdo**: Aprimore capítulos e exemplos existentes
- **Novos Exemplos**: Adicione cenários e templates do mundo real  
- **Tradução**: Ajude a manter o suporte multilíngue
- **Relatórios de Bugs**: Melhore a precisão e clareza
- **Padrões da Comunidade**: Siga nossas diretrizes inclusivas da comunidade

---

## 📄 Informações do Curso

### Licença
Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](../../LICENSE) para detalhes.

### Recursos Relacionados de Aprendizado da Microsoft

Nossa equipe produz outros cursos abrangentes de aprendizado:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j para Iniciantes](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js para Iniciantes](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain para Iniciantes](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agentes
[![AZD para Iniciantes](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI para Iniciantes](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP para Iniciantes](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Agentes de IA para Iniciantes](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série de IA Generativa
[![IA Generativa para Iniciantes](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Aprendizado Essencial
[![ML para Iniciantes](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Ciência de Dados para Iniciantes](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA para Iniciantes](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cibersegurança para Iniciantes](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Desenvolvimento Web para Iniciantes](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para Iniciantes](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Desenvolvimento XR para Iniciantes](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot para Programação Emparelhada com IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventura do Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navegação do Curso

**🚀 Pronto para começar a aprender?**

**Iniciantes**: Comece com [Capítulo 1: Fundamentos & Início Rápido](#-chapter-1-foundation--quick-start)  
**Desenvolvedores de IA**: Vá para [Capítulo 2: Desenvolvimento com Foco em IA](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Desenvolvedores Experientes**: Comece com [Capítulo 3: Configuração & Autenticação](#️-chapter-3-configuration--authentication)

**Próximos Passos**: [Iniciar Capítulo 1 - Conceitos Básicos do AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->