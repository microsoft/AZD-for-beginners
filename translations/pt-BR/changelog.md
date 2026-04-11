# Registro de alterações - AZD For Beginners

## Introdução

Este changelog documenta todas as mudanças, atualizações e melhorias notáveis no repositório AZD For Beginners. Seguimos os princípios de versionamento semântico e mantemos este registro para ajudar os usuários a entender o que mudou entre as versões.

## Objetivos de Aprendizagem

Ao revisar este changelog, você irá:
- Manter-se informado sobre novos recursos e adições de conteúdo
- Entender as melhorias feitas na documentação existente
- Acompanhar correções de bugs e ajustes para garantir precisão
- Acompanhar a evolução dos materiais de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Após revisar as entradas do changelog, você será capaz de:
- Identificar novos conteúdos e recursos disponíveis para aprendizado
- Entender quais seções foram atualizadas ou melhoradas
- Planejar seu caminho de aprendizado com base nos materiais mais atualizados
- Contribuir com feedback e sugestões para melhorias futuras

## Histórico de Versões

### [v3.19.1] - 2026-03-27

#### Esclarecimento de Onboarding para Iniciantes, Validação de Configuração e Limpeza Final de Comandos AZD
**Esta versão dá seguimento à verificação de validação do AZD 1.23 com uma revisão de documentação focada em iniciantes: esclarece as orientações de autenticação com prioridade ao AZD, adiciona scripts de validação de configuração local, verifica comandos-chave contra o CLI AZD ao vivo e remove as últimas referências de comandos em inglês obsoletas fora do changelog.**

#### Adicionado
- **🧪 Scripts de validação de configuração para iniciantes** com `validate-setup.ps1` e `validate-setup.sh` para que os aprendizes possam confirmar as ferramentas necessárias antes de iniciar o Capítulo 1
- **✅ Etapas iniciais de validação de configuração** no README raiz e no README do Capítulo 1 para que pré-requisitos ausentes sejam detectados antes de `azd up`

#### Alterado
- **🔐 Orientação de autenticação para iniciantes** agora trata de forma consistente `azd auth login` como o caminho primário para fluxos de trabalho AZD, com `az login` destacado como opcional, a menos que comandos do Azure CLI sejam usados diretamente
- **📚 Fluxo de onboarding do Capítulo 1** agora orienta os aprendizes a validar sua configuração local antes da instalação, autenticação e primeiros passos de implantação
- **🛠️ Mensagens do validador** agora separam claramente requisitos bloqueadores de avisos opcionais do Azure CLI para o caminho destinado apenas ao AZD para iniciantes
- **📖 Documentos de configuração, solução de problemas e exemplos** agora distinguem entre autenticação AZD necessária e login opcional do Azure CLI onde ambos eram anteriormente apresentados sem contexto

#### Corrigido
- **📋 Referências de comandos ainda em inglês** atualizadas para as formas atuais do AZD, incluindo `azd config show` no cheat sheet e `azd monitor --overview` onde a orientação de visão geral do Azure Portal era pretendida
- **🧭 Afirmações para iniciantes no Capítulo 1** suavizadas para evitar prometer excessivamente comportamento garantido de sem erros ou de rollback em todos os templates e recursos do Azure
- **🔎 Validação ao vivo do CLI** confirmou suporte atual para `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` e `azd down --force --purge`

#### Arquivos Atualizados
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### Validação do AZD 1.23.12, Expansão do Ambiente do Workshop e Atualização de Modelos de IA
**Esta versão realiza uma verificação de validação da documentação contra `azd` `1.23.12`, atualiza exemplos de comandos AZD desatualizados, atualiza as orientações de modelos de IA para os padrões atuais e amplia as instruções do workshop além do GitHub Codespaces para também suportar dev containers e clones locais.**

#### Adicionado
- **✅ Notas de validação em capítulos centrais e docs do workshop** para tornar explícita a base AZD testada para aprendizes que usam builds do CLI mais novos ou mais antigos
- **⏱️ Orientação de timeout de implantação** para implantações de aplicativos de IA de longa duração usando `azd deploy --timeout 1800`
- **🔎 Etapas de inspeção de extensão** com `azd extension show azure.ai.agents` na documentação de fluxo de trabalho de IA
- **🌐 Orientação mais ampla para ambientes de workshop** cobrindo GitHub Codespaces, dev containers e clones locais com MkDocs

#### Alterado
- **📚 READMEs de introdução dos capítulos** agora registram de forma consistente a validação contra `azd 1.23.12` nas seções de fundação, configuração, infraestrutura, multi-agente, pré-implantação, solução de problemas e produção
- **🛠️ Referências de comandos AZD** atualizadas para as formas atuais em toda a documentação:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` or `azd env get-value(s)` depending on context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` where Application Insights overview is intended
- **🧪 Exemplos de preview de provisionamento** simplificados para a utilização atualmente suportada, como `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Fluxo do workshop** atualizado para que os aprendizes possam completar os laboratórios em Codespaces, um dev container ou um clone local, em vez de presumir execução apenas em Codespaces
- **🔐 Orientação de autenticação** agora prefere `azd auth login` para fluxos de trabalho AZD, com `az login` posicionado como opcional quando comandos do Azure CLI são usados diretamente

#### Corrigido
- **🪟 Comandos de instalação no Windows** normalizados para a capitalização atual do pacote `winget` no guia de instalação
- **🐧 Orientação de instalação no Linux** corrigida para evitar instruções de gerenciador de pacotes `azd` específicas de distro não suportadas e, em vez disso, apontar para os assets de release quando apropriado
- **📦 Exemplos de modelos de IA** atualizados de padrões mais antigos como `gpt-35-turbo` e `text-embedding-ada-002` para exemplos atuais como `gpt-4.1-mini`, `gpt-4.1` e `text-embedding-3-large`
- **📋 Trechos de implantação e diagnóstico** corrigidos para usar os comandos atuais de ambiente e status em logs, scripts e passos de solução de problemas
- **⚙️ Orientação para GitHub Actions** atualizada de `Azure/setup-azd@v1.0.0` para `Azure/setup-azd@v2`
- **🤖 Orientação de consentimento MCP/Copilot** atualizada de `azd mcp consent` para `azd copilot consent list`

#### Melhorado
- **🧠 Orientações do capítulo de IA** agora explicam melhor o comportamento sensível a pré-visualização do `azd ai`, login específico por tenant, uso atual de extensões e recomendações atualizadas de implantação de modelos
- **🧪 Instruções do workshop** agora usam exemplos de versões mais realistas e uma linguagem mais clara de configuração de ambiente para laboratórios práticos
- **📈 Documentos de produção e solução de problemas** agora estão mais alinhados com exemplos atuais de monitoramento, modelo de fallback e níveis de custo

#### Arquivos Atualizados
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### Comandos AZD AI CLI, Validação de Conteúdo e Expansão de Templates
**Esta versão adiciona cobertura dos comandos `azd ai`, `azd extension` e `azd mcp` em todos os capítulos relacionados à IA, corrige links quebrados e código depreciado em agents.md, atualiza o cheat sheet e reformula a seção de Example Templates com descrições validadas e novos templates Azure AI AZD.**

#### Adicionado
- **🤖 Cobertura do AZD AI CLI** em 7 arquivos (anteriormente apenas no Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova seção "Extensions and AI Commands" introduzindo `azd extension`, `azd ai agent init`, e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opção 4: `azd ai agent init` com tabela de comparação (abordagem template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — subseções "Extensões AZD para Foundry" e "Implantação orientada por agente"
  - `docs/chapter-05-multi-agent/README.md` — O Quick Start agora mostra caminhos de implantação baseados em template e em manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — A seção Deploy agora inclui a opção `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — subseção "Comandos de Extensão AZD AI para Diagnóstico"
  - `resources/cheat-sheet.md` — Nova seção "Comandos de IA & Extensões" com `azd extension`, `azd ai agent init`, `azd mcp`, e `azd infra generate`
- **📦 Novos templates de exemplo AZD AI** em `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — chat RAG em .NET com Blazor WebAssembly, Semantic Kernel e suporte a chat por voz
  - **azure-search-openai-demo-java** — chat RAG em Java usando Langchain4J com opções de implantação ACA/AKS
  - **contoso-creative-writer** — aplicativo de escrita criativa multi-agente usando Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB com suporte a desenvolvimento local Ollama
  - **chat-with-your-data-solution-accelerator** — acelerador RAG empresarial com portal de administração, integração com Teams e opções PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — aplicativo de referência de orquestração MCP multi-agente com servidores em .NET, Python, Java e TypeScript
  - **azd-ai-starter** — template inicial Bicep minimal de infraestrutura Azure AI
  - **🔗 Link da galeria Awesome AZD AI** — Referência para a [galeria awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Corrigido
- **🔗 Navegação em agents.md**: os links Anterior/Próximo agora correspondem à ordem das lições do README do Capítulo 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 links quebrados em agents.md**: `production-ai-practices.md` corrigido para `../chapter-08-production/production-ai-practices.md` (3 ocorrências)
- **📦 Código depreciado em agents.md**: Substituído `opencensus` por `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API inválida em agents.md**: `max_tokens` movido de `create_agent()` para `create_run()` como `max_completion_tokens`
- **🔢 Contagem de tokens em agents.md**: Estimativa aproximada `len//4` substituída por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Serviços corrigidos de "Cognitive Search + App Service" para "Azure AI Search + Azure Container Apps" (host padrão alterado em outubro de 2024)
- **contoso-chat**: Descrição atualizada para referenciar Azure AI Foundry + Prompty, correspondendo ao título real do repositório e à stack tecnológica

#### Removido
- **ai-document-processing**: Referência a template não funcional removida (repositório não acessível publicamente como um template AZD)

#### Melhorado
- **📝 agents.md exercises**: O Exercício 1 agora mostra a saída esperada e a etapa `azd monitor`; o Exercício 2 inclui o código completo de registro do `FunctionTool`; o Exercício 3 substitui orientação vaga por comandos concretos `prepdocs.py`
- **📚 agents.md resources**: Links de documentação atualizados para os docs atuais do Azure AI Agent Service e quickstart
- **📋 agents.md Next Steps table**: Adicionado link do AI Workshop Lab para cobertura completa do capítulo

#### Arquivos Atualizados
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Aprimoramento da Navegação do Curso
**Esta versão melhora a navegação do README.md dos capítulos com um formato de tabela aprimorado.**

#### Alterado
- **Tabela do Mapa do Curso**: Aprimorada com links diretos das lições, estimativas de duração e classificações de complexidade
- **Limpeza de Pastas**: Removidas pastas antigas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validação de Links**: Todos os 21+ links internos na tabela do Mapa do Curso verificados

### [v3.16.0] - 2026-02-05

#### Atualizações de Nome do Produto
**Esta versão atualiza referências de produtos para a marca atual da Microsoft.**

#### Alterado
- **Microsoft Foundry → Microsoft Foundry**: Todas as referências atualizadas em arquivos não traduzidos
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir a marca atual

#### Arquivos Atualizados
- `README.md` - Página principal do curso
- `changelog.md` - Histórico de versões
- `course-outline.md` - Estrutura do curso
- `docs/chapter-02-ai-development/agents.md` - Guia de agentes de IA
- `examples/README.md` - Documentação de exemplos
- `workshop/README.md` - Página inicial do workshop
- `workshop/docs/index.md` - Índice do workshop
- `workshop/docs/instructions/*.md` - Todos os arquivos de instruções do workshop

---

### [v3.15.0] - 2026-02-05

#### Reestruturação Majoritária do Repositório: Nomes de Pastas por Capítulo
**Esta versão reestrutura a documentação em pastas dedicadas por capítulo para uma navegação mais clara.**

#### Renomeações de Pastas
Pastas antigas foram substituídas por pastas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Adicionado novo: `docs/chapter-05-multi-agent/`

#### Migração de Arquivos
| Arquivo | From | To |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Adicionado
- **📚 Arquivos README de Capítulo**: Criados README.md em cada pasta de capítulo com:
  - Objetivos de aprendizado e duração
  - Tabela de lições com descrições
  - Comandos de início rápido
  - Navegação para outros capítulos

#### Alterado
- **🔗 Atualizados todos os links internos**: 78+ caminhos atualizados em todos os arquivos de documentação
- **🗺️ README.md principal**: Mapa do Curso atualizado com a nova estrutura por capítulos
- **📝 examples/README.md**: Referências cruzadas atualizadas para pastas de capítulos

#### Removido
- Estrutura de pasta antiga (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestruturação do Repositório: Navegação por Capítulo
**Esta versão adicionou arquivos README de navegação por capítulo (substituído pela v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novo Guia de Agentes de IA
**Esta versão adiciona um guia abrangente para implantar agentes de IA com o Azure Developer CLI.**

#### Adicionado
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo cobrindo:
  - O que são agentes de IA e como eles diferem de chatbots
  - Três templates de agentes de início rápido (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agente (agente único, RAG, multi-agente)
  - Configuração e personalização de ferramentas
  - Monitoramento e rastreamento de métricas
  - Considerações de custo e otimização
  - Cenários comuns de solução de problemas
  - Três exercícios práticos com critérios de sucesso

#### Estrutura do Conteúdo
- **Introdução**: Conceitos de agente para iniciantes
- **Quick Start**: Implante agentes com `azd init --template get-started-with-ai-agents`
- **Padrões de Arquitetura**: Diagramas visuais de padrões de agentes
- **Configuração**: Configuração de ferramentas e variáveis de ambiente
- **Monitoramento**: Integração com Application Insights
- **Exercícios**: Aprendizado prático progressivo (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### Atualização do Ambiente DevContainer
**Esta versão atualiza a configuração do contêiner de desenvolvimento com ferramentas modernas e melhores padrões para a experiência de aprendizado AZD.**

#### Alterado
- **🐳 Imagem Base**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (última stable do Debian)
- **📛 Nome do Contêiner**: Renomeado de "Python 3" para "AZD for Beginners" para maior clareza

#### Adicionado
- **🔧 Novos Recursos do Dev Container**:
  - `azure-cli` com suporte a Bicep habilitado
  - `node:20` (versão LTS para templates AZD)
  - `github-cli` para gerenciamento de templates
  - `docker-in-docker` para implantações de container app

- **🔌 Encaminhamento de Portas**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (visualização MkDocs)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Novas Extensões do VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense avançado para Python
  - `ms-azuretools.vscode-azurefunctions` - Suporte a Azure Functions
  - `ms-azuretools.vscode-docker` - Suporte a Docker
  - `ms-azuretools.vscode-bicep` - Suporte à linguagem Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gerenciamento de recursos Azure
  - `yzhang.markdown-all-in-one` - Edição de Markdown
  - `DavidAnson.vscode-markdownlint` - Linting de Markdown
  - `bierner.markdown-mermaid` - Suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - Suporte a YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualização Git
  - `mhutchie.git-graph` - Histórico Git

- **⚙️ Configurações do VS Code**: Adicionadas configurações padrão para interpretador Python, formatar ao salvar e remover espaços em branco

- **📦 requirements-dev.txt atualizado**:
  - Adicionado plugin de minificação do MkDocs
  - Adicionado pre-commit para qualidade de código
  - Adicionados pacotes do Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigido
- **Comando Pós-Criação**: Agora verifica instalação do AZD e do Azure CLI ao iniciar o contêiner

---

### [v3.11.0] - 2026-02-05

#### Reformulação do README para Iniciantes
**Esta versão melhora significativamente o README.md para ser mais acessível a iniciantes e adiciona recursos essenciais para desenvolvedores de IA.**

#### Adicionado
- **🆚 Azure CLI vs AZD Comparação**: Explicação clara de quando usar cada ferramenta com exemplos práticos
- **🌟 Links Incríveis do AZD**: Links diretos para galeria de templates da comunidade e recursos de contribuição:
  - [Galeria Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ templates prontos para deploy
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Contribuição da comunidade
- **🎯 Guia de Início Rápido**: Seção de 3 passos simplificada para começar (Instalar → Login → Deploy)
- **📊 Tabela de Navegação Baseada em Experiência**: Orientação clara sobre onde começar com base na experiência do desenvolvedor

#### Alterado
- **Estrutura do README**: Reorganizada para divulgação progressiva - informações chave primeiro
- **Seção de Introdução**: Reescrita para explicar "A Magia do `azd up`" para iniciantes completos
- **Removido Conteúdo Duplicado**: Eliminada seção de solução de problemas duplicada
- **Comandos de Solução de Problemas**: Corrigida a referência `azd logs` para usar o válido `azd monitor --logs`

#### Corrigido
- **🔐 Comandos de Autenticação**: Adicionados `azd auth login` e `azd auth logout` em cheat-sheet.md
- **Referências a Comandos Inválidos**: Removidas referências restantes a `azd logs` na seção de solução de problemas do README

#### Observações
- **Escopo**: Alterações aplicadas ao README.md principal e resources/cheat-sheet.md
- **Público-Alvo**: Melhorias direcionadas especificamente a desenvolvedores novos no AZD

---

### [v3.10.0] - 2026-02-05

#### Atualização de Precisão de Comandos do Azure Developer CLI
**Esta versão corrige comandos AZD inexistentes em toda a documentação, garantindo que todos os exemplos de código usem a sintaxe válida do Azure Developer CLI.**

#### Corrigido
- **🔧 Comandos AZD Inexistentes Removidos**: Auditoria abrangente e correção de comandos inválidos:
  - `azd logs` (não existe) → substituído por `azd monitor --logs` ou alternativas do Azure CLI
  - subcomandos `azd service` (não existem) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (não existem) → removidos ou substituídos por alternativas válidas
  - flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (não existem) → removidas
  - flags `azd provision --what-if/--rollback` (não existem) → atualizadas para usar `--preview`
  - `azd config validate` (não existe) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (não existem) → removidos

- **📚 Arquivos Atualizados com Correções de Comando**:
  - `resources/cheat-sheet.md`: Grande reformulação da referência de comandos
  - `docs/deployment/deployment-guide.md`: Estratégias de rollback e deploy corrigidas
  - `docs/troubleshooting/debugging.md`: Seções de análise de logs corrigidas
  - `docs/troubleshooting/common-issues.md`: Comandos de solução de problemas atualizados
  - `docs/troubleshooting/ai-troubleshooting.md`: Seção de depuração do AZD corrigida
  - `docs/getting-started/azd-basics.md`: Comandos de monitoramento corrigidos
  - `docs/getting-started/first-project.md`: Exemplos de monitoramento e depuração atualizados
  - `docs/getting-started/installation.md`: Exemplos de ajuda e versão corrigidos
  - `docs/pre-deployment/application-insights.md`: Comandos de visualização de logs corrigidos
  - `docs/pre-deployment/coordination-patterns.md`: Comandos de depuração de agentes corrigidos

- **📝 Referência de Versão Atualizada**: 
  - `docs/getting-started/installation.md`: Versão hardcoded `1.5.0` alterada para genérica `1.x.x` com link para releases

#### Alterado
- **Estratégias de Rollback**: Documentação atualizada para usar rollback baseado em Git (AZD não possui rollback nativo)
- **Visualização de Logs**: Referências a `azd logs` substituídas por `azd monitor --logs`, `azd monitor --live` e comandos do Azure CLI
- **Seção de Performance**: Removidas flags de deploy paralelas/incrementais inexistentes, fornecendo alternativas válidas

#### Detalhes Técnicos
- **Comandos AZD válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidas do azd monitor**: `--live`, `--logs`, `--overview`
- **Recursos removidos**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificação**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Conclusão do Workshop e Atualização da Qualidade da Documentação
**Esta versão conclui os módulos interativos do workshop, corrige todos os links quebrados na documentação e melhora a qualidade geral do conteúdo para desenvolvedores de IA que utilizam o Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes de contribuição com:
  - Instruções claras para reportar problemas e propor mudanças
  - Padrões de documentação para novo conteúdo
  - Diretrizes de exemplos de código e convenções de mensagens de commit
  - Informações sobre engajamento da comunidade

#### Concluído
- **🎯 Módulo 7 do Workshop (Encerramento)**: Módulo de encerramento totalmente concluído com:
  - Resumo abrangente das conquistas do workshop
  - Seção de conceitos-chave dominados cobrindo AZD, templates e Microsoft Foundry
  - Recomendações para continuação da jornada de aprendizado
  - Exercícios de desafio do workshop com classificações de dificuldade
  - Links de feedback da comunidade e suporte

- **📚 Módulo 3 do Workshop (Desconstruir)**: Objetivos de aprendizado atualizados com:
  - Orientação para ativação do GitHub Copilot com servidores MCP
  - Compreensão da estrutura de pastas de templates do AZD
  - Padrões de organização de Infrastructure-as-Code (Bicep)
  - Instruções de laboratório prático

- **🔧 Módulo 6 do Workshop (Desmontagem)**: Concluído com:
  - Objetivos de limpeza de recursos e gestão de custos
  - Uso de `azd down` para desprovisionamento seguro da infraestrutura
  - Orientação para recuperação de serviços cognitivos em soft-delete
  - Sugestões bônus de exploração para GitHub Copilot e Azure Portal

#### Corrigido
- **🔗 Correção de Links Quebrados**: Resolvidos 15+ links internos quebrados na documentação:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrigidos caminhos para microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigidos caminhos de ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Substituído cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Corrigidos caminhos do FAQ e do guia de solução de problemas
  - `examples/container-app/microservices/README.md`: Corrigidos caminhos do curso e do guia de implantação
  - `resources/faq.md` e `resources/glossary.md`: Atualizadas referências do capítulo de IA
  - `course-outline.md`: Corrigidos guia do instrutor e referências de laboratório do workshop de IA

- **📅 Banner de Status do Workshop**: Atualizado de "Under Construction" para status de workshop ativo com data de fevereiro de 2026

- **🔗 Navegação do Workshop**: Corrigidos links de navegação quebrados no README.md do workshop que apontavam para a pasta lab-1-azd-basics inexistente

#### Alterado
- **Apresentação do Workshop**: Removido aviso de "under construction", o workshop agora está completo e pronto para uso
- **Consistência de Navegação**: Garantido que todos os módulos do workshop tenham navegação intermodular apropriada
- **Referências do Caminho de Aprendizado**: Atualizadas referências de capítulos cruzados para usar os caminhos corretos do microsoft-foundry

#### Validado
- ✅ Todos os arquivos markdown em inglês têm links internos válidos
- ✅ Módulos do workshop 0-7 estão completos com objetivos de aprendizado
- ✅ A navegação entre capítulos e módulos funciona corretamente
- ✅ O conteúdo é adequado para desenvolvedores de IA que utilizam o Microsoft AZD
- ✅ Linguagem e estrutura amigáveis para iniciantes mantidas em todo o conteúdo
- ✅ CONTRIBUTING.md fornece orientações claras para contribuidores da comunidade

#### Implementação Técnica
- **Validação de Links**: Script automatizado do PowerShell verificou todos os links internos .md
- **Auditoria de Conteúdo**: Revisão manual da completude do workshop e adequação para iniciantes
- **Sistema de Navegação**: Padrões consistentes de navegação entre capítulos e módulos aplicados

#### Observações
- **Escopo**: Alterações aplicadas apenas à documentação em inglês
- **Traduções**: Pastas de tradução não foram atualizadas nesta versão (a tradução automatizada sincronizará depois)
- **Duração do Workshop**: Workshop completo agora fornece 3-4 horas de aprendizado prático

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitoramento, Segurança e Padrões Multi-Agente
**Esta versão adiciona lições abrangentes de nível A sobre integração com Application Insights, padrões de autenticação e coordenação multi-agente para implantações de produção.**

#### Adicionado
- **📊 Lição de Integração com Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Implantação focada em AZD com provisionamento automático
  - Templates Bicep completos para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria personalizada (1.200+ linhas)
  - Padrões de monitoramento para IA/LLM (rastreio de tokens/custos do Microsoft Foundry Models)
  - 6 diagramas Mermaid (arquitetura, rastreamento distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, dashboards, monitoramento de IA)
  - Exemplos de consultas Kusto e estratégias de otimização de custos
  - Streaming de métricas ao vivo e depuração em tempo real
  - 40-50 minutos de tempo de aprendizado com padrões prontos para produção

- **🔐 Lição de Padrões de Autenticação & Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (connection strings, Key Vault, identidade gerenciada)
  - Templates de infraestrutura Bicep completos para implantações seguras
  - Código de aplicação Node.js com integração do Azure SDK
  - 3 exercícios completos (habilitar identidade gerenciada, identidade atribuída ao usuário, rotação de Key Vault)
  - Melhores práticas de segurança e configurações RBAC
  - Guia de solução de problemas e análise de custos
  - Padrões de autenticação sem senha prontos para produção

- **🤖 Lição de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, orientado a eventos, consenso)
  - Implementação completa de serviço orquestrador (Python/Flask, 1.500+ linhas)
  - 3 implementações especializadas de agentes (Research, Writer, Editor)
  - Integração com Service Bus para enfileiramento de mensagens
  - Gerenciamento de estado com Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interações dos agentes
  - 3 exercícios avançados (tratamento de timeout, lógica de retry, circuit breaker)
  - Quebra de custos ($240-565/month) com estratégias de otimização
  - Integração com Application Insights para monitoramento

#### Aprimorado
- **Capítulo de Pré-implantação**: Agora inclui monitoramento abrangente e padrões de coordenação
- **Capítulo de Introdução**: Aprimorado com padrões profissionais de autenticação
- **Prontidão para Produção**: Cobertura completa de segurança a observabilidade
- **Roteiro do Curso**: Atualizado para referenciar novas lições nos Capítulos 3 e 6

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de segurança e monitoramento ao longo do curso
- **Qualidade da Documentação**: Padrões consistentes de nível A (95-97%) nas novas lições
- **Padrões de Produção**: Cobertura completa de ponta a ponta para implantações corporativas

#### Melhorado
- **Experiência do Desenvolvedor**: Caminho claro do desenvolvimento ao monitoramento em produção
- **Padrões de Segurança**: Padrões profissionais para autenticação e gerenciamento de segredos
- **Observabilidade**: Integração completa do Application Insights com AZD
- **Workloads de IA**: Monitoramento especializado para Microsoft Foundry Models e sistemas multi-agente

#### Validado
- ✅ Todas as lições incluem código funcional completo (não apenas trechos)
- ✅ Diagramas Mermaid para aprendizado visual (19 no total nas 3 lições)
- ✅ Exercícios práticos com etapas de verificação (9 no total)
- ✅ Templates Bicep prontos para produção implantáveis via `azd up`
- ✅ Análise de custos e estratégias de otimização
- ✅ Guias de solução de problemas e melhores práticas
- ✅ Pontos de verificação de conhecimento com comandos de verificação

#### Resultados da Classificação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia de monitoramento abrangente
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas avançadas multi-agente
- **Novo Conteúdo Geral**: - Padrões consistentes de alta qualidade

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria personalizada + rastreamento distribuído
- **Autenticação**: Identidade gerenciada + Key Vault + padrões RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitoramento**: Métricas ao vivo + consultas Kusto + alertas + dashboards
- **Gestão de Custos**: Estratégias de amostragem, políticas de retenção, controles de orçamento

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo de Microsoft Foundry Models
**Esta versão aprimora a qualidade da documentação em todo o repositório e adiciona um exemplo completo de implantação do Microsoft Foundry Models com interface de chat gpt-4.1.**

#### Adicionado
- **🤖 Exemplo de Chat com Microsoft Foundry Models**: Implantação completa do gpt-4.1 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa do Microsoft Foundry Models (implantação do modelo gpt-4.1)
  - Interface de chat em linha de comando Python com histórico de conversas
  - Integração com Key Vault para armazenamento seguro de chaves de API
  - Rastreamento de uso de tokens e estimativa de custos
  - Limitação de taxa e tratamento de erros
  - README abrangente com guia de implantação de 35-45 minutos
  - 11 arquivos prontos para produção (templates Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Adicionados exercícios práticos ao guia de configuração:
  - Exercício 1: Configuração multi-ambiente (15 minutos)
  - Exercício 2: Prática de gerenciamento de segredos (10 minutos)
  - Critérios claros de sucesso e etapas de verificação
- **✅ Verificação de Implantação**: Adicionada seção de verificação ao guia de implantação:
  - Procedimentos de verificação de integridade
  - Lista de verificação de critérios de sucesso
  - Saídas esperadas para todos os comandos de implantação
  - Referência rápida de solução de problemas

#### Aprimorado
- **examples/README.md**: Atualizado para qualidade A (93%):
  - Adicionado azure-openai-chat em todas as seções relevantes
  - Atualizado número de exemplos locais de 3 para 4
  - Adicionado à tabela de Exemplos de Aplicações de IA
  - Integrado ao Quick Start para Usuários Intermediários
  - Adicionado à seção de Templates do Microsoft Foundry
  - Atualizada Matriz de Comparação e seções de descobertas de tecnologia
- **Qualidade da Documentação**: Melhorada de B+ (87%) → A- (92%) na pasta docs:
  - Adicionadas saídas esperadas a exemplos críticos de comandos
  - Inclusas etapas de verificação para alterações de configuração
  - Aprendizado prático aprimorado com exercícios aplicáveis

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de exemplos de IA para aprendizes intermediários
- **Estrutura da Documentação**: Exercícios mais acionáveis com resultados claros
- **Processo de Verificação**: Critérios de sucesso explícitos adicionados a fluxos de trabalho chave

#### Melhorado
- **Experiência do Desenvolvedor**: Implantação do Microsoft Foundry Models agora leva 35-45 minutos (vs 60-90 para alternativas complexas)
- **Transparência de Custos**: Estimativas de custo claras ($50-200/month) para o exemplo Microsoft Foundry Models
- **Caminho de Aprendizado**: Desenvolvedores de IA têm ponto de entrada claro com azure-openai-chat
- **Padrões de Documentação**: Saídas esperadas e etapas de verificação consistentes

#### Validado
- ✅ Exemplo do Microsoft Foundry Models totalmente funcional com `azd up`
- ✅ Todos os 11 arquivos de implementação sintaticamente corretos
- ✅ Instruções do README correspondem à experiência real de implantação
- ✅ Links da documentação atualizados em 8+ locais
- ✅ Índice de exemplos reflete com precisão 4 exemplos locais
- ✅ Sem links externos duplicados em tabelas
- ✅ Todas as referências de navegação corretas

#### Implementação Técnica
- **Arquitetura do Microsoft Foundry Models**: gpt-4.1 + Key Vault + padrão Container Apps
- **Segurança**: Pronto para Managed Identity, segredos no Key Vault
- **Monitoramento**: Integração com Application Insights
- **Gestão de Custos**: Rastreamento de tokens e otimização de uso
- **Implantação**: Comando único `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Maior: Exemplos de Implantação de Container Apps
**Esta versão introduz exemplos abrangentes de implantação de aplicações em containers prontos para produção usando Azure Developer CLI (AZD), com documentação completa e integração no caminho de aprendizado.**

#### Adicionado
- **🚀 Exemplos de Container App**: Novos exemplos locais em `examples/container-app/`:
  - [Guia Principal](examples/container-app/README.md): Visão geral completa de implantações conteinerizadas, quick start, produção e padrões avançados
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com scale-to-zero, sondas de integridade, monitoramento e solução de problemas
  - [Arquitetura de Microservices](../../examples/container-app/microservices): Implantação multi-serviço pronta para produção (API Gateway, Product, Order, User, Notification), mensageria assíncrona, Service Bus, Cosmos DB, Azure SQL, rastreamento distribuído, deployment blue-green/canary
- **Boas Práticas**: Segurança, monitoramento, otimização de custos e orientações de CI/CD para cargas de trabalho conteinerizadas
- **Exemplos de Código**: `azure.yaml`, templates Bicep completos e implementações de serviços em várias linguagens (Python, Node.js, C#, Go)
- **Testes & Solução de Problemas**: Cenários de teste ponta a ponta, comandos de monitoramento, orientações de solução de problemas

#### Alterado
- **README.md**: Atualizado para apresentar e vincular novos exemplos de aplicativos em contêiner em "Local Examples - Container Applications"
- **examples/README.md**: Atualizado para destacar exemplos de aplicativos em contêiner, adicionar entradas na matriz de comparação e atualizar referências de tecnologia/arquitetura
- **Course Outline & Study Guide**: Atualizado para referenciar novos exemplos de aplicativos em contêiner e padrões de implantação nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos implantáveis com `azd up` e seguem as melhores práticas
- ✅ Links cruzados da documentação e navegação atualizados
- ✅ Exemplos cobrem cenários do iniciante ao avançado, incluindo microsserviços de produção

#### Notas
- **Escopo**: Documentação e exemplos em inglês somente
- **Próximos Passos**: Expandir com padrões avançados adicionais de contêiner e automação de CI/CD em lançamentos futuros

### [v3.5.0] - 2025-11-19

#### Rebranding do Produto: Microsoft Foundry
**Esta versão implementa uma alteração abrangente do nome do produto de "Microsoft Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**

#### Alterado
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Microsoft Foundry" para "Microsoft Foundry"
  - Atualizadas todas as referências na documentação em inglês na pasta `docs/`
  - Renomeada pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renomeado arquivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referências de conteúdo atualizadas em 7 arquivos de documentação

- **📁 Alterações na Estrutura de Pastas**:
  - `docs/ai-foundry/` renomeada para `docs/microsoft-foundry/`
  - Todas as referências cruzadas atualizadas para refletir a nova estrutura de pastas
  - Links de navegação validados em toda a documentação

- **📄 Renomeação de Arquivos**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos os links internos atualizados para referenciar o novo nome de arquivo

#### Arquivos Atualizados
- **Documentação de Capítulo** (7 arquivos):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações de links de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências de nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já usando Microsoft Foundry (a partir de atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback da comunidade, documentação)
  - `docs/getting-started/azd-basics.md` - 4 links de referência cruzada atualizados
  - `docs/getting-started/first-project.md` - 2 links de navegação de capítulo atualizados
  - `docs/getting-started/installation.md` - 2 links para o próximo capítulo atualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navegação atualizado
  - `docs/troubleshooting/debugging.md` - 1 link de navegação atualizado

- **Arquivos da Estrutura do Curso** (2 arquivos):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos de capítulos, seção de templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizagem, recursos do capítulo)

#### Validado
- ✅ Zero referências restantes de caminho de pasta "ai-foundry" na documentação em inglês
- ✅ Zero referências restantes do nome do produto "Microsoft Foundry" na documentação em inglês
- ✅ Todos os links de navegação funcionais com a nova estrutura de pastas
- ✅ Renomeações de arquivos e pastas concluídas com sucesso
- ✅ Referências cruzadas entre capítulos validadas

#### Observações
- **Escopo**: Alterações aplicadas apenas à documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de tradução (`translations/`) não atualizadas nesta versão
- **Workshop**: Materiais do workshop (`workshop/`) não atualizados nesta versão
- **Exemplos**: Arquivos de exemplo podem ainda referenciar nomenclatura legada (a ser tratado em atualização futura)
- **Links Externos**: URLs externas e referências ao repositório GitHub permanecem inalteradas

#### Guia de Migração para Colaboradores
Se você tiver branches locais ou documentação referenciando a estrutura antiga:
1. Atualize as referências de pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualize as referências de arquivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substitua o nome do produto: "Microsoft Foundry" → "Microsoft Foundry"
4. Valide se todos os links internos da documentação ainda funcionam

---

### [v3.4.0] - 2025-10-24

#### Aprimoramentos na Pré-visualização de Infraestrutura e Validação
**Esta versão introduz suporte abrangente para o novo recurso de pré-visualização do Azure Developer CLI e aprimora a experiência do usuário do workshop.**

#### Adicionado
- **🧪 Documentação do recurso azd provision --preview**: Cobertura abrangente da nova capacidade de pré-visualização de infraestrutura
  - Referência do comando e exemplos de uso na folha de referência (cheat sheet)
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Integração de checagem pré-implantação para validação de implantação mais segura
  - Atualizações no guia de início rápido com práticas de implantação que priorizam a segurança
- **🚧 Banner de Status do Workshop**: Banner HTML profissional indicando o status de desenvolvimento do workshop
  - Design em degradê com indicadores de construção para comunicação clara ao usuário
  - Carimbo de data/hora da última atualização para transparência
  - Design responsivo para todos os tipos de dispositivo

#### Aprimorado
- **Segurança da Infraestrutura**: Funcionalidade de pré-visualização integrada em toda a documentação de implantação
- **Validação Pré-implantação**: Scripts automatizados agora incluem testes de pré-visualização de infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir a pré-visualização como melhor prática
- **Experiência do Workshop**: Expectativas claras definidas para os usuários sobre o status de desenvolvimento do conteúdo

#### Alterado
- **Melhores Práticas de Implantação**: Fluxo de trabalho com prioridade na pré-visualização agora é a abordagem recomendada
- **Fluxo da Documentação**: Validação de infraestrutura movida para mais cedo no processo de aprendizado
- **Apresentação do Workshop**: Comunicação profissional de status com cronograma de desenvolvimento claro

#### Melhorado
- **Abordagem de Segurança em Primeiro Lugar**: Alterações de infraestrutura agora podem ser validadas antes da implantação
- **Colaboração em Equipe**: Resultados da pré-visualização podem ser compartilhados para revisão e aprovação
- **Consciência de Custos**: Melhor entendimento dos custos de recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas de implantação através de validação antecipada

#### Implementação Técnica
- **Integração Multidocumento**: Recurso de pré-visualização documentado em 4 arquivos principais
- **Padrões de Comando**: Sintaxe e exemplos consistentes em toda a documentação
- **Integração de Melhores Práticas**: Pré-visualização incluída em fluxos de trabalho de validação e scripts
- **Indicadores Visuais**: Marcações claras de novo recurso para descoberta

#### Infraestrutura do Workshop
- **Comunicação de Status**: Banner HTML profissional com estilo em degradê
- **Experiência do Usuário**: Status de desenvolvimento claro evita confusão
- **Apresentação Profissional**: Mantém a credibilidade do repositório enquanto define expectativas
- **Transparência do Cronograma**: Carimbo de última atualização em outubro de 2025 para responsabilização

### [v3.3.0] - 2025-09-24

#### Materiais de Workshop Aprimorados e Experiência de Aprendizado Interativa
**Esta versão introduz materiais de workshop abrangentes com guias interativos baseados em navegador e caminhos de aprendizado estruturados.**

#### Adicionado
- **🎥 Guia Interativo do Workshop**: Experiência de workshop baseada em navegador com capacidade de pré-visualização do MkDocs
- **📝 Instruções Estruturadas do Workshop**: Caminho de aprendizado guiado em 7 etapas, da descoberta à customização
  - 0-Introduction: Visão geral do workshop e configuração
  - 1-Select-AI-Template: Processo de descoberta e seleção de templates
  - 2-Validate-AI-Template: Procedimentos de implantação e validação
  - 3-Deconstruct-AI-Template: Entendendo a arquitetura do template
  - 4-Configure-AI-Template: Configuração e customização
  - 5-Customize-AI-Template: Modificações avançadas e iterações
  - 6-Teardown-Infrastructure: Limpeza e gerenciamento de recursos
  - 7-Wrap-up: Resumo e próximos passos
- **🛠️ Ferramentas do Workshop**: Configuração do MkDocs com o tema Material para uma experiência de aprendizado aprimorada
- **🎯 Caminho de Aprendizado Prático**: Metodologia em 3 etapas (Descoberta → Implantação → Customização)
- **📱 Integração com GitHub Codespaces**: Configuração fluida do ambiente de desenvolvimento

#### Aprimorado
- **Laboratório do Workshop de IA**: Estendido com uma experiência de aprendizado estruturada abrangente de 2-3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e recursos visuais
- **Progressão do Aprendizado**: Orientação clara passo a passo desde a seleção do template até a implantação em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho de desenvolvimento otimizados

#### Melhorado
- **Acessibilidade**: Interface baseada em navegador com busca, funcionalidade de copiar e alternância de tema
- **Aprendizado Autodirigido**: Estrutura de workshop flexível que acomoda diferentes ritmos de aprendizagem
- **Aplicação Prática**: Cenários de implantação de templates de IA no mundo real
- **Integração com a Comunidade**: Integração com Discord para suporte e colaboração no workshop

#### Recursos do Workshop
- **Busca Integrada**: Descoberta rápida por palavra-chave e lição
- **Copiar Blocos de Código**: Funcionalidade de passar o mouse para copiar para todos os exemplos de código
- **Alternador de Tema**: Suporte a modo escuro/claro para diferentes preferências
- **Recursos Visuais**: Capturas de tela e diagramas para melhor compreensão
- **Integração de Ajuda**: Acesso direto ao Discord para suporte da comunidade

### [v3.2.0] - 2025-09-17

#### Reestruturação Maior da Navegação e Sistema de Aprendizado por Capítulos
**Esta versão introduz uma estrutura abrangente de aprendizado por capítulos com navegação aprimorada em todo o repositório.**

#### Adicionado
- 📚 Sistema de Aprendizado por Capítulos: Reestruturou todo o curso em 8 capítulos de aprendizado progressivos
  - Capítulo 1: Fundamentos & Início Rápido (⭐ - 30-45 min)
  - Capítulo 2: Desenvolvimento AI-First (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração & Autenticação (⭐⭐ - 45-60 min)
  - Capítulo 4: Infraestrutura como Código & Implantação (⭐⭐⭐ - 1-1,5 horas)
  - Capítulo 5: Soluções de IA Multi-Agente (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação & Planejamento Pré-implantação (⭐⭐ - 1 hora)
  - Capítulo 7: Solução de Problemas & Depuração (⭐⭐ - 1-1,5 horas)
  - Capítulo 8: Padrões de Produção & Empresariais (⭐⭐⭐⭐ - 2-3 horas)
- 📚 Sistema de Navegação Abrangente: Cabeçalhos e rodapés de navegação consistentes em toda a documentação
- 🎯 Rastreamento de Progresso: Lista de verificação de conclusão do curso e sistema de verificação de aprendizagem
- 🗺️ Orientação do Caminho de Aprendizado: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- 🔗 Navegação de Referência Cruzada: Capítulos relacionados e pré-requisitos claramente vinculados

#### Aprimorado
- Estrutura do README: Transformada em uma plataforma de aprendizado estruturada com organização por capítulos
- Navegação da Documentação: Cada página agora inclui contexto do capítulo e orientação de progressão
- Organização de Templates: Exemplos e templates mapeados para os capítulos de aprendizado apropriados
- Integração de Recursos: Cheat sheets, FAQs e guias de estudo conectados aos capítulos relevantes
- Integração do Workshop: Laboratórios práticos mapeados para múltiplos objetivos de aprendizado dos capítulos

#### Alterado
- Progressão de Aprendizado: Mudou de documentação linear para aprendizado flexível baseado em capítulos
- Posicionamento da Configuração: Guia de configuração reposicionado como Capítulo 3 para melhor fluxo de aprendizado
- Integração de Conteúdo de IA: Melhor integração de conteúdo específico de IA ao longo da jornada de aprendizado
- Conteúdo de Produção: Padrões avançados consolidados no Capítulo 8 para aprendizes empresariais

#### Melhorado
- Experiência do Usuário: Trilhas de navegação claras e indicadores de progressão por capítulo
- Acessibilidade: Padrões de navegação consistentes para facilitar a navegação no curso
- Apresentação Profissional: Estrutura de curso no estilo universitário adequada para treinamento acadêmico e corporativo
- Eficiência de Aprendizado: Tempo reduzido para encontrar conteúdo relevante por meio de melhor organização

#### Implementação Técnica
- Cabeçalhos de Navegação: Navegação por capítulo padronizada em mais de 40 arquivos de documentação
- Navegação no Rodapé: Orientação de progressão consistente e indicadores de conclusão de capítulo
- Links Cruzados: Sistema abrangente de links internos conectando conceitos relacionados
- Mapeamento de Capítulos: Templates e exemplos claramente associados aos objetivos de aprendizado

#### Aprimoramento do Guia de Estudos
- 📚 Objetivos de Aprendizado Abrangentes: Guia de estudos reestruturado para alinhar-se ao sistema de 8 capítulos
- 🎯 Avaliação por Capítulo: Cada capítulo inclui objetivos de aprendizado específicos e exercícios práticos
- 📋 Rastreamento de Progresso: Cronograma semanal de aprendizado com resultados mensuráveis e listas de verificação de conclusão
- ❓ Questões de Avaliação: Perguntas de validação de conhecimento para cada capítulo com resultados profissionais
- 🛠️ Exercícios Práticos: Atividades práticas com cenários reais de implantação e solução de problemas
- 📊 Progressão de Habilidades: Avanço claro de conceitos básicos a padrões empresariais com foco no desenvolvimento de carreira
- 🎓 Estrutura de Certificação: Resultados de desenvolvimento profissional e sistema de reconhecimento da comunidade
- ⏱️ Gestão de Cronograma: Plano de aprendizado estruturado de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Soluções de IA Multi-Agente Aprimoradas
**Esta versão melhora a solução de varejo multi-agente com nomeação de agentes aprimorada e documentação melhorada.**

#### Alterado
- Terminologia Multi-Agente: Substituiu "Cora agent" por "Customer agent" em toda a solução de varejo multi-agente para maior compreensão
- Arquitetura do Agente: Atualizada toda a documentação, templates ARM e exemplos de código para usar a nomenclatura consistente "Customer agent"
- Exemplos de Configuração: Modernizados padrões de configuração de agente com convenções de nomenclatura atualizadas
- Consistência da Documentação: Garantiu que todas as referências usem nomes de agentes profissionais e descritivos

#### Aprimorado
- **Pacote de Templates ARM**: Atualizado retail-multiagent-arm-template com referências ao agente Customer
- **Diagramas de Arquitetura**: Diagramas Mermaid atualizados com nomenclatura de agentes revisada
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam a nomenclatura CustomerAgent
- **Variáveis de Ambiente**: Atualizados todos os scripts de implantação para usar convenções CUSTOMER_AGENT_NAME

#### Melhorado
- **Experiência do Desenvolvedor**: Funções e responsabilidades dos agentes mais claras na documentação
- **Prontidão para Produção**: Melhor alinhamento com convenções de nomenclatura corporativas
- **Materiais de Aprendizado**: Nomenclatura de agentes mais intuitiva para fins educacionais
- **Usabilidade dos Templates**: Compreensão simplificada das funções dos agentes e padrões de implantação

#### Detalhes Técnicos
- Diagramas de arquitetura Mermaid atualizados com referências a CustomerAgent
- Substituídos nomes de classe CoraAgent por CustomerAgent em exemplos Python
- Modificadas configurações JSON do template ARM para usar o tipo de agente "customer"
- Atualizadas variáveis de ambiente de CORA_AGENT_* para padrão CUSTOMER_AGENT_*
- Atualizados todos os comandos de implantação e configurações de contêiner

### [v3.0.0] - 2025-09-12

#### Principais Mudanças - Foco em Desenvolvedores de IA e Integração com Microsoft Foundry
**Esta versão transforma o repositório em um recurso de aprendizado abrangente com foco em IA e integração com Microsoft Foundry.**

#### Adicionado
- **🤖 Caminho de Aprendizado com Foco em IA**: Reestrutura completa priorizando desenvolvedores e engenheiros de IA
- **Guia de Integração com Microsoft Foundry**: Documentação abrangente para conectar AZD com serviços do Microsoft Foundry
- **Padrões de Implantação de Modelos de IA**: Guia detalhado cobrindo seleção de modelos, configuração e estratégias de implantação em produção
- **Laboratório de Workshop de IA**: Workshop prático de 2-3 horas para converter aplicações de IA em soluções implantáveis via AZD
- **Melhores Práticas de IA para Produção**: Padrões prontos para empresas sobre escalabilidade, monitoramento e segurança de cargas de trabalho de IA
- **Guia de Solução de Problemas Específico para IA**: Solução de problemas completa para Microsoft Foundry Models, Cognitive Services e questões de implantação de IA
- **Galeria de Templates de IA**: Coleção destacada de templates do Microsoft Foundry com classificações de complexidade
- **Materiais do Workshop**: Estrutura completa do workshop com labs práticos e materiais de referência

#### Aprimorado
- **Estrutura do README**: Focada em desenvolvedores de IA com 45% de dados de interesse da comunidade do Microsoft Foundry Discord
- **Trilhas de Aprendizado**: Jornada dedicada ao desenvolvedor de IA ao lado de trilhas tradicionais para estudantes e engenheiros DevOps
- **Recomendações de Templates**: Templates em destaque para IA incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integração com a Comunidade**: Suporte comunitário no Discord expandido com canais e discussões específicas para IA

#### Foco em Segurança & Produção
- **Padrões de Identidade Gerenciada**: Configurações de autenticação e segurança específicas para IA
- **Otimização de Custos**: Rastreamento de uso de tokens e controles orçamentários para cargas de trabalho de IA
- **Implantação Multirregional**: Estratégias para implantação global de aplicações de IA
- **Monitoramento de Desempenho**: Métricas específicas de IA e integração com Application Insights

#### Qualidade da Documentação
- **Estrutura de Curso Linear**: Progressão lógica do iniciante ao avançado em padrões de implantação de IA
- **URLs Validadas**: Todos os links externos de repositórios verificados e acessíveis
- **Referência Completa**: Todos os links internos de documentação validados e funcionais
- **Pronto para Produção**: Padrões de implantação corporativos com exemplos do mundo real

### [v2.0.0] - 2025-09-09

#### Principais Mudanças - Reestruturação do Repositório e Aperfeiçoamento Profissional
**Esta versão representa uma revisão significativa da estrutura do repositório e da apresentação do conteúdo.**

#### Adicionado
- **Estrutura de Aprendizado Estruturada**: Todas as páginas de documentação agora incluem seções de Introdução, Objetivos de Aprendizado e Resultados de Aprendizado
- **Sistema de Navegação**: Adicionados links Anterior/Próximo em todas as documentações para progressão guiada do aprendizado
- **Study Guide**: study-guide.md abrangente com objetivos de aprendizagem, exercícios práticos e materiais de avaliação
- **Apresentação Profissional**: Remoção de todos os ícones emoji para melhorar acessibilidade e aparência profissional
- **Estrutura de Conteúdo Aprimorada**: Organização e fluxo de materiais de aprendizado melhorados

#### Alterado
- **Formato da Documentação**: Padronização de toda a documentação com estrutura consistente focada em aprendizado
- **Fluxo de Navegação**: Implementada progressão lógica através de todos os materiais de aprendizado
- **Apresentação de Conteúdo**: Removidos elementos decorativos em favor de formatação clara e profissional
- **Estrutura de Links**: Atualizados todos os links internos para suportar o novo sistema de navegação

#### Melhorado
- **Acessibilidade**: Removida dependência de emojis para melhor compatibilidade com leitores de tela
- **Aparência Profissional**: Apresentação limpa em estilo acadêmico adequada para aprendizado empresarial
- **Experiência de Aprendizado**: Abordagem estruturada com objetivos claros e resultados para cada lição
- **Organização de Conteúdo**: Melhor fluxo lógico e conexão entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório de Aprendizado AZD Abrangente

#### Adicionado
- **Estrutura Principal de Documentação**
  - Série completa de guias de getting-started
  - Documentação abrangente de implantação e provisão
  - Recursos detalhados de solução de problemas e guias de depuração
  - Ferramentas e procedimentos de validação pré-implantação

- **Módulo Getting Started**
  - AZD Basics: Conceitos e terminologia principais
  - Guia de Instalação: Instruções de configuração específicas por plataforma
  - Guia de Configuração: Configuração do ambiente e autenticação
  - Primeiro Projeto Tutorial: Aprendizado prático passo a passo

- **Módulo de Implantação e Provisão**
  - Guia de Implantação: Documentação completa do fluxo de trabalho
  - Guia de Provisionamento: Infrastructure as Code com Bicep
  - Melhores práticas para implantações em produção
  - Padrões de arquitetura multi-serviço

- **Módulo de Validação Pré-implantação**
  - Planejamento de Capacidade: Validação de disponibilidade de recursos do Azure
  - Seleção de SKU: Orientação abrangente sobre níveis de serviço
  - Verificações Pré-voo: Scripts de validação automatizados (PowerShell e Bash)
  - Estimativas de custo e ferramentas de planejamento orçamentário

- **Módulo de Solução de Problemas**
  - Problemas Comuns: Problemas frequentemente encontrados e soluções
  - Guia de Depuração: Metodologias sistemáticas de solução de problemas
  - Técnicas e ferramentas de diagnóstico avançado
  - Monitoramento e otimização de desempenho

- **Recursos e Referências**
  - Folha de Referência de Comandos: Referência rápida para comandos essenciais
  - Glossário: Definições abrangentes de termos e siglas
  - FAQ: Respostas detalhadas para perguntas comuns
  - Links de recursos externos e conexões com a comunidade

- **Exemplos e Templates**
  - Exemplo de Aplicação Web Simples
  - Template de Implantação de Site Estático
  - Configuração de Aplicação em Contêiner
  - Padrões de integração com Banco de Dados
  - Exemplos de arquitetura de Microsserviços
  - Implementações de funções serverless

#### Recursos
- **Suporte Multiplataforma**: Guias de instalação e configuração para Windows, macOS e Linux
- **Múltiplos Níveis de Habilidade**: Conteúdo destinado desde estudantes até desenvolvedores profissionais
- **Foco Prático**: Exemplos práticos e cenários do mundo real
- **Cobertura Abrangente**: De conceitos básicos a padrões empresariais avançados
- **Abordagem com Prioridade em Segurança**: Melhores práticas de segurança integradas ao longo do conteúdo
- **Otimização de Custos**: Orientações para implantações e gerenciamento de recursos com custo eficiente

#### Qualidade da Documentação
- **Exemplos de Código Detalhados**: Exemplos de código práticos e testados
- **Instruções Passo a Passo**: Orientação clara e acionável
- **Tratamento Abrangente de Erros**: Solução de problemas para questões comuns
- **Integração de Melhores Práticas**: Padrões e recomendações da indústria
- **Compatibilidade de Versão**: Atualizado com os serviços Azure mais recentes e funcionalidades do azd

## Melhorias Futuras Planejadas

### Versão 3.1.0 (Planejada)
#### Expansão da Plataforma de IA
- **Suporte a Múltiplos Modelos**: Padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados
- **Frameworks de Agentes de IA**: Templates para implementações LangChain, Semantic Kernel e AutoGen
- **Padrões RAG Avançados**: Opções de banco de dados vetorial além do Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidade de IA**: Monitoramento aprimorado para desempenho de modelos, uso de tokens e qualidade das respostas

#### Experiência do Desenvolvedor
- **Extensão do VS Code**: Experiência de desenvolvimento integrada AZD + Microsoft Foundry
- **Integração com GitHub Copilot**: Geração assistida por IA de templates AZD
- **Tutoriais Interativos**: Exercícios práticos de codificação com validação automatizada para cenários de IA
- **Conteúdo em Vídeo**: Tutoriais em vídeo complementares para aprendizes visuais com foco em implantações de IA

### Versão 4.0.0 (Planejada)
#### Padrões de IA Empresariais
- **Estrutura de Governança**: Governança de modelos de IA, conformidade e trilhas de auditoria
- **IA Multi-Tenant**: Padrões para atender múltiplos clientes com serviços de IA isolados
- **Implantação de IA na Edge**: Integração com Azure IoT Edge e instâncias de contêiner
- **IA em Nuvem Híbrida**: Padrões de implantação multi-cloud e híbrida para cargas de trabalho de IA

#### Recursos Avançados
- **Automação de Pipeline de IA**: Integração MLOps com pipelines do Azure Machine Learning
- **Segurança Avançada**: Padrões de zero-trust, endpoints privados e proteção avançada contra ameaças
- **Otimização de Desempenho**: Ajustes avançados e estratégias de escalonamento para aplicações de IA de alto throughput
- **Distribuição Global**: Padrões de entrega de conteúdo e cache na borda para aplicações de IA

### Versão 3.0.0 (Planejada) - Substituída pela Versão Atual
#### Propostas de Adições - Agora Implementadas na v3.0.0
- ✅ **Conteúdo Focado em IA**: Integração abrangente com Microsoft Foundry (Concluído)
- ✅ **Tutoriais Interativos**: Laboratório prático de workshop de IA (Concluído)
- ✅ **Módulo Avançado de Segurança**: Padrões de segurança específicos para IA (Concluído)
- ✅ **Otimização de Desempenho**: Estratégias de ajuste para cargas de trabalho de IA (Concluído)

### Versão 2.1.0 (Planejada) - Parcialmente Implementada na v3.0.0
#### Pequenas Melhorias - Algumas Concluídas na Versão Atual
- ✅ **Exemplos Adicionais**: Cenários de implantação focados em IA (Concluído)
- ✅ **FAQ Expandido**: Perguntas e solução de problemas específicos para IA (Concluído)
- **Integração de Ferramentas**: Guias aprimorados de integração com IDE e editores
- ✅ **Expansão de Monitoramento**: Padrões de monitoramento e alertas específicos para IA (Concluído)

#### Ainda Planejado para Lançamento Futuro
- **Documentação Responsiva para Dispositivos Móveis**: Design responsivo para aprendizado móvel
- **Acesso Offline**: Pacotes de documentação para download
- **Integração Aprimorada de IDE**: Extensão do VS Code para fluxos de trabalho AZD + IA
- **Painel da Comunidade**: Métricas da comunidade em tempo real e rastreamento de contribuições

## Contribuindo para o Changelog

### Reportando Mudanças
Ao contribuir para este repositório, por favor, assegure que as entradas do changelog incluam:

1. **Número da Versão**: Seguindo versionamento semântico (major.minor.patch)
2. **Data**: Data de lançamento ou atualização no formato YYYY-MM-DD
3. **Categoria**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Descrição Clara**: Descrição concisa do que mudou
5. **Avaliação de Impacto**: Como as mudanças afetam os usuários existentes

### Categorias de Mudança

#### Adicionado
- Novos recursos, seções de documentação ou capacidades
- Novos exemplos, templates ou recursos de aprendizado
- Ferramentas adicionais, scripts ou utilitários

#### Alterado
- Modificações em funcionalidades ou documentação existentes
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Obsoleto
- Recursos ou abordagens que estão sendo descontinuados
- Seções da documentação programadas para remoção
- Métodos que têm alternativas melhores

#### Removido
- Recursos, documentação ou exemplos que não são mais relevantes
- Informações desatualizadas ou abordagens obsoletas
- Conteúdo redundante ou consolidado

#### Corrigido
- Correções de erros na documentação ou código
- Resolução de problemas relatados ou incidentes
- Melhorias de precisão ou funcionalidade

#### Segurança
- Melhorias ou correções relacionadas à segurança
- Atualizações às melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Diretrizes de Versionamento Semântico

#### Versão Principal (X.0.0)
- Mudanças incompatíveis que exigem ação do usuário
- Reestruturação significativa de conteúdo ou organização
- Alterações que mudam a abordagem ou metodologia fundamental

#### Versão Secundária (X.Y.0)
- Novos recursos ou adições de conteúdo
- Aprimoramentos que mantêm compatibilidade retroativa
- Exemplos, ferramentas ou recursos adicionais

#### Versão de Correção (X.Y.Z)
- Correções de bugs e correções
- Melhorias menores em conteúdo existente
- Esclarecimentos e pequenos aprimoramentos

## Feedback e Sugestões da Comunidade

Ativamente incentivamos o feedback da comunidade para melhorar este recurso de aprendizado:

### Como Fornecer Feedback
- **GitHub Issues**: Reporte problemas ou sugira melhorias (issues específicas de IA são bem-vindas)
- **Discussões no Discord**: Compartilhe ideias e engaje com a comunidade Microsoft Foundry
- **Pull Requests**: Contribua com melhorias diretas no conteúdo, especialmente templates e guias de IA
- **Microsoft Foundry Discord**: Participe do canal #Azure para discussões sobre AZD + IA
- **Fóruns da Comunidade**: Participe de discussões mais amplas com desenvolvedores Azure

### Categorias de Feedback
- **Precisão do Conteúdo de IA**: Correções sobre integração e implantação de serviços de IA
- **Experiência de Aprendizado**: Sugestões para melhorar o fluxo de aprendizado do desenvolvedor de IA
- **Conteúdo de IA Ausente**: Solicitações por templates, padrões ou exemplos adicionais de IA
- **Acessibilidade**: Melhorias para atender diversas necessidades de aprendizado
- **Integração de Ferramentas de IA**: Sugestões para melhor integração de fluxos de trabalho de desenvolvimento de IA
- **Padrões de IA para Produção**: Solicitações de padrões de implantação de IA empresariais

### Compromisso de Resposta
- **Resposta a Issues**: Dentro de 48 horas para problemas reportados
- **Solicitações de Recursos**: Avaliação dentro de uma semana
- **Contribuições da Comunidade**: Revisão dentro de uma semana
- **Problemas de Segurança**: Prioridade imediata com resposta acelerada

## Cronograma de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: Precisão do conteúdo e validação de links
- **Atualizações Trimestrais**: Principais adições e melhorias de conteúdo
- **Revisões Semestrais**: Reestruturação e aprimoramento abrangentes
- **Lançamentos Anuais**: Atualizações de versão principais com melhorias significativas

### Monitoramento e Garantia de Qualidade
- **Testes Automatizados**: Validação regular de exemplos de código e links
- **Integração de Feedback da Comunidade**: Incorporação regular de sugestões de usuários
- **Atualizações Tecnológicas**: Alinhamento com os serviços Azure mais recentes e versões do azd
- **Auditorias de Acessibilidade**: Revisão regular para princípios de design inclusivo

## Política de Suporte de Versão

### Suporte à Versão Atual
- **Última Versão Principal**: Suporte completo com atualizações regulares
- **Versão Principal Anterior**: Atualizações de segurança e correções críticas por 12 meses
- **Versões Legadas**: Suporte apenas da comunidade, sem atualizações oficiais

### Orientações de Migração
Quando versões principais são lançadas, fornecemos:
- **Guias de Migração**: Instruções passo a passo para a transição
- **Notas de Compatibilidade**: Detalhes sobre alterações que quebram a compatibilidade
- **Suporte a Ferramentas**: Scripts ou utilitários para auxiliar na migração
- **Suporte da Comunidade**: Fóruns dedicados para perguntas sobre migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)
- **Próxima Lição**: Retornar ao [README Principal](README.md)

**Fique Atualizado**: Acompanhe este repositório para receber notificações sobre novos lançamentos e atualizações importantes nos materiais de aprendizado.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de Responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->