# Changelog - AZD Para Iniciantes

## Introdução

Este changelog documenta todas as alterações, atualizações e melhorias notáveis no repositório AZD Para Iniciantes. Seguimos os princípios do versionamento semântico e mantemos este registo para ajudar os utilizadores a compreender o que mudou entre as versões.

## Objetivos de Aprendizagem

Ao rever este changelog, irá:
- Manter-se informado sobre novas funcionalidades e adições de conteúdo
- Compreender as melhorias feitas na documentação existente
- Acompanhar correções de erros e revisões para garantir a precisão
- Seguir a evolução dos materiais de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Após rever as entradas do changelog, será capaz de:
- Identificar novos conteúdos e recursos disponíveis para aprendizagem
- Compreender quais secções foram atualizadas ou melhoradas
- Planear o seu percurso de aprendizagem com base nos materiais mais atuais
- Contribuir com feedback e sugestões para melhorias futuras

## Histórico de Versões

### [v3.19.1] - 2026-03-27

#### Esclarecimento de Onboarding para Iniciantes, Validação de Configuração & Limpeza Final de Comandos AZD
**Esta versão dá seguimento à varredura de validação do AZD 1.23 com uma passagem de documentação focada em iniciantes: clarifica a orientação de autenticação AZD-primeiro, adiciona scripts de validação da configuração local, verifica comandos chave contra o AZD CLI ao vivo, e remove as últimas referências obsoletas a comandos em inglês fora do changelog.**

#### Adicionado
- **🧪 Scripts de validação de configuração para iniciantes** com `validate-setup.ps1` e `validate-setup.sh` para os aprendizes confirmarem as ferramentas necessárias antes de iniciar o Capítulo 1
- **✅ Passos antecipados de validação da configuração** no README raiz e no README do Capítulo 1 para que pré-requisitos em falta sejam detetados antes do `azd up`

#### Alterado
- **🔐 Orientação de autenticação para iniciantes** agora trata consistentemente `azd auth login` como o caminho principal para fluxos de trabalho AZD, com `az login` destacado como opcional a menos que se use diretamente comandos Azure CLI
- **📚 Fluxo de onboarding do Capítulo 1** agora encaminha os aprendizes para validar a configuração local antes dos passos de instalação, autenticação e primeiro deploy
- **🛠️ Mensagens do validador** agora separam claramente requisitos bloqueantes de avisos opcionais da Azure CLI para o caminho AZD exclusivo para iniciantes
- **📖 Documentação de configuração, resolução de problemas e exemplos** agora distingue entre autenticação AZD obrigatória e login opcional da Azure CLI onde antes ambos eram apresentados sem contexto

#### Corrigido
- **📋 Referências restantes a comandos em inglês** atualizadas para formas AZD atuais, incluindo `azd config show` na folha de dicas e `azd monitor --overview` onde se pretendia orientação sobre a visão geral do Portal Azure
- **🧭 Afirmações para iniciantes no Capítulo 1** suavizadas para evitar promessas excessivas de comportamento garantido sem erros ou rollback para todos os templates e recursos Azure
- **🔎 Validação CLI ao vivo** confirmou suporte atual para `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, e `azd down --force --purge`

#### Ficheiros Atualizados
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

#### Validação AZD 1.23.12, Expansão do Ambiente de Workshop & Atualização do Modelo AI
**Esta versão realiza uma varredura de validação da documentação contra `azd` `1.23.12`, atualiza exemplos desatualizados de comandos AZD, refresca a orientação do modelo AI para padrões atuais e amplia as instruções do workshop para além do GitHub Codespaces, incluindo também dev containers e clones locais.**

#### Adicionado
- **✅ Notas de validação em capítulos principais e documentação do workshop** para explicitar a base AZD testada para aprendizes que usam versões CLI mais recentes ou antigas
- **⏱️ Orientação sobre timeout de deploy** para implementações longas de apps AI usando `azd deploy --timeout 1800`
- **🔎 Passos de inspeção de extensões** com `azd extension show azure.ai.agents` na documentação do fluxo AI
- **🌐 Orientação mais ampla para ambiente de workshop** cobrindo GitHub Codespaces, dev containers e clones locais com MkDocs

#### Alterado
- **📚 READMEs introdutórios de capítulos** agora indicam consistentemente validação contra `azd 1.23.12` nos capítulos de fundação, configuração, infraestrutura, multi-agente, pré-deployment, resolução de problemas e produção
- **🛠️ Referências a comandos AZD** atualizadas para formas atuais em toda a documentação:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ou `azd env get-value(s)` conforme contexto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` quando se pretende uma visão geral do Application Insights
- **🧪 Exemplos de preview de provisionamento** simplificados para uso suportado atual como `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Fluxo do workshop** atualizado para que os aprendizes possam completar os laboratórios em Codespaces, num dev container, ou num clone local, em vez de assumir execução só em Codespaces
- **🔐 Orientação de autenticação** agora prefere `azd auth login` para fluxos AZD, colocando `az login` como opcional quando comandos Azure CLI são usados diretamente

#### Corrigido
- **🪟 Comandos de instalação Windows** normalizados para uso atual de caixa em pacotes `winget` na guia de instalação
- **🐧 Orientação de instalação Linux** corrigida para evitar instruções de gestor de pacotes `azd` específicas de distro não suportadas, apontando para assets de releases quando apropriado
- **📦 Exemplos de modelos AI** atualizados de padrões antigos como `gpt-35-turbo` e `text-embedding-ada-002` para exemplos atuais como `gpt-4.1-mini`, `gpt-4.1` e `text-embedding-3-large`
- **📋 Snippets de deploy e diagnóstico** corrigidos para usar comandos atuais de ambiente e estado em logs, scripts e passos de troubleshooting
- **⚙️ Orientação GitHub Actions** atualizada de `Azure/setup-azd@v1.0.0` para `Azure/setup-azd@v2`
- **🤖 Orientação MCP/Copilot consentimentos** atualizada de `azd mcp consent` para `azd copilot consent list`

#### Melhorado
- **🧠 Orientação do capítulo AI** agora explica melhor o comportamento sensível a previsualização do `azd ai`, login específico do tenant, uso atual de extensões e recomendações atualizadas de deploy de modelos
- **🧪 Instruções do workshop** usam agora exemplos de versões mais realistas e linguagem mais clara para configuração de ambiente em laboratórios práticos
- **📈 Documentos de produção e troubleshooting** alinhados para melhor com monitorização atual, fallback de modelos e exemplos de níveis de custo

#### Ficheiros Atualizados
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

#### Comandos AZD AI CLI, Validação de Conteúdo & Expansão de Templates
**Esta versão adiciona cobertura dos comandos `azd ai`, `azd extension` e `azd mcp` em todos os capítulos relacionados com AI, corrige links partidos e código obsoleto em agents.md, atualiza a folha de dicas, e revê a secção de Exemplos de Templates com descrições validadas e novos templates Azure AI AZD.**

#### Adicionado
- **🤖 Cobertura AZD AI CLI** em 7 ficheiros (antes apenas no Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova secção "Extensões e Comandos AI" introduzindo `azd extension`, `azd ai agent init` e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opção 4: `azd ai agent init` com tabela comparativa (abordagem template vs manifesto)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecções "Extensões AZD para Foundry" e "Deploy orientado a agente"
  - `docs/chapter-05-multi-agent/README.md` — Arranque rápido agora mostra ambos caminhos de deploy por template e por manifesto
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Secção de deploy agora inclui opção `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsecção "Comandos da Extensão AZD AI para Diagnóstico"
  - `resources/cheat-sheet.md` — Nova secção "Comandos AI & Extensões" com `azd extension`, `azd ai agent init`, `azd mcp`, e `azd infra generate`
- **📦 Novos templates de exemplo AZD AI** em `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET com Blazor WebAssembly, Semantic Kernel e suporte a voz
  - **azure-search-openai-demo-java** — Chat RAG Java usando Langchain4J com opções de deploy ACA/AKS
  - **contoso-creative-writer** — App de escrita criativa multi-agente usando Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB com suporte a dev local Ollama
  - **chat-with-your-data-solution-accelerator** — Acelerador empresarial RAG com portal admin, integração Teams, e opções PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — App de referência multi-agente MCP para orquestração com servidores em .NET, Python, Java, e TypeScript
  - **azd-ai-starter** — Template inicial minimalista de infraestrutura Azure AI Bicep
  - **🔗 Link para a galeria Awesome AZD AI** — Referência para a [galeria awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (mais de 80 templates)

#### Corrigido
- **🔗 Navegação em agents.md**: Links Anterior/Próximo agora correspondem à ordem das lições do README do Capítulo 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Links partidos em agents.md**: `production-ai-practices.md` corrigido para `../chapter-08-production/production-ai-practices.md` (3 ocorrências)
- **📦 Código obsoleto em agents.md**: Substituído `opencensus` por `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API inválida em agents.md**: Passado `max_tokens` de `create_agent()` para `create_run()` como `max_completion_tokens`
- **🔢 Contagem de tokens em agents.md**: Estimativa aproximada `len//4` substituída por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Serviços corrigidos de "Cognitive Search + App Service" para "Azure AI Search + Azure Container Apps" (host padrão alterado em out 2024)
- **contoso-chat**: Descrição atualizada para referenciar Azure AI Foundry + Prompty, correspondendo ao título e stack tecnológico real do repositório

#### Removido
- **ai-document-processing**: Remoção da referência a template não funcional (repositório não publicamente acessível como template AZD)

#### Melhorado
- **📝 exercícios agents.md**: O Exercício 1 agora mostra a saída esperada e o passo `azd monitor`; o Exercício 2 inclui o código completo de registo do `FunctionTool`; o Exercício 3 substitui orientações vagas por comandos concretos do `prepdocs.py`
- **📚 recursos agents.md**: Atualização dos links da documentação para os documentos atuais do Azure AI Agent Service e quickstart
- **📋 tabela Próximos Passos agents.md**: Adicionado link do AI Workshop Lab para cobertura completa do capítulo

#### Ficheiros Atualizados
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Melhoria na Navegação do Curso
**Esta versão melhora a navegação do README.md do capítulo com um formato de tabela aprimorado.**

#### Alterações
- **Tabela do Mapa do Curso**: Melhorada com links diretos para as aulas, estimativas de duração e classificações de complexidade
- **Limpeza de Pastas**: Removidas pastas antigas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validação de Links**: Todas as 21+ ligações internas na tabela do Mapa do Curso verificadas

### [v3.16.0] - 2026-02-05

#### Atualizações nos Nomes dos Produtos
**Esta versão atualiza referências a produtos para o branding atual da Microsoft.**

#### Alterações
- **Microsoft Foundry → Microsoft Foundry**: Todas as referências actualizadas em ficheiros não traduzidos
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir o branding atual

#### Ficheiros Atualizados
- `README.md` - Página principal do curso
- `changelog.md` - Histórico de versões
- `course-outline.md` - Estrutura do curso
- `docs/chapter-02-ai-development/agents.md` - Guia de agentes AI
- `examples/README.md` - Documentação de exemplos
- `workshop/README.md` - Página de entrada do workshop
- `workshop/docs/index.md` - Índice do workshop
- `workshop/docs/instructions/*.md` - Todos os ficheiros de instruções do workshop

---

### [v3.15.0] - 2026-02-05

#### Reestruturação Major do Repositório: Pastas Baseadas em Capítulos
**Esta versão reestrutura a documentação em pastas dedicadas a capítulos para uma navegação mais clara.**

#### Renomeações de Pastas
As pastas antigas foram substituídas por pastas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Adicionada nova: `docs/chapter-05-multi-agent/`

#### Migrações de Ficheiros
| Ficheiro | De | Para |
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
| Todos ficheiros pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Todos ficheiros troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Adicionado
- **📚 Ficheiros README dos Capítulos**: Criados README.md em cada pasta de capítulo com:
  - Objetivos de aprendizagem e duração
  - Tabela de lições com descrições
  - Comandos de início rápido
  - Navegação para outros capítulos

#### Alterações
- **🔗 Atualizadas todas as ligações internas**: 78+ caminhos atualizados em todos os ficheiros de documentação
- **🗺️ README.md Principal**: Atualizado o Mapa do Curso com a nova estrutura dos capítulos
- **📝 examples/README.md**: Atualizadas referências cruzadas para pastas de capítulos

#### Removido
- Estrutura antiga de pastas (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestruturação do Repositório: Navegação por Capítulos
**Esta versão adicionou ficheiros README de navegação por capítulos (substituída pela v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novo Guia para Agentes AI
**Esta versão adiciona um guia completo para implementar agentes AI com Azure Developer CLI.**

#### Adicionado
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo cobrindo:
  - O que são agentes AI e como diferem dos chatbots
  - Três modelos de arranque rápido de agentes (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agentes (agente único, RAG, multi-agente)
  - Configuração e personalização de ferramentas
  - Monitorização e rastreamento de métricas
  - Considerações e otimização de custos
  - Cenários comuns de resolução de problemas
  - Três exercícios práticos com critérios de sucesso

#### Estrutura do Conteúdo
- **Introdução**: Conceitos de agentes para iniciantes
- **Arranque Rápido**: Implementação de agentes com `azd init --template get-started-with-ai-agents`
- **Padrões de Arquitetura**: Diagramas visuais dos padrões de agentes
- **Configuração**: Definição de ferramentas e variáveis de ambiente
- **Monitorização**: Integração com Application Insights
- **Exercícios**: Aprendizagem prática progressiva (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### Atualização do Ambiente DevContainer
**Esta versão atualiza a configuração do contentor de desenvolvimento com ferramentas modernas e melhores predefinições para a experiência AZD.**

#### Alterações
- **🐳 Imagem Base**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (última versão estável do Debian)
- **📛 Nome do Contentor**: Renomeado de "Python 3" para "AZD para Iniciantes" para maior clareza

#### Adicionado
- **🔧 Novas Funcionalidades do Dev Container**:
  - `azure-cli` com suporte a Bicep ativado
  - `node:20` (versão LTS para modelos AZD)
  - `github-cli` para gestão de templates
  - `docker-in-docker` para implementações de aplicações em contentores

- **🔌 Redirecionamento de Portas**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (pré-visualização MkDocs)
  - 3000 (apps web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Novas Extensões VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python avançado
  - `ms-azuretools.vscode-azurefunctions` - suporte a Azure Functions
  - `ms-azuretools.vscode-docker` - suporte Docker
  - `ms-azuretools.vscode-bicep` - suporte à linguagem Bicep
  - `ms-azure-devtools.azure-resource-groups` - gestão de recursos Azure
  - `yzhang.markdown-all-in-one` - edição de markdown
  - `DavidAnson.vscode-markdownlint` - linting markdown
  - `bierner.markdown-mermaid` - suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - suporte YAML (para azure.yaml)
  - `eamodio.gitlens` - visualização Git
  - `mhutchie.git-graph` - histórico Git

- **⚙️ Definições VS Code**: Adicionadas definições padrão para interpretador Python, formatação ao guardar e remoção de espaços em branco

- **📦 requirements-dev.txt Atualizado**:
  - Adicionado plugin de minificação MkDocs
  - Adicionado pre-commit para qualidade de código
  - Adicionados pacotes Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigido
- **Comando Pós-Criação**: Agora verifica instalação do AZD e Azure CLI ao iniciar o contentor

---

### [v3.11.0] - 2026-02-05

#### Reformulação do README para Iniciantes
**Esta versão melhora significativamente o README.md para ser mais acessível para iniciantes e adiciona recursos essenciais para desenvolvedores AI.**

#### Adicionado
- **🆚 Comparação Azure CLI vs AZD**: Explicação clara sobre quando usar cada ferramenta com exemplos práticos
- **🌟 Links Interessantes AZD**: Links diretos para galeria comunitária de modelos e recursos de contribuição:
  - [Galeria Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ modelos prontos a implementar
  - [Submeter um Modelo](https://github.com/Azure/awesome-azd/issues) - Contribuição comunitária
- **🎯 Guia de Início Rápido**: Secção simplificada em 3 passos para começar (Instalar → Iniciar sessão → Implementar)
- **📊 Tabela de Navegação por Experiência**: Orientação clara sobre onde começar baseado na experiência do programador

#### Alterações
- **Estrutura do README**: Reorganizada para divulgação progressiva - informação chave primeiro
- **Secção de Introdução**: Reescrita para explicar "A Magia do `azd up`" para completos iniciantes
- **Conteúdo Duplicado Removido**: Eliminação da secção de resolução de problemas duplicada
- **Comandos de Resolução de Problemas**: Corrigida referência `azd logs` para usar `azd monitor --logs` válida

#### Corrigido
- **🔐 Comandos de Autenticação**: Adicionados `azd auth login` e `azd auth logout` ao cheat-sheet.md
- **Referências a Comandos Inválidos**: Remoção dos restantes `azd logs` da secção de resolução de problemas do README

#### Notas
- **Âmbito**: Alterações aplicadas ao README.md principal e resources/cheat-sheet.md
- **Público-Alvo**: Melhorias especificamente direcionadas a programadores novos no AZD

---

### [v3.10.0] - 2026-02-05

#### Atualização de Comandos do Azure Developer CLI
**Esta versão corrige comandos AZD inexistentes em toda a documentação, garantindo que todos os exemplos de código usam sintaxe válida do Azure Developer CLI.**

#### Corrigido
- **🔧 Comandos AZD Inexistentes Removidos**: Auditoria e correção abrangente de comandos inválidos:
  - `azd logs` (não existe) → substituído por `azd monitor --logs` ou alternativas Azure CLI
  - subcomandos `azd service` (não existem) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (não existem) → removidos ou substituídos por alternativas válidas
  - flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (não existem) → removidas
  - flags `azd provision --what-if/--rollback` (não existem) → atualizadas para usar `--preview`
  - `azd config validate` (não existe) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (não existem) → removidos

- **📚 Ficheiros Atualizados com Correções de Comandos**:
  - `resources/cheat-sheet.md`: Revisão maior da referência de comandos
  - `docs/deployment/deployment-guide.md`: Corrigidas estratégias de rollback e implementação
  - `docs/troubleshooting/debugging.md`: Corrigidas secções de análise de logs
  - `docs/troubleshooting/common-issues.md`: Atualizados comandos de resolução de problemas
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigida secção de debugging AZD
  - `docs/getting-started/azd-basics.md`: Corrigidos comandos de monitorização
  - `docs/getting-started/first-project.md`: Atualizados exemplos de monitorização e debugging
  - `docs/getting-started/installation.md`: Corrigidos exemplos de ajuda e versão
  - `docs/pre-deployment/application-insights.md`: Corrigidos comandos para visualização de logs
  - `docs/pre-deployment/coordination-patterns.md`: Corrigidos comandos de debugging de agentes

- **📝 Referência de Versão Atualizada**: 
  - `docs/getting-started/installation.md`: Alterada versão fixa `1.5.0` para genérica `1.x.x` com link para versões

#### Alterações
- **Estratégias de Rollback**: Documentação atualizada para uso de rollback baseado em Git (AZD não tem rollback nativo)
- **Visualização de Logs**: Substituídas referências a `azd logs` por `azd monitor --logs`, `azd monitor --live` e comandos Azure CLI
- **Secção de Desempenho**: Removidas flags inexistentes de deployment paralelizado/incremental, fornecidas alternativas válidas

#### Detalhes Técnicos
- **Comandos AZD Válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidas para azd monitor**: `--live`, `--logs`, `--overview`
- **Funcionalidades Removidas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificação**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Atualização de Conclusão do Workshop e Qualidade da Documentação
**Esta versão conclui os módulos interativos do workshop, corrige todos os links partidos na documentação e melhora a qualidade geral do conteúdo para desenvolvedores de IA que utilizam o Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes para contribuições com:
  - Instruções claras para reportar problemas e propor alterações
  - Padrões de documentação para conteúdos novos
  - Diretrizes para exemplos de código e convenções de mensagens de commit
  - Informação sobre envolvimento comunitário

#### Concluído
- **🎯 Módulo 7 do Workshop (Conclusão)**: Módulo de encerramento totalmente concluído com:
  - Resumo abrangente dos feitos no workshop
  - Secção de conceitos-chave dominados incluindo AZD, templates e Microsoft Foundry
  - Recomendações de continuação da jornada de aprendizagem
  - Exercícios de desafio do workshop com classificações de dificuldade
  - Links para feedback da comunidade e suporte

- **📚 Módulo 3 do Workshop (Desconstrução)**: Objetivos de aprendizagem atualizados com:
  - Orientação para ativação do GitHub Copilot com servidores MCP
  - Compreensão da estrutura de pastas dos templates AZD
  - Padrões de organização de infraestrutura como código (Bicep)
  - Instruções práticas para laboratório

- **🔧 Módulo 6 do Workshop (Derrube)**: Concluído com:
  - Objetivos de limpeza de recursos e gestão de custos
  - Uso do `azd down` para desprovisionamento seguro da infraestrutura
  - Guia para recuperação de serviços cognitivos apagados suavemente
  - Exploração bônus para GitHub Copilot e Portal Azure

#### Corrigido
- **🔗 Correção de Links Partidos**: Resolveu mais de 15 links internos com falhas:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrigidos caminhos para microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigidos caminhos ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Substituído cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Corrigidos caminhos de FAQ e guia de resolução de problemas
  - `examples/container-app/microservices/README.md`: Corrigidos caminhos para página principal do curso e guia de implantação
  - `resources/faq.md` e `resources/glossary.md`: Atualizadas referências do capítulo de IA
  - `course-outline.md`: Corrigidos guias de instrutor e referências de laboratório do workshop de IA

- **📅 Banner do Estado do Workshop**: Atualizado de "Em Construção" para estado ativo do workshop com data de fevereiro de 2026

- **🔗 Navegação do Workshop**: Corrigidos links de navegação partidos no README.md do workshop apontando para a pasta lab-1-azd-basics inexistente

#### Alterado
- **Apresentação do Workshop**: Removido aviso de "em construção"; workshop agora completo e pronto a usar
- **Consistência da Navegação**: Garantida navegação correta entre todos os módulos do workshop
- **Referências do Percurso de Aprendizagem**: Atualizadas as referências entre capítulos para os caminhos corretos do microsoft-foundry

#### Validado
- ✅ Todos os ficheiros markdown em inglês têm links internos válidos
- ✅ Módulos do workshop 0-7 completos com objetivos de aprendizagem
- ✅ Navegação entre capítulos e módulos funciona corretamente
- ✅ Conteúdo adequado para desenvolvedores de IA que usam Microsoft AZD
- ✅ Linguagem e estrutura amigáveis a iniciantes mantidas
- ✅ CONTRIBUTING.md fornece orientações claras para contribuintes da comunidade

#### Implementação Técnica
- **Validação de Links**: Script PowerShell automatizado verificou todos os links internos .md
- **Auditoria de Conteúdo**: Revisão manual da completude do workshop e adequação a iniciantes
- **Sistema de Navegação**: Aplicados padrões consistentes de navegação entre capítulos e módulos

#### Notas
- **Escopo**: Alterações aplicadas apenas à documentação em inglês
- **Traduções**: Pastas de tradução não atualizadas nesta versão (a tradução automática será sincronizada mais tarde)
- **Duração do Workshop**: Workshop completo oferece agora 3-4 horas de aprendizagem prática

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitorização, Segurança e Padrões Multi-Agente
**Esta versão adiciona lições de qualidade A abrangentes sobre integração do Application Insights, padrões de autenticação e coordenação multi-agente para implementações em produção.**

#### Adicionado
- **📊 Lição de Integração com Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Desdobramento focado em AZD com provisionamento automático
  - Templates Bicep completos para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria personalizada (mais de 1200 linhas)
  - Padrões de monitorização AI/LLM (rastreio de tokens/custos dos Modelos Microsoft Foundry)
  - 6 diagramas Mermaid (arquitetura, tracing distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, painéis, monitorização AI)
  - Exemplos de consultas Kusto e estratégias de otimização de custos
  - Streaming de métricas ao vivo e depuração em tempo real
  - Tempo de aprendizagem de 40-50 minutos com padrões prontos para produção

- **🔐 Lição de Padrões de Autenticação & Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (strings de conexão, Key Vault, identidade gerida)
  - Templates completos Bicep para infraestrutura segura
  - Código de aplicação Node.js com integração do Azure SDK
  - 3 exercícios completos (ativar identidade gerida, identidade atribuída pelo utilizador, rotação de Key Vault)
  - Melhores práticas de segurança e configurações RBAC
  - Guia de resolução de problemas e análise de custos
  - Padrões de autenticação production-ready sem palavra-passe

- **🤖 Lição de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, acionado por eventos, consenso)
  - Implementação completa do serviço orquestrador (Python/Flask, mais de 1500 linhas)
  - 3 implementações especializadas de agentes (Investigação, Escritor, Editor)
  - Integração com Service Bus para enfileiramento de mensagens
  - Gestão de estado Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid a mostrar interações dos agentes
  - 3 exercícios avançados (gestão de timeout, lógica de retry, circuito de disjunção)
  - Análise de custo ($240-565/mês) com estratégias de otimização
  - Integração Application Insights para monitorização

#### Melhorado
- **Capítulo de Pré-desdobramento**: Agora inclui padrões abrangentes de monitorização e coordenação
- **Capítulo Início Rápido**: Melhorado com padrões profissionais de autenticação
- **Prontidão para Produção**: Cobertura completa desde segurança até observabilidade
- **Esquema do Curso**: Atualizado para referenciar as novas lições dos Capítulos 3 e 6

#### Alterado
- **Progresso de Aprendizagem**: Melhor integração de segurança e monitorização ao longo do curso
- **Qualidade da Documentação**: Padrões consistentes de qualidade A (95-97%) nas novas lições
- **Padrões de Produção**: Cobertura completa de ponta a ponta para implementações empresariais

#### Aprimorado
- **Experiência do Desenvolvedor**: Caminho claro do desenvolvimento até monitorização em produção
- **Padrões de Segurança**: Padrões profissionais para autenticação e gestão de segredos
- **Observabilidade**: Integração completa do Application Insights com AZD
- **Workloads de IA**: Monitorização especializada para Modelos Microsoft Foundry e sistemas multi-agente

#### Validado
- ✅ Todas as lições incluem código funcional completo (não excertos)
- ✅ Diagramas Mermaid para aprendizagem visual (19 no total em 3 lições)
- ✅ Exercícios práticos com passos de verificação (9 no total)
- ✅ Templates Bicep prontos para produção, implantáveis com `azd up`
- ✅ Análise de custo e estratégias de otimização
- ✅ Guias de resolução de problemas e melhores práticas
- ✅ Pontos de verificação de conhecimento com comandos de verificação

#### Resultados da Avaliação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia abrangente de monitorização
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas multi-agente avançadas
- **Conteúdo Novo Global**: - Padrões consistentes de alta qualidade

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria personalizada + tracing distribuído
- **Autenticação**: Identidade Gerida + Key Vault + padrões RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitorização**: Métricas ao vivo + consultas Kusto + alertas + painéis
- **Gestão de Custos**: Estratégias de amostragem, políticas de retenção, controlo orçamental

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo de Microsoft Foundry Models
**Esta versão melhora a qualidade da documentação no repositório e adiciona um exemplo completo de desdobramento do Microsoft Foundry Models com interface de chat gpt-4.1.**

#### Adicionado
- **🤖 Exemplo de Chat Microsoft Foundry Models**: Desdobramento completo gpt-4.1 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa Microsoft Foundry Models (desdobramento do modelo gpt-4.1)
  - Interface de chat Python em linha de comando com histórico de conversas
  - Integração Key Vault para armazenamento seguro da chave API
  - Monitorização de uso de tokens e estimativa de custos
  - Limitação de taxas e tratamento de erros
  - README abrangente com guia de desdobramento de 35-45 minutos
  - 11 ficheiros production-ready (templates Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Exercícios práticos adicionados ao guia de configuração:
  - Exercício 1: Configuração multi-ambiente (15 minutos)
  - Exercício 2: Prática de gestão de segredos (10 minutos)
  - Critérios de sucesso claros e passos de verificação
- **✅ Verificação de Desdobramento**: Secção de verificação adicionada ao guia de desdobramento:
  - Procedimentos de verificação de estado
  - Lista de critérios de sucesso
  - Resultados esperados para todos os comandos de desdobramento
  - Referência rápida para resolução de problemas

#### Melhorado
- **examples/README.md**: Atualizado para qualidade A (93%):
  - Adicionado azure-openai-chat a todas as secções relevantes
  - Contagem de exemplos locais atualizada de 3 para 4
  - Adicionado à tabela de Exemplos de Aplicações de IA
  - Integrado na Introdução Rápida para Utilizadores Intermédios
  - Adicionado na secção de Microsoft Foundry Templates
  - Atualizadas secções de Matriz de Comparação e localização tecnológica
- **Qualidade da Documentação**: Melhorada de B+ (87%) para A- (92%) na pasta docs:
  - Adicionados resultados esperados a exemplos de comandos críticos
  - Incluídos passos de verificação para alterações de configuração
  - Aprendizagem prática reforçada com exercícios

#### Alterado
- **Progresso de Aprendizagem**: Melhor integração de exemplos de IA para aprendizes intermédios
- **Estrutura da Documentação**: Exercícios mais práticos com resultados claros
- **Processo de Verificação**: Critérios explícitos de sucesso adicionados a fluxos de trabalho chave

#### Aprimorado
- **Experiência do Desenvolvedor**: Desdobramento Microsoft Foundry Models agora demora 35-45 minutos (em vez de 60-90 para alternativas complexas)
- **Transparência de Custos**: Estimativas claras de custos ($50-200/mês) para exemplo Microsoft Foundry Models
- **Percurso de Aprendizagem**: Desenvolvedores de IA têm ponto de entrada claro com azure-openai-chat
- **Padrões da Documentação**: Resultados esperados consistentes e passos de verificação

#### Validado
- ✅ Exemplo Microsoft Foundry Models totalmente funcional com `azd up`
- ✅ Todos os 11 ficheiros de implementação sintaticamente corretos
- ✅ Instruções README correspondem à experiência real de desdobramento
- ✅ Links da documentação atualizados em mais de 8 locais
- ✅ Índice de exemplos reflete com precisão 4 exemplos locais
- ✅ Sem links externos duplicados em tabelas
- ✅ Todas as referências de navegação corretas

#### Implementação Técnica
- **Arquitetura Microsoft Foundry Models**: gpt-4.1 + Key Vault + padrão Container Apps
- **Segurança**: Identidade Gerida pronta, segredos no Key Vault
- **Monitorização**: Integração Application Insights
- **Gestão de Custos**: Rastreio de tokens e otimização de uso
- **Desdobramento**: Comando único `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Principal: Exemplos de Desdobramento de Container App
**Esta versão introduz exemplos comprensivos de desdobramento de aplicações em containers prontos para produção usando Azure Developer CLI (AZD), com documentação completa e integração no percurso de aprendizagem.**

#### Adicionado
- **🚀 Exemplos de Container App**: Novos exemplos locais em `examples/container-app/`:
  - [Guia Mestre](examples/container-app/README.md): Visão geral completa de desdobramentos conteinerizados, início rápido, produção e padrões avançados
  - [API Flask Simples](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com escala-para-zero, sondas de saúde, monitorização e resolução de problemas
  - [Arquitetura de Microserviços](../../examples/container-app/microservices): Desdobramento multi-serviço pronto para produção (API Gateway, Produto, Encomenda, Utilizador, Notificação), mensagens assíncronas, Service Bus, Cosmos DB, Azure SQL, tracing distribuído, desdobramento blue-green/canary
- **Melhores Práticas**: Segurança, monitorização, otimização de custos e orientação CI/CD para cargas conteinerizadas
- **Exemplos de Código**: `azure.yaml`, templates Bicep completos e implementações multi-linguagem dos serviços (Python, Node.js, C#, Go)
- **Testes & Resolução de Problemas**: Cenários de teste end-to-end, comandos de monitorização, guias de resolução de problemas

#### Alterado
- **README.md**: Atualizado para apresentar e ligar novos exemplos de aplicações em contentores sob "Exemplos Locais - Aplicações em Contentores"
- **examples/README.md**: Atualizado para destacar exemplos de aplicações em contentores, adicionar entradas à matriz de comparação e atualizar referências de tecnologia/arquitetura
- **Estrutura do Curso & Guia de Estudo**: Atualizado para referenciar novos exemplos de aplicações em contentores e padrões de implementação nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos podem ser implementados com `azd up` e seguem as melhores práticas
- ✅ Ligações cruzadas na documentação e navegação atualizadas
- ✅ Exemplos cobrem cenários do nível inicial ao avançado, incluindo microsserviços em produção

#### Notas
- **Âmbito**: Documentação em inglês e exemplos apenas
- **Próximos Passos**: Expandir com padrões adicionais avançados para contentores e automação CI/CD em futuras versões

### [v3.5.0] - 2025-11-19

#### Rebranding do Produto: Microsoft Foundry
**Esta versão implementa uma alteração abrangente do nome do produto de "Microsoft Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**

#### Alterado
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Microsoft Foundry" para "Microsoft Foundry"
  - Atualizadas todas as referências na documentação em inglês na pasta `docs/`
  - Renomeada pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renomeado ficheiro: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referências de conteúdo atualizadas em 7 ficheiros de documentação

- **📁 Alterações na Estrutura das Pastas**:
  - `docs/ai-foundry/` renomeada para `docs/microsoft-foundry/`
  - Todas as referências cruzadas atualizadas para refletir a nova estrutura de pastas
  - Ligações de navegação validadas em toda a documentação

- **📄 Renomeações de Ficheiros**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todas as ligações internas atualizadas para referenciar o novo nome de ficheiro

#### Ficheiros Atualizados
- **Documentação dos Capítulos** (7 ficheiros):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações de ligações de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências ao nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já utiliza Microsoft Foundry (de atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback da comunidade, documentação)
  - `docs/getting-started/azd-basics.md` - 4 ligações de referência cruzada atualizadas
  - `docs/getting-started/first-project.md` - 2 ligações de navegação de capítulo atualizadas
  - `docs/getting-started/installation.md` - 2 ligações do próximo capítulo atualizadas
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade Discord)
  - `docs/troubleshooting/common-issues.md` - 1 ligação de navegação atualizada
  - `docs/troubleshooting/debugging.md` - 1 ligação de navegação atualizada

- **Ficheiros da Estrutura do Curso** (2 ficheiros):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos dos capítulos, seção de templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizagem, recursos dos capítulos)

#### Validado
- ✅ Nenhuma referência restante à pasta "ai-foundry" nos documentos em inglês
- ✅ Nenhuma referência restante ao nome de produto "Microsoft Foundry" na documentação em inglês
- ✅ Todas as ligações de navegação funcionam com a nova estrutura de pastas
- ✅ Renomeações de ficheiros e pastas concluídas com sucesso
- ✅ Referências cruzadas entre capítulos validadas

#### Notas
- **Âmbito**: Alterações aplicadas apenas à documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de tradução (`translations/`) não atualizadas nesta versão
- **Workshop**: Materiais do workshop (`workshop/`) não atualizados nesta versão
- **Exemplos**: Ficheiros de exemplo podem ainda referir nomes legados (a corrigir em atualizações futuras)
- **Ligações Externas**: URLs externas e referências ao repositório GitHub mantidas sem alterações

#### Guia de Migração para Contribuidores
Se possuir ramificações locais ou documentação que referencie a estrutura antiga:
1. Atualize referências de pastas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualize referências de ficheiros: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substitua o nome do produto: "Microsoft Foundry" → "Microsoft Foundry"
4. Verifique se todas as ligações internas da documentação funcionam corretamente

---

### [v3.4.0] - 2025-10-24

#### Pré-visualização de Infraestrutura e Melhorias de Validação
**Esta versão introduz suporte abrangente para a nova funcionalidade de pré-visualização do Azure Developer CLI e melhora a experiência dos utilizadores do workshop.**

#### Adicionado
- **🧪 Documentação de Função azd provision --preview**: Cobertura completa da nova funcionalidade de pré-visualização da infraestrutura
  - Referência de comando e exemplos de uso no cheat sheet
  - Integração detalhada no guia de provisionamento com casos de utilização e benefícios
  - Integração de verificação pré-implementação para validação mais segura
  - Atualizações no guia de início rápido com práticas de implementação orientadas à segurança
- **🚧 Barra de Estado do Workshop**: Banner HTML profissional indicando o estado de desenvolvimento do workshop
  - Design degradê com indicadores de construção para comunicação clara ao utilizador
  - Marca temporal da última atualização para transparência
  - Design responsivo para dispositivos móveis de todos os tipos

#### Melhorado
- **Segurança da Infraestrutura**: Funcionalidade de pré-visualização integrada através da documentação de implementação
- **Validação Pré-implementação**: Scripts automatizados incluem agora testes de pré-visualização de infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir pré-visualização como melhor prática
- **Experiência no Workshop**: Expectativas claras definidas para os utilizadores sobre o estado de desenvolvimento do conteúdo

#### Alterado
- **Melhores Práticas de Implementação**: Fluxo de trabalho "pré-visualizar primeiro" recomendado atualmente
- **Fluxo Documental**: Validação da infraestrutura avançada para etapas iniciais de aprendizagem
- **Apresentação no Workshop**: Comunicação de estado profissional com cronogramas claros de desenvolvimento

#### Melhorado
- **Abordagem Focada na Segurança**: Alterações da infraestrutura podem agora ser validadas antes da implementação
- **Colaboração em Equipa**: Resultados de pré-visualização podem ser partilhados para revisão e aprovação
- **Consciência de Custos**: Melhor compreensão dos custos dos recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas na implementação através de validação antecipada

#### Implementação Técnica
- **Integração Multi-documento**: Funcionalidade de pré-visualização documentada em 4 ficheiros-chave
- **Padrões de Comando**: Sintaxe consistente e exemplos através da documentação
- **Integração das Melhores Práticas**: Pré-visualização incluída em fluxos de trabalho e scripts de validação
- **Indicadores Visuais**: Marcação clara de NOVA funcionalidade para facilidade de descoberta

#### Infraestrutura do Workshop
- **Comunicação de Estado**: Banner HTML profissional com estilo degradê
- **Experiência do Utilizador**: Estado de desenvolvimento claro evita confusões
- **Apresentação Profissional**: Mantém credibilidade do repositório enquanto define expectativas
- **Transparência do Cronograma**: Data da última atualização em outubro de 2025 para responsabilização

### [v3.3.0] - 2025-09-24

#### Materiais Avançados para Workshops e Experiência de Aprendizagem Interativa
**Esta versão introduz materiais abrangentes para workshops com guias interativos via browser e percursos de aprendizagem estruturados.**

#### Adicionado
- **🎥 Guia Interativo para Workshop**: Experiência de workshop via browser com capacidade de pré-visualização MkDocs
- **📝 Instruções Estruturadas para Workshop**: Percurso de aprendizagem guiado em 7 passos desde descoberta à personalização
  - 0-Introdução: Visão geral e configuração do workshop
  - 1-Selecionar-Template-AI: Descoberta e seleção do template
  - 2-Validar-Template-AI: Procedimentos de implementação e validação
  - 3-Desconstruir-Template-AI: Compreensão da arquitetura do template
  - 4-Configurar-Template-AI: Configuração e personalização
  - 5-Personalizar-Template-AI: Modificações avançadas e iterações
  - 6-Desmantelar-Infraestrutura: Limpeza e gestão de recursos
  - 7-Conclusão: Resumo e próximos passos
- **🛠️ Ferramentas para Workshop**: Configuração MkDocs com tema Material para experiência de aprendizagem melhorada
- **🎯 Percurso Prático de Aprendizagem**: Metodologia em 3 passos (Descoberta → Implementação → Personalização)
- **📱 Integração GitHub Codespaces**: Configuração transparente do ambiente de desenvolvimento

#### Melhorado
- **Laboratório AI Workshop**: Ampliado com experiência estruturada de aprendizagem de 2-3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e auxiliares visuais
- **Progressão de Aprendizagem**: Orientação clara passo a passo desde seleção do template até implementação em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho de desenvolvimento simplificados

#### Melhorado
- **Acessibilidade**: Interface via browser com pesquisa, funcionalidade copiar e alternância de tema
- **Aprendizagem Autodirigida**: Estrutura flexível para acomodar diferentes ritmos de aprendizagem
- **Aplicação Prática**: Cenários reais de implementação de templates de IA
- **Integração Comunitária**: Integração Discord para suporte e colaboração no workshop

#### Funcionalidades do Workshop
- **Pesquisa Incorporada**: Descoberta rápida de palavras-chave e lições
- **Copiar Blocos de Código**: Funcionalidade hover-to-copy para todos os exemplos de código
- **Alternância de Tema**: Suporte a modos escuro/claro para diferentes preferências
- **Recursos Visuais**: Capturas de ecrã e diagramas para melhor compreensão
- **Integração de Ajuda**: Acesso direto ao Discord para suporte comunitário

### [v3.2.0] - 2025-09-17

#### Reestruturação Maior da Navegação e Sistema de Aprendizagem Baseado em Capítulos
**Esta versão introduz uma estrutura abrangente de aprendizagem organizada por capítulos com navegação melhorada em todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizagem Baseado em Capítulos**: Reestruturado curso completo em 8 capítulos progressivos
  - Capítulo 1: Fundamentos & Início Rápido (⭐ - 30-45 mins)
  - Capítulo 2: Desenvolvimento AI-First (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração & Autenticação (⭐⭐ - 45-60 mins)
  - Capítulo 4: Infrastructure as Code & Implementação (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluções Multi-Agentes de IA (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação & Planeamento Pré-Implementação (⭐⭐ - 1 hora)
  - Capítulo 7: Resolução de Problemas & Debugging (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Padrões de Produção & Empresariais (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema Completo de Navegação**: Cabeçalhos e rodapés consistentes de navegação em toda a documentação
- **🎯 Acompanhamento de Progresso**: Lista de verificação de conclusão do curso e sistema de verificação de aprendizagem
- **🗺️ Orientação do Percurso de Aprendizagem**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação com Referências Cruzadas**: Capítulos relacionados e pré-requisitos claramente ligados

#### Melhorado
- **Estrutura do README**: Transformada numa plataforma de aprendizagem estruturada com organização por capítulos
- **Navegação da Documentação**: Cada página inclui contexto de capítulo e orientação de progressão
- **Organização dos Templates**: Exemplos e templates mapeados para capítulos de aprendizagem apropriados
- **Integração de Recursos**: Cheatsheets, FAQ e guias de estudo ligados a capítulos relevantes
- **Integração do Workshop**: Laboratórios práticos mapeados para múltiplos objetivos dos capítulos

#### Alterado
- **Progressão da Aprendizagem**: Passagem de documentação linear para aprendizagem flexível baseada em capítulos
- **Posicionamento da Configuração**: Guia de configuração reposicionado no Capítulo 3 para melhor fluxo de aprendizagem
- **Integração de Conteúdo AI**: Melhor integração de conteúdo específico de IA ao longo do percurso de aprendizagem
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para utilizadores empresariais

#### Melhorado
- **Experiência do Utilizador**: Trilhas de navegação e indicadores claros de progressão por capítulo
- **Acessibilidade**: Padrões de navegação consistentes para facilitar a travessia do curso
- **Apresentação Profissional**: Estrutura de curso ao estilo universitário adequada para formação académica e corporativa
- **Eficiência na Aprendizagem**: Redução do tempo para encontrar conteúdo relevante através de melhor organização

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação padronizada por capítulos em mais de 40 ficheiros de documentação
- **Rodapé de Navegação**: Orientação consistente da progressão e indicadores de conclusão de capítulo
- **Ligação Cruzada**: Sistema interno abrangente de ligações conectando conceitos relacionados
- **Mapeamento de Capítulos**: Templates e exemplos associados claramente a objetivos de aprendizagem

#### Melhoria do Guia de Estudo
- **📚 Objetivos Abrangentes de Aprendizagem**: Guia de estudo reestruturado para alinhar com sistema de 8 capítulos
- **🎯 Avaliação Baseada em Capítulos**: Cada capítulo inclui objetivos de aprendizagem específicos e exercícios práticos
- **📋 Acompanhamento de Progresso**: Agenda semanal com resultados mensuráveis e checklist de conclusão
- **❓ Questões de Avaliação**: Perguntas de validação de conhecimento para cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades hands-on com cenários reais de implementação e resolução de problemas
- **📊 Progressão de Competências**: Avanço claro dos conceitos básicos a padrões empresariais com foco em desenvolvimento de carreira
- **🎓 Estrutura de Certificação**: Resultados de desenvolvimento profissional e sistema de reconhecimento comunitário
- **⏱️ Gestão do Cronograma**: Plano estruturado de aprendizagem de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Soluções Multi-Agentes de IA Melhoradas
**Esta versão melhora a solução multi-agente para retalho com melhor nomeação dos agentes e documentação enriquecida.**

#### Alterado
- **Terminologia Multi-Agente**: Substituído "agente Cora" por "agente Cliente" em toda a solução multi-agente para retalho para maior clareza
- **Arquitetura do Agente**: Atualizada toda a documentação, templates ARM e exemplos de código para usar o nome consistente "agente Cliente"
- **Exemplos de Configuração**: Modernizadas configurações do agente com convenções de nomeação atualizadas
- **Consistência na Documentação**: Garantido que todas as referências utilizam nomes profissionais e descritivos dos agentes

#### Melhorado
- **Pacote ARM Template**: Atualizado retail-multiagent-arm-template com referências ao agente Customer
- **Diagramas de Arquitetura**: Diagramas Mermaid atualizados com nomenclatura atualizada dos agentes
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam a nomenclatura CustomerAgent
- **Variáveis de Ambiente**: Todos os scripts de implantação atualizados para usar as convenções CUSTOMER_AGENT_NAME

#### Melhorias
- **Experiência do Desenvolvedor**: Papéis e responsabilidades do agente mais claros na documentação
- **Prontidão para Produção**: Melhor alinhamento com convenções de nomenclatura empresariais
- **Materiais de Aprendizagem**: Nomenclatura dos agentes mais intuitiva para fins educacionais
- **Usabilidade do Template**: Compreensão simplificada das funções dos agentes e padrões de implantação

#### Detalhes Técnicos
- Diagramas de arquitetura Mermaid atualizados com referências ao CustomerAgent
- Substituídos nomes da classe CoraAgent por CustomerAgent nos exemplos Python
- Configurações JSON do template ARM modificadas para usar o tipo de agente "customer"
- Variáveis de ambiente atualizadas de CORA_AGENT_* para padrões CUSTOMER_AGENT_*
- Comandos de implantação e configurações de container atualizados

### [v3.0.0] - 2025-09-12

#### Grandes Mudanças - Foco no Desenvolvedor AI e Integração Microsoft Foundry
**Esta versão transforma o repositório numa fonte de aprendizagem abrangente focada em IA com integração Microsoft Foundry.**

#### Adicionado
- **🤖 Roteiro de Aprendizagem Prioritário em IA**: Reestruturação completa priorizando desenvolvedores e engenheiros de IA
- **Guia de Integração Microsoft Foundry**: Documentação abrangente para conectar AZD com serviços Microsoft Foundry
- **Padrões de Implantação de Modelos IA**: Guia detalhado sobre seleção, configuração e estratégias de implantação em produção
- **Laboratório Workshop de IA**: Workshop prático de 2-3 horas para converter aplicações IA em soluções implantáveis via AZD
- **Boas Práticas de IA para Produção**: Padrões empresariais prontos para escalar, monitorar e proteger cargas de trabalho IA
- **Guia de Resolução de Problemas Específico de IA**: Diagnóstico completo para Modelos Microsoft Foundry, Serviços Cognitivos e implantações IA
- **Galeria de Templates IA**: Coleção em destaque de templates Microsoft Foundry com classificações de complexidade
- **Materiais do Workshop**: Estrutura completa do workshop com laboratórios práticos e materiais de referência

#### Melhorado
- **Estrutura do README**: Focado em desenvolvedores IA com dados de interesse comunitário de 45% do Discord Microsoft Foundry
- **Rotas de Aprendizagem**: Jornada dedicada para desenvolvedores IA paralelamente a roteiros tradicionais para estudantes e engenheiros DevOps
- **Recomendações de Templates**: Templates IA em destaque incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integração Comunitária**: Suporte aprimorado na comunidade Discord com canais e discussões específicos de IA

#### Foco em Segurança e Produção
- **Padrões de Identidade Gerenciada**: Configurações de autenticação e segurança específicas para IA
- **Otimização de Custos**: Rastreamento de uso de tokens e controle de orçamentos para cargas IA
- **Implantação Multi-Região**: Estratégias para implantação global de aplicações IA
- **Monitorização de Performance**: Métricas específicas de IA e integração com Application Insights

#### Qualidade da Documentação
- **Estrutura Linear do Curso**: Progressão lógica de padrões básicos a avançados de implantação IA
- **URLs Validados**: Todos os links externos verificados e acessíveis
- **Referência Completa**: Todos os links internos validados e funcionais
- **Pronto para Produção**: Padrões empresariais de implantação com exemplos reais

### [v2.0.0] - 2025-09-09

#### Grandes Mudanças - Reestruturação do Repositório e Aperfeiçoamento Profissional
**Esta versão representa uma mudança significativa na estrutura e apresentação do conteúdo do repositório.**

#### Adicionado
- **Estrutura de Aprendizagem Estruturada**: Todas as páginas de documentação agora incluem Introdução, Objetivos de Aprendizagem e Resultados de Aprendizagem
- **Sistema de Navegação**: Adicionados links de aula Anterior/Seguinte em toda a documentação para progresso guiado
- **Guia de Estudo**: Guia abrangente study-guide.md com objetivos de aprendizagem, exercícios práticos e materiais de avaliação
- **Apresentação Profissional**: Remoção de todos os ícones emoji para melhorar acessibilidade e aparência profissional
- **Estrutura de Conteúdo Melhorada**: Organização e fluxo aprimorados dos materiais de aprendizagem

#### Alterado
- **Formato da Documentação**: Documentação padronizada com estrutura consistente focada no aprendizado
- **Fluxo de Navegação**: Implementada progressão lógica em todos os materiais
- **Apresentação de Conteúdo**: Remoção de elementos decorativos para formato claro e profissional
- **Estrutura de Links**: Atualizados todos os links internos para suportar o novo sistema de navegação

#### Melhorado
- **Acessibilidade**: Remoção de dependências de emojis para melhor compatibilidade com leitores de ecrã
- **Aparência Profissional**: Apresentação limpa em estilo académico adequada para aprendizagem empresarial
- **Experiência de Aprendizagem**: Abordagem estruturada com objetivos claros e resultados para cada lição
- **Organização do Conteúdo**: Melhor fluxo lógico e ligação entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório Completo de Aprendizagem AZD

#### Adicionado
- **Estrutura Central da Documentação**
  - Série completa de guias de introdução
  - Documentação abrangente de implantação e aprovisionamento
  - Recursos detalhados de troubleshooting e guias de depuração
  - Ferramentas e procedimentos de validação pré-implantação

- **Módulo Introdução**
  - Noções básicas AZD: conceitos e terminologia principais
  - Guia de Instalação: instruções específicas por plataforma
  - Guia de Configuração: configuração do ambiente e autenticação
  - Tutorial do Primeiro Projeto: aprendizagem prática passo a passo

- **Módulo Implantação e Aprovisionamento**
  - Guia de Implantação: documentação completa do fluxo de trabalho
  - Guia de Aprovisionamento: Infraestrutura como Código com Bicep
  - Melhores práticas para implantações em produção
  - Padrões de arquitetura multi-serviço

- **Módulo de Validação Pré-Implantação**
  - Planeamento de Capacidade: validação da disponibilidade de recursos Azure
  - Seleção de SKU: guia abrangente de níveis de serviço
  - Verificações Pré-voo: scripts automatizados de validação (PowerShell e Bash)
  - Estimativa de custos e ferramentas de planeamento orçamental

- **Módulo de Resolução de Problemas**
  - Problemas comuns: questões frequentes e soluções
  - Guia de Depuração: metodologias sistemáticas de troubleshooting
  - Técnicas avançadas de diagnóstico e ferramentas
  - Monitorização e otimização de performance

- **Recursos e Referências**
  - Folha de comandos: referência rápida para comandos essenciais
  - Glossário: terminologia e definições de siglas completas
  - FAQ: respostas detalhadas para questões comuns
  - Links externos e conexões comunitárias

- **Exemplos e Templates**
  - Exemplo de aplicação web simples
  - Template de implantação para site estático
  - Configuração de aplicação em container
  - Padrões de integração com base de dados
  - Exemplos de arquitetura microserviços
  - Implementações de funções serverless

#### Funcionalidades
- **Suporte Multiplataforma**: guias de instalação e configuração para Windows, macOS e Linux
- **Vários Níveis de Competência**: conteúdo criado para estudantes até desenvolvedores profissionais
- **Foco Prático**: exemplos práticos e cenários reais
- **Cobertura Abrangente**: dos conceitos básicos a padrões empresariais avançados
- **Abordagem Focada em Segurança**: práticas de segurança integradas ao longo de toda a documentação
- **Otimização de Custos**: orientações para implantações econômicas e gestão de recursos

#### Qualidade da Documentação
- **Exemplos de Código Detalhados**: amostras de código práticas e testadas
- **Instruções Passo a Passo**: orientações claras e acionáveis
- **Tratamento Completo de Erros**: resolução de problemas comuns
- **Integração de Melhores Práticas**: padrões e recomendações do setor
- **Compatibilidade de Versão**: atualizado com os mais recentes serviços Azure e funcionalidades azd

## Melhorias Futuras Planeadas

### Versão 3.1.0 (Planeada)
#### Expansão da Plataforma IA
- **Suporte Multi-modelo**: padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados
- **Frameworks para Agentes IA**: templates para LangChain, Semantic Kernel e implementações AutoGen
- **Padrões Avançados RAG**: opções de bases de dados vetoriais além do Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidade IA**: monitorização ampliada para performance de modelos, uso de tokens e qualidade de respostas

#### Experiência do Desenvolvedor
- **Extensão VS Code**: experiência integrada AZD + Microsoft Foundry para desenvolvimento
- **Integração GitHub Copilot**: geração assistida de templates AZD com IA
- **Tutoriais Interativos**: exercícios de codificação práticos com validação automatizada para cenários IA
- **Conteúdo Vídeo**: tutoriais em vídeo suplementares para alunos visuais focados em implantações IA

### Versão 4.0.0 (Planeada)
#### Padrões Empresariais IA
- **Framework de Governança**: governança, conformidade e auditoria de modelos IA
- **IA Multi-inquilino**: padrões para servir vários clientes com serviços IA isolados
- **Implantação Edge IA**: integração com Azure IoT Edge e instâncias de container
- **IA em Nuvem Híbrida**: padrões de implantação multi-cloud e híbridos para cargas IA

#### Funcionalidades Avançadas
- **Automação de Pipeline IA**: integração MLOps com pipelines do Azure Machine Learning
- **Segurança Avançada**: padrões de zero-trust, endpoints privados e proteção avançada contra ameaças
- **Otimização de Performance**: estratégias avançadas de tuning e escalabilidade para aplicações IA de alto rendimento
- **Distribuição Global**: padrões de entrega de conteúdos e cache de borda para aplicações IA

### Versão 3.0.0 (Planeada) - Substituída pela Versão Atual
#### Adições Propostas - Agora Implementadas no v3.0.0
- ✅ **Conteúdo Focado em IA**: integração abrangente Microsoft Foundry (Concluído)
- ✅ **Tutoriais Interativos**: laboratório hands-on de IA (Concluído)
- ✅ **Módulo de Segurança Avançada**: padrões de segurança específicos para IA (Concluído)
- ✅ **Otimização de Performance**: estratégias de tuning para cargas IA (Concluído)

### Versão 2.1.0 (Planeada) - Parcialmente Implementada no v3.0.0
#### Melhorias Menores - Algumas Concluídas na Versão Atual
- ✅ **Exemplos Adicionais**: cenários de implantação focados em IA (Concluído)
- ✅ **FAQ Extendida**: questões específicas de IA e resolução de problemas (Concluído)
- **Integração de Ferramentas**: guias aprimorados para IDEs e editores
- ✅ **Expansão de Monitorização**: padrões de monitorização e alertas específicos de IA (Concluído)

#### Ainda Planeado para Versão Futura
- **Documentação Mobile-Friendly**: design responsivo para aprendizagem móvel
- **Acesso Offline**: pacotes de documentação descarregáveis
- **Integração Aprimorada IDE**: extensão VS Code para AZD + fluxos de trabalho IA
- **Dashboard Comunitário**: métricas em tempo real e rastreio de contribuições da comunidade

## Contribuir para o Changelog

### Reportar Mudanças
Ao contribuir para este repositório, por favor assegure que as entradas do changelog incluem:

1. **Número da Versão**: seguindo versionamento semântico (major.minor.patch)
2. **Data**: data de lançamento ou atualização no formato AAAA-MM-DD
3. **Categoria**: Adicionado, Alterado, Depreciado, Removido, Corrigido, Segurança
4. **Descrição Clara**: descrição concisa do que mudou
5. **Avaliação de Impacto**: como as mudanças afetam os utilizadores existentes

### Categorias de Mudança

#### Adicionado
- Novas funcionalidades, secções de documentação ou capacidades
- Novos exemplos, templates ou recursos de aprendizagem
- Ferramentas, scripts ou utilitários adicionais

#### Alterado
- Modificações na funcionalidade existente ou documentação
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Depreciado
- Funcionalidades ou abordagens a serem retiradas
- Secções da documentação agendadas para remoção
- Métodos que possuem alternativas melhores

#### Removido
- Funcionalidades, documentação ou exemplos que deixaram de ser relevantes
- Informação obsoleta ou abordagens depreciadas
- Conteúdo redundante ou consolidado

#### Corrigido
- Correções de erros na documentação ou código
- Resolução de questões ou problemas reportados
- Melhorias na precisão ou funcionalidade

#### Segurança
- Melhorias ou correções relacionadas com segurança
- Atualizações em melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Diretrizes de Versionamento Semântico

#### Versão Major (X.0.0)
- Mudanças incompatíveis que requerem ação do utilizador
- Reestruturação significativa de conteúdo ou organização
- Mudanças que alteram a abordagem ou metodologia fundamental

#### Versão Minor (X.Y.0)
- Novas funcionalidades ou adições de conteúdo
- Melhorias que mantêm compatibilidade retroativa
- Exemplos, ferramentas ou recursos adicionais

#### Versão Patch (X.Y.Z)
- Correções de bugs e correções
- Melhorias menores no conteúdo existente
- Esclarecimentos e pequenas melhorias

## Feedback e Sugestões da Comunidade

Incentivamos ativamente o feedback da comunidade para melhorar este recurso de aprendizagem:

### Como Fornecer Feedback
- **Issues GitHub**: Reportar problemas ou sugerir melhorias (issues específicas de IA bem-vindas)
- **Discussões Discord**: Partilhar ideias e interagir com a comunidade Microsoft Foundry
- **Pull Requests**: Contribuir melhorias diretas no conteúdo, especialmente templates e guias IA
- **Discord Microsoft Foundry**: Participar no canal #Azure para discussões AZD + IA
- **Fóruns Comunitários**: Participar em discussões mais amplas para desenvolvedores Azure

### Categorias de Feedback
- **Precisão do Conteúdo IA**: Correções na integração e implantação de serviços IA
- **Experiência de Aprendizagem**: Sugestões para fluxo de aprendizado melhorado para desenvolvedores IA
- **Conteúdo IA em Falta**: Pedido de templates, padrões ou exemplos IA adicionais
- **Acessibilidade**: Melhorias para necessidades diversas de aprendizagem
- **Integração de Ferramentas IA**: Sugestões para melhor integração no fluxo de desenvolvimento IA
- **Padrões de IA para Produção**: Pedido de padrões empresariais de implantação IA

### Compromisso de Resposta
- **Resposta a Issues**: Dentro de 48 horas para problemas reportados
- **Pedidos de Funcionalidades**: Avaliação em até uma semana
- **Contribuições da Comunidade**: Revisão em até uma semana
- **Questões de Segurança**: Prioridade imediata com resposta acelerada

## Cronograma de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: Verificação da precisão do conteúdo e validação de links
- **Atualizações Trimestrais**: Adições e melhorias significativas de conteúdo
- **Revisões Semestrais**: Reestruturação e aprimoramento abrangentes
- **Lançamentos Anuais**: Atualizações principais com melhorias significativas

### Monitorização e Garantia de Qualidade
- **Testes Automatizados**: Validação regular de exemplos de código e links
- **Integração de Feedback Comunitário**: Incorporação regular de sugestões de utilizadores
- **Atualizações Tecnológicas**: Alinhamento com os mais recentes serviços Azure e versões azd
- **Auditorias de Acessibilidade**: Revisões periódicas para princípios de design inclusivos

## Política de Suporte à Versão Atual
- **Última Versão Principal**: Suporte total com atualizações regulares
- **Versão Principal Anterior**: Atualizações de segurança e correções críticas durante 12 meses
- **Versões Legadas**: Apenas suporte da comunidade, sem atualizações oficiais

### Orientações para Migração
Quando são lançadas versões principais, fornecemos:
- **Guias de Migração**: Instruções passo a passo para a transição
- **Notas de Compatibilidade**: Detalhes sobre alterações que quebram compatibilidade
- **Suporte com Ferramentas**: Scripts ou utilitários para ajudar na migração
- **Suporte da Comunidade**: Fóruns dedicados a questões de migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)
- **Próxima Lição**: Voltar ao [README Principal](README.md)

**Mantenha-se Atualizado**: Siga este repositório para notificações sobre novas versões e atualizações importantes dos materiais de aprendizagem.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se a tradução profissional feita por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->