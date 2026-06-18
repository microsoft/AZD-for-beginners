# AZD Para Iniciantes: Uma Jornada de Aprendizagem Estruturada

![AZD-for-beginners](../../translated_images/pt-PT/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduções Automáticas (Sempre Atualizadas)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Árabe](../ar/README.md) | [Bengali](../bn/README.md) | [Búlgaro](../bg/README.md) | [Birmanês (Myanmar)](../my/README.md) | [Chinês (Simplificado)](../zh-CN/README.md) | [Chinês (Tradicional, Hong Kong)](../zh-HK/README.md) | [Chinês (Tradicional, Macau)](../zh-MO/README.md) | [Chinês (Tradicional, Taiwan)](../zh-TW/README.md) | [Croata](../hr/README.md) | [Checo](../cs/README.md) | [Dinamarquês](../da/README.md) | [Holandês](../nl/README.md) | [Estónio](../et/README.md) | [Finlandês](../fi/README.md) | [Francês](../fr/README.md) | [Alemão](../de/README.md) | [Grego](../el/README.md) | [Hebraico](../he/README.md) | [Hindi](../hi/README.md) | [Húngaro](../hu/README.md) | [Indonésio](../id/README.md) | [Italiano](../it/README.md) | [Japonês](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malaio](../ms/README.md) | [Malaiala](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Norueguês](../no/README.md) | [Persa (Farsi)](../fa/README.md) | [Polaco](../pl/README.md) | [Português (Brasil)](../pt-BR/README.md) | [Português (Portugal)](./README.md) | [Punyabi (Gurmukhi)](../pa/README.md) | [Romeno](../ro/README.md) | [Russo](../ru/README.md) | [Sérvio (Cirílico)](../sr/README.md) | [Eslovaco](../sk/README.md) | [Esloveno](../sl/README.md) | [Espanhol](../es/README.md) | [Suaíli](../sw/README.md) | [Sueco](../sv/README.md) | [Tagalo (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Tailandês](../th/README.md) | [Turco](../tr/README.md) | [Ucraniano](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Prefere Clonar Localmente?**
>
> Este repositório inclui mais de 50 traduções de idiomas que aumentam significativamente o tamanho do download. Para clonar sem traduções, use o checkout esparso:
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
> Isto dá-lhe tudo o que precisa para completar o curso com um download muito mais rápido.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Novidades no azd Hoje

> 📌 Este curso está validado contra **`azd 1.25.6`** (Junho de 2026). Execute `azd version` para verificar a sua versão, e `azd upgrade` para obter a mais recente.

O Azure Developer CLI ultrapassou as tradicionais web apps e APIs. Hoje, o azd é a ferramenta única para implementar **qualquer** aplicação no Azure—including aplicações com IA e agentes inteligentes.

Isto é o que isto significa para si:

- **Agentes de IA são agora cargas de trabalho azd de primeira classe.** Pode inicializar, implementar e gerir projetos de agentes de IA com o mesmo fluxo `azd init` → `azd up` que já conhece.
- **Um ciclo de vida completo do agente a partir da CLI.** A extensão `azure.ai.agents` agora cobre toda a jornada—`azd ai agent init` para scaffolding, `azd ai agent invoke` para testar (com saída de tempo de resposta), `azd ai agent eval generate` e `azd ai agent optimize` para medir e melhorar a qualidade, e `azd ai agent delete` para limpeza.
- **Mais blocos de construção de IA.** Novas extensões em pré-visualização—`azure.ai.skills` e `azure.ai.connections`—permitem gerir skills reutilizáveis de agentes e conexões Foundry diretamente com azd.
- **Integração Microsoft Foundry** que traz deployment de modelos, hosting de agentes e configuração de serviços de IA diretamente no ecossistema de templates azd.
- **Rotinas diárias mais suaves.** As versões recentes tornaram o `azd init` idempotente (seguro para executar novamente), fizeram com que o `azd auth login` eliminasse automaticamente tokens obsoletos e adicionaram um pedido de setup amigável no primeiro uso do `azd tool`.
- **O fluxo principal não mudou.** Quer esteja a implementar uma app de tarefas, um microserviço, ou uma solução de IA multiagente, os comandos permanecem os mesmos.

> **Nota para utilizadores Aspire:** A Microsoft agora refere o produto simplesmente como **Aspire** (anteriormente ".NET Aspire"). O suporte azd para Aspire mantém-se inalterado—apenas o nome foi atualizado.

Se já usou azd anteriormente, o suporte a IA é uma extensão natural—não uma ferramenta separada ou uma via avançada. Se está a começar, vai aprender um fluxo que funciona para tudo.

---

## 🚀 O que é o Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** é uma ferramenta de linha de comandos amiga do programador que torna simples implementar aplicações no Azure. Em vez de criar e ligar dezenas de recursos Azure manualmente, pode implementar aplicações inteiras com um único comando.

### A Magia do `azd up`

```bash
# Este único comando faz tudo:
# ✅ Cria todos os recursos do Azure
# ✅ Configura a rede e a segurança
# ✅ Compila o código da sua aplicação
# ✅ Implanta no Azure
# ✅ Fornece uma URL funcional
azd up
```

**É tudo!** Nada de clicar no Portal Azure, nada de templates ARM complexos para aprender antes, nada de configurações manuais - apenas aplicações a funcionar no Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual a Diferença?

Esta é a pergunta mais comum entre os iniciantes. Aqui está a resposta simples:

| Característica | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|----------------|---------------------|--------------------------------|
| **Objetivo**   | Gerir recursos Azure individuais | Implementar aplicações completas |
| **Mentalidade**| Focado na infraestrutura | Focado em aplicações |
| **Exemplo**    | `az webapp create --name myapp...` | `azd up` |
| **Curva de Aprendizagem** | Deve conhecer serviços Azure | Apenas conhecer a sua app |
| **Ideal Para** | DevOps, Infraestrutura | Programadores, Prototipagem |

### Analogia Simples

- **Azure CLI** é como ter todas as ferramentas para construir uma casa - martelos, serras, pregos. Pode construir qualquer coisa, mas precisa de saber construir.
- **Azure Developer CLI** é como contratar um empreiteiro - descreve o que quer, e eles tratam da construção.

### Quando Usar Cada Um

| Cenário                          | Use Isto                    |
|---------------------------------|-----------------------------|
| "Quero implementar a minha web app rapidamente" | `azd up`                   |
| "Preciso de criar apenas uma conta de armazenamento" | `az storage account create` |
| "Estou a construir uma aplicação completa de IA" | `azd init --template azure-search-openai-demo` |
| "Preciso de depurar um recurso Azure específico" | `az resource show`         |
| "Quero um deployment pronto para produção em minutos" | `azd up --environment production` |

### Funcionam em Conjunto!

AZD usa Azure CLI por trás. Pode usar ambos:
```bash
# Implemente a sua aplicação com o AZD
azd up

# Em seguida, ajuste com precisão recursos específicos usando a Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Encontre Templates no Awesome AZD

Não comece do zero! **Awesome AZD** é a coleção comunitária de templates prontos para deploy:

| Recurso | Descrição |
|---------|-----------|
| 🔗 [**Galeria Awesome AZD**](https://azure.github.io/awesome-azd/) | Explore 200+ templates com deploy com um clique |
| 🔗 [**Envie um Template**](https://github.com/Azure/awesome-azd/issues) | Contribua com o seu próprio template para a comunidade |
| 🔗 [**Repositório GitHub**](https://github.com/Azure/awesome-azd) | Dê estrela e explore o código fonte |

### Templates populares de IA do Awesome AZD

```bash
# Chat RAG com modelos Microsoft Foundry + Pesquisa de IA
azd init --template azure-search-openai-demo

# Aplicação de chat de IA rápida
azd init --template openai-chat-app-quickstart

# Agentes de IA com Agentes Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Comece em 3 Passos

Antes de começar, certifique-se que o seu computador está pronto para o template que quer implementar:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se alguma verificação necessária falhar, corrija primeiro antes de continuar com o início rápido.

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

### Passo 2: Autenticar para AZD

```bash
# Opcional se planeia usar comandos da Azure CLI diretamente neste curso
az login

# Obrigatório para os fluxos de trabalho AZD
azd auth login
```

Se não tiver certeza de qual precisa, siga o fluxo de configuração completo em [Instalação & Configuração](docs/chapter-01-foundation/installation.md#authentication-setup).

### Passo 3: Implementar a Sua Primeira App

```bash
# Inicializar a partir de um modelo
azd init --template todo-nodejs-mongo

# Implantar no Azure (cria tudo!)
azd up
```

**🎉 Já está!** A sua app está agora ativa no Azure.

### Limpeza (Não se Esqueça!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Como Usar Este Curso

Este curso é concebido para **aprendizagem progressiva** - comece onde se sentir confortável e avance gradualmente:

| Sua Experiência | Comece Aqui |
|-----------------|-------------|
| **Novo no Azure** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Conhece Azure, novo no AZD** | [Capítulo 1: Fundamentos](#-chapter-1-foundation--quick-start) |
| **Quer implementar apps IA** | [Capítulo 2: Desenvolvimento IA-First](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Quer prática prática** | [🎓 Workshop Interativo](workshop/README.md) - laboratório guiado de 3-4 horas |
| **Precisa de padrões para produção** | [Capítulo 8: Produção & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Configuração Rápida

1. **Faça um Fork deste Repositório**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone-o**: `git clone https://github.com/SEU-NOME-UTILIZADOR/azd-for-beginners.git`
3. **Peça Ajuda**: [Comunidade Azure no Discord](https://discord.com/invite/ByRwuEEgH4)

> **Prefere Clonar Localmente?**

> Este repositório inclui mais de 50 traduções de idiomas que aumentam significativamente o tamanho do download. Para clonar sem traduções, use o checkout esparso:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Isto dá-lhe tudo o que precisa para completar o curso com um download muito mais rápido.


## Visão Geral do Curso

Domine o Azure Developer CLI (azd) através de capítulos estruturados concebidos para aprendizagem progressiva. **Foco especial na implementação de aplicações IA com integração Microsoft Foundry.**
### Porque Este Curso é Essencial para Desenvolvedores Modernos

Com base nas informações da comunidade Microsoft Foundry Discord, **45% dos desenvolvedores querem usar o AZD para cargas de trabalho de IA** mas encontram desafios com:
- Arquiteturas complexas de IA com múltiplos serviços
- Melhores práticas para implantação de IA em produção  
- Integração e configuração dos serviços Azure AI
- Otimização de custos para cargas de trabalho de IA
- Resolução de problemas específicos na implantação de IA

### Objetivos de Aprendizagem

Ao completar este curso estruturado, você irá:
- **Dominar os Fundamentos do AZD**: Conceitos principais, instalação e configuração
- **Implantar Aplicações de IA**: Usar AZD com serviços Microsoft Foundry
- **Implementar Infraestrutura como Código**: Gerir recursos Azure com templates Bicep
- **Resolver Problemas de Implantação**: Diagnosticar questões comuns e depurar problemas
- **Otimizar para Produção**: Segurança, escalabilidade, monitorização e gestão de custos
- **Construir Soluções Multi-Agente**: Implantar arquiteturas complexas de IA

## Antes de Começar: Contas, Acesso e Suposições

Antes de começar o Capítulo 1, certifique-se que tem o seguinte preparado. Os passos de instalação posteriores neste guia pressupõem que estas bases já estão resolvidas.

- **Uma subscrição Azure**: Pode usar uma subscrição existente do trabalho ou da sua conta pessoal, ou criar um [teste gratuito](https://aka.ms/azurefreetrial) para começar.
- **Permissão para criar recursos Azure**: Para a maioria dos exercícios, deverá ter pelo menos acesso **Colaborador** na subscrição ou grupo de recursos alvo. Alguns capítulos podem também presumir que pode criar grupos de recursos, identidades geridas e atribuições RBAC.
- [**Uma conta GitHub**](https://github.com): Útil para fazer fork do repositório, acompanhar as suas próprias alterações e usar GitHub Codespaces para o workshop.
- **Pré-requisitos de runtime dos templates**: Alguns templates precisam de ferramentas locais como Node.js, Python, Java ou Docker. Execute o validador de configuração antes de começar para detetar faltas de ferramentas atempadamente.
- **Familiaridade básica com terminal**: Não precisa de ser um especialista, mas deve sentir-se confortável a executar comandos como `git clone`, `azd auth login` e `azd up`.

> **Trabalha numa subscrição empresarial?**
> Se o seu ambiente Azure é gerido por um administrador, confirme antecipadamente que pode implantar recursos na subscrição ou grupo de recursos que planeia usar. Caso contrário, peça uma subscrição sandbox ou acesso de Colaborador antes de começar.

> **Novo no Azure?**
> Comece com o seu próprio teste Azure ou subscrição pay-as-you-go em https://aka.ms/azurefreetrial para poder completar os exercícios integralmente sem esperar pela aprovação a nível de tenant.

## 🗺️ Mapa do Curso: Navegação Rápida por Capítulo

Cada capítulo tem um README dedicado com objetivos de aprendizagem, inícios rápidos e exercícios:

| Capítulo | Tópico | Lições | Duração | Complexidade |
|---------|-------|---------|----------|------------|
| **[Cap 1: Fundação](docs/chapter-01-foundation/README.md)** | Iniciar | [Noções Básicas do AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalação](docs/chapter-01-foundation/installation.md) &#124; [Primeiro Projeto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap 2: Desenvolvimento AI](docs/chapter-02-ai-development/README.md)** | Aplicações AI-First | [Integração Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agentes AI](docs/chapter-02-ai-development/agents.md) &#124; [Implantação de Modelos](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Cap 3: Configuração](docs/chapter-03-configuration/README.md)** | Autenticação & Segurança | [Configuração](docs/chapter-03-configuration/configuration.md) &#124; [Autenticação & Segurança](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infraestrutura](docs/chapter-04-infrastructure/README.md)** | IaC & Implantação | [Guia de Implantação](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionamento](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Cap 5: Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluções com Agentes AI | [Cenário Retail](examples/retail-scenario.md) &#124; [Padrões de Coordenação](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Cap 6: Pré-implantação](docs/chapter-06-pre-deployment/README.md)** | Planeamento & Validação | [Checks Preliminares](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planeamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Cap 7: Resolução de Problemas](docs/chapter-07-troubleshooting/README.md)** | Depurar & Corrigir | [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Depuração](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemas de IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Cap 8: Produção](docs/chapter-08-production/README.md)** | Padrões Empresariais | [Práticas para Produção](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratório Prático | [Introdução](workshop/docs/instructions/0-Introduction.md) &#124; [Seleção](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validação](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Fecho](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Duração Total do Curso:** ~10-14 horas | **Progressão de Competências:** Iniciante → Pronto para Produção

---

## 📚 Capítulos de Aprendizagem

*Escolha o seu percurso de aprendizagem de acordo com o seu nível de experiência e objetivos*

### 🚀 Capítulo 1: Fundação & Início Rápido
**Pré-requisitos**: subscrição Azure, conhecimentos básicos de linha de comandos  
**Duração**: 30-45 minutos  
**Complexidade**: ⭐

#### O que Vai Aprender
- Compreender os fundamentos do Azure Developer CLI
- Instalar AZD na sua plataforma
- O seu primeiro deployment bem-sucedido

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [O que é Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [Noções Básicas do AZD](docs/chapter-01-foundation/azd-basics.md) - Conceitos e terminologia
- **⚙️ Configuração**: [Instalação & Setup](docs/chapter-01-foundation/installation.md) - Guias específicos para plataformas
- **🛠️ Prático**: [Seu Primeiro Projeto](docs/chapter-01-foundation/first-project.md) - Tutorial passo a passo
- **📋 Referência Rápida**: [Folha de Comandos](resources/cheat-sheet.md)

#### Exercícios Práticos
```bash
# Verificação rápida de instalação
azd version

# Implante a sua primeira aplicação
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resultado do Capítulo**: Implantar com sucesso uma simples aplicação web no Azure usando AZD

**✅ Validação do Sucesso:**
```bash
# Após completar o Capítulo 1, deverá ser capaz de:
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                  # Realiza o deployment para o Azure
azd show                # Mostra o URL da aplicação em execução
# A aplicação abre no browser e funciona
azd down --force --purge  # Limpa os recursos
```

**📊 Investimento de Tempo:** 30-45 minutos  
**📈 Nível de Competência Depois:** Capaz de implantar aplicações básicas de forma independente  
**📈 Nível de Competência Depois:** Capaz de implantar aplicações básicas de forma independente

---

### 🤖 Capítulo 2: Desenvolvimento AI-First (Recomendado para Desenvolvedores AI)
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 1-2 horas  
**Complexidade**: ⭐⭐

#### O que Vai Aprender
- Integração Microsoft Foundry com AZD
- Implantação de aplicações potenciadas por IA
- Compreender configurações dos serviços AI

#### Recursos de Aprendizagem
- **🎯 Comece Aqui**: [Integração Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agentes AI**: [Guia de Agentes AI](docs/chapter-02-ai-development/agents.md) - Implantar agentes inteligentes com AZD
- **📖 Padrões**: [Implantação de Modelos AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Implantar e gerir modelos AI
- **🛠️ Workshop**: [Laboratório AI Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) - Prepare as suas soluções AI para AZD
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Aprendizagem no navegador com MkDocs * Ambiente DevContainer
- **📋 Templates**: [Templates Microsoft Foundry](#recursos-do-workshop)
- **📝 Exemplos**: [Exemplos de Implantação AZD](examples/README.md)

#### Exercícios Práticos
```bash
# Desdobre a sua primeira aplicação de IA
azd init --template azure-search-openai-demo
azd up

# Experimente modelos adicionais de IA
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resultado do Capítulo**: Implantar e configurar uma aplicação de chat AI com capacidades RAG

**✅ Validação do Sucesso:**
```bash
# Após o Capítulo 2, deverá ser capaz de:
azd init --template azure-search-openai-demo
azd up
# Testar a interface de chat da IA
# Fazer perguntas e obter respostas potenciadas por IA com fontes
# Verificar se a integração de pesquisa funciona
azd monitor  # Confirmar que o Application Insights mostra telemetria
azd down --force --purge
```

**📊 Investimento de Tempo:** 1-2 horas  
**📈 Nível de Competência Depois:** Capaz de implantar e configurar aplicações AI prontas para produção  
**💰 Consciência do Custo:** Compreende custos de desenvolvimento de $80-150/mês e custos de produção de $300-3500/mês

#### 💰 Considerações de Custo para Implantação AI

**Ambiente de Desenvolvimento (Estimado $80-150/mês):**
- Modelos Microsoft Foundry (Pague pelo uso): $0-50/mês (baseado no uso de tokens)
- AI Search (nível básico): $75/mês
- Container Apps (Consumo): $0-20/mês
- Armazenamento (Padrão): $1-5/mês

**Ambiente de Produção (Estimado $300-3,500+/mês):**
- Modelos Microsoft Foundry (PTU para performance consistente): $3,000+/mês OU Pague pelo uso com alto volume
- AI Search (nível Standard): $250/mês
- Container Apps (Dedicado): $50-100/mês
- Application Insights: $5-50/mês
- Armazenamento (Premium): $10-50/mês

**💡 Dicas para Otimização de Custos:**
- Use modelos Microsoft Foundry **na camada gratuita** para aprendizagem (Azure OpenAI inclui 50.000 tokens/mês)
- Execute `azd down` para desalocar recursos quando não estiver a desenvolver ativamente
- Comece com faturação baseada em consumo, faça upgrade para PTU só em produção
- Use `azd provision --preview` para estimar custos antes da implantação
- Ative auto-escalamento: pague apenas pelo consumo real

**Monitorização de Custos:**
```bash
# Verificar custos mensais estimados
azd provision --preview

# Monitorizar custos reais no Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capítulo 3: Configuração & Autenticação
**Pré-requisitos**: Capítulo 1 concluído  
**Duração**: 45-60 minutos  
**Complexidade**: ⭐⭐

#### O que Vai Aprender
- Configuração e gestão de ambientes
- Melhores práticas de autenticação e segurança
- Nomeação e organização de recursos

#### Recursos de Aprendizagem
- **📖 Configuração**: [Guia de Configuração](docs/chapter-03-configuration/configuration.md) - Setup de ambiente
- **🔐 Segurança**: [Padrões de autenticação e identidade gerida](docs/chapter-03-configuration/authsecurity.md) - Padrões de autenticação
- **📝 Exemplos**: [Exemplo App Base de Dados](examples/database-app/README.md) - Exemplos AZD para bases de dados

#### Exercícios Práticos
- Configurar múltiplos ambientes (dev, staging, prod)
- Configurar autenticação por identidade gerida
- Implementar configurações específicas por ambiente

**💡 Resultado do Capítulo**: Gerir múltiplos ambientes com autenticação e segurança adequadas

---

### 🏗️ Capítulo 4: Infraestrutura como Código & Implantação
**Pré-requisitos**: Capítulos 1-3 concluídos  
**Duração**: 1-1.5 horas  
**Complexidade**: ⭐⭐⭐

#### O que Vai Aprender
- Padrões avançados de implantação
- Infraestrutura como Código com Bicep
- Estratégias para provisionamento de recursos

#### Recursos de Aprendizagem
- **📖 Implantação**: [Guia de Implantação](docs/chapter-04-infrastructure/deployment-guide.md) - Workflows completos
- **🏗️ Provisionamento**: [Provisionamento de Recursos](docs/chapter-04-infrastructure/provisioning.md) - Gestão de recursos Azure
- **📝 Exemplos**: [Exemplo Container App](../../examples/container-app) - Implantação de containers

#### Exercícios Práticos
- Criar templates Bicep personalizados
- Implantar aplicações multi-serviço
- Implementar estratégias de implantação blue-green

**💡 Resultado do Capítulo**: Implantar aplicações complexas multi-serviço usando templates de infraestrutura personalizados

---
### 🎯 Capítulo 5: Soluções de IA Multi-Agente (Avançado)
**Pré-requisitos**: Capítulos 1-2 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O que irá aprender
- Padrões de arquitetura multi-agente
- Orquestração e coordenação de agentes
- Deploys de IA prontos para produção

#### Recursos Didáticos
- **🤖 Projeto em Destaque**: [Solução Multi-Agente para Retalho](examples/retail-scenario.md) - Implementação completa
- **🛠️ Templates ARM**: [Pacote de Templates ARM](../../examples/retail-multiagent-arm-template) - Deploy com um clique
- **📖 Arquitetura**: [Padrões de coordenação multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Padrões

#### Exercícios Práticos
```bash
# Desenhe a solução completa de múltiplos agentes para retalho
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore as configurações dos agentes
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultado do Capítulo**: Fazer deploy e gerir uma solução de IA multi-agente pronta para produção com agentes de Cliente e Inventário

---

### 🔍 Capítulo 6: Validação e Planeamento Pré-Deploy
**Pré-requisitos**: Capítulo 4 concluído  
**Duração**: 1 hora  
**Complexidade**: ⭐⭐

#### O que irá aprender
- Planeamento de capacidade e validação de recursos
- Estratégias de seleção de SKUs
- Verificações pré-implementação e automação

#### Recursos Didáticos
- **📊 Planeamento**: [Planeamento de Capacidade](docs/chapter-06-pre-deployment/capacity-planning.md) - Validação de recursos
- **💰 Seleção**: [Seleção de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Escolhas custo-efetivas
- **✅ Validação**: [Verificações Pré-Implementação](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatizados

#### Exercícios Práticos
- Executar scripts de validação de capacidade
- Otimizar seleções de SKU para custo
- Implementar verificações pré-deploy automatizadas

**💡 Resultado do Capítulo**: Validar e otimizar os deploys antes da execução

---

### 🚨 Capítulo 7: Resolução de Problemas & Depuração
**Pré-requisitos**: Qualquer capítulo de deploy concluído  
**Duração**: 1-1,5 horas  
**Complexidade**: ⭐⭐

#### O que irá aprender
- Abordagens sistemáticas de depuração
- Problemas comuns e soluções
- Resolução de problemas específica para IA

#### Recursos Didáticos
- **🔧 Problemas Comuns**: [Problemas Comuns](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluções
- **🕵️ Depuração**: [Guia de Depuração](docs/chapter-07-troubleshooting/debugging.md) - Estratégias passo a passo
- **🤖 Problemas em IA**: [Resolução de Problemas em IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemas em serviços de IA

#### Exercícios Práticos
- Diagnosticar falhas de deploy
- Resolver problemas de autenticação
- Depurar conectividade do serviço de IA

**💡 Resultado do Capítulo**: Diagnosticar e resolver de forma independente problemas comuns de deploy

---

### 🏢 Capítulo 8: Padrões de Produção & Empresariais
**Pré-requisitos**: Capítulos 1-4 concluídos  
**Duração**: 2-3 horas  
**Complexidade**: ⭐⭐⭐⭐

#### O que irá aprender
- Estratégias de deploy em produção
- Padrões de segurança empresarial
- Monitorização e otimização de custos

#### Recursos Didáticos
- **🏭 Produção**: [Melhores Práticas de IA em Produção](docs/chapter-08-production/production-ai-practices.md) - Padrões empresariais
- **📝 Exemplos**: [Exemplo de Microserviços](../../examples/microservices) - Arquiteturas complexas
- **📊 Monitorização**: [Integração com Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorização

#### Exercícios Práticos
- Implementar padrões de segurança empresarial
- Configurar monitorização abrangente
- Fazer deploy para produção com governação adequada

**💡 Resultado do Capítulo**: Fazer deploy de aplicações empresariais com todas as capacidades de produção

---

## 🎓 Visão Geral do Workshop: Experiência de Aprendizagem Prática

> **⚠️ ESTADO DO WORKSHOP: Desenvolvimento Ativo**  
> Os materiais do workshop estão atualmente a ser desenvolvidos e aprimorados. Módulos principais estão funcionais, mas algumas secções avançadas ainda estão incompletas. Estamos a trabalhar ativamente para completar todo o conteúdo. [Acompanhe o progresso →](workshop/README.md)

### Materiais Interativos do Workshop
**Aprendizagem prática abrangente com ferramentas baseadas no navegador e exercícios guiados**

Os nossos materiais de workshop oferecem uma experiência de aprendizagem estruturada e interativa que complementa o currículo por capítulos acima. O workshop é adequado para aprendizagem autónoma e para sessões com instrutor.

#### 🛠️ Funcionalidades do Workshop
- **Interface Baseada no Navegador**: Workshop completo alimentado por MkDocs com pesquisa, cópia e funcionalidades temáticas
- **Integração com GitHub Codespaces**: Configuração do ambiente de desenvolvimento com um clique
- **Caminho de Aprendizagem Estruturado**: 8 módulos de exercícios guiados (3-4 horas totais)
- **Metodologia Progressiva**: Introdução → Seleção → Validação → Desconstrução → Configuração → Personalização → Desmontagem → Conclusão
- **Ambiente DevContainer Interativo**: Ferramentas e dependências pré-configuradas

#### 📚 Estrutura dos Módulos do Workshop
O workshop segue uma **metodologia progressiva de 8 módulos** que o leva desde a descoberta até à maestria no deploy:

| Módulo | Tema | O que irá fazer | Duração |
|--------|-------|----------------|----------|
| **0. Introdução** | Visão Geral do Workshop | Compreender objetivos de aprendizagem, pré-requisitos e estrutura do workshop | 15 min |
| **1. Seleção** | Descoberta de Templates | Explorar templates AZD e selecionar o template de IA correto para o seu cenário | 20 min |
| **2. Validação** | Deploy & Verificação | Fazer deploy do template com `azd up` e validar funcionamento da infraestrutura | 30 min |
| **3. Desconstrução** | Compreender a Estrutura | Usar GitHub Copilot para explorar arquitetura do template, ficheiros Bicep e organização do código | 30 min |
| **4. Configuração** | Análise Profunda do azure.yaml | Dominar configuração do `azure.yaml`, lifecycle hooks e variáveis de ambiente | 30 min |
| **5. Personalização** | Customize a Seu Gosto | Ativar Pesquisa IA, tracing, avaliação e personalizar para o seu cenário | 45 min |
| **6. Desmontagem** | Limpeza | Desprovisionar recursos com segurança usando `azd down --purge` | 15 min |
| **7. Conclusão** | Próximos Passos | Rever conquistas, conceitos chave e continuar a sua jornada de aprendizagem | 15 min |

**Fluxo do Workshop:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Começar o Workshop
```bash
# Opção 1: GitHub Codespaces (Recomendado)
# Clique em "Code" → "Create codespace on main" no repositório

# Opção 2: Desenvolvimento Local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Siga as instruções de configuração em workshop/README.md
```

#### 🎯 Resultados da Aprendizagem no Workshop
Ao completar o workshop, os participantes irão:
- **Fazer Deploy de Aplicações de IA em Produção**: Usar AZD com serviços Microsoft Foundry
- **Dominar Arquiteturas Multi-Agente**: Implementar soluções coordenadas de agentes de IA
- **Implementar Melhores Práticas de Segurança**: Configurar autenticação e controlo de acesso
- **Otimizar para Escala**: Projetar deploys custo-efetivos e performantes
- **Resolver Problemas de Deploy**: Diagnosticar e corrigir problemas comuns de forma independente

#### 📖 Recursos do Workshop
- **🎥 Guia Interativo**: [Materiais do Workshop](workshop/README.md) - Ambiente de aprendizagem baseado no navegador
- **📋 Instruções por Módulo**:
  - [0. Introdução](workshop/docs/instructions/0-Introduction.md) - Visão geral e objetivos do workshop
  - [1. Seleção](workshop/docs/instructions/1-Select-AI-Template.md) - Encontrar e selecionar templates IA
  - [2. Validação](workshop/docs/instructions/2-Validate-AI-Template.md) - Fazer deploy e verificar templates
  - [3. Desconstrução](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorar arquitetura do template
  - [4. Configuração](workshop/docs/instructions/4-Configure-AI-Template.md) - Dominar azure.yaml
  - [5. Personalização](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizar para o seu cenário
  - [6. Desmontagem](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Limpeza de recursos
  - [7. Conclusão](workshop/docs/instructions/7-Wrap-up.md) - Rever e próximos passos
- **🛠️ Laboratório de IA Workshop**: [Laboratório de IA Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercícios focados em IA
- **💡 Arranque Rápido**: [Guia de Configuração do Workshop](workshop/README.md#quick-start) - Configuração do ambiente

**Perfeito para**: Formação corporativa, cursos universitários, autoaprendizagem e bootcamps de desenvolvimento.

---

## 📖 Exploração Profunda: Capacidades do AZD

Além do básico, o AZD oferece funcionalidades poderosas para deploys em produção:

- **Deploys baseados em templates** - Usar templates pré-construídos para padrões comuns de aplicações
- **Infraestrutura como Código** - Gerir recursos Azure usando Bicep ou Terraform  
- **Workflows integrados** - Provisionar, fazer deploy e monitorizar aplicações sem falhas
- **Amigável para Desenvolvedores** - Otimizado para produtividade e experiência do programador

### **AZD + Microsoft Foundry: Perfeito para Deploys de IA**

**Porque usar AZD para Soluções de IA?** AZD resolve os principais desafios que os desenvolvedores de IA enfrentam:

- **Templates Prontos para IA** - Templates pré-configurados para Microsoft Foundry Models, Azure AI Services e cargas de trabalho ML
- **Deploys de IA Seguros** - Padrões de segurança incorporados para serviços IA, chaves API e endpoints de modelo  
- **Padrões de IA para Produção** - Melhores práticas para aplicações IA escaláveis e custo-efetivas
- **Workflows End-to-End para IA** - Desde o desenvolvimento do modelo ao deploy em produção com monitorização adequada
- **Otimização de Custos** - Alocação inteligente e estratégias de escalonamento para cargas de trabalho IA
- **Integração com Microsoft Foundry** - Ligação fluida ao catálogo de modelos e endpoints Microsoft Foundry

---

## 🎯 Biblioteca de Templates & Exemplos

### Em Destaque: Templates Microsoft Foundry
**Comece aqui se estiver a fazer deploys de aplicações IA!**

> **Nota:** Estes templates demonstram vários padrões IA. Alguns são Azure Samples externos, outros são implementações locais.

| Template | Capítulo | Complexidade | Serviços | Tipo |
|----------|----------|--------------|----------|------|
| [**Começar com chat IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externo |
| [**Começar com agentes IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capítulo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Externo |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externo |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externo |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externo |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externo |
| [**Solução Multi-Agente para Retalho**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Em Destaque: Cenários Completos de Aprendizagem
**Templates de aplicação prontos para produção mapeados para capítulos de aprendizagem**

| Template | Capítulo de Aprendizagem | Complexidade | Aprendizagem Principal |
|----------|--------------------------|--------------|-----------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capítulo 2 | ⭐ | Padrões básicos de deploy IA |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capítulo 2 | ⭐⭐ | Implementação RAG com Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capítulo 4 | ⭐⭐ | Integração Intelligence de Documentos |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capítulo 5 | ⭐⭐⭐ | Framework de agentes e chamadas de função |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capítulo 8 | ⭐⭐⭐ | Orquestração IA empresarial |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capítulo 5 | ⭐⭐⭐⭐ | Arquitetura multi-agente com agentes Cliente e Inventário |

### Aprendizagem por Tipo de Exemplo

> **📌 Exemplos Locais vs. Externos:**  
> **Exemplos Locais** (neste repositório) = Prontos a usar imediatamente  
> **Exemplos Externos** (Azure Samples) = Clonar a partir dos repositórios vinculados

#### Exemplos Locais (Prontos a Usar)
- [**Solução Multi-Agente para Retalho**](examples/retail-scenario.md) - Implementação completa pronta para produção com templates ARM
  - Arquitetura multi-agente (agentes Cliente + Inventário)
  - Monitorização e avaliação abrangentes
  - Deploy com um clique via template ARM

#### Exemplos Locais - Aplicações Containerizadas (Capítulos 2-5)
**Exemplos abrangentes de deploy de containers neste repositório:**
- [**Exemplos de Aplicações em Contentores**](examples/container-app/README.md) - Guia completo para despliegues conteinerizados
  - [API Flask Simples](../../examples/container-app/simple-flask-api) - API REST básica com escala a zero
  - [Arquitetura de Microserviços](../../examples/container-app/microservices) - Despliegue multi-serviço pronto para produção
  - Padrões de Despliegue Iniciais, de Produção e Avançados
  - Diretrizes para monitorização, segurança e otimização de custos

#### Exemplos Externos - Aplicações Simples (Capítulos 1-2)
**Clone estes repositórios Azure Samples para começar:**
- [Aplicação Web Simples - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Padrões básicos de despliegue
- [Website Estático - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Despliegue de conteúdo estático
- [Aplicação em Contentores - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Despliegue de API REST

#### Exemplos Externos - Integração de Base de Dados (Capítulos 3-4)  
- [Aplicação de Base de Dados - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Padrões de conectividade a bases de dados
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Fluxo de trabalho serverless para dados

#### Exemplos Externos - Padrões Avançados (Capítulos 4-8)
- [Microserviços Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arquiteturas multi-serviço
- [Jobs em Aplicações em Contentores](https://github.com/Azure-Samples/container-apps-jobs) - Processamento em background  
- [Pipeline ML Empresarial](https://github.com/Azure-Samples/mlops-v2) - Padrões de ML prontos para produção

### Coleções de Templates Externos
- [**Galeria Oficial de Templates AZD**](https://azure.github.io/awesome-azd/) - Coleção curada de templates oficiais e comunitários
- [**Templates do Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentação dos templates no Microsoft Learn
- [**Directório de Exemplos**](examples/README.md) - Exemplos locais de aprendizagem com explicações detalhadas

---

## 📚 Recursos de Aprendizagem & Referências

### Referências Rápidas
- [**Folha de Comandos**](resources/cheat-sheet.md) - Comandos essenciais azd organizados por capítulo
- [**Glossário**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Perguntas frequentes organizadas por capítulo de aprendizagem
- [**Guia de Estudo**](resources/study-guide.md) - Exercícios práticos abrangentes

### Workshops Práticos
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Torne as suas soluções de IA deployáveis com AZD (2-3 horas)
- [**Workshop Interativo**](workshop/README.md) - Exercícios guiados em 8 módulos com MkDocs e GitHub Codespaces
  - Segue: Introdução → Seleção → Validação → Desconstrução → Configuração → Customização → Encerramento → Conclusão

### Recursos Externos de Aprendizagem
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitectura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculadora de Preços Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status do Azure](https://status.azure.com/)

### Competências AI Agent para o Seu Editor
- [**Competências Microsoft Azure em skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 competências abertas de agentes para Azure AI, Foundry, despliegue, diagnósticos, otimização de custos e mais. Instale-as no GitHub Copilot, Cursor, Claude Code ou qualquer agente suportado:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guia Rápido de Resolução de Problemas

**Problemas comuns que os iniciantes enfrentam e soluções imediatas:**

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
<summary><strong>❌ "Quota insuficiente" ou "Quota excedida"</strong></summary>

```bash
# Experimente uma região Azure diferente
azd env set AZURE_LOCATION "westus2"
azd up

# Ou utilize SKUs mais pequenos em desenvolvimento
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

# Opção 3: Verificar o estado detalhado
azd show

# Opção 4: Verificar os logs no Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autenticação falhou" ou "Token expirado"</strong></summary>

```bash
# Reautenticar para AZD
azd auth logout
azd auth login

# Opcional: atualizar também o Azure CLI se estiver a executar comandos az
az logout
az login

# Verificar a autenticação
az account show
```
</details>

<details>
<summary><strong>❌ "Recurso já existe" ou conflitos de nomeação</strong></summary>

```bash
# AZD gera nomes únicos, mas em caso de conflito:
azd down --force --purge

# Depois tenta novamente com um ambiente novo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Despliegue do template está a demorar demasiado</strong></summary>

**Tempos normales de espera:**
- Aplicação web simples: 5-10 minutos
- Aplicação com base de dados: 10-15 minutos
- Aplicações AI: 15-25 minutos (provisionamento OpenAI é lento)

```bash
# Verificar progresso
azd show

# Se preso >30 minutos, verificar o Portal Azure:
azd monitor --overview
# Procurar implantações falhadas
```
</details>

<details>
<summary><strong>❌ "Permissão negada" ou "Proibido"</strong></summary>

```bash
# Verifique a sua função no Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Necessita pelo menos da função "Colaborador"
# Peça ao seu administrador Azure para conceder:
# - Colaborador (para recursos)
# - Administrador de Acesso de Utilizadores (para atribuições de funções)
```
</details>

<details>
<summary><strong>❌ Não consegue encontrar a URL da aplicação despliegada</strong></summary>

```bash
# Mostrar todos os pontos finais do serviço
azd show

# Ou abrir o Portal Azure
azd monitor

# Verificar serviço específico
azd env get-values
# Procurar variáveis *_URL
```
</details>

### 📚 Recursos Completos de Resolução de Problemas

- **Guia de Problemas Comuns:** [Soluções Detalhadas](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemas Específicos de IA:** [Resolução de Problemas AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guia de Debugging:** [Debugging passo a passo](docs/chapter-07-troubleshooting/debugging.md)
- **Obtenha Ajuda:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Conclusão do Curso & Certificação

### Acompanhamento do Progresso
Acompanhe o seu progresso de aprendizagem em cada capítulo:

- [ ] **Capítulo 1**: Fundamentos & Início Rápido ✅
- [ ] **Capítulo 2**: Desenvolvimento com AI em Primeiro Lugar ✅  
- [ ] **Capítulo 3**: Configuração & Autenticação ✅
- [ ] **Capítulo 4**: Infraestrutura como Código & Despliegue ✅
- [ ] **Capítulo 5**: Soluções AI Multi-Agentes ✅
- [ ] **Capítulo 6**: Validação & Planeamento Pré-Despliegue ✅
- [ ] **Capítulo 7**: Resolução de Problemas & Debugging ✅
- [ ] **Capítulo 8**: Padrões de Produção & Empresariais ✅

### Verificação de Aprendizagem
Após completar cada capítulo, verifique o seu conhecimento através de:
1. **Exercício Prático**: Complete o despliegue prático do capítulo
2. **Teste de Conhecimento**: Reveja a secção FAQ do capítulo
3. **Discussão Comunitária**: Partilhe a sua experiência no Azure Discord
4. **Próximo Capítulo**: Avance para o próximo nível de complexidade

### Benefícios da Conclusão do Curso
Ao concluir todos os capítulos, terá:
- **Experiência de Produção**: Aplicações AI reais despliegadas no Azure
- **Competências Profissionais**: Capacidades de despliegue prontas para o mercado empresarial  
- **Reconhecimento Comunitário**: Membro ativo da comunidade de desenvolvedores Azure
- **Avanço na Carreira**: Expertise procurada em AZD e despliegues AI

---

## 🤝 Comunidade & Suporte

### Obtenha Ajuda & Suporte
- **Problemas Técnicos**: [Reportar bugs e pedir funcionalidades](https://github.com/microsoft/azd-for-beginners/issues)
- **Dúvidas de Aprendizagem**: [Comunidade Microsoft Azure Discord](https://discord.gg/microsoft-azure) e [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Ajuda Específica para AI**: Junte-se ao [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentação**: [Documentação oficial Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insights da Comunidade do Microsoft Foundry Discord

**Resultados recentes da sondagem no canal #Azure:**
- **45%** dos desenvolvedores querem usar AZD para workloads de AI
- **Principais desafios**: Despliegues multi-serviço, gestão de credenciais, prontidão para produção  
- **Mais requisitados**: Templates específicos para AI, guias de resolução de problemas, melhores práticas

**Junte-se à nossa comunidade para:**
- Partilhar as suas experiências AZD + AI e obter ajuda
- Aceder a prévias antecipadas de novos templates AI
- Contribuir para as melhores práticas de despliegue AI
- Influenciar o desenvolvimento futuro de funcionalidades AI + AZD

### Contribuições para o Curso
Aceitamos contribuições! Por favor, leia o nosso [Guia de Contribuição](CONTRIBUTING.md) para detalhes sobre:
- **Melhorias de Conteúdo**: Aprimore capítulos e exemplos existentes
- **Novos Exemplos**: Adicione cenários reais e templates  
- **Tradução**: Ajude a manter o suporte multilíngue
- **Reportar Bugs**: Melhore a precisão e clareza
- **Padrões da Comunidade**: Siga as nossas diretrizes inclusivas de comunidade

---

## 📄 Informações do Curso

### Licença
Este projeto está licenciado sob a Licença MIT - veja o ficheiro [LICENSE](../../LICENSE) para detalhes.

### Recursos de Aprendizagem Relacionados Microsoft

A nossa equipa produz outros cursos abrangentes de aprendizagem:

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
 
### Série Generative AI
[![Generative AI para Iniciantes](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Aprendizagem Principal
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

**Iniciantes**: Comece com [Capítulo 1: Fundamentos & Início Rápido](#-chapter-1-foundation--quick-start)  
**Desenvolvedores de IA**: Pule para [Capítulo 2: Desenvolvimento AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Desenvolvedores Experientes**: Comece com [Capítulo 3: Configuração & Autenticação](#️-chapter-3-configuration--authentication)

**Próximos Passos**: [Começar Capítulo 1 – AZD Básico](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->