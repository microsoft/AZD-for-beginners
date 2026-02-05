# AZD Para Iniciantes: Uma Jornada de Aprendizagem Estruturada

![AZD-for-beginners](../../translated_images/pt-PT/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Começar Com Este Curso

Siga estes passos para iniciar a sua jornada de aprendizagem AZD:

1. **Fork do Repositório**: Clique [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonar o Repositório**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Junte-se à Comunidade**: [Comunidades Azure Discord](https://discord.com/invite/ByRwuEEgH4) para suporte especializado
4. **Escolha o Seu Caminho de Aprendizagem**: Selecione um capítulo abaixo que corresponda ao seu nível de experiência

### Suporte Multilíngue

#### Traduções Automatizadas (Sempre Atualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Árabe](../ar/README.md) | [Bengali](../bn/README.md) | [Búlgaro](../bg/README.md) | [Birmanês (Myanmar)](../my/README.md) | [Chinês (Simplificado)](../zh-CN/README.md) | [Chinês (Tradicional, Hong Kong)](../zh-HK/README.md) | [Chinês (Tradicional, Macau)](../zh-MO/README.md) | [Chinês (Tradicional, Taiwan)](../zh-TW/README.md) | [Croata](../hr/README.md) | [Checo](../cs/README.md) | [Dinamarquês](../da/README.md) | [Neerlandês](../nl/README.md) | [Estónio](../et/README.md) | [Finlandês](../fi/README.md) | [Francês](../fr/README.md) | [Alemão](../de/README.md) | [Grego](../el/README.md) | [Hebraico](../he/README.md) | [Hindi](../hi/README.md) | [Húngaro](../hu/README.md) | [Indonésio](../id/README.md) | [Italiano](../it/README.md) | [Japonês](../ja/README.md) | [Kannada](../kn/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malaio](../ms/README.md) | [Malaiala](../ml/README.md) | [Marata](../mr/README.md) | [Nepalês](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Norueguês](../no/README.md) | [Persa (Farsi)](../fa/README.md) | [Polaco](../pl/README.md) | [Português (Brasil)](../pt-BR/README.md) | [Português (Portugal)](./README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romeno](../ro/README.md) | [Russo](../ru/README.md) | [Sérvio (Cirílico)](../sr/README.md) | [Eslovaco](../sk/README.md) | [Esloveno](../sl/README.md) | [Espanhol](../es/README.md) | [Suaíli](../sw/README.md) | [Sueco](../sv/README.md) | [Tagalo (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Tailandês](../th/README.md) | [Turco](../tr/README.md) | [Ucraniano](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Prefere Clonar Localmente?**

> Este repositório inclui traduções em mais de 50 idiomas, o que aumenta significativamente o tamanho do download. Para clonar sem traduções, use sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Isto dá-lhe tudo que precisa para completar o curso com um download muito mais rápido.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Visão Geral do Curso

Domine o Azure Developer CLI (azd) através de capítulos estruturados para uma aprendizagem progressiva. **Foco especial na implementação de aplicações AI com integração da Microsoft Foundry.**

### Porquê Este Curso é Essencial para Developers Modernos

Baseado nas perceções da comunidade Microsoft Foundry Discord, **45% dos developers querem usar AZD para cargas de trabalho AI** mas enfrentam desafios com:
- Arquiteturas AI complexas com múltiplos serviços
- Boas práticas para deployment AI em produção  
- Integração e configuração de serviços Azure AI
- Otimização de custos para cargas AI
- Resolução de problemas específicos de deployment AI

### Objetivos de Aprendizagem

Ao completar este curso estruturado, irá:
- **Dominar os Fundamentos AZD**: Conceitos principais, instalação e configuração
- **Implementar Aplicações AI**: Usar AZD com serviços Microsoft Foundry
- **Implementar Infraestrutura como Código**: Gerir recursos Azure com templates Bicep
- **Resolver Problemas em Deployments**: Solucionar problemas comuns e depurar
- **Otimizar para Produção**: Segurança, escalabilidade, monitorização e gestão de custos
- **Construir Soluções Multi-Agente**: Implementar arquiteturas AI complexas

## 📚 Capítulos de Aprendizagem

*Selecione o seu percurso de aprendizagem baseado no nível de experiência e objetivos*

### 🚀 Capítulo 1: Fundamentos & Início Rápido
**Pré-requisitos**: Subscrição Azure, conhecimentos básicos de linha de comandos  
**Duração**: 30-45 minutos  
**Complexidade**: ⭐

#### O que Vai Aprender
- Compreender os fundamentos do Azure Developer CLI
- Instalar o AZD na sua plataforma
- O seu primeiro deployment bem sucedido

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [O que é o Azure Developer CLI?](../..)
- **📖 Teoria**: [Noções Básicas AZD](docs/getting-started/azd-basics.md) - Conceitos e terminologia principais
- **⚙️ Configuração**: [Instalação & Configuração](docs/getting-started/installation.md) - Guias específicos para plataformas
- **🛠️ Prático**: [O Seu Primeiro Projeto](docs/getting-started/first-project.md) - Tutorial passo a passo
- **📋 Referência Rápida**: [Folha de comandos](resources/cheat-sheet.md)

#### Exercícios Práticos
```bash
# Verificação rápida de instalação
azd version

# Faça o deploy da sua primeira aplicação
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resultado do Capítulo**: Desplegar com sucesso uma aplicação web simples no Azure usando AZD

**✅ Validação de Sucesso:**
```bash
# Após completar o Capítulo 1, deverá conseguir:
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                  # Desdobra para o Azure
azd show                # Mostra a URL da aplicação em execução
# A aplicação abre no browser e funciona
azd down --force --purge  # Limpa os recursos
```

**📊 Investimento de Tempo:** 30-45 minutos  
**📈 Nível Após:** Consegue desplegar aplicações básicas de forma independente

**✅ Validação de Sucesso:**
```bash
# Depois de concluir o Capítulo 1, deverá ser capaz de:
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                  # Faz o deploy para o Azure
azd show                # Exibe a URL da aplicação em execução
# A aplicação abre no navegador e funciona
azd down --force --purge  # Limpa os recursos
```

**📊 Investimento de Tempo:** 30-45 minutos  
**📈 Nível Após:** Consegue desplegar aplicações básicas de forma independente

---

### 🤖 Capítulo 2: Desenvolvimento AI-First (Recomendado para Developers AI)
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 1-2 horas  
**Complexidade**: ⭐⭐

#### O que Vai Aprender
- Integração Microsoft Foundry com AZD
- Deploy de aplicações potenciadas por AI
- Compreensão da configuração dos serviços AI

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [Integração Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Padrões**: [Deployment de Modelos AI](docs/microsoft-foundry/ai-model-deployment.md) - Implementar e gerir modelos AI
- **🛠️ Workshop**: [Laboratório AI Workshop](docs/microsoft-foundry/ai-workshop-lab.md) - Prepare as suas soluções AI para AZD
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Aprendizagem baseada em browser com MkDocs * Ambiente DevContainer
- **📋 Templates**: [Templates Microsoft Foundry](../..)
- **📝 Exemplos**: [Exemplos de Deployment AZD](examples/README.md)

#### Exercícios Práticos
```bash
# Faça o deploy da sua primeira aplicação de IA
azd init --template azure-search-openai-demo
azd up

# Experimente modelos adicionais de IA
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resultado do Capítulo**: Implementar e configurar uma aplicação de chat AI com capacidades RAG

**✅ Validação de Sucesso:**
```bash
# Após o Capítulo 2, deverá ser capaz de:
azd init --template azure-search-openai-demo
azd up
# Testar a interface de chat da IA
# Fazer perguntas e obter respostas alimentadas por IA com fontes
# Verificar se a integração de pesquisa funciona
azd monitor  # Verificar se o Application Insights mostra telemetria
azd down --force --purge
```

**📊 Investimento de Tempo:** 1-2 horas  
**📈 Nível Após:** Consegue desplegar e configurar aplicações AI prontas para produção  
**💰 Consciência de Custos:** Entende custos de desenvolvimento $80-150/mês, produção $300-3500/mês

#### 💰 Considerações de Custo para Deployments AI

**Ambiente de Desenvolvimento (Estimado $80-150/mês):**
- Azure OpenAI (pague conforme o uso): $0-50/mês (baseado no uso de tokens)
- AI Search (nível básico): $75/mês
- Container Apps (Consumo): $0-20/mês
- Armazenamento (Standard): $1-5/mês

**Ambiente de Produção (Estimado $300-3,500+/mês):**
- Azure OpenAI (PTU para desempenho consistente): $3,000+/mês OU Pague conforme o uso com alto volume
- AI Search (nível standard): $250/mês
- Container Apps (dedicado): $50-100/mês
- Application Insights: $5-50/mês
- Armazenamento (Premium): $10-50/mês

**💡 Dicas para Otimização de Custos:**
- Use o nível **Gratuito** Azure OpenAI para aprendizagem (50,000 tokens/mês incluídos)
- Execute `azd down` para desalocar recursos quando não estiver a desenvolver
- Comece com faturação baseada no consumo e atualize para PTU apenas para produção
- Use `azd provision --preview` para estimar custos antes do deployment
- Ative auto-escalamento: pague apenas pelo uso efetivo

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

#### O que Vai Aprender
- Configuração e gestão de ambientes
- Práticas recomendadas de autenticação e segurança
- Nomeação e organização de recursos

#### Recursos de Aprendizagem
- **📖 Configuração**: [Guia de Configuração](docs/getting-started/configuration.md) - Configuração de ambiente
- **🔐 Segurança**: [Padrões de autenticação e identidade gerida](docs/getting-started/authsecurity.md) - Padrões de autenticação
- **📝 Exemplos**: [Exemplo de Aplicação de Base de Dados](examples/database-app/README.md) - Exemplos AZD Database

#### Exercícios Práticos
- Configurar múltiplos ambientes (dev, staging, prod)
- Configurar autenticação com identidade gerida
- Implementar configurações específicas para cada ambiente

**💡 Resultado do Capítulo**: Gerir múltiplos ambientes com autenticação e segurança adequadas

---

### 🏗️ Capítulo 4: Infraestrutura como Código & Deployment
**Pré-requisitos**: Capítulos 1-3 concluídos  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐⭐

#### O que Vai Aprender
- Padrões avançados de deployment
- Infraestrutura como Código com Bicep
- Estratégias de provisionamento de recursos

#### Recursos de Aprendizagem
- **📖 Deployment**: [Guia de Deployment](docs/deployment/deployment-guide.md) - Workflows completos
- **🏗️ Provisionamento**: [Provisionamento de Recursos](docs/deployment/provisioning.md) - Gestão de recursos Azure
- **📝 Exemplos**: [Exemplo de Container App](../../examples/container-app) - Deployments conteinerizados

#### Exercícios Práticos
- Criar templates Bicep personalizados
- Implementar aplicações multi-serviço
- Implementar estratégias blue-green para deployment

**💡 Resultado do Capítulo**: Desplegar aplicações multi-serviço complexas usando templates de infraestrutura personalizados

---

### 🎯 Capítulo 5: Soluções AI Multi-Agente (Avançado)
**Pré-requisitos**: Capítulos 1-2 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐
#### O Que Vai Aprender
- Padrões de arquitetura multi-agente
- Orquestração e coordenação de agentes
- Implementações de IA preparadas para produção

#### Recursos de Aprendizagem
- **🤖 Projeto em Destaque**: [Solução Multi-Agente para Retalho](examples/retail-scenario.md) - Implementação completa
- **🛠️ Templates ARM**: [Pacote de Template ARM](../../examples/retail-multiagent-arm-template) - Implementação com um clique
- **📖 Arquitetura**: [Padrões de coordenação multi-agente](/docs/pre-deployment/coordination-patterns.md) - Padrões

#### Exercícios Práticos
```bash
# Desplegar a solução multi-agente completa para retalho
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorar configurações do agente
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultado do Capítulo**: Implementar e gerir uma solução multi-agente de IA pronta para produção com agentes Cliente e Inventário

---

### 🔍 Capítulo 6: Validação e Planeamento Pré-Implementação
**Pré-requisitos**: Capítulo 4 concluído  
**Duração**: 1 hora  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Planeamento de capacidade e validação de recursos
- Estratégias para seleção de SKU
- Verificações pré-implementação e automação

#### Recursos de Aprendizagem
- **📊 Planeamento**: [Planeamento de Capacidade](docs/pre-deployment/capacity-planning.md) - Validação de recursos
- **💰 Seleção**: [Seleção de SKU](docs/pre-deployment/sku-selection.md) - Opções custo-efetivas
- **✅ Validação**: [Verificações Pré-Implementação](docs/pre-deployment/preflight-checks.md) - Scripts automatizados

#### Exercícios Práticos
- Executar scripts de validação de capacidade
- Otimizar seleções de SKU para custos
- Implementar verificações automatizadas pré-implementação

**💡 Resultado do Capítulo**: Validar e otimizar as implementações antes da execução

---

### 🚨 Capítulo 7: Resolução de Problemas e Depuração
**Pré-requisitos**: Qualquer capítulo de implementação concluído  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐

#### O Que Vai Aprender
- Abordagens sistemáticas de depuração
- Problemas comuns e soluções
- Resolução de problemas específica para IA

#### Recursos de Aprendizagem
- **🔧 Problemas Comuns**: [Problemas Comuns](docs/troubleshooting/common-issues.md) - FAQ e soluções
- **🕵️ Depuração**: [Guia de Depuração](docs/troubleshooting/debugging.md) - Estratégias passo a passo
- **🤖 Problemas de IA**: [Resolução de Problemas Específica para IA](docs/troubleshooting/ai-troubleshooting.md) - Problemas de serviços de IA

#### Exercícios Práticos
- Diagnosticar falhas de implementação
- Resolver problemas de autenticação
- Depurar conectividade de serviços de IA

**💡 Resultado do Capítulo**: Diagnosticar e resolver problemas comuns de implementação de forma autónoma

---

### 🏢 Capítulo 8: Padrões de Produção e Empresariais
**Pré-requisitos**: Capítulos 1-4 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O Que Vai Aprender
- Estratégias de implementação em produção
- Padrões de segurança empresariais
- Monitorização e otimização de custos

#### Recursos de Aprendizagem
- **🏭 Produção**: [Boas Práticas de IA em Produção](docs/microsoft-foundry/production-ai-practices.md) - Padrões empresariais
- **📝 Exemplos**: [Exemplo de Microserviços](../../examples/microservices) - Arquiteturas complexas
- **📊 Monitorização**: [Integração com Application Insights](docs/pre-deployment/application-insights.md) - Monitorização

#### Exercícios Práticos
- Implementar padrões de segurança empresariais
- Configurar monitorização abrangente
- Implementar em produção com governação adequada

**💡 Resultado do Capítulo**: Implementar aplicações empresariais prontas para produção com todas as capacidades

---

## 🎓 Visão Geral do Workshop: Experiência Prática de Aprendizagem

> **⚠️ ESTADO DO WORKSHOP: Desenvolvimento Ativo**  
> Os materiais do workshop estão atualmente em desenvolvimento e aperfeiçoamento. Os módulos principais estão operacionais, mas algumas secções avançadas ainda estão incompletas. Estamos a trabalhar ativamente para completar todo o conteúdo. [Acompanhe o progresso →](workshop/README.md)

### Materiais Interativos do Workshop
**Aprendizagem prática abrangente com ferramentas baseadas no navegador e exercícios guiados**

Os materiais do workshop fornecem uma experiência de aprendizagem estruturada e interativa que complementa o currículo baseado em capítulos acima. O workshop foi concebido tanto para aprendizagem autónoma como para sessões conduzidas por instrutores.

#### 🛠️ Funcionalidades do Workshop
- **Interface no Navegador**: Workshop completo suportado por MkDocs com busca, cópia e funcionalidades de temas
- **Integração com GitHub Codespaces**: Configuração do ambiente de desenvolvimento com um clique
- **Caminho de Aprendizagem Estruturado**: Exercícios guiados em 7 passos (3.5 horas no total)
- **Descoberta → Implementação → Personalização**: Metodologia progressiva
- **Ambiente DevContainer Interativo**: Ferramentas e dependências pré-configuradas

#### 📚 Estrutura do Workshop
O workshop segue uma metodologia **Descoberta → Implementação → Personalização**:

1. **Fase de Descoberta** (45 mins)
   - Explorar templates e serviços Microsoft Foundry
   - Compreender padrões de arquitetura multi-agente
   - Rever requisitos e pré-requisitos de implementação

2. **Fase de Implementação** (2 horas)
   - Implementação prática de aplicações de IA com AZD
   - Configurar serviços e endpoints Azure AI
   - Implementar padrões de segurança e autenticação

3. **Fase de Personalização** (45 mins)
   - Modificar aplicações para casos de uso específicos
   - Otimizar para implementações em produção
   - Implementar monitorização e gestão de custos

#### 🚀 Começar com o Workshop
```bash
# Opção 1: GitHub Codespaces (Recomendado)
# Clique em "Code" → "Create codespace on main" no repositório

# Opção 2: Desenvolvimento Local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Siga as instruções de configuração em workshop/README.md
```

#### 🎯 Resultados de Aprendizagem do Workshop
Ao concluir o workshop, os participantes irão:
- **Implementar Aplicações de IA em Produção**: Utilizar AZD com serviços Microsoft Foundry
- **Dominar Arquiteturas Multi-Agente**: Implementar soluções coordenadas de agentes de IA
- **Implementar Melhores Práticas de Segurança**: Configurar autenticação e controlo de acesso
- **Otimizar para Escala**: Projetar implementações desempenho e custo-efetivas
- **Resolver Problemas de Implementação**: Diagnosticar e resolver problemas comuns de forma autónoma

#### 📖 Recursos do Workshop
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Ambiente de aprendizagem no navegador
- **📋 Instruções Passo a Passo**: [Exercícios Guiados](../../workshop/docs/instructions) - Guias detalhados
- **🛠️ Laboratório do Workshop de IA**: [Laboratório de IA](docs/microsoft-foundry/ai-workshop-lab.md) - Exercícios focados em IA
- **💡 Arranque Rápido**: [Guia de Configuração do Workshop](workshop/README.md#quick-start) - Configuração do ambiente

**Ideal para**: Formação corporativa, cursos universitários, aprendizagem autónoma e bootcamps para desenvolvedores.

---

## 📖 O Que é o Azure Developer CLI?

Azure Developer CLI (azd) é uma interface de linha de comandos centrada no desenvolvedor que acelera o processo de criação e implementação de aplicações no Azure. Proporciona:

- **Implementações baseadas em templates** - Use templates pré-construídos para padrões comuns de aplicação
- **Infraestrutura como Código** - Gerir recursos Azure usando Bicep ou Terraform  
- **Fluxos de trabalho integrados** - Provisionar, implementar e monitorizar aplicações de forma contínua
- **Amigável para desenvolvedores** - Otimizado para produtividade e experiência do desenvolvedor

### **AZD + Microsoft Foundry: Perfeito para Implementações de IA**

**Porquê AZD para Soluções de IA?** AZD aborda os principais desafios enfrentados pelos desenvolvedores de IA:

- **Templates Prontos para IA** - Templates pré-configurados para Azure OpenAI, Serviços Cognitivos e cargas de trabalho ML
- **Implementações Seguras de IA** - Padrões de segurança incorporados para serviços de IA, chaves API e endpoints de modelos  
- **Padrões de IA para Produção** - Melhores práticas para implementações de aplicações IA escaláveis e custo-efetivas
- **Fluxos de Trabalho End-to-End para IA** - Desde o desenvolvimento do modelo até a implementação com monitorização adequada
- **Otimização de Custos** - Alocação inteligente de recursos e estratégias de escala para cargas de trabalho IA
- **Integração com Microsoft Foundry** - Ligação fluida ao catálogo e endpoints de modelos Microsoft Foundry

---

## 🎯 Biblioteca de Templates & Exemplos

### Em Destaque: Templates Microsoft Foundry
**Comece aqui se está a implementar aplicações de IA!**

> **Nota:** Estes templates demonstram vários padrões de IA. Alguns são Azure Samples externos, outros são implementações locais.

| Template | Capítulo | Complexidade | Serviços | Tipo |
|----------|---------|------------|----------|------|
| [**Começar com chat de IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externo |
| [**Começar com agentes de IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externo |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externo |
| [**Início Rápido App de Chat OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externo |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externo |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externo |
| [**Solução Multi-Agente para Retalho**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Em Destaque: Cenários de Aprendizagem Completos
**Templates de aplicação prontos para produção mapeados para capítulos de aprendizagem**

| Template | Capítulo de Aprendizagem | Complexidade | Aprendizagem Chave |
|----------|--------------------------|------------|--------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Padrões básicos de implementação de IA |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementação RAG com Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capítulo 4 | ⭐⭐ | Integração de Inteligência de Documentos |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agentes e chamadas de funções |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestração empresarial de IA |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitetura multi-agente com agentes Cliente e Inventário |

### Aprender por Tipo de Exemplo

> **📌 Exemplos Locais vs. Externos:**  
> **Exemplos Locais** (neste repositório) = Prontos a usar imediatamente  
> **Exemplos Externos** (Azure Samples) = Clonar dos repositórios vinculados

#### Exemplos Locais (Prontos a Usar)
- [**Solução Multi-Agente para Retalho**](examples/retail-scenario.md) - Implementação completa pronta para produção com templates ARM
  - Arquitetura multi-agente (agentes Cliente + Inventário)
  - Monitorização e avaliação abrangentes
  - Implementação com um clique via template ARM

#### Exemplos Locais - Aplicações em Contêineres (Capítulos 2-5)
**Exemplos completos de implementação em contêiner neste repositório:**
- [**Exemplos de Aplicações em Contêiner**](examples/container-app/README.md) - Guia completo para implementações conteinerizadas
  - [API Flask Simples](../../examples/container-app/simple-flask-api) - API REST básica com escala a zero
  - [Arquitetura de Microserviços](../../examples/container-app/microservices) - Implementação multi-serviço pronta para produção
  - Padrões de início rápido, produção e avançados
  - Orientação para monitorização, segurança e otimização de custos

#### Exemplos Externos - Aplicações Simples (Capítulos 1-2)
**Clone estes repositórios Azure Samples para começar:**
- [Aplicação Web Simples - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Padrões básicos de implementação
- [Website Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementação de conteúdo estático
- [Aplicação em Contêiner - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementação de API REST

#### Exemplos Externos - Integração com Base de Dados (Capítulos 3-4)  
- [Aplicação com Base de Dados - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Padrões de conectividade a bases de dados
- [Funcionalidades + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Fluxo de dados serverless

#### Exemplos Externos - Padrões Avançados (Capítulos 4-8)
- [Microserviços Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquiteturas multi-serviço
- [Jobs em Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Processamento em segundo plano  
- [Pipeline ML Empresarial](https://github.com/Azure-Samples/mlops-v2) - Padrões ML prontos para produção

### Coleções de Templates Externos
- [**Galeria Oficial de Templates AZD**](https://azure.github.io/awesome-azd/) - Coleção curada de templates oficiais e da comunidade
- [**Modelos Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentação dos modelos Microsoft Learn
- [**Directório de Exemplos**](examples/README.md) - Exemplos locais de aprendizagem com explicações detalhadas

---

## 📚 Recursos de Aprendizagem & Referências

### Referências Rápidas
- [**Folha de Comandos**](resources/cheat-sheet.md) - Comandos essenciais azd organizados por capítulo
- [**Glossário**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Perguntas comuns organizadas por capítulo de aprendizagem
- [**Guia de Estudo**](resources/study-guide.md) - Exercícios práticos abrangentes

### Workshops Práticos
- [**Laboratório Workshop AI**](docs/microsoft-foundry/ai-workshop-lab.md) - Torne suas soluções AI implantáveis com AZD (2-3 horas)
- [**Guia do Workshop Interativo**](workshop/README.md) - Workshop baseado em browser com MkDocs e Ambiente DevContainer
- [**Caminho de Aprendizagem Estruturado**](../../workshop/docs/instructions) - Exercícios guiados em 7 passos (Descoberta → Implantação → Personalização)
- [**Workshop AZD para Iniciantes**](workshop/README.md) - Materiais completos para workshop prático com integração GitHub Codespaces

### Recursos Externos de Aprendizagem
- Documentação do Azure Developer CLI (https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Centro de Arquitetura Azure (https://learn.microsoft.com/en-us/azure/architecture/)
- Calculadora de Preços Azure (https://azure.microsoft.com/pricing/calculator/)
- Estado do Azure (https://status.azure.com/)

---

## 🔧 Guia Rápido de Resolução de Problemas

**Problemas comuns enfrentados por iniciantes e soluções imediatas:**

### ❌ "azd: comando não encontrado"

```bash
# Instalar primeiro o AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verificar a instalação
azd version
```

### ❌ "Nenhuma subscrição encontrada" ou "Subscrição não definida"

```bash
# Listar subscrições disponíveis
az account list --output table

# Definir subscrição padrão
az account set --subscription "<subscription-id-or-name>"

# Definir para ambiente AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verificar
az account show
```

### ❌ "Quota Insuficiente" ou "Limite de quota excedido"

```bash
# Experimente uma região Azure diferente
azd env set AZURE_LOCATION "westus2"
azd up

# Ou use SKUs mais pequenos no desenvolvimento
# Edite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" falha a meio do processo

```bash
# Opção 1: Limpar e tentar novamente
azd down --force --purge
azd up

# Opção 2: Apenas corrigir a infraestrutura
azd provision

# Opção 3: Verificar registos detalhados
azd show
azd logs
```

### ❌ "Falha na autenticação" ou "Token expirado"

```bash
# Autenticar novamente
az logout
az login

azd auth logout
azd auth login

# Verificar autenticação
az account show
```

### ❌ "Recurso já existe" ou conflitos de nomes

```bash
# AZD gera nomes únicos, mas se houver conflito:
azd down --force --purge

# Então tente novamente com um ambiente novo
azd env new dev-v2
azd up
```

### ❌ Implantação do modelo a demorar demasiado

**Tempos normais de espera:**
- Aplicação web simples: 5-10 minutos
- Aplicação com base de dados: 10-15 minutos
- Aplicações AI: 15-25 minutos (Provisionamento OpenAI é lento)

```bash
# Verificar progresso
azd show

# Se estiver preso >30 minutos, verifique o Azure Portal:
azd monitor
# Procure implantações falhadas
```

### ❌ "Permissão negada" ou "Proibido"

```bash
# Verifique o seu papel no Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Necessita pelo menos da função "Colaborador"
# Peça ao seu administrador Azure para conceder:
# - Colaborador (para recursos)
# - Administrador de Acesso de Utilizador (para atribuições de funções)
```

### ❌ Não consegue encontrar URL da aplicação implantada

```bash
# Mostrar todos os pontos finais do serviço
azd show

# Ou abrir o Portal Azure
azd monitor

# Verificar serviço específico
azd env get-values
# Procurar variáveis *_URL
```

### 📚 Recursos Completos de Resolução de Problemas

- **Guia de Problemas Comuns:** [Soluções Detalhadas](docs/troubleshooting/common-issues.md)
- **Problemas Específicos AI:** [Resolução de Problemas AI](docs/troubleshooting/ai-troubleshooting.md)
- **Guia de Debug:** [Debug passo a passo](docs/troubleshooting/debugging.md)
- **Obtenha Ajuda:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Guia Rápido de Resolução de Problemas

**Problemas comuns enfrentados por iniciantes e soluções imediatas:**

<details>
<summary><strong>❌ "azd: comando não encontrado"</strong></summary>

```bash
# Instale primeiro o AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verificar a instalação
azd version
```
</details>

<details>
<summary><strong>❌ "Nenhuma subscrição encontrada" ou "Subscrição não definida"</strong></summary>

```bash
# Listar subscrições disponíveis
az account list --output table

# Definir subscrição predefinida
az account set --subscription "<subscription-id-or-name>"

# Definir para ambiente AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verificar
az account show
```
</details>

<details>
<summary><strong>❌ "Quota Insuficiente" ou "Limite de quota excedido"</strong></summary>

```bash
# Tente uma região Azure diferente
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
<summary><strong>❌ "azd up" falha a meio do processo</strong></summary>

```bash
# Opção 1: Limpar e tentar novamente
azd down --force --purge
azd up

# Opção 2: Apenas corrigir a infraestrutura
azd provision

# Opção 3: Verificar registos detalhados
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Falha na autenticação" ou "Token expirado"</strong></summary>

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
# AZD gera nomes únicos, mas se houver conflito:
azd down --force --purge

# Então tente novamente com um ambiente novo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Implantação do modelo a demorar demasiado</strong></summary>

**Tempos normais de espera:**
- Aplicação web simples: 5-10 minutos
- Aplicação com base de dados: 10-15 minutos
- Aplicações AI: 15-25 minutos (Provisionamento OpenAI é lento)

```bash
# Verificar progresso
azd show

# Se estiver parado >30 minutos, verifique o Portal Azure:
azd monitor
# Procure implantações falhadas
```
</details>

<details>
<summary><strong>❌ "Permissão negada" ou "Proibido"</strong></summary>

```bash
# Verifique o seu papel no Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Precisa de, pelo menos, o papel de "Contribuidor"
# Peça ao administrador do Azure para conceder:
# - Contribuidor (para recursos)
# - Administrador de Acesso de Utilizadores (para atribuições de papéis)
```
</details>

<details>
<summary><strong>❌ Não consegue encontrar URL da aplicação implantada</strong></summary>

```bash
# Mostrar todos os endpoints de serviço
azd show

# Ou abrir o Portal Azure
azd monitor

# Verificar serviço específico
azd env get-values
# Procurar variáveis *_URL
```
</details>

### 📚 Recursos Completos de Resolução de Problemas

- **Guia de Problemas Comuns:** [Soluções Detalhadas](docs/troubleshooting/common-issues.md)
- **Problemas Específicos AI:** [Resolução de Problemas AI](docs/troubleshooting/ai-troubleshooting.md)
- **Guia de Debug:** [Debug passo a passo](docs/troubleshooting/debugging.md)
- **Obtenha Ajuda:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Conclusão do Curso & Certificação

### Acompanhamento de Progresso
Acompanhe o progresso da sua aprendizagem em cada capítulo:

- [ ] **Capítulo 1**: Fundamentos & Introdução Rápida ✅
- [ ] **Capítulo 2**: Desenvolvimento AI-First ✅  
- [ ] **Capítulo 3**: Configuração & Autenticação ✅
- [ ] **Capítulo 4**: Infraestrutura como Código & Implantação ✅
- [ ] **Capítulo 5**: Soluções AI Multi-Agente ✅
- [ ] **Capítulo 6**: Validação & Planeamento Pré-Implantação ✅
- [ ] **Capítulo 7**: Resolução de Problemas & Debugging ✅
- [ ] **Capítulo 8**: Padrões de Produção & Empresariais ✅

### Verificação da Aprendizagem
Após terminar cada capítulo, verifique o seu conhecimento por:
1. **Exercício Prático**: Complete a implantação prática do capítulo
2. **Verificação de Conhecimento**: Revise a secção FAQ do seu capítulo
3. **Discussão na Comunidade**: Partilhe a sua experiência no Azure Discord
4. **Próximo Capítulo**: Avance para o próximo nível de complexidade

### Benefícios da Conclusão do Curso
Ao concluir todos os capítulos, terá:
- **Experiência de Produção**: Aplicações AI reais implantadas no Azure
- **Competências Profissionais**: Capacidades de implantação prontas para empresa  
- **Reconhecimento na Comunidade**: Membro ativo da comunidade de desenvolvedores Azure
- **Avanço na Carreira**: Expertise requisitada em implantação AZD e AI

---

## 🤝 Comunidade & Suporte

### Obtenha Ajuda & Suporte
- **Problemas Técnicos**: [Reportar bugs e solicitar funcionalidades](https://github.com/microsoft/azd-for-beginners/issues)
- **Dúvidas de Aprendizagem**: [Comunidade Microsoft Azure Discord](https://discord.gg/microsoft-azure) e [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajuda Específica AI**: Junte-se ao [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentação**: [Documentação oficial Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insights da Comunidade Microsoft Foundry Discord

**Resultados recentes da sondagem no canal #Azure:**
- **45%** dos desenvolvedores querem usar AZD para workloads AI
- **Principais desafios**: Implantações multi-serviço, gestão de credenciais, prontidão para produção  
- **Mais pedidos**: Modelos específicos AI, guias de resolução de problemas, melhores práticas

**Junte-se à nossa comunidade para:**
- Partilhar as suas experiências AZD + AI e obter ajuda
- Aceder a pré-visualizações antecipadas de novos modelos AI
- Contribuir para melhores práticas de implantação AI
- Influenciar o desenvolvimento futuro de funcionalidades AI + AZD

### Contribuir para o Curso
Aceitamos contribuições! Por favor leia o nosso [Guia de Contribuição](CONTRIBUTING.md) para detalhes sobre:
- **Melhorias de Conteúdo**: Melhorar capítulos e exemplos existentes
- **Novos Exemplos**: Adicionar cenários e modelos reais  
- **Tradução**: Ajudar a manter suporte multilíngue
- **Relatórios de Bugs**: Melhorar a precisão e clareza
- **Padrões da Comunidade**: Seguir as nossas diretrizes inclusivas

---

## 📄 Informação do Curso

### Licença
Este projeto está licenciado sob a Licença MIT - veja o ficheiro [LICENSE](../../LICENSE) para detalhes.

### Recursos Microsoft Learning Relacionados

A nossa equipa produz outros cursos completos de aprendizagem:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j para Iniciantes](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js para Iniciantes](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain para Iniciantes](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD para Iniciantes](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI para Iniciantes](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP para Iniciantes](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Agentes AI para Iniciantes](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Generative AI
[![Generative AI para Iniciantes](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Aprendizagem Core
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navegação do Curso

**🚀 Pronto para Começar a Aprender?**

**Iniciantes**: Comece com [Capítulo 1: Fundamentos e Início Rápido](../..)  
**Desenvolvedores de IA**: Passe para [Capítulo 2: Desenvolvimento AI-First](../..)  
**Desenvolvedores Experientes**: Comece pelo [Capítulo 3: Configuração e Autenticação](../..)

**Próximos Passos**: [Começar Capítulo 1 - Noções Básicas AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte oficial. Para informações críticas, recomenda-se a tradução profissional efetuada por um humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->