# AZD Para Principiantes: Uma Jornada de Aprendizagem Estruturada

![AZD-for-beginners](../../translated_images/pt-PT/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduções Automáticas (Sempre Atualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Árabe](../ar/README.md) | [Bengali](../bn/README.md) | [Búlgaro](../bg/README.md) | [Birmanês (Myanmar)](../my/README.md) | [Chinês (Simplificado)](../zh-CN/README.md) | [Chinês (Tradicional, Hong Kong)](../zh-HK/README.md) | [Chinês (Tradicional, Macau)](../zh-MO/README.md) | [Chinês (Tradicional, Taiwan)](../zh-TW/README.md) | [Croata](../hr/README.md) | [Checo](../cs/README.md) | [Dinamarquês](../da/README.md) | [Holandês](../nl/README.md) | [Estónio](../et/README.md) | [Finlandês](../fi/README.md) | [Francês](../fr/README.md) | [Alemão](../de/README.md) | [Grego](../el/README.md) | [Hebraico](../he/README.md) | [Hindi](../hi/README.md) | [Húngaro](../hu/README.md) | [Indonésio](../id/README.md) | [Italiano](../it/README.md) | [Japonês](../ja/README.md) | [Kannada](../kn/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malaio](../ms/README.md) | [Malaiala](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Norueguês](../no/README.md) | [Persa (Farsi)](../fa/README.md) | [Polaco](../pl/README.md) | [Português (Brasil)](../pt-BR/README.md) | [Português (Portugal)](./README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romeno](../ro/README.md) | [Russo](../ru/README.md) | [Sérvio (Cirílico)](../sr/README.md) | [Eslovaco](../sk/README.md) | [Esloveno](../sl/README.md) | [Espanhol](../es/README.md) | [Suaíli](../sw/README.md) | [Sueco](../sv/README.md) | [Tagalo (Filipino)](../tl/README.md) | [Tâmil](../ta/README.md) | [Telugu](../te/README.md) | [Tailandês](../th/README.md) | [Turco](../tr/README.md) | [Ucraniano](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Prefere Clonar Localmente?**

> Este repositório inclui mais de 50 traduções de idiomas, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, use o sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Isto dá-lhe tudo o que precisa para completar o curso com um download muito mais rápido.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 O que é o Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** é uma ferramenta de linha de comando amigável para programadores que facilita o deployment de aplicações no Azure. Em vez de criar e conectar manualmente dezenas de recursos Azure, pode implementar aplicações inteiras com um único comando.

### A Magia do `azd up`

```bash
# Este único comando faz tudo:
# ✅ Cria todos os recursos do Azure
# ✅ Configura a rede e a segurança
# ✅ Compila o código da sua aplicação
# ✅ Faz o deploy para o Azure
# ✅ Dá-lhe uma URL funcional
azd up
```

**É tudo!** Nada de clicar no Portal Azure, nem de aprender templates ARM complexos primeiro, nem de configuração manual - apenas aplicações a funcionar no Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual é a Diferença?

Esta é a pergunta mais comum feita por principiantes. Aqui está a resposta simples:

| Funcionalidade | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|----------------|---------------------|--------------------------------|
| **Objetivo** | Gerir recursos individuais do Azure | Implementar aplicações completas |
| **Mentalidade** | Focado na infraestrutura | Focado na aplicação |
| **Exemplo** | `az webapp create --name myapp...` | `azd up` |
| **Curva de Aprendizagem** | Precisa conhecer serviços Azure | Só precisa conhecer a sua app |
| **Ideal Para** | DevOps, Infraestrutura | Desenvolvedores, Prototipagem |

### Analogia Simples

- **Azure CLI** é como ter todas as ferramentas para construir uma casa - martelos, serras, pregos. Pode construir qualquer coisa, mas precisa de saber construção.
- **Azure Developer CLI** é como contratar um empreiteiro - descreve o que quer, e eles tratam da construção.

### Quando Usar Cada Um

| Cenário | Use Este |
|---------|----------|
| "Quero implementar a minha aplicação web rapidamente" | `azd up` |
| "Preciso criar apenas uma conta de armazenamento" | `az storage account create` |
| "Estou a construir uma aplicação AI completa" | `azd init --template azure-search-openai-demo` |
| "Preciso depurar um recurso Azure específico" | `az resource show` |
| "Quero um deployment pronto para produção em minutos" | `azd up --environment production` |

### Eles Trabalham Juntos!

AZD usa o Azure CLI por baixo. Pode usar ambos:
```bash
# Implemente a sua aplicação com o AZD
azd up

# Em seguida, afine recursos específicos com a Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Encontre Templates no Awesome AZD

Não comece do zero! **Awesome AZD** é a coleção comunitária de templates prontos para deployment:

| Recurso | Descrição |
|---------|-----------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Navegue por mais de 200 templates com deploy de um clique |
| 🔗 [**Submeta um Template**](https://github.com/Azure/awesome-azd/issues) | Contribua com o seu próprio template para a comunidade |
| 🔗 [**Repositório GitHub**](https://github.com/Azure/awesome-azd) | Dê estrela e explore o código-fonte |

### Templates Populares de IA no Awesome AZD

```bash
# Conversa RAG com Azure OpenAI + AI Search
azd init --template azure-search-openai-demo

# Aplicação rápida de chat com IA
azd init --template openai-chat-app-quickstart

# Agentes de IA com Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Começar em 3 Passos

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

### Passo 2: Iniciar Sessão no Azure

```bash
azd auth login
```

### Passo 3: Implementar a Sua Primeira Aplicação

```bash
# Inicializar a partir de um modelo
azd init --template todo-nodejs-mongo

# Implementar no Azure (cria tudo!)
azd up
```

**🎉 Está feito!** A sua aplicação está agora ativa no Azure.

### Limpar (Não Esqueça!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Como Usar Este Curso

Este curso é desenhado para uma **aprendizagem progressiva** - comece onde se sentir confortável e avance:

| A Sua Experiência | Comece Aqui |
|-------------------|-------------|
| **Novo no Azure** | [Capítulo 1: Fundamentos](../..) |
| **Conhece Azure, novo no AZD** | [Capítulo 1: Fundamentos](../..) |
| **Quer implementar apps AI** | [Capítulo 2: Desenvolvimento AI-First](../..) |
| **Quer prática prática** | [🎓 Workshop Interativo](workshop/README.md) - laboratório guiado de 3-4 horas |
| **Precisa de padrões de produção** | [Capítulo 8: Produção & Empresarial](../..) |

### Configuração Rápida

1. **Faça Fork deste Repositório**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone-o**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtenha Ajuda**: [Comunidade Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Prefere Clonar Localmente?**

> Este repositório inclui mais de 50 traduções de idiomas, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, use o sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Isto dá-lhe tudo o que precisa para completar o curso com um download muito mais rápido.


## Visão Geral do Curso

Domine o Azure Developer CLI (azd) através de capítulos estruturados para aprendizagem progressiva. **Foco especial na implementação de aplicações AI com integração Microsoft Foundry.**

### Por Que Este Curso é Essencial para Desenvolvedores Modernos

Baseado em insights da comunidade Microsoft Foundry Discord, **45% dos desenvolvedores querem usar AZD para cargas de trabalho AI** mas encontram desafios com:
- Arquiteturas AI complexas de múltiplos serviços
- Melhores práticas para deployment AI em produção  
- Integração e configuração de serviços Azure AI
- Otimização de custos para cargas AI
- Resolução de problemas específicos de deployment AI

### Objetivos de Aprendizagem

Ao concluir este curso estruturado, irá:
- **Dominar os Fundamentos do AZD**: conceitos principais, instalação e configuração
- **Implementar Aplicações AI**: usar AZD com serviços Microsoft Foundry
- **Implementar Infraestrutura como Código**: gerir recursos Azure com templates Bicep
- **Resolver Problemas de Deployment**: diagnosticar problemas comuns e debug
- **Otimizar para Produção**: segurança, escalabilidade, monitorização e gestão de custos
- **Construir Soluções Multi-Agente**: implementar arquiteturas AI complexas

## 🗺️ Mapa do Curso: Navegação Rápida por Capítulo

Cada capítulo tem um README dedicado com objetivos de aprendizagem, inícios rápidos e exercícios:

| Capítulo | Tema | Lições | Duração | Complexidade |
|----------|------|--------|---------|-------------|
| **[Cap 1: Fundamentos](docs/chapter-01-foundation/README.md)** | Início | [Noções Básicas do AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalação](docs/chapter-01-foundation/installation.md) &#124; [Primeiro Projeto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap 2: Desenvolvimento AI](docs/chapter-02-ai-development/README.md)** | Apps AI-First | [Integração Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agentes AI](docs/chapter-02-ai-development/agents.md) &#124; [Deployment Modelo AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Cap 3: Configuração](docs/chapter-03-configuration/README.md)** | Autenticação & Segurança | [Configuração](docs/chapter-03-configuration/configuration.md) &#124; [Autenticação & Segurança](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infraestrutura](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Guia de Deployment](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionamento](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Cap 5: Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluções de Agentes de IA | [Cenário de Retalho](examples/retail-scenario.md) &#124; [Padrões de Coordenação](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Cap 6: Pré-Implementação](docs/chapter-06-pre-deployment/README.md)** | Planeamento & Validação | [Verificações Pré-Implementação](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planeamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Cap 7: Resolução de Problemas](docs/chapter-07-troubleshooting/README.md)** | Depuração & Correção | [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depuração](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Cap 8: Produção](docs/chapter-08-production/README.md)** | Padrões Empresariais | [Práticas de Produção](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratório Prático | [Introdução](workshop/docs/instructions/0-Introduction.md) &#124; [Seleção](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validação](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusão](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Duração Total do Curso:** ~10-14 horas | **Progressão de Competências:** Iniciante → Pronto para Produção

---

## 📚 Capítulos de Aprendizagem

*Selecione o seu caminho de aprendizagem com base no nível de experiência e objetivos*

### 🚀 Capítulo 1: Fundamentos & Início Rápido
**Pré-requisitos**: Subscrição Azure, conhecimentos básicos de linha de comandos  
**Duração**: 30-45 minutos  
**Complexidade**: ⭐

#### O Que Vai Aprender
- Compreender os fundamentos do Azure Developer CLI
- Instalar o AZD na sua plataforma
- O seu primeiro deployment com sucesso

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [O que é o Azure Developer CLI?](../..)
- **📖 Teoria**: [Conceitos Básicos do AZD](docs/chapter-01-foundation/azd-basics.md) - Conceitos e terminologia principais
- **⚙️ Configuração**: [Instalação & Configuração](docs/chapter-01-foundation/installation.md) - Guias específicos para plataforma
- **🛠️ Prático**: [O Seu Primeiro Projeto](docs/chapter-01-foundation/first-project.md) - Tutorial passo a passo
- **📋 Referência Rápida**: [Resumo de Comandos](resources/cheat-sheet.md)

#### Exercícios Práticos
```bash
# Verificação rápida de instalação
azd version

# Desplegue a sua primeira aplicação
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resultado do Capítulo**: Fazer o deployment bem-sucedido de uma aplicação web simples para Azure usando AZD

**✅ Validação de Sucesso:**
```bash
# Após completar o Capítulo 1, deverá ser capaz de:
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                  # Faz o deployment para o Azure
azd show                # Exibe a URL da aplicação em execução
# A aplicação abre no navegador e funciona
azd down --force --purge  # Limpa os recursos
```

**📊 Tempo Investido:** 30-45 minutos  
**📈 Nível de Competência Após:** Capaz de implementar aplicações básicas de forma independente

**✅ Validação de Sucesso:**
```bash
# Depois de completar o Capítulo 1, deverá ser capaz de:
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                  # Desdobra para o Azure
azd show                # Exibe a URL da aplicação em execução
# A aplicação abre no navegador e funciona
azd down --force --purge  # Limpa os recursos
```

**📊 Tempo Investido:** 30-45 minutos  
**📈 Nível de Competência Após:** Capaz de implementar aplicações básicas de forma independente

---

### 🤖 Capítulo 2: Desenvolvimento com IA em Primeiro Plano (Recomendado para Desenvolvedores de IA)
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 1-2 horas  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Integração Microsoft Foundry com AZD
- Deployment de aplicações potenciadas por IA
- Compreensão das configurações dos serviços de IA

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [Integração Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agentes de IA**: [Guia de Agentes de IA](docs/chapter-02-ai-development/agents.md) - Implementar agentes inteligentes com AZD
- **📖 Padrões**: [Deployment de Modelos de IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementar e gerir modelos de IA
- **🛠️ Workshop**: [Laboratório do Workshop de IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Prepare as suas soluções de IA para AZD
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Aprendizagem via browser com MkDocs * Ambiente DevContainer
- **📋 Modelos**: [Modelos Microsoft Foundry em Destaque](../..)
- **📝 Exemplos**: [Exemplos de Deployment AZD](examples/README.md)

#### Exercícios Práticos
```bash
# Desdobre a sua primeira aplicação de IA
azd init --template azure-search-openai-demo
azd up

# Experimente modelos adicionais de IA
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resultado do Capítulo**: Implementar e configurar uma aplicação de chat com IA e capacidades RAG

**✅ Validação de Sucesso:**
```bash
# Após o Capítulo 2, deverá ser capaz de:
azd init --template azure-search-openai-demo
azd up
# Testar a interface de chat de IA
# Fazer perguntas e obter respostas com IA e fontes
# Verificar se a integração de pesquisa funciona
azd monitor  # Confirmar que o Application Insights mostra telemetria
azd down --force --purge
```

**📊 Tempo Investido:** 1-2 horas  
**📈 Nível de Competência Após:** Capaz de implementar e configurar aplicações de IA prontas para produção  
**💰 Consciência de Custos:** Compreender custos de $80-150/mês em desenvolvimento e $300-3500/mês em produção

#### 💰 Considerações de Custos para Deployments de IA

**Ambiente de Desenvolvimento (Estimado $80-150/mês):**
- Azure OpenAI (Pagamento por uso): $0-50/mês (baseado no uso de tokens)
- Pesquisa IA (nível básico): $75/mês
- Container Apps (Consumo): $0-20/mês
- Armazenamento (Standard): $1-5/mês

**Ambiente de Produção (Estimado $300-3.500+/mês):**
- Azure OpenAI (PTU para desempenho consistente): $3.000+/mês OU Pagamento por uso com volume elevado
- Pesquisa IA (nível Standard): $250/mês
- Container Apps (Dedicado): $50-100/mês
- Application Insights: $5-50/mês
- Armazenamento (Premium): $10-50/mês

**💡 Dicas de Otimização de Custos:**
- Use **Free Tier** Azure OpenAI para aprendizagem (50.000 tokens/mês incluídos)
- Execute `azd down` para desalocar recursos quando não estiver a desenvolver ativamente
- Comece com faturação por consumo, faça upgrade para PTU apenas em produção
- Use `azd provision --preview` para estimar custos antes do deployment
- Ative auto-escalonamento: pague apenas pelo uso real

**Monitorização de Custos:**
```bash
# Verificar custos mensais estimados
azd provision --preview

# Monitorizar custos reais no Portal Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capítulo 3: Configuração & Autenticação
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 45-60 minutos  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Configuração e gestão de ambientes
- Melhores práticas de autenticação e segurança
- Nomeação e organização de recursos

#### Recursos de Aprendizagem
- **📖 Configuração**: [Guia de Configuração](docs/chapter-03-configuration/configuration.md) - Preparação do ambiente
- **🔐 Segurança**: [Padrões de autenticação e identidade gerida](docs/chapter-03-configuration/authsecurity.md) - Padrões de autenticação
- **📝 Exemplos**: [Exemplo Aplicação Base de Dados](examples/database-app/README.md) - Exemplos AZD para base de dados

#### Exercícios Práticos
- Configurar múltiplos ambientes (dev, staging, prod)
- Configurar autenticação com identidade gerida
- Implementar configurações específicas por ambiente

**💡 Resultado do Capítulo**: Gerir múltiplos ambientes com autenticação e segurança adequadas

---

### 🏗️ Capítulo 4: Infraestrutura como Código & Deployment
**Pré-requisitos**: Capítulos 1-3 concluídos  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐⭐

#### O Que Vai Aprender
- Padrões avançados de deployment
- Infraestrutura como Código com Bicep
- Estratégias de provisionamento de recursos

#### Recursos de Aprendizagem
- **📖 Deployment**: [Guia de Deployment](docs/chapter-04-infrastructure/deployment-guide.md) - Fluxos completos
- **🏗️ Provisionamento**: [Provisionamento de Recursos](docs/chapter-04-infrastructure/provisioning.md) - Gestão de recursos Azure
- **📝 Exemplos**: [Exemplo Container App](../../examples/container-app) - Deployments conteinerizados

#### Exercícios Práticos
- Criar templates Bicep personalizados
- Implementar aplicações multi-serviço
- Implementar estratégias de deployment blue-green

**💡 Resultado do Capítulo**: Implementar aplicações multi-serviço complexas com templates de infraestrutura personalizados

---

### 🎯 Capítulo 5: Soluções Multi-Agente de IA (Avançado)
**Pré-requisitos**: Capítulos 1-2 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O Que Vai Aprender
- Padrões de arquitetura multi-agente
- Orquestração e coordenação de agentes
- Deployments de IA prontos para produção

#### Recursos de Aprendizagem
- **🤖 Projeto em Destaque**: [Solução Multi-Agente para Retalho](examples/retail-scenario.md) - Implementação completa
- **🛠️ Templates ARM**: [Pacote de Template ARM](../../examples/retail-multiagent-arm-template) - Deployment de um clique
- **📖 Arquitetura**: [Padrões de coordenação multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Padrões

#### Exercícios Práticos
```bash
# Desplegar a solução completa multiagente de retalho
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorar configurações de agentes
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultado do Capítulo**: Implementar e gerir uma solução multi-agente de IA pronta para produção com agentes de Cliente e Inventário

---

### 🔍 Capítulo 6: Validação & Planeamento Pré-Implementação
**Pré-requisitos**: Capítulo 4 concluído  
**Duração**: 1 hora  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Planeamento de capacidade e validação de recursos
- Estratégias de seleção de SKU
- Verificações pré-implementação e automação

#### Recursos de Aprendizagem
- **📊 Planeamento**: [Planeamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) - Validação de recursos
- **💰 Seleção**: [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Escolhas custo-efetivas
- **✅ Validação**: [Verificações Pré-Implementação](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatizados

#### Exercícios Práticos
- Executar scripts de validação de capacidade
- Otimizar seleções de SKU para custo
- Implementar verificações pré-implementação automatizadas

**💡 Resultado do Capítulo**: Validar e otimizar deployments antes da execução

---

### 🚨 Capítulo 7: Resolução de Problemas & Depuração
**Pré-requisitos**: Qualquer capítulo de deployment concluído  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Abordagens sistemáticas de depuração
- Problemas comuns e soluções
- Resolução específica para IA

#### Recursos de Aprendizagem
- **🔧 Problemas Comuns**: [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluções
- **🕵️ Depuração**: [Guia de Depuração](docs/chapter-07-troubleshooting/debugging.md) - Estratégias passo a passo
- **🤖 Problemas de IA**: [Resolução Específica para IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas dos serviços IA

#### Exercícios Práticos
- Diagnosticar falhas de deployment
- Resolver problemas de autenticação
- Depurar conectividade dos serviços de IA

**💡 Resultado do Capítulo**: Diagnosticar e resolver problemas comuns de deployment de forma independente

---

### 🏢 Capítulo 8: Produção & Padrões Empresariais
**Pré-requisitos**: Capítulos 1-4 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O Que Vai Aprender
- Estratégias de deployment para produção
- Padrões de segurança empresariais
- Monitorização e otimização de custos

#### Recursos de Aprendizagem
- **🏭 Produção**: [Melhores Práticas de IA em Produção](docs/chapter-08-production/production-ai-practices.md) - Padrões empresariais
- **📝 Exemplos**: [Exemplo Microserviços](../../examples/microservices) - Arquiteturas complexas
- **📊 Monitorização**: [Integração Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorização

#### Exercícios Práticos
- Implementar padrões de segurança empresariais
- Configurar monitorização abrangente
- Fazer deployment para produção com governação adequada

**💡 Resultado do Capítulo**: Implementar aplicações prontas para produção empresarial com funcionalidades completas

---

## 🎓 Visão Geral do Workshop: Experiência Prática de Aprendizagem

> **⚠️ ESTADO DO WORKSHOP: Desenvolvimento Ativo**  
> Os materiais do workshop estão a ser atualmente desenvolvidos e refinados. Os módulos principais estão funcionais, mas algumas secções avançadas estão incompletas. Estamos a trabalhar ativamente para completar todo o conteúdo. [Acompanhe o progresso →](workshop/README.md)

### Materiais Interativos do Workshop
**Aprendizagem prática abrangente com ferramentas baseadas no navegador e exercícios guiados**
Os materiais do nosso workshop proporcionam uma experiência de aprendizagem estruturada e interativa que complementa o currículo baseado em capítulos acima. O workshop está concebido tanto para aprendizagem autónoma como para sessões conduzidas por um instrutor.

#### 🛠️ Características do Workshop
- **Interface Baseada no Navegador**: Workshop completo com suporte a MkDocs, com funcionalidades de pesquisa, copiar e tema
- **Integração com GitHub Codespaces**: Configuração do ambiente de desenvolvimento com um clique
- **Caminho de Aprendizagem Estruturado**: Exercícios guiados em 8 módulos (3-4 horas no total)
- **Metodologia Progressiva**: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Desmontagem → Conclusão
- **Ambiente Interativo DevContainer**: Ferramentas e dependências pré-configuradas

#### 📚 Estrutura dos Módulos do Workshop
O workshop segue uma **metodologia progressiva em 8 módulos** que o leva desde a descoberta até à maestria do deployment:

| Módulo | Tema | O Que Vai Fazer | Duração |
|--------|-------|----------------|----------|
| **0. Introdução** | Visão Geral do Workshop | Compreender objetivos de aprendizagem, pré-requisitos e estrutura do workshop | 15 min |
| **1. Seleção** | Descoberta de Templates | Explorar templates AZD e escolher o template AI adequado ao seu cenário | 20 min |
| **2. Validação** | Deploy & Verificação | Deploy do template com `azd up` e validação do funcionamento da infraestrutura | 30 min |
| **3. Desconstrução** | Compreender a Estrutura | Usar GitHub Copilot para explorar arquitetura do template, ficheiros Bicep e organização de código | 30 min |
| **4. Configuração** | Análise ao azure.yaml | Dominar a configuração em `azure.yaml`, lifecycle hooks e variáveis de ambiente | 30 min |
| **5. Personalização** | Tornar Seu | Ativar AI Search, tracing, avaliação e personalizar para o seu cenário | 45 min |
| **6. Desmontagem** | Limpeza | Desaprovisionar recursos de forma segura com `azd down --purge` | 15 min |
| **7. Conclusão** | Próximos Passos | Rever conquistas, conceitos chave e continuar a sua jornada de aprendizagem | 15 min |

**Fluxo do Workshop:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Iniciar o Workshop
```bash
# Opção 1: GitHub Codespaces (Recomendado)
# Clique em "Code" → "Create codespace on main" no repositório

# Opção 2: Desenvolvimento Local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Siga as instruções de configuração em workshop/README.md
```

#### 🎯 Resultados de Aprendizagem do Workshop
Ao completar o workshop, os participantes irão:
- **Deploy de Aplicações AI em Produção**: Utilizar AZD com serviços Microsoft Foundry
- **Dominar Arquiteturas Multi-Agente**: Implementar soluções de agentes AI coordenados
- **Implementar Boas Práticas de Segurança**: Configurar autenticação e controlo de acesso
- **Otimizar para Escalabilidade**: Projetar deploys custo-efetivos e com bom desempenho
- **Resolver Problemas de Deploy**: Solucionar problemas comuns de forma independente

#### 📖 Recursos do Workshop
- **🎥 Guia Interativo**: [Workshop Materials](workshop/README.md) - Ambiente de aprendizagem baseado no navegador
- **📋 Instruções Módulo a Módulo**:
  - [0. Introdução](workshop/docs/instructions/0-Introduction.md) - Visão geral e objetivos do workshop
  - [1. Seleção](workshop/docs/instructions/1-Select-AI-Template.md) - Encontrar e escolher templates AI
  - [2. Validação](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy e verificação de templates
  - [3. Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorar arquitetura do template
  - [4. Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) - Dominar azure.yaml
  - [5. Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizar para o seu cenário
  - [6. Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Limpar recursos
  - [7. Conclusão](workshop/docs/instructions/7-Wrap-up.md) - Revisão e próximos passos
- **🛠️ Laboratório AI Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercícios focados em AI
- **💡 Arranque Rápido**: [Workshop Setup Guide](workshop/README.md#quick-start) - Configuração do ambiente

**Perfeito para**: Formação corporativa, cursos universitários, aprendizagem autónoma e bootcamps para programadores.

---

## 📖 Análise Detalhada: Capacidades AZD

Para além do básico, o AZD oferece funcionalidades poderosas para deployments de produção:

- **Deploys baseados em templates** - Utilizar templates pré-construídos para padrões comuns de aplicações
- **Infraestrutura como Código** - Gerir recursos Azure com Bicep ou Terraform  
- **Workflows integrados** - Provisionar, deployar e monitorizar aplicações sem interrupções
- **Amigo do programador** - Otimizado para produtividade e experiência do programador

### **AZD + Microsoft Foundry: Perfeito para Deployments AI**

**Porquê AZD para Soluções AI?** O AZD responde aos principais desafios que os programadores AI enfrentam:

- **Templates Prontos para AI** - Templates pré-configurados para Azure OpenAI, Cognitive Services e workloads ML
- **Deploys AI Seguros** - Padrões de segurança incorporados para serviços AI, chaves API e endpoints de modelos  
- **Padrões de AI para Produção** - Boas práticas para deploys escaláveis e custo-efetivos de aplicações AI
- **Workflows AI Fim-a-Fim** - Desde desenvolvimento do modelo até deployment com monitorização adequada
- **Otimização de Custos** - Estratégias inteligentes de alocação e escalabilidade para workloads AI
- **Integração com Microsoft Foundry** - Ligação contínua ao catálogo e endpoints de modelos Microsoft Foundry

---

## 🎯 Biblioteca de Templates & Exemplos

### Destaque: Templates Microsoft Foundry
**Comece aqui se vai deployar aplicações AI!**

> **Nota:** Estes templates demonstram vários padrões AI. Alguns são Azure Samples externos, outros implementações locais.

| Template | Capítulo | Complexidade | Serviços | Tipo |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externo |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externo |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externo |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externo |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externo |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externo |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Destaque: Cenários Completos de Aprendizagem
**Templates de aplicações prontas para produção mapeadas aos capítulos de aprendizagem**

| Template | Capítulo de Aprendizagem | Complexidade | Aprendizagem Principal |
|----------|--------------------------|--------------|------------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Padrões básicos de deploy AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementação RAG com Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capítulo 4 | ⭐⭐ | Integração Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agentes e chamadas a funções |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestração AI empresarial |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitetura multi-agente com agentes de Cliente e Inventário |

### Aprender por Tipo de Exemplo

> **📌 Exemplos Locais vs. Externos:**  
> **Exemplos Locais** (neste repositório) = Prontos a usar imediatamente  
> **Exemplos Externos** (Azure Samples) = Clonar dos repositórios indicados

#### Exemplos Locais (Prontos a Usar)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Implementação completa pronta para produção com ARM templates
  - Arquitetura multi-agente (agentes Cliente + Inventário)
  - Monitorização e avaliação abrangente
  - Deploy com um clique via template ARM

#### Exemplos Locais - Aplicações Containerizadas (Capítulos 2-5)
**Exemplos completos de deploy de containers neste repositório:**
- [**Container App Examples**](examples/container-app/README.md) - Guia completo para deploys em containers
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST básica com scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Deploy multi-serviço pronto para produção
  - Padrões de deploy Quick Start, Produção e Avançado
  - Guias para monitorização, segurança e otimização de custos

#### Exemplos Externos - Aplicações Simples (Capítulos 1-2)
**Clonar estes repositórios Azure Samples para começar:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Padrões básicos de deploy
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deploy de conteúdo estático
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deploy API REST

#### Exemplos Externos - Integração de Base de Dados (Capítulos 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Padrões de conectividade a base de dados
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Workflow sem servidor para dados

#### Exemplos Externos - Padrões Avançados (Capítulos 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquiteturas multi-serviço
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Processamento em segundo plano  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Padrões ML prontos para produção

### Coleções de Templates Externos
- [**Galeria Oficial de Templates AZD**](https://azure.github.io/awesome-azd/) - Coleção selecionada de templates oficiais e da comunidade
- [**Templates Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentação de templates Microsoft Learn
- [**Directório de Exemplos**](examples/README.md) - Exemplos locais de aprendizagem com explicações detalhadas

---

## 📚 Recursos de Aprendizagem & Referências

### Referências Rápidas
- [**Folha de Comandos**](resources/cheat-sheet.md) - Comandos essenciais azd organizados por capítulo
- [**Glossário**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Perguntas frequentes organizadas por capítulo de aprendizagem
- [**Guia de Estudo**](resources/study-guide.md) - Exercícios práticos abrangentes

### Workshops Práticos
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tornar soluções AI deployáveis com AZD (2-3 horas)
- [**Workshop Interativo**](workshop/README.md) - Exercícios guiados em 8 módulos com MkDocs e GitHub Codespaces
  - Segue: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Desmontagem → Conclusão

### Recursos Externos de Aprendizagem
- [Documentação Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculadora de Preços Azure](https://azure.microsoft.com/pricing/calculator/)
- [Estado do Azure](https://status.azure.com/)

---

## 🔧 Guia Rápido de Resolução de Problemas

**Problemas comuns enfrentados por iniciantes e soluções imediatas:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Instale primeiro o AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verificar instalação
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Listar assinaturas disponíveis
az account list --output table

# Definir assinatura padrão
az account set --subscription "<subscription-id-or-name>"

# Definir para ambiente AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verificar
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Experimente diferentes regiões Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ou use SKUs mais pequenos no desenvolvimento
# Edite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>
```bash
# Opção 1: Limpar e tentar novamente
azd down --force --purge
azd up

# Opção 2: Apenas corrigir a infraestrutura
azd provision

# Opção 3: Verificar estado detalhado
azd show

# Opção 4: Verificar os registos no Azure Monitor
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

# Verificar autenticação
az account show
```
</details>

<details>
<summary><strong>❌ "Recurso já existe" ou conflitos de nomes</strong></summary>

```bash
# AZD gera nomes únicos, mas em caso de conflito:
azd down --force --purge

# Então tente novamente com um ambiente novo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Implantação do template a demorar demasiado</strong></summary>

**Tempos normais de espera:**
- Aplicação web simples: 5-10 minutos
- Aplicação com base de dados: 10-15 minutos
- Aplicações de IA: 15-25 minutos (Provisionamento do OpenAI é lento)

```bash
# Verificar progresso
azd show

# Se estiver parado >30 minutos, verificar o Portal Azure:
azd monitor
# Procurar implantações falhadas
```
</details>

<details>
<summary><strong>❌ "Permissão negada" ou "Proibido"</strong></summary>

```bash
# Verifique o seu papel no Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Precisa pelo menos do papel "Colaborador"
# Peça ao administrador do Azure para conceder:
# - Colaborador (para recursos)
# - Administrador de Acesso de Utilizadores (para atribuições de papéis)
```
</details>

<details>
<summary><strong>❌ Não consegue encontrar a URL da aplicação implantada</strong></summary>

```bash
# Mostrar todos os pontos de extremidade do serviço
azd show

# Ou abrir o Portal Azure
azd monitor

# Verificar serviço específico
azd env get-values
# Procurar variáveis *_URL
```
</details>

### 📚 Recursos completos de resolução de problemas

- **Guia de Problemas Comuns:** [Soluções Detalhadas](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemas Específicos de IA:** [Resolução de Problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guia de Debugging:** [Debugging passo a passo](docs/chapter-07-troubleshooting/debugging.md)
- **Obtenha Ajuda:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Conclusão do Curso & Certificação

### Acompanhamento do Progresso
Acompanhe o seu progresso de aprendizagem em cada capítulo:

- [ ] **Capítulo 1**: Fundamentos & Arranque Rápido ✅
- [ ] **Capítulo 2**: Desenvolvimento AI-Primeiro ✅  
- [ ] **Capítulo 3**: Configuração & Autenticação ✅
- [ ] **Capítulo 4**: Infraestrutura como Código & Implantação ✅
- [ ] **Capítulo 5**: Soluções AI Multi-Agente ✅
- [ ] **Capítulo 6**: Validação & Planeamento Pré-implantação ✅
- [ ] **Capítulo 7**: Resolução de Problemas & Debugging ✅
- [ ] **Capítulo 8**: Padrões de Produção & Empresariais ✅

### Verificação de Aprendizagem
Após completar cada capítulo, verifique os seus conhecimentos por:
1. **Exercício Prático**: Complete a implantação prática do capítulo
2. **Teste de Conhecimentos**: Reveja a secção de FAQ do seu capítulo
3. **Discussão na Comunidade**: Partilhe a sua experiência no Azure Discord
4. **Próximo Capítulo**: Avance para o próximo nível de complexidade

### Benefícios da Conclusão do Curso
Ao concluir todos os capítulos, estará apto para:
- **Experiência em Produção**: Implantar aplicações AI reais na Azure
- **Competências Profissionais**: Capacidades de implantação empresariais  
- **Reconhecimento Comunitário**: Membro ativo da comunidade de desenvolvedores Azure
- **Avanço na Carreira**: Especialização em AZD e implantação de IA muito procurada

---

## 🤝 Comunidade & Suporte

### Obtenha Ajuda & Suporte
- **Problemas Técnicos**: [Reportar bugs e pedir funcionalidades](https://github.com/microsoft/azd-for-beginners/issues)
- **Perguntas de Aprendizagem**: [Comunidade Microsoft Azure Discord](https://discord.gg/microsoft-azure) e [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajuda Específica para IA**: Junte-se a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentação**: [Documentação oficial do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insights da Comunidade no Microsoft Foundry Discord

**Resultados recentes da sondagem no canal #Azure:**
- **45%** dos programadores querem usar AZD para cargas de trabalho de IA
- **Principais desafios**: Implantação multi-serviço, gestão de credenciais, prontidão para produção  
- **Mais solicitados**: Templates específicos de IA, guias de resolução de problemas, melhores práticas

**Junte-se à nossa comunidade para:**
- Partilhar as suas experiências AZD + IA e obter ajuda
- Aceder a prévias antecipadas de novos templates de IA
- Contribuir com melhores práticas de implantação de IA
- Influenciar o futuro desenvolvimento de funcionalidades AI + AZD

### Contribuir para o Curso
Aceitamos contribuições! Por favor leia o nosso [Guia de Contribuições](CONTRIBUTING.md) para detalhes sobre:
- **Melhorias de Conteúdo**: Aprimore capítulos e exemplos existentes
- **Novos Exemplos**: Adicione cenários e templates do mundo real  
- **Tradução**: Ajude a manter o suporte multilingue
- **Reportar Bugs**: Melhore a precisão e clareza
- **Normas da Comunidade**: Siga as nossas diretrizes inclusivas da comunidade

---

## 📄 Informações do Curso

### Licença
Este projeto está licenciado sob a Licença MIT - veja o ficheiro [LICENSE](../../LICENSE) para detalhes.

### Recursos de Aprendizagem Relacionados da Microsoft

A nossa equipa produz outros cursos completos de aprendizagem:

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
[![Agentes AI para Iniciantes](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série de IA Generativa
[![IA Generativa para Iniciantes](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![IA Generativa (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Aprendizagem Básica
[![ML para Iniciantes](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Ciência de Dados para Iniciantes](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA para Iniciantes](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cibersegurança para Iniciantes](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Desenvolvimento Web para Iniciantes](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para Iniciantes](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Desenvolvimento XR para Iniciantes](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot para Programação Pareada de IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navegação do Curso

**🚀 Pronto para Começar a Aprender?**

**Iniciantes**: Comece com [Capítulo 1: Fundamentos & Arranque Rápido](../..)  

**Desenvolvedores de IA**: Ir para [Capítulo 2: Desenvolvimento AI-First](../..)  
**Desenvolvedores Experientes**: Começar com [Capítulo 3: Configuração & Autenticação](../..)

**Próximos Passos**: [Começar o Capítulo 1 - Noções Básicas do AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, por favor tenha em conta que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->