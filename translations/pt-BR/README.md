# AZD Para Iniciantes: Uma Jornada de Aprendizado Estruturada

![AZD-para-iniciantes](../../translated_images/pt-BR/azdbeginners.5527441dd9f74068.webp) 

[![Observadores do GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks do GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Estrelas do GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord do Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord da Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduções Automatizadas (Sempre Atualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](./README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Prefere clonar localmente?**
>
> Este repositório inclui traduções em 50+ idiomas, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, use sparse checkout:
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
> Isso fornece tudo o que você precisa para completar o curso com um download muito mais rápido.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Novidades no azd hoje

Azure Developer CLI cresceu além de aplicações web tradicionais e APIs. Hoje, o azd é a ferramenta única para implantar **qualquer** aplicação no Azure — incluindo aplicações com recursos de IA e agentes inteligentes.

Aqui está o que isso significa para você:

- **Agentes de IA agora são cargas de trabalho de primeira classe no azd.** Você pode inicializar, implantar e gerenciar projetos de agentes de IA usando o mesmo fluxo `azd init` → `azd up` que você já conhece.
- **Integração com Microsoft Foundry** traz implantação de modelos, hospedagem de agentes e configuração de serviços de IA diretamente para o ecossistema de templates do azd.
- **O fluxo principal não mudou.** Seja você implantando um app de tarefas, um microsserviço ou uma solução multi-agente de IA, os comandos são os mesmos.

Se você já usou azd antes, o suporte a IA é uma extensão natural — não uma ferramenta separada ou uma trilha avançada. Se você está começando agora, aprenderá um fluxo que funciona para tudo.

---

## 🚀 O que é o Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** é uma ferramenta de linha de comando amigável para desenvolvedores que facilita a implantação de aplicações no Azure. Em vez de criar e conectar manualmente dezenas de recursos do Azure, você pode implantar aplicações inteiras com um único comando.

### A Mágica do `azd up`

```bash
# Este comando único faz tudo:
# ✅ Cria todos os recursos do Azure
# ✅ Configura a rede e a segurança
# ✅ Compila o código da sua aplicação
# ✅ Faz o deploy no Azure
# ✅ Fornece uma URL funcional
azd up
```

**Isso é tudo!** Sem cliques no Azure Portal, sem templates ARM complexos para aprender primeiro, sem configuração manual — apenas aplicações funcionando no Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual é a Diferença?

Esta é a pergunta mais comum que iniciantes fazem. Aqui está a resposta simples:

| Recurso | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Finalidade** | Gerenciar recursos individuais do Azure | Implantar aplicações completas |
| **Mentalidade** | Focado em infraestrutura | Focado em aplicação |
| **Exemplo** | `az webapp create --name myapp...` | `azd up` |
| **Curva de Aprendizado** | É necessário conhecer os serviços do Azure | Basta conhecer sua aplicação |
| **Ideal Para** | DevOps, Infraestrutura | Desenvolvedores, Prototipagem |

### Analogia Simples

- **Azure CLI** é como ter todas as ferramentas para construir uma casa — martelos, serras, pregos. Você pode construir qualquer coisa, mas precisa saber construção.
- **Azure Developer CLI** é como contratar um empreiteiro — você descreve o que quer, e ele cuida da construção.

### Quando Usar Cada Um

| Cenário | Use |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Eles Funcionam Juntos!

AZD usa Azure CLI por baixo dos panos. Você pode usar ambos:
```bash
# Faça o deploy do seu app com AZD
azd up

# Depois, ajuste recursos específicos com o Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Encontre Modelos no Awesome AZD

Não comece do zero! **Awesome AZD** é a coleção da comunidade de modelos prontos para implantação:

| Recurso | Descrição |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Navegue por 200+ modelos com implantação com um clique |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Contribua com seu próprio modelo para a comunidade |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Dê estrela e explore o código-fonte |

### Modelos de IA Populares do Awesome AZD

```bash
# Chat RAG com Modelos Microsoft Foundry + Pesquisa de IA
azd init --template azure-search-openai-demo

# Aplicação Rápida de Chat de IA
azd init --template openai-chat-app-quickstart

# Agentes de IA com Agentes Foundry
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

### Passo 3: Implantar Seu Primeiro App

```bash
# Inicializar a partir de um modelo
azd init --template todo-nodejs-mongo

# Implantar no Azure (cria tudo!)
azd up
```

**🎉 Pronto!** Seu aplicativo agora está ativo no Azure.

### Limpeza (Não Esqueça!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Como Usar Este Curso

Este curso foi projetado para o **aprendizado progressivo** — comece de onde se sente confortável e avance no seu próprio ritmo:

| Sua Experiência | Comece Aqui |
|-----------------|------------|
| **Novo no Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Conhece o Azure, novo no AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Quer implantar apps de IA** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Quer prática mão na massa** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 hour guided lab |
| **Precisa de padrões para produção** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Configuração Rápida

1. **Faça um fork deste repositório**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone-o**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtenha Ajuda**: [Comunidade Discord do Azure](https://discord.com/invite/ByRwuEEgH4)

> **Prefere clonar localmente?**
>
> Este repositório inclui traduções em 50+ idiomas, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, use sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Isso fornece tudo o que você precisa para completar o curso com um download muito mais rápido.


## Visão Geral do Curso

Domine o Azure Developer CLI (azd) por meio de capítulos estruturados projetados para aprendizado progressivo. **Foco especial na implantação de aplicações de IA com integração Microsoft Foundry.**

### Por que este curso é essencial para desenvolvedores modernos

Com base em insights da comunidade Microsoft Foundry no Discord, **45% dos desenvolvedores querem usar o AZD para cargas de trabalho de IA** mas encontram desafios com:
- Arquiteturas complexas de IA com múltiplos serviços
- Melhores práticas para implantação de IA em produção  
- Integração e configuração de serviços de IA do Azure
- Otimização de custos para cargas de trabalho de IA
- Resolução de problemas específicos de implantação de IA

### Objetivos de Aprendizagem

Ao concluir este curso estruturado, você irá:
- **Dominar os Fundamentos do AZD**: Conceitos principais, instalação e configuração
- **Implantar Aplicações de IA**: Usar AZD com serviços Microsoft Foundry
- **Implementar Infrastructure as Code**: Gerenciar recursos do Azure com templates Bicep
- **Resolver Problemas de Implantação**: Corrigir problemas comuns e depurar falhas
- **Otimizar para Produção**: Segurança, escalabilidade, monitoramento e gerenciamento de custos
- **Construir Soluções Multi-Agente**: Implantar arquiteturas complexas de IA

## 🗺️ Mapa do Curso: Navegação Rápida por Capítulo

Cada capítulo tem um README dedicado com objetivos de aprendizagem, guias rápidos e exercícios:

| Capítulo | Tópico | Lições | Duração | Complexidade |
|---------|-------|---------|----------|------------|
| **[Cap. 1: Fundamentos](docs/chapter-01-foundation/README.md)** | Introdução | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐
| **[Capítulo 2: Desenvolvimento de IA](docs/chapter-02-ai-development/README.md)** | Aplicativos com foco em IA | [Integração com Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agentes](docs/chapter-02-ai-development/agents.md) &#124; [Implantação de Modelos](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Oficina](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 h | ⭐⭐ |
| **[Capítulo 3: Configuração](docs/chapter-03-configuration/README.md)** | Autenticação & Segurança | [Configuração](docs/chapter-03-configuration/configuration.md) &#124; [Autenticação & Segurança](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Capítulo 4: Infraestrutura](docs/chapter-04-infrastructure/README.md)** | IaC & Implantação | [Guia de Implantação](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionamento](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 h | ⭐⭐⭐ |
| **[Capítulo 5: Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluções com Agentes de IA | [Cenário de Varejo](examples/retail-scenario.md) &#124; [Padrões de Coordenação](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[Capítulo 6: Pré-Implantação](docs/chapter-06-pre-deployment/README.md)** | Planejamento & Validação | [Verificações Preliminares](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planejamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 h | ⭐⭐ |
| **[Capítulo 7: Solução de Problemas](docs/chapter-07-troubleshooting/README.md)** | Depuração & Correção | [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depuração](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 h | ⭐⭐ |
| **[Capítulo 8: Produção](docs/chapter-08-production/README.md)** | Padrões Corporativos | [Práticas de Produção](docs/chapter-08-production/production-ai-practices.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratório Prático | [Introdução](workshop/docs/instructions/0-Introduction.md) &#124; [Seleção](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validação](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Encerramento](workshop/docs/instructions/7-Wrap-up.md) | 3-4 h | ⭐⭐ |

**Duração Total do Curso:** ~10-14 horas | **Progressão de Habilidades:** Iniciante → Pronto para Produção

---

## 📚 Capítulos de Aprendizagem

*Selecione sua trilha de aprendizado com base no nível de experiência e objetivos*

### 🚀 Capítulo 1: Fundamentos & Início Rápido
**Pré-requisitos**: Assinatura do Azure, conhecimento básico de linha de comando  
**Duração**: 30-45 minutos  
**Complexidade**: ⭐

#### O que você vai aprender
- Entendendo os fundamentos do Azure Developer CLI
- Instalando o AZD na sua plataforma
- Sua primeira implantação bem-sucedida

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [O que é o Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [Noções Básicas do AZD](docs/chapter-01-foundation/azd-basics.md) - Conceitos e terminologia essenciais
- **⚙️ Configuração**: [Instalação & Configuração](docs/chapter-01-foundation/installation.md) - Guias específicos por plataforma
- **🛠️ Prático**: [Seu Primeiro Projeto](docs/chapter-01-foundation/first-project.md) - Tutorial passo a passo
- **📋 Referência Rápida**: [Resumo de Comandos](resources/cheat-sheet.md)

#### Exercícios Práticos
```bash
# Verificação rápida de instalação
azd version

# Implante sua primeira aplicação
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resultado do Capítulo**: Implantar com sucesso uma aplicação web simples no Azure usando o AZD

**✅ Validação de Sucesso:**
```bash
# Após concluir o Capítulo 1, você deverá ser capaz de:
azd version              # Exibe a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                  # Implanta no Azure
azd show                # Exibe a URL do aplicativo em execução
# Aplicativo abre no navegador e funciona
azd down --force --purge  # Limpa os recursos
```

**📊 Investimento de Tempo:** 30-45 minutos  
**📈 Nível de Habilidade Após:** Consegue implantar aplicações básicas de forma independente
**📈 Nível de Habilidade Após:** Consegue implantar aplicações básicas de forma independente

---

### 🤖 Capítulo 2: Desenvolvimento com Foco em IA (Recomendado para Desenvolvedores de IA)
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 1-2 h  
**Complexidade**: ⭐⭐

#### O que você vai aprender
- Integração do Microsoft Foundry com AZD
- Implantação de aplicações com recursos de IA
- Entendendo configurações de serviços de IA

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [Integração com Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agentes de IA**: [Guia de Agentes de IA](docs/chapter-02-ai-development/agents.md) - Implantar agentes inteligentes com AZD
- **📖 Padrões**: [Implantação de Modelos de IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Implantar e gerenciar modelos de IA
- **🛠️ Oficina**: [Laboratório de IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Deixe suas soluções de IA prontas para AZD
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Aprendizado baseado no navegador com MkDocs * Ambiente DevContainer
- **📋 Modelos**: [Modelos do Microsoft Foundry](#recursos-do-workshop)
- **📝 Exemplos**: [Exemplos de Implantação AZD](examples/README.md)

#### Exercícios Práticos
```bash
# Implante sua primeira aplicação de IA
azd init --template azure-search-openai-demo
azd up

# Experimente outros modelos de IA
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resultado do Capítulo**: Implantar e configurar uma aplicação de chat com IA com capacidades RAG

**✅ Validação de Sucesso:**
```bash
# Após o Capítulo 2, você deverá ser capaz de:
azd init --template azure-search-openai-demo
azd up
# Testar a interface de chat da IA
# Fazer perguntas e obter respostas geradas por IA com fontes
# Verificar se a integração de pesquisa funciona
azd monitor  # Verificar se o Application Insights exibe telemetria
azd down --force --purge
```

**📊 Investimento de Tempo:** 1-2 h  
**📈 Nível de Habilidade Após:** Consegue implantar e configurar aplicações de IA prontas para produção  
**💰 Consciência de Custos:** Entender custos de desenvolvimento $80-150/mês, custos de produção $300-3500/mês

#### 💰 Considerações de Custos para Implantações de IA

**Ambiente de Desenvolvimento (Estimado $80-150/mês):**
- Microsoft Foundry Models (Pague conforme o uso): $0-50/mês (baseado no uso de tokens)
- AI Search (nível Básico): $75/mês
- Container Apps (Consumo): $0-20/mês
- Storage (Padrão): $1-5/mês

**Ambiente de Produção (Estimado $300-3,500+/mês):**
- Microsoft Foundry Models (PTU para desempenho consistente): $3,000+/mês OU Pague conforme o uso com alto volume
- AI Search (nível Padrão): $250/mês
- Container Apps (Dedicado): $50-100/mês
- Application Insights: $5-50/mês
- Storage (Premium): $10-50/mês

**💡 Dicas de Otimização de Custos:**
- Use **Camada Gratuita** dos modelos Microsoft Foundry para aprendizado (Azure OpenAI inclui 50.000 tokens/mês)
- Execute `azd down` para desalocar recursos quando não estiver desenvolvendo ativamente
- Comece com cobrança baseada em consumo, faça upgrade para PTU apenas em produção
- Use `azd provision --preview` para estimar custos antes da implantação
- Habilite autoescalonamento: pague apenas pelo uso real

**Monitoramento de Custos:**
```bash
# Verifique os custos mensais estimados
azd provision --preview

# Monitore os custos reais no Portal do Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capítulo 3: Configuração & Autenticação
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 45-60 minutos  
**Complexidade**: ⭐⭐

#### O que você vai aprender
- Configuração e gerenciamento de ambientes
- Melhores práticas de autenticação e segurança
- Nomeação e organização de recursos

#### Recursos de Aprendizagem
- **📖 Configuração**: [Guia de Configuração](docs/chapter-03-configuration/configuration.md) - Configuração de ambiente
- **🔐 Segurança**: [Padrões de autenticação e identidade gerenciada](docs/chapter-03-configuration/authsecurity.md) - Padrões de autenticação
- **📝 Exemplos**: [Exemplo de Aplicativo de Banco de Dados](examples/database-app/README.md) - Exemplos de Banco de Dados AZD

#### Exercícios Práticos
- Configure múltiplos ambientes (dev, staging, prod)
- Configure autenticação com identidade gerenciada
- Implemente configurações específicas por ambiente

**💡 Resultado do Capítulo**: Gerenciar múltiplos ambientes com autenticação e segurança adequadas

---

### 🏗️ Capítulo 4: Infraestrutura como Código & Implantação
**Pré-requisitos**: Capítulos 1-3 concluídos  
**Duração**: 1-1.5 h  
**Complexidade**: ⭐⭐⭐

#### O que você vai aprender
- Padrões avançados de implantação
- Infraestrutura como Código com Bicep
- Estratégias de provisionamento de recursos

#### Recursos de Aprendizagem
- **📖 Implantação**: [Guia de Implantação](docs/chapter-04-infrastructure/deployment-guide.md) - Fluxos de trabalho completos
- **🏗️ Provisionamento**: [Provisionamento de Recursos](docs/chapter-04-infrastructure/provisioning.md) - Gerenciamento de recursos Azure
- **📝 Exemplos**: [Exemplo de Container App](../../examples/container-app) - Implantações conteinerizadas

#### Exercícios Práticos
- Crie templates Bicep personalizados
- Implemente aplicações multi-serviço
- Aplique estratégias de implantação blue-green

**💡 Resultado do Capítulo**: Implantar aplicações multi-serviço complexas usando templates de infraestrutura personalizados

---

### 🎯 Capítulo 5: Soluções de IA Multi-Agente (Avançado)
**Pré-requisitos**: Capítulos 1-2 concluídos  
**Duração**: 2-3 h  
**Complexidade**: ⭐⭐⭐⭐

#### O que você vai aprender
- Padrões de arquitetura multi-agente
- Orquestração e coordenação de agentes
- Implantações de IA prontas para produção

#### Recursos de Aprendizagem
- **🤖 Projeto em Destaque**: [Solução Multi-Agente para Varejo](examples/retail-scenario.md) - Implementação completa
- **🛠️ Templates ARM**: [Pacote de Template ARM](../../examples/retail-multiagent-arm-template) - Implantação com um clique
- **📖 Arquitetura**: [Padrões de coordenação multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Padrões

#### Exercícios Práticos
```bash
# Implantar a solução completa de multiagentes para o varejo
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorar configurações de agentes
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultado do Capítulo**: Implantar e gerenciar uma solução multi-agente de IA pronta para produção com agentes de Cliente e Inventário

---

### 🔍 Capítulo 6: Validação & Planejamento Pré-Implantação
**Pré-requisitos**: Capítulo 4 concluído  
**Duração**: 1 h  
**Complexidade**: ⭐⭐

#### O que você vai aprender
- Planejamento de capacidade e validação de recursos
- Estratégias de seleção de SKU
- Verificações pré-implantação e automação

#### Recursos de Aprendizagem
- **📊 Planejamento**: [Planejamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) - Validação de recursos
- **💰 Seleção**: [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Escolhas custo-efetivas
- **✅ Validação**: [Verificações Preliminares](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatizados

#### Exercícios Práticos
- Execute scripts de validação de capacidade
- Otimize seleções de SKU para custo
- Implemente verificações automatizadas pré-implantação

**💡 Resultado do Capítulo**: Validar e otimizar implantações antes da execução

---

### 🚨 Capítulo 7: Resolução de Problemas & Depuração
**Pré-requisitos**: Qualquer capítulo de implantação concluído  
**Duração**: 1-1.5 h  
**Complexidade**: ⭐⭐

#### O que você vai aprender
- Abordagens sistemáticas de depuração
- Problemas comuns e soluções
- Resolução de problemas específicos de IA

#### Recursos de Aprendizagem
- **🔧 Problemas Comuns**: [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluções
- **🕵️ Depuração**: [Guia de Depuração](docs/chapter-07-troubleshooting/debugging.md) - Estratégias passo a passo
- **🤖 Problemas de IA**: [Resolução de Problemas Específicos de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas de serviços de IA

#### Exercícios Práticos
- Diagnosticar falhas de implantação
- Resolver problemas de autenticação
- Depurar conectividade de serviços de IA

**💡 Resultado do Capítulo**: Diagnosticar e resolver de forma independente problemas comuns de implantação

---

### 🏢 Capítulo 8: Produção & Padrões Corporativos
**Pré-requisitos**: Capítulos 1-4 concluídos  
**Duração**: 2-3 h  
**Complexidade**: ⭐⭐⭐⭐

#### O que você vai aprender
- Estratégias de implantação em produção
- Padrões de segurança corporativa
- Monitoramento e otimização de custos

#### Recursos de Aprendizagem
- **🏭 Produção**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Padrões empresariais
- **📝 Exemplos**: [Microservices Example](../../examples/microservices) - Arquiteturas complexas
- **📊 Monitoramento**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoramento

#### Exercícios Práticos
- Implemente padrões de segurança empresariais
- Configure monitoramento abrangente
- Faça deploy em produção com governança adequada

**💡 Resultado do Capítulo**: Implantar aplicações prontas para produção com todas as capacidades necessárias

---

## 🎓 Visão Geral do Workshop: Experiência de Aprendizagem Prática

> **⚠️ STATUS DO WORKSHOP: Em desenvolvimento ativo**  
> Os materiais do workshop estão atualmente sendo desenvolvidos e refinados. Os módulos principais estão funcionais, mas algumas seções avançadas estão incompletas. Estamos trabalhando ativamente para concluir todo o conteúdo. [Acompanhar progresso →](workshop/README.md)

### Materiais do Workshop Interativo
**Aprendizagem prática abrangente com ferramentas baseadas em navegador e exercícios guiados**

Nossos materiais do workshop oferecem uma experiência de aprendizagem estruturada e interativa que complementa o currículo por capítulos acima. O workshop foi projetado tanto para aprendizado no próprio ritmo quanto para sessões conduzidas por instrutores.

#### 🛠️ Recursos do Workshop
- **Interface baseada no navegador**: Workshop completo baseado em MkDocs com recursos de busca, cópia e temas
- **Integração com GitHub Codespaces**: Configuração do ambiente de desenvolvimento com um clique
- **Trilha de aprendizado estruturada**: Exercícios guiados em 8 módulos (3-4 horas no total)
- **Metodologia progressiva**: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Limpeza → Encerramento
- **Ambiente DevContainer interativo**: Ferramentas e dependências pré-configuradas

#### 📚 Estrutura dos Módulos do Workshop
O workshop segue uma **metodologia progressiva de 8 módulos** que o leva da descoberta à maestria na implantação:

| Módulo | Tópico | O que você fará | Duração |
|--------|-------|----------------|----------|
| **0. Introdução** | Visão Geral do Workshop | Entenda os objetivos de aprendizado, pré-requisitos e a estrutura do workshop | 15 min |
| **1. Seleção** | Descoberta de Templates | Explore templates do AZD e selecione o template de IA adequado para o seu cenário | 20 min |
| **2. Validação** | Implantar & Verificar | Implemente o template com `azd up` e verifique se a infraestrutura funciona | 30 min |
| **3. Desconstrução** | Entender a Estrutura | Use o GitHub Copilot para explorar a arquitetura do template, arquivos Bicep e organização do código | 30 min |
| **4. Configuração** | Imersão em azure.yaml | Domine a configuração `azure.yaml`, hooks de ciclo de vida e variáveis de ambiente | 30 min |
| **5. Personalização** | Torne-o seu | Ative AI Search, tracing, avaliação e personalize para o seu cenário | 45 min |
| **6. Limpeza** | Limpeza | Desprovisione recursos com segurança com `azd down --purge` | 15 min |
| **7. Encerramento** | Próximos Passos | Revise conquistas, conceitos-chave e continue sua jornada de aprendizado | 15 min |

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
# Clique em "Code" → "Create codespace on main" no repositório

# Opção 2: Desenvolvimento Local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Siga as instruções de configuração em workshop/README.md
```

#### 🎯 Resultados de Aprendizagem do Workshop
Ao completar o workshop, os participantes irão:
- **Implantar Aplicações de IA em Produção**: Use AZD com os serviços Microsoft Foundry
- **Dominar Arquiteturas Multi-Agente**: Implementar soluções coordenadas de agentes de IA
- **Implementar Melhores Práticas de Segurança**: Configurar autenticação e controle de acesso
- **Otimizar para Escala**: Projetar implantações econômicas e de alto desempenho
- **Solucionar Problemas de Implantações**: Resolver problemas comuns de forma independente

#### 📖 Recursos do Workshop
- **🎥 Guia Interativo**: [Workshop Materials](workshop/README.md) - Ambiente de aprendizado baseado em navegador
- **📋 Instruções Módulo a Módulo**:
  - [0. Introdução](workshop/docs/instructions/0-Introduction.md) - Visão geral do workshop e objetivos
  - [1. Seleção](workshop/docs/instructions/1-Select-AI-Template.md) - Encontre e selecione templates de IA
  - [2. Validação](workshop/docs/instructions/2-Validate-AI-Template.md) - Implemente e verifique templates
  - [3. Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explore a arquitetura do template
  - [4. Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) - Domine o azure.yaml
  - [5. Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalize para o seu cenário
  - [6. Limpeza](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Limpe os recursos
  - [7. Encerramento](workshop/docs/instructions/7-Wrap-up.md) - Revisão e próximos passos
- **🛠️ Laboratório do Workshop de IA**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercícios focados em IA
- **💡 Início Rápido**: [Workshop Setup Guide](workshop/README.md#quick-start) - Configuração do ambiente

**Perfeito para**: Treinamento corporativo, cursos universitários, aprendizado no próprio ritmo e bootcamps para desenvolvedores.

---

## 📖 Mergulho Profundo: Capacidades do AZD

Além do básico, o AZD oferece recursos poderosos para implantações em produção:

- **Implantações baseadas em templates** - Use templates pré-construídos para padrões comuns de aplicação
- **Infraestrutura como Código** - Gerencie recursos do Azure usando Bicep ou Terraform  
- **Workflows integrados** - Provisione, implante e monitore aplicações de forma contínua
- **Focado no desenvolvedor** - Otimizado para produtividade e experiência do desenvolvedor

### **AZD + Microsoft Foundry: Perfeito para Implantações de IA**

**Por que AZD para Soluções de IA?** AZD aborda os principais desafios que desenvolvedores de IA enfrentam:

- **Templates prontos para IA** - Templates pré-configurados para Microsoft Foundry Models, Cognitive Services e cargas de trabalho de ML
- **Implantações de IA seguras** - Padrões de segurança integrados para serviços de IA, chaves de API e endpoints de modelos  
- **Padrões de IA para produção** - Melhores práticas para implantações de aplicações de IA escaláveis e econômicas
- **Workflows de IA de ponta a ponta** - Do desenvolvimento do modelo à implantação em produção com monitoramento adequado
- **Otimização de custos** - Alocação inteligente de recursos e estratégias de escalonamento para cargas de trabalho de IA
- **Integração com Microsoft Foundry** - Conexão fluida ao catálogo de modelos e endpoints do Microsoft Foundry

---

## 🎯 Biblioteca de Templates & Exemplos

### Em destaque: Templates do Microsoft Foundry
**Comece aqui se você estiver implantando aplicações de IA!**

> **Nota:** Esses templates demonstram vários padrões de IA. Alguns são Azure Samples externos, outros são implementações locais.

| Template | Capítulo | Complexidade | Services | Tipo |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externo |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externo |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externo |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externo |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externo |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externo |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Em destaque: Cenários de Aprendizado Completo
**Templates prontos para produção mapeados para capítulos de aprendizado**

| Template | Capítulo de Aprendizado | Complexidade | Principais Aprendizados |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Padrões básicos de implantação de IA |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementação RAG com Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capítulo 4 | ⭐⭐ | Integração com Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agentes e chamadas de função |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestração de IA corporativa |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitetura multi-agente com agentes de Cliente e Estoque |

### Aprendendo por Tipo de Exemplo

> **📌 Exemplos Locais vs. Externos:**  
> **Exemplos Locais** (neste repositório) = Prontos para uso imediato  
> **Exemplos Externos** (Azure Samples) = Clone dos repositórios vinculados

#### Exemplos Locais (Prontos para Uso)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Implementação completa pronta para produção com templates ARM
  - Arquitetura multi-agente (agentes Cliente + Estoque)
  - Monitoramento e avaliação abrangentes
  - Implantação com um clique via template ARM

#### Exemplos Locais - Aplicações em Contêiner (Capítulos 2-5)
**Exemplos abrangentes de implantação em contêineres neste repositório:**
- [**Container App Examples**](examples/container-app/README.md) - Guia completo para implantações conteinerizadas
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST básica com scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Implantação multi-serviço pronta para produção
  - Padrões de Inicialização Rápida, Produção e Avançado
  - Orientação sobre monitoramento, segurança e otimização de custos

#### Exemplos Externos - Aplicações Simples (Capítulos 1-2)
**Clone esses repositórios Azure Samples para começar:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Padrões básicos de implantação
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implantação de conteúdo estático
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implantação de API REST

#### Exemplos Externos - Integração com Banco de Dados (Capítulos 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Padrões de conectividade com banco de dados
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Fluxo de dados serverless

#### Exemplos Externos - Padrões Avançados (Capítulos 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquiteturas multi-serviço
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Processamento em segundo plano  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Padrões de ML prontos para produção

### Coleções de Templates Externas
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Coleção curada de templates oficiais e da comunidade
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentação de templates Microsoft Learn
- [**Examples Directory**](examples/README.md) - Exemplos locais de aprendizado com explicações detalhadas

---

## 📚 Recursos de Aprendizado & Referências

### Referências Rápidas
- [**Resumo de Comandos**](resources/cheat-sheet.md) - Comandos essenciais do azd organizados por capítulo
- [**Glossário**](resources/glossary.md) - Terminologia do Azure e azd  
- [**Perguntas Frequentes**](resources/faq.md) - Perguntas comuns organizadas por capítulo de aprendizado
- [**Guia de Estudo**](resources/study-guide.md) - Exercícios práticos abrangentes

### Workshops Práticos
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Torne suas soluções de IA implantáveis com AZD (2-3 horas)
- [**Interactive Workshop**](workshop/README.md) - Exercícios guiados em 8 módulos com MkDocs e GitHub Codespaces
  - Segue: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Limpeza → Encerramento

### Recursos Externos de Aprendizado
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculadora de Preços do Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status do Azure](https://status.azure.com/)

### Habilidades de Agente de IA para o Seu Editor
- [**Habilidades Microsoft Azure no skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 habilidades de agente abertas para Azure AI, Foundry, implantação, diagnóstico, otimização de custos e mais. Instale-as no GitHub Copilot, Cursor, Claude Code ou em qualquer agente suportado:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guia Rápido de Solução de Problemas

**Problemas comuns enfrentados por iniciantes e soluções imediatas:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Tente uma região diferente do Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ou use SKUs menores durante o desenvolvimento
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

# Opção 3: Verificar status detalhado
azd show

# Opção 4: Verificar logs no Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

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
# Verifique o progresso
azd show

# Se ficar travado por mais de 30 minutos, verifique o Portal do Azure:
azd monitor
# Procure por implantações com falha
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Verifique sua função no Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Você precisa de pelo menos a função "Contributor"
# Peça ao administrador do Azure para conceder:
# - Contributor (para recursos)
# - User Access Administrator (para atribuições de função)
```
</details>

<details>
<summary><strong>❌ Não é possível encontrar a URL da aplicação implantada</strong></summary>

```bash
# Mostrar todos os endpoints de serviço
azd show

# Ou abra o Azure Portal
azd monitor

# Verificar serviço específico
azd env get-values
# Procure por variáveis *_URL
```
</details>

### 📚 Recursos completos de solução de problemas

- **Guia de Problemas Comuns:** [Soluções Detalhadas](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemas Específicos de IA:** [Solução de Problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guia de Depuração:** [Depuração passo a passo](docs/chapter-07-troubleshooting/debugging.md)
- **Obter Ajuda:** [Discord do Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Conclusão do Curso e Certificação

### Acompanhamento de Progresso
Acompanhe seu progresso de aprendizagem em cada capítulo:

- [ ] **Capítulo 1**: Fundamentos e Início Rápido ✅
- [ ] **Capítulo 2**: Desenvolvimento com Foco em IA ✅  
- [ ] **Capítulo 3**: Configuração e Autenticação ✅
- [ ] **Capítulo 4**: Infraestrutura como Código e Implantação ✅
- [ ] **Capítulo 5**: Soluções de IA Multiagente ✅
- [ ] **Capítulo 6**: Validação e Planejamento Pré-implantação ✅
- [ ] **Capítulo 7**: Solução de Problemas e Depuração ✅
- [ ] **Capítulo 8**: Padrões de Produção e Corporativos ✅

### Verificação da Aprendizagem
Após completar cada capítulo, verifique seu conhecimento por meio de:
1. **Exercício Prático**: Complete a implantação prática do capítulo
2. **Verificação de Conhecimento**: Revise a seção de FAQ do seu capítulo
3. **Discussão na Comunidade**: Compartilhe sua experiência no Discord do Azure
4. **Próximo Capítulo**: Avance para o próximo nível de complexidade

### Benefícios ao Concluir o Curso
Ao concluir todos os capítulos, você terá:
- **Experiência em produção**: Aplicações de IA reais implantadas no Azure
- **Habilidades profissionais**: Capacidades de implantação prontas para empresas  
- **Reconhecimento na Comunidade**: Membro ativo da comunidade de desenvolvedores Azure
- **Avanço na Carreira**: Expertise em AZD e implantação de IA altamente demandada

---

## 🤝 Comunidade e Suporte

### Obter Ajuda e Suporte
- **Problemas Técnicos**: [Relatar bugs e solicitar recursos](https://github.com/microsoft/azd-for-beginners/issues)
- **Dúvidas de Aprendizado**: [Comunidade Discord do Microsoft Azure](https://discord.gg/microsoft-azure) e [![Discord do Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajuda Específica para IA**: Junte-se ao [![Discord do Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentação**: [Documentação oficial do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Percepções da Comunidade do Discord do Microsoft Foundry

**Resultados recentes da enquete no canal #Azure:**
- **45%** dos desenvolvedores querem usar AZD para cargas de trabalho de IA
- **Principais desafios**: Implantações multi-serviço, gerenciamento de credenciais, prontidão para produção  
- **Mais solicitados**: Modelos específicos para IA, guias de solução de problemas, melhores práticas

**Junte-se à nossa comunidade para:**
- Compartilhe suas experiências com AZD + IA e obtenha ajuda
- Acessar prévias antecipadas de novos modelos de IA
- Contribuir para as melhores práticas de implantação de IA
- Influenciar o desenvolvimento futuro de recursos de IA + AZD

### Contribuindo para o Curso
Aceitamos contribuições! Por favor, leia nosso [Guia de Contribuição](CONTRIBUTING.md) para detalhes sobre:
- **Melhorias de Conteúdo**: Aprimore capítulos e exemplos existentes
- **Novos Exemplos**: Adicione cenários do mundo real e modelos  
- **Tradução**: Ajude a manter o suporte multilíngue
- **Relatórios de Bugs**: Melhore a precisão e clareza
- **Padrões Comunitários**: Siga nossas diretrizes comunitárias inclusivas

---

## 📄 Informações do Curso

### Licença
Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](../../LICENSE) para detalhes.

### Recursos de Aprendizado Relacionados da Microsoft

Nossa equipe produz outros cursos de aprendizado abrangentes:

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
 
### Aprendizado Básico
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

**Próximos Passos**: [Começar Capítulo 1 - Noções Básicas do AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->