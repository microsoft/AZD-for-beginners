# Registo de alterações - AZD Para Iniciantes

## Introdução

Este registo de alterações documenta todas as alterações, atualizações e melhorias notáveis do repositório AZD Para Iniciantes. Seguimos princípios de versionamento semântico e mantemos este registo para ajudar os utilizadores a compreender o que mudou entre versões.

## Objetivos de Aprendizagem

Ao rever este registo de alterações, irá:
- Manter-se informado sobre novas funcionalidades e adições de conteúdo
- Compreender as melhorias feitas na documentação existente
- Acompanhar correções de erros e ajustes para garantir precisão
- Seguir a evolução dos materiais de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Após rever as entradas do registo, será capaz de:
- Identificar novos conteúdos e recursos disponíveis para aprendizagem
- Perceber quais as secções que foram atualizadas ou melhoradas
- Planear o seu percurso de aprendizagem com base nos materiais mais atuais
- Contribuir com feedback e sugestões para futuras melhorias

## Histórico de Versões

### [v3.18.0] - 2026-03-16

#### Comandos AZD AI CLI, Validação de Conteúdo & Expansão de Templates
**Esta versão adiciona cobertura dos comandos `azd ai`, `azd extension` e `azd mcp` em todos os capítulos relacionados com IA, corrige links quebrados e código desatualizado em agents.md, atualiza o cheat sheet, e reformula a secção de Exemplos de Templates com descrições validadas e novos templates Azure AI AZD.**

#### Adicionado
- **🤖 Cobertura AZD AI CLI** em 7 ficheiros (anteriormente apenas no Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova secção "Extensões e Comandos de IA" apresentando `azd extension`, `azd ai agent init`, e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opção 4: `azd ai agent init` com tabela comparativa (template vs abordagem manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecções "Extensões AZD para Foundry" e "Implantação Agent-First"
  - `docs/chapter-05-multi-agent/README.md` — Arranque rápido agora mostra ambos os caminhos de implantação baseada em template e manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Secção de Implantação inclui agora opção `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseção "Comandos AZD AI Extension para Diagnóstico"
  - `resources/cheat-sheet.md` — Nova secção "Comandos IA & Extensões" com `azd extension`, `azd ai agent init`, `azd mcp`, e `azd infra generate`
- **📦 Novos templates exemplo AZD AI** em `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET com Blazor WebAssembly, Semantic Kernel e suporte a chat de voz
  - **azure-search-openai-demo-java** — Chat RAG Java usando Langchain4J com opções de implantação ACA/AKS
  - **contoso-creative-writer** — Aplicação multi-agente de escrita criativa utilizando Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB com suporte a desenvolvimento local Ollama
  - **chat-with-your-data-solution-accelerator** — Acelerador empresarial RAG com portal admin, integração Teams e opções PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicação referência MCP multi-agente com servidores em .NET, Python, Java, e TypeScript
  - **azd-ai-starter** — Template inicial minimalista para infraestrutura Azure AI com Bicep
  - **🔗 Link para Galeria Awesome AZD AI** — Referência à [galeria awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Corrigido
- **🔗 Navegação agents.md**: Links Anterior/Seguinte agora correspondem à ordem das lições do README do Capítulo 2 (Integração Microsoft Foundry → Agents → Implantação de Modelo IA)
- **🔗 Links quebrados em agents.md**: `production-ai-practices.md` corrigido para `../chapter-08-production/production-ai-practices.md` (3 ocorrências)
- **📦 Código desatualizado em agents.md**: Substituído `opencensus` por `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API inválida em agents.md**: `max_tokens` movido de `create_agent()` para `create_run()` como `max_completion_tokens`
- **🔢 Contagem de tokens em agents.md**: Estimativa grosseira `len//4` substituída por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Corrigidos serviços de "Cognitive Search + App Service" para "Azure AI Search + Azure Container Apps" (host padrão alterado em Out 2024)
- **contoso-chat**: Descrição atualizada para referenciar Azure AI Foundry + Prompty, alinhando com o título real do repositório e stack tecnológico

#### Removido
- **ai-document-processing**: Removida referência a template não funcional (repositório não acessível publicamente como template AZD)

#### Melhorado
- **📝 Exercícios em agents.md**: Exercício 1 mostra agora saída esperada e passo `azd monitor`; Exercício 2 inclui código completo de registo `FunctionTool`; Exercício 3 substitui orientação vaga por comandos concretos `prepdocs.py`
- **📚 Recursos em agents.md**: Atualizados links da documentação para documentação atual do Azure AI Agent Service e quickstart
- **📋 Tabela Passos Seguintes em agents.md**: Adicionado link para AI Workshop Lab para cobertura completa do capítulo

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
**Esta versão melhora a navegação entre capítulos no README.md com um formato de tabela melhorado.**

#### Alterado
- **Tabela do Mapa do Curso**: Melhorada com links diretos para lições, estimativas de duração e classificações de complexidade
- **Limpeza de Pastas**: Removidas pastas antigas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validação de Links**: Verificados todos os 21+ links internos da tabela do Mapa do Curso

### [v3.16.0] - 2026-02-05

#### Atualizações nos Nomes dos Produtos
**Esta versão atualiza referências de produtos para a marca atual da Microsoft.**

#### Alterado
- **Microsoft Foundry → Microsoft Foundry**: Todas as referências atualizadas em ficheiros não traduzidos
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir a marca atual

#### Ficheiros Atualizados
- `README.md` - Página principal do curso
- `changelog.md` - Histórico de versões
- `course-outline.md` - Estrutura do curso
- `docs/chapter-02-ai-development/agents.md` - Guia de agentes IA
- `examples/README.md` - Documentação de exemplos
- `workshop/README.md` - Página principal do workshop
- `workshop/docs/index.md` - Índice do workshop
- `workshop/docs/instructions/*.md` - Todos os ficheiros de instruções do workshop

---

### [v3.15.0] - 2026-02-05

#### Reestruturação Principal do Repositório: Pastas Baseadas em Capítulos
**Esta versão reestrutura a documentação em pastas dedicadas por capítulo para uma navegação mais clara.**

#### Renomeações de Pastas
Pastas antigas foram substituídas por pastas numeradas por capítulo:
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
| Todos os ficheiros pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Todos os ficheiros troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Adicionado
- **📚 Ficheiros README de Capítulo**: Criados README.md em cada pasta de capítulo com:
  - Objetivos de aprendizagem e duração
  - Tabela de lições com descrições
  - Comandos para arranque rápido
  - Navegação para outros capítulos

#### Alterado
- **🔗 Atualizados todos os links internos**: Mais de 78 caminhos atualizados em todos os ficheiros de documentação
- **🗺️ README.md principal**: Atualizado o Mapa do Curso com nova estrutura por capítulos
- **📝 examples/README.md**: Atualizadas referências cruzadas para as pastas dos capítulos

#### Removido
- Estrutura antiga de pastas (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestruturação do Repositório: Navegação por Capítulos
**Esta versão adicionou ficheiros README de navegação por capítulos (substituídos pela v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novo Guia para Agentes de IA
**Esta versão adiciona um guia completo para implantação de agentes IA com Azure Developer CLI.**

#### Adicionado
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo abordando:
  - O que são agentes de IA e como diferem dos chatbots
  - Três templates de arranque rápido (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agentes (agente único, RAG, multi-agente)
  - Configuração e personalização de ferramentas
  - Monitorização e controlo de métricas
  - Considerações e otimização de custos
  - Cenários comuns de resolução de problemas
  - Três exercícios práticos com critérios de sucesso

#### Estrutura do Conteúdo
- **Introdução**: Conceitos de agentes para iniciantes
- **Arranque Rápido**: Implantar agentes com `azd init --template get-started-with-ai-agents`
- **Padrões de Arquitetura**: Diagramas visuais dos padrões de agentes
- **Configuração**: Configuração de ferramentas e variáveis de ambiente
- **Monitorização**: Integração com Application Insights
- **Exercícios**: Aprendizagem prática progressiva (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### Atualização do Ambiente DevContainer
**Esta versão atualiza a configuração do contentor de desenvolvimento com ferramentas modernas e melhores predefinições para a experiência de aprendizagem AZD.**

#### Alterado
- **🐳 Imagem Base**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (Debian stable mais recente)
- **📛 Nome do Contentor**: Renomeado de "Python 3" para "AZD para Iniciantes" para maior clareza

#### Adicionado
- **🔧 Novas Funcionalidades no Contêiner de Desenvolvimento**:
  - `azure-cli` com suporte a Bicep ativado
  - `node:20` (versão LTS para templates AZD)
  - `github-cli` para gestão de templates
  - `docker-in-docker` para deploys de aplicações em contêiner

- **🔌 Encaminhamento de Portas**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (preview MkDocs)
  - 3000 (aplicações web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Novas Extensões VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense melhorado para Python
  - `ms-azuretools.vscode-azurefunctions` - Suporte a Azure Functions
  - `ms-azuretools.vscode-docker` - Suporte a Docker
  - `ms-azuretools.vscode-bicep` - Suporte a linguagem Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestão de recursos Azure
  - `yzhang.markdown-all-in-one` - Edição Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - Suporte a YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualização Git
  - `mhutchie.git-graph` - Histórico Git

- **⚙️ Definições VS Code**: Adicionadas definições padrão para interpretador Python, formatação ao guardar e remoção de espaços em branco

- **📦 Atualizado requirements-dev.txt**:
  - Adicionado plugin MkDocs minify
  - Adicionado pre-commit para qualidade de código
  - Adicionados pacotes Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigido
- **Comando Pós-Criação**: Agora verifica instalação do AZD e Azure CLI no arranque do contêiner

---

### [v3.11.0] - 2026-02-05

#### Revisão do README acessível para iniciantes
**Esta versão melhora significativamente o README.md para ser mais acessível aos iniciantes e adiciona recursos essenciais para desenvolvedores AI.**

#### Adicionado
- **🆚 Comparação Azure CLI vs AZD**: Explicação clara de quando usar cada ferramenta com exemplos práticos
- **🌟 Links Awesome AZD**: Links diretos para galeria de templates da comunidade e recursos de contribuição:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Mais de 200 templates prontos para deploy
  - [Submeter um Template](https://github.com/Azure/awesome-azd/issues) - Contribuição comunitária
- **🎯 Guia Rápido de Introdução**: Secção simplificada de 3 passos para começar (Instalar → Login → Deploy)
- **📊 Tabela de Navegação baseada na Experiência**: Orientação clara sobre onde começar baseado na experiência do utilizador

#### Alterado
- **Estrutura do README**: Reorganizado para divulgação progressiva - informação chave primeiro
- **Secção de Introdução**: Reescrita para explicar "A Magia do `azd up`" para iniciantes
- **Remoção de Conteúdo Duplicado**: Eliminada secção duplicada de resolução de problemas
- **Comandos de Resolução de Problemas**: Corrigida referência a `azd logs` para usar `azd monitor --logs` válido

#### Corrigido
- **🔐 Comandos de Autenticação**: Adicionados `azd auth login` e `azd auth logout` no cheat-sheet.md
- **Referências a comandos inválidos**: Remoção dos restantes `azd logs` na secção de resolução de problemas do README

#### Notas
- **Âmbito**: Mudanças aplicadas ao README.md principal e resources/cheat-sheet.md
- **Público-alvo**: Melhorias direcionadas a developers novos com AZD

---

### [v3.10.0] - 2026-02-05

#### Atualização de Comandos Azure Developer CLI para correção
**Esta versão corrige comandos AZD inexistentes em toda a documentação, garantindo que todos os exemplos de código usam sintaxe válida do Azure Developer CLI.**

#### Corrigido
- **🔧 Comandos AZD inexistentes removidos**: Auditoria e correção extensiva de comandos inválidos:
  - `azd logs` (não existe) → substituído por `azd monitor --logs` ou alternativas Azure CLI
  - Subcomandos `azd service` (não existem) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (não existem) → removidos ou substituídos por alternativas válidas
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (não existem) → removidas
  - Flags `azd provision --what-if/--rollback` (não existem) → atualizadas para `--preview`
  - `azd config validate` (não existe) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (não existem) → removidos

- **📚 Ficheiros atualizados com correções de comandos**:
  - `resources/cheat-sheet.md`: Grande revisão da referência de comandos
  - `docs/deployment/deployment-guide.md`: Corrigidas estratégias de rollback e deploy
  - `docs/troubleshooting/debugging.md`: Corrigidas secções de análise de logs
  - `docs/troubleshooting/common-issues.md`: Atualizados comandos de resolução de problemas
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigida secção de debug AZD
  - `docs/getting-started/azd-basics.md`: Corrigidos comandos de monitorização
  - `docs/getting-started/first-project.md`: Atualizados exemplos de monitorização e debug
  - `docs/getting-started/installation.md`: Corrigidos exemplos de ajuda e versões
  - `docs/pre-deployment/application-insights.md`: Corrigidos comandos de visualização de logs
  - `docs/pre-deployment/coordination-patterns.md`: Corrigidos comandos de debug de agentes

- **📝 Referência de Versão Atualizada**:
  - `docs/getting-started/installation.md`: Versão hardcoded `1.5.0` alterada para genérico `1.x.x` com link para releases

#### Alterado
- **Estratégias de rollback**: Documentação atualizada para uso de rollback baseado em Git (AZD não suporta rollback nativo)
- **Visualização de logs**: Substituídos `azd logs` por `azd monitor --logs`, `azd monitor --live` e comandos Azure CLI
- **Secção de desempenho**: Removidas flags inexistentes de deploy paralelo/incremental, fornecidas alternativas válidas

#### Detalhes Técnicos
- **Comandos AZD válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidos para azd monitor**: `--live`, `--logs`, `--overview`
- **Funcionalidades removidas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificação**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Completação do Workshop e Atualização da Qualidade da Documentação
**Esta versão completa os módulos interativos do workshop, corrige todos os links partidos na documentação e melhora a qualidade do conteúdo para desenvolvedores AI que usam Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes para contribuições com:
  - Instruções claras para reportar issues e propor alterações
  - Padrões de documentação para novo conteúdo
  - Diretrizes para exemplos de código e convenções de mensagens de commit
  - Informação para envolvimento comunitário

#### Completado
- **🎯 Módulo 7 do Workshop (Conclusão)**: Módulo de conclusão totalmente completo com:
  - Resumo abrangente das conquistas do workshop
  - Secção de conceitos chave dominados cobrindo AZD, templates e Microsoft Foundry
  - Recomendações de continuidade da jornada educativa
  - Exercícios desafiantes para o workshop com níveis de dificuldade
  - Feedback da comunidade e links de suporte

- **📚 Módulo 3 do Workshop (Desconstrução)**: Atualizados objetivos de aprendizagem com:
  - Orientação para ativação do GitHub Copilot com servidores MCP
  - Compreensão da estrutura de pastas dos templates AZD
  - Padrões de organização de infraestruturas-as-code (Bicep)
  - Instruções para laboratórios práticos

- **🔧 Módulo 6 do Workshop (Desmontagem)**: Completo com:
  - Objetivos de limpeza de recursos e gestão de custos
  - Uso de `azd down` para desprovisionamento seguro da infraestrutura
  - Diretrizes para recuperação de serviços cognitivos eliminados soft
  - Pistas exploratórias para GitHub Copilot e Azure Portal

#### Corrigido
- **🔗 Correções de links partidos**: Resolvidos mais de 15 links internos partidos na documentação:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrigidos caminhos para microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigidos caminhos para ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Substituído cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Corrigidos links para FAQ e guia de resolução de problemas
  - `examples/container-app/microservices/README.md`: Corrigidos caminhos para guia do curso e guia de deploy
  - `resources/faq.md` e `resources/glossary.md`: Atualizadas referências do capítulo AI
  - `course-outline.md`: Corrigidos guias do instrutor e referências ao workshop AI lab

- **📅 Banner de status do workshop**: Atualizado de "Em Construção" para estado ativo com data de fevereiro 2026

- **🔗 Navegação do workshop**: Corrigidos links partidos no README.md do workshop a apontar para pasta lab-1-azd-basics inexistente

#### Alterado
- **Apresentação do Workshop**: Removido aviso "em construção", workshop agora completo e pronto a usar
- **Consistência da navegação**: Garantida navegação apropriada entre módulos do workshop
- **Referências do percurso de aprendizagem**: Atualizadas referências cruzadas para usar caminhos corretos microsoft-foundry

#### Validado
- ✅ Todos os ficheiros markdown em inglês têm links internos válidos
- ✅ Módulos 0-7 do workshop estão completos com objetivos de aprendizagem
- ✅ Navegação entre capítulos e módulos funciona corretamente
- ✅ Conteúdo adequado para developers AI que usam Microsoft AZD
- ✅ Linguagem e estrutura acessível para iniciantes mantidas
- ✅ CONTRIBUTING.md fornece orientação clara para contribuições da comunidade

#### Implementação Técnica
- **Validação de links**: Script PowerShell automatizado verificou todos os links internos .md
- **Auditoria de conteúdo**: Revisão manual da completude do workshop e adequação a iniciantes
- **Sistema de navegação**: Aplicados padrões consistentes de navegação entre capítulos e módulos

#### Notas
- **Âmbito**: Mudanças aplicadas apenas na documentação em inglês
- **Traduções**: Pastas de tradução não atualizadas nesta versão (tradução automática será sincronizada posteriormente)
- **Duração do Workshop**: Workshop completo agora oferece 3-4 horas de aprendizagem prática

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitorização, Segurança e Padrões Multi-Agente
**Esta versão adiciona lições abrangentes nível A sobre integração do Application Insights, padrões de autenticação e coordenação multi-agente para deploys em produção.**

#### Adicionado
- **📊 Lição de Integração Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Deploy focado em AZD com provisão automática
  - Templates Bicep completos para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria personalizada (mais de 1200 linhas)
  - Padrões de monitorização AI/LLM (contabilização de tokens/custos Microsoft Foundry Models)
  - 6 diagramas Mermaid (arquitetura, tracing distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, dashboards, monitorização AI)
  - Exemplos de queries Kusto e estratégias de otimização de custos
  - Streaming de métricas em tempo real e debug em vivo
  - Tempo de aprendizagem de 40-50 minutos com padrões prontos para produção

- **🔐 Lição de Padrões de Autenticação & Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (strings de ligação, Key Vault, identidade gerida)
  - Templates completos de infraestrutura Bicep para deploys seguros
  - Código de aplicação Node.js com integração Azure SDK
  - 3 exercícios completos (ativar identidade gerida, identidade atribuída por usuário, rotação Key Vault)
  - Melhores práticas de segurança e configurações RBAC
  - Guia de resolução de problemas e análise de custos
  - Padrões de autenticação sem password prontos para produção

- **🤖 Lição de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, acionado por eventos, consenso)
  - Implementação completa de orquestrador de serviço (Python/Flask, mais de 1500 linhas)
  - 3 implementações especializadas de agentes (Pesquisa, Escritor, Editor)
  - Integração com Service Bus para enfileiramento de mensagens
  - Gestão de estado com Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interações entre agentes
  - 3 exercícios avançados (gestão de timeouts, lógica de retry, circuit breaker)
  - Análise de custos ($240-565/mês) com estratégias de otimização
  - Integração Application Insights para monitorização

#### Melhorado
- **Capítulo Pré-deploy**: Agora inclui padrões abrangentes de monitorização e coordenação
- **Capítulo Iniciação**: Reforçado com padrões profissionais de autenticação
- **Prontidão para Produção**: Cobertura completa desde segurança até observabilidade
- **Estrutura do Curso**: Atualizada para referenciar novas lições nos Capítulos 3 e 6

#### Alterado
- **Progressão da Aprendizagem**: Melhor integração da segurança e monitorização ao longo do curso
- **Qualidade da Documentação**: Padrões consistentes nível A (95-97%) nas novas lições
- **Padrões para Produção**: Cobertura completa de ponta a ponta para deploys empresariais

#### Melhorado
- **Experiência do Desenvolvedor**: Caminho claro do desenvolvimento ao monitorização em produção  
- **Padrões de Segurança**: Padrões profissionais para autenticação e gestão de segredos  
- **Observabilidade**: Integração completa do Application Insights com AZD  
- **Cargas de Trabalho AI**: Monitorização especializada para Microsoft Foundry Models e sistemas multi-agente  

#### Validado  
- ✅ Todas as lições incluem código funcional completo (não excertos)  
- ✅ Diagramas Mermaid para aprendizagem visual (19 no total em 3 lições)  
- ✅ Exercícios práticos com passos de verificação (9 no total)  
- ✅ Templates Bicep prontos para produção, implantáveis com `azd up`  
- ✅ Análise de custos e estratégias de otimização  
- ✅ Guias de resolução de problemas e melhores práticas  
- ✅ Pontos de verificação de conhecimento com comandos de verificação  

#### Resultados da Avaliação da Documentação  
- **docs/pre-deployment/application-insights.md**: - Guia abrangente de monitorização  
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança  
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas avançadas de multi-agente  
- **Conteúdo Novo Global**: - Padrões consistentes de alta qualidade  

#### Implementação Técnica  
- **Application Insights**: Log Analytics + telemetria personalizada + tracing distribuído  
- **Autenticação**: Managed Identity + Key Vault + padrões RBAC  
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração  
- **Monitorização**: Métricas em tempo real + consultas Kusto + alertas + dashboards  
- **Gestão de Custos**: Estratégias de sampling, políticas de retenção, controlo orçamental  

### [v3.7.0] - 2025-11-19  

#### Melhorias na Qualidade da Documentação e Novo Exemplo Microsoft Foundry Models  
**Esta versão melhora a qualidade da documentação em todo o repositório e adiciona um exemplo completo de implementação Microsoft Foundry Models com interface de chat gpt-4.1.**  

#### Adicionado  
- **🤖 Exemplo de Chat Microsoft Foundry Models**: Implantação completa do gpt-4.1 com implementação funcional em `examples/azure-openai-chat/`:  
  - Infraestrutura completa do Microsoft Foundry Models (implantação modelo gpt-4.1)  
  - Interface de chat python por linha de comandos com histórico de conversas  
  - Integração com Key Vault para armazenamento seguro de chaves API  
  - Monitorização do uso de tokens e estimativa de custos  
  - Limitação de taxa e gestão de erros  
  - README completo com guia de implantação de 35-45 minutos  
  - 11 ficheiros prontos para produção (templates Bicep, app Python, configuração)  
- **📚 Exercícios de Documentação**: Acrescentados exercícios práticos ao guia de configuração:  
  - Exercício 1: Configuração multi-ambiente (15 minutos)  
  - Exercício 2: Prática de gestão de segredos (10 minutos)  
  - Critérios claros de sucesso e passos de verificação  
- **✅ Verificação de Implantação**: Adicionada secção de verificação ao guia de implantação:  
  - Procedimentos de verificação de estado  
  - Checklist de critérios de sucesso  
  - Saídas esperadas para todos os comandos de implantação  
  - Referência rápida para resolução de problemas  

#### Melhorado  
- **examples/README.md**: Atualizado para qualidade A (93%):  
  - Adicionado azure-openai-chat a todas as secções relevantes  
  - Contagem de exemplos locais atualizada de 3 para 4  
  - Adicionado à tabela de Exemplos de Aplicações AI  
  - Integrado no Quick Start para utilizadores intermédios  
  - Adicionado à secção Microsoft Foundry Templates  
  - Atualizado Matriz de Comparação e secções de tecnologias encontradas  
- **Qualidade da Documentação**: Elevado de B+ (87%) para A- (92%) na pasta docs:  
  - Adicionadas saídas esperadas aos exemplos críticos de comandos  
  - Incluídos passos de verificação para alterações de configuração  
  - Aprendizagem prática com exercícios melhorados  

#### Alterado  
- **Progressão de Aprendizagem**: Melhor integração de exemplos AI para utilizadores intermédios  
- **Estrutura da Documentação**: Exercícios mais acionáveis com resultados claros  
- **Processo de Verificação**: Critérios explícitos de sucesso adicionados aos fluxos de trabalho principais  

#### Melhorado  
- **Experiência do Desenvolvedor**: Implantação Microsoft Foundry Models agora leva 35-45 minutos (vs 60-90 para alternativas complexas)  
- **Transparência de Custos**: Estimativas claras de custos (50-200$/mês) para exemplo Microsoft Foundry Models  
- **Caminho de Aprendizagem**: Desenvolvedores AI têm ponto de entrada claro com azure-openai-chat  
- **Padrões de Documentação**: Saídas esperadas e passos de verificação consistentes  

#### Validado  
- ✅ Exemplo Microsoft Foundry Models totalmente funcional com `azd up`  
- ✅ Todos os 11 ficheiros de implementação sintaticamente corretos  
- ✅ Instruções do README correspondem à experiência real de implantação  
- ✅ Links de documentação atualizados em 8+ localizações  
- ✅ Índice de exemplos reflete com precisão 4 exemplos locais  
- ✅ Sem links externos duplicados nas tabelas  
- ✅ Todas as referências de navegação corretas  

#### Implementação Técnica  
- **Arquitetura Microsoft Foundry Models**: gpt-4.1 + Key Vault + padrão Container Apps  
- **Segurança**: Managed Identity disponível, segredos no Key Vault  
- **Monitorização**: Integração Application Insights  
- **Gestão de Custos**: Monitorização de tokens e otimização de uso  
- **Implantação**: Comando único `azd up` para configuração completa  

### [v3.6.0] - 2025-11-19  

#### Atualização Principal: Exemplos de Implantação Container App  
**Esta versão apresenta exemplos completos de implantação de aplicações containerizadas prontas para produção utilizando Azure Developer CLI (AZD), com documentação completa e integração no percurso de aprendizagem.**  

#### Adicionado  
- **🚀 Exemplos Container App**: Novos exemplos locais em `examples/container-app/`:  
  - [Guia Mestre](examples/container-app/README.md): Visão geral completa de implantações containerizadas, início rápido, produção e padrões avançados  
  - [API Flask Simples](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com escala a zero, probes de saúde, monitorização e resolução de problemas  
  - [Arquitetura Microserviços](../../examples/container-app/microservices): Implantação multi-serviço para produção (API Gateway, Produto, Pedido, Utilizador, Notificação), mensagens assíncronas, Service Bus, Cosmos DB, Azure SQL, tracing distribuído, implantação blue-green/canary  
- **Melhores Práticas**: Segurança, monitorização, otimização de custos e orientação CI/CD para cargas containerizadas  
- **Exemplos de Código**: `azure.yaml` completo, templates Bicep e implementações multi-linguagem (Python, Node.js, C#, Go)  
- **Testes & Resolução de Problemas**: Cenários de teste end-to-end, comandos de monitorização, orientações para troubleshooting  

#### Alterado  
- **README.md**: Atualizado para destacar e linkar novos exemplos container app em "Exemplos Locais - Aplicações Container"  
- **examples/README.md**: Atualizado para destacar exemplos container app, adicionar entradas na matriz de comparação e atualizar referências de tecnologia/arquitetura  
- **Sumário do Curso & Guia de Estudo**: Atualizado para referenciar novos exemplos container app e padrões de implantação nos capítulos relevantes  

#### Validado  
- ✅ Todos os novos exemplos implantáveis com `azd up` e seguem melhores práticas  
- ✅ Links cruzados e navegação da documentação atualizados  
- ✅ Exemplos abrangem cenários desde iniciado a avançado, incluindo microserviços para produção  

#### Notas  
- **Âmbito**: Documentação e exemplos apenas em inglês  
- **Próximos Passos**: Expandir com padrões container avançados adicionais e automação CI/CD em futuras versões  

### [v3.5.0] - 2025-11-19  

#### Rebranding do Produto: Microsoft Foundry  
**Esta versão implementa uma alteração abrangente do nome do produto de "Microsoft Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**  

#### Alterado  
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Microsoft Foundry" para "Microsoft Foundry"  
  - Atualizadas todas as referências na documentação em inglês na pasta `docs/`  
  - Pasta renomeada: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
  - Ficheiro renomeado: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - Total: 23 referências de conteúdo atualizadas em 7 ficheiros de documentação  

- **📁 Alterações na Estrutura de Pastas**:  
  - `docs/ai-foundry/` renomeada para `docs/microsoft-foundry/`  
  - Todas as referências cruzadas atualizadas para refletir nova estrutura  
  - Links de navegação validados em toda a documentação  

- **📄 Renomeação de Ficheiros**:  
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - Todos os links internos atualizados para o novo nome  

#### Ficheiros Atualizados  
- **Documentação dos Capítulos** (7 ficheiros):  
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações de links de navegação  
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências do nome do produto atualizadas  
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já usa Microsoft Foundry (de atualizações anteriores)  
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (overview, comunidade, documentação)  
  - `docs/getting-started/azd-basics.md` - 4 links de referência cruzada atualizados  
  - `docs/getting-started/first-project.md` - 2 links de navegação atualizados  
  - `docs/getting-started/installation.md` - 2 links para capítulos seguintes atualizados  
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade Discord)  
  - `docs/troubleshooting/common-issues.md` - 1 link de navegação atualizado  
  - `docs/troubleshooting/debugging.md` - 1 link de navegação atualizado  

- **Ficheiros de Estrutura do Curso** (2 ficheiros):  
  - `README.md` - 17 referências atualizadas (visão do curso, títulos de capítulos, secção de templates, insights da comunidade)  
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizagem, recursos de capítulos)  

#### Validado  
- ✅ Zero referências restantes ao caminho da pasta "ai-foundry" em documentação inglesa  
- ✅ Zero referências restantes ao nome do produto "Microsoft Foundry" em documentação inglesa  
- ✅ Todos os links de navegação funcionais com a nova estrutura  
- ✅ Renomeações de ficheiros e pastas concluídas com sucesso  
- ✅ Referências cruzadas entre capítulos validadas  

#### Notas  
- **Âmbito**: Alterações aplicadas apenas à documentação em inglês na pasta `docs/`  
- **Traduções**: Pastas de traduções (`translations/`) não atualizadas nesta versão  
- **Workshop**: Materiais do workshop (`workshop/`) não atualizados nesta versão  
- **Exemplos**: Ficheiros de exemplo podem continuar a referenciar a nomenclatura antiga (a ser tratado em atualização futura)  
- **Links Externos**: URLs externos e referências a repositórios GitHub mantêm-se inalterados  

#### Guia de Migração para Contribuidores  
Se tiver ramos locais ou documentação que faça referência à estrutura antiga:  
1. Atualize referências de pastas: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
2. Atualize referências de ficheiros: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
3. Substitua nome do produto: "Microsoft Foundry" → "Microsoft Foundry"  
4. Valide que todos os links internos da documentação ainda funcionam  

---  

### [v3.4.0] - 2025-10-24  

#### Melhorias na Pré-visualização e Validação da Infraestrutura  
**Esta versão introduz suporte abrangente para a nova funcionalidade de pré-visualização do Azure Developer CLI e melhora a experiência do utilizador do workshop.**  

#### Adicionado  
- **🧪 Documentação da funcionalidade azd provision --preview**: Cobertura completa da nova capacidade de pré-visualização da infraestrutura  
  - Referência de comandos e exemplos de uso no cheat sheet  
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios  
  - Integração de verificação pré-implantação para validação mais segura  
  - Atualizações do guia de início rápido com práticas prioritárias de segurança  
- **🚧 Banner de Estado do Workshop**: Banner HTML profissional indicando estado de desenvolvimento do workshop  
  - Design com gradiente e indicadores de construção para comunicação clara ao utilizador  
  - Timestamp da última atualização para transparência  
  - Design responsivo para dispositivos móveis e variados  

#### Melhorado  
- **Segurança da Infraestrutura**: Funcionalidade preview integrada em toda a documentação de implantação  
- **Validação Pré-implantação**: Scripts automatizados agora incluem teste de pré-visualização da infraestrutura  
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir preview como prática recomendada  
- **Experiência do Workshop**: Expectativas claras definidas para os utilizadores sobre o estado de desenvolvimento do conteúdo  

#### Alterado  
- **Melhores Práticas de Implantação**: Workflow com preview prioritário agora recomendado  
- **Fluxo da Documentação**: Validação da infraestrutura antecipada no processo de aprendizagem  
- **Apresentação do Workshop**: Comunicação profissional do estado com cronograma claro de desenvolvimento  

#### Melhorado  
- **Abordagem Prioritária de Segurança**: Alterações na infraestrutura podem agora ser validadas antes da implantação  
- **Colaboração em Equipa**: Resultados da pré-visualização podem ser partilhados para revisão e aprovação  
- **Consciência de Custos**: Melhor perceção dos custos dos recursos antes do provisionamento  
- **Mitigação de Riscos**: Redução de falhas de implantação através de validação antecipada  

#### Implementação Técnica  
- **Integração Multi-documento**: Funcionalidade preview documentada em 4 ficheiros principais  
- **Padrões de Comandos**: Sintaxe e exemplos consistentes na documentação  
- **Integração de Melhores Práticas**: Preview incluído nos workflows e scripts de validação  
- **Indicadores Visuais**: Marcas claras de NOVA funcionalidade para fácil descoberta  

#### Infraestrutura do Workshop  
- **Comunicação de Estado**: Banner HTML profissional com estilização em gradiente  
- **Experiência de Utilizador**: Estado de desenvolvimento claro evita confusão  
- **Apresentação Profissional**: Mantém a credibilidade do repositório enquanto define expectativas  
- **Transparência de Cronograma**: Timestamp de última atualização outubro 2025 para responsabilidade  

### [v3.3.0] - 2025-09-24  

#### Materiais de Workshop Aprimorados e Experiência de Aprendizagem Interativa  
**Esta versão apresenta materiais completos de workshop com guias interativos baseados em browser e percursos de aprendizagem estruturados.**  

#### Adicionado  
- **🎥 Guia Interativo para Workshop**: Experiência de workshop baseada em navegador com capacidade de pré-visualização MkDocs  
- **📝 Instruções Estruturadas para Workshop**: Percurso de aprendizagem guiado em 7 passos da descoberta à personalização  
  - 0-Introdução: Visão geral do workshop e configuração  
  - 1-Selecionar-Modelo-AI: Processo de descoberta e seleção de modelos  
  - 2-Validar-Modelo-AI: Procedimentos de implementação e validação  
  - 3-Desconstruir-Modelo-AI: Compreensão da arquitetura do modelo  
  - 4-Configurar-Modelo-AI: Configuração e personalização  
  - 5-Personalizar-Modelo-AI: Modificações avançadas e iterações  
  - 6-Derrube-Infrastrutura: Limpeza e gestão de recursos  
  - 7-Conclusão: Resumo e próximos passos  
- **🛠️ Ferramentas do Workshop**: Configuração MkDocs com o tema Material para uma experiência de aprendizagem melhorada  
- **🎯 Percurso de Aprendizagem Prático**: Metodologia em 3 etapas (Descoberta → Implementação → Personalização)  
- **📱 Integração com GitHub Codespaces**: Configuração integrada do ambiente de desenvolvimento  

#### Aprimorado  
- **Laboratório do Workshop AI**: Extendido com experiência estruturada abrangente de 2-3 horas  
- **Documentação do Workshop**: Apresentação profissional com navegação e recursos visuais  
- **Progressão da Aprendizagem**: Orientação clara passo a passo desde a seleção do modelo até a implementação em produção  
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho de desenvolvimento simplificados  

#### Melhorado  
- **Acessibilidade**: Interface baseada em navegador com pesquisa, funcionalidade de cópia e alternância de tema  
- **Aprendizagem Autodirigida**: Estrutura flexível para acomodar diferentes ritmos de aprendizagem  
- **Aplicação Prática**: Cenários reais de implementação de modelos AI  
- **Integração Comunitária**: Integração Discord para suporte e colaboração no workshop  

#### Funcionalidades do Workshop  
- **Pesquisa Integrada**: Descoberta rápida de palavras-chave e lições  
- **Copiar Blocos de Código**: Funcionalidade de cópia ao passar o cursor para todos os exemplos de código  
- **Alternância de Tema**: Suporte para modo escuro/claro conforme preferências  
- **Ativos Visuais**: Capturas de ecrã e diagramas para maior compreensão  
- **Integração de Ajuda**: Acesso direto ao Discord para suporte comunitário  

### [v3.2.0] - 2025-09-17  

#### Reestruturação Maior de Navegação e Sistema de Aprendizagem Baseado em Capítulos  
**Esta versão introduz uma estrutura abrangente baseada em capítulos com navegação melhorada por todo o repositório.**  

#### Adicionado  
- **📚 Sistema de Aprendizagem Baseado em Capítulos**: Curso completamente reestruturado em 8 capítulos progressivos de aprendizagem  
  - Capítulo 1: Fundamentos & Início Rápido (⭐ - 30-45 mins)  
  - Capítulo 2: Desenvolvimento com Foco em AI (⭐⭐ - 1-2 horas)  
  - Capítulo 3: Configuração & Autenticação (⭐⭐ - 45-60 mins)  
  - Capítulo 4: Infraestrutura como Código & Implementação (⭐⭐⭐ - 1-1.5 horas)  
  - Capítulo 5: Soluções AI Multi-Agente (⭐⭐⭐⭐ - 2-3 horas)  
  - Capítulo 6: Validação & Planeamento Pré-Implementação (⭐⭐ - 1 hora)  
  - Capítulo 7: Resolução de Problemas & Depuração (⭐⭐ - 1-1.5 horas)  
  - Capítulo 8: Padrões de Produção & Empresariais (⭐⭐⭐⭐ - 2-3 horas)  
- **📚 Sistema de Navegação Abrangente**: Cabeçalhos e rodapés de navegação consistentes em toda a documentação  
- **🎯 Monitorização de Progresso**: Lista de verificação de conclusão do curso e sistema de verificação de aprendizagem  
- **🗺️ Orientação do Percurso de Aprendizagem**: Pontos de entrada claros para diferentes níveis de experiência e objetivos  
- **🔗 Navegação de Referência Cruzada**: Capítulos relacionados e pré-requisitos ligados de forma clara  

#### Aprimorado  
- **Estrutura README**: Transformada numa plataforma de aprendizagem estruturada com organização por capítulos  
- **Navegação na Documentação**: Cada página inclui agora contexto do capítulo e orientação de progressão  
- **Organização de Modelos**: Exemplos e modelos mapeados para os capítulos de aprendizagem adequados  
- **Integração de Recursos**: Folhas de ajuda, FAQs e guias de estudo ligados aos capítulos relevantes  
- **Integração do Workshop**: Laboratórios práticos associados a múltiplos objetivos de aprendizagem dos capítulos  

#### Alterado  
- **Progressão da Aprendizagem**: Mudança de documentação linear para aprendizagem flexível baseada em capítulos  
- **Posicionamento da Configuração**: Guia de configuração reposicionado como Capítulo 3 para melhor fluxo de aprendizagem  
- **Integração de Conteúdo AI**: Melhor integração do conteúdo específico de AI ao longo do percurso  
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para formandos empresariais  

#### Melhorado  
- **Experiência do Utilizador**: Trilhas de navegação claras e indicadores de progressão por capítulo  
- **Acessibilidade**: Padrões de navegação consistentes para facilitar a travessia do curso  
- **Apresentação Profissional**: Estrutura de curso estilo universitário adequada para treino académico e corporativo  
- **Eficiência na Aprendizagem**: Redução do tempo à procura de conteúdo relevante através de melhor organização  

#### Implementação Técnica  
- **Cabeçalhos de Navegação**: Navegação padronizada por capítulos em mais de 40 ficheiros de documentação  
- **Navegação em Rodapé**: Orientação consistente para progressão e indicadores de conclusão de capítulo  
- **Ligação Cruzada**: Sistema abrangente de links internos a conceitos relacionados  
- **Mapeamento de Capítulos**: Modelos e exemplos claramente associados aos objetivos de aprendizagem  

#### Aprimoramento do Guia de Estudo  
- **📚 Objetivos de Aprendizagem Abrangentes**: Guia de estudo reestruturado para alinhar com o sistema de 8 capítulos  
- **🎯 Avaliação por Capítulo**: Cada capítulo inclui objetivos de aprendizagem específicos e exercícios práticos  
- **📋 Monitorização de Progresso**: Calendário semanal com metas mensuráveis e listas de verificação  
- **❓ Perguntas de Avaliação**: Questões para validação de conhecimentos em cada capítulo com resultados profissionais  
- **🛠️ Exercícios Práticos**: Atividades hands-on com cenários reais de implementação e resolução de problemas  
- **📊 Progressão de Competências**: Avanço claro desde conceitos básicos até padrões empresariais com foco em desenvolvimento de carreira  
- **🎓 Estrutura de Certificação**: Resultados de desenvolvimento profissional e sistema de reconhecimento comunitário  
- **⏱️ Gestão de Cronograma**: Plano de aprendizagem estruturado para 10 semanas com validação de marcos  

### [v3.1.0] - 2025-09-17  

#### Soluções AI Multi-Agente Melhoradas  
**Esta versão melhora a solução multi-agente para retalho com nomeação de agentes mais clara e documentação aprimorada.**  

#### Alterado  
- **Terminologia Multi-Agente**: Troca de "agente Cora" para "agente Cliente" em toda a solução multi-agente de retalho para melhor compreensão  
- **Arquitetura de Agente**: Atualização de toda a documentação, templates ARM e exemplos de código para utilização consistente do termo "agente Cliente"  
- **Exemplos de Configuração**: Modernização dos padrões de configuração de agentes com convenções de nomenclatura atualizadas  
- **Consistência na Documentação**: Garantia que todas as referências usam nomes profissionais e descritivos para agentes  

#### Aprimorado  
- **Pacote de Template ARM**: Atualização do retail-multiagent-arm-template com referências ao agente Cliente  
- **Diagramas de Arquitetura**: Diagramas Mermaid atualizados com nomeação de agentes revisada  
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam nomenclatura CustomerAgent  
- **Variáveis de Ambiente**: Atualização de todos os scripts de implementação para padrões CUSTOMER_AGENT_NAME  

#### Melhorado  
- **Experiência do Desenvolvedor**: Papéis e responsabilidades dos agentes mais claros na documentação  
- **Prontidão para Produção**: Melhor alinhamento a convenções de nomenclatura empresariais  
- **Materiais de Aprendizagem**: Nomeação de agentes mais intuitiva para fins educativos  
- **Usabilidade do Template**: Compreensão simplificada das funções e padrões de implementação dos agentes  

#### Detalhes Técnicos  
- Atualização dos diagramas Mermaid de arquitetura com referências CustomerAgent  
- Substituição de nomes de classes CoraAgent por CustomerAgent em exemplos Python  
- Modificação das configurações JSON dos templates ARM para usar tipo de agente "customer"  
- Atualização das variáveis de ambiente de CORA_AGENT_* para CUSTOMER_AGENT_*  
- Renovação de todos os comandos de implementação e configurações de container  

### [v3.0.0] - 2025-09-12  

#### Alterações Maiores - Foco no Desenvolvedor AI e Integração Microsoft Foundry  
**Esta versão transforma o repositório num recurso abrangente focado em AI com integração Microsoft Foundry.**  

#### Adicionado  
- **🤖 Percurso de Aprendizagem AI-First**: Reestruturação completa priorizando desenvolvedores e engenheiros AI  
- **Guia de Integração Microsoft Foundry**: Documentação completa para conectar AZD com serviços Microsoft Foundry  
- **Padrões de Implementação de Modelos AI**: Guia detalhado sobre seleção de modelos, configuração e estratégias de produção  
- **Laboratório do Workshop AI**: Workshop prático de 2-3 horas para converter aplicações AI em soluções implementáveis com AZD  
- **Boas Práticas AI para Produção**: Padrões prontos para empresas para escalabilidade, monitorização e segurança de workloads AI  
- **Guia de Resolução de Problemas AI**: Soluções abrangentes para problemas com Microsoft Foundry Models, Cognitive Services e implementação AI  
- **Galeria de Modelos AI**: Coleção destacada de templates Microsoft Foundry com classificações de complexidade  
- **Materiais do Workshop**: Estrutura completa do workshop com laboratórios práticos e materiais de referência  

#### Aprimorado  
- **Estrutura README**: Focada em desenvolvedores AI com 45% de interesse comunitário via Microsoft Foundry Discord  
- **Percursos de Aprendizagem**: Jornada dedicada a desenvolvedores AI alinhada com percursos tradicionais para estudantes e engenheiros DevOps  
- **Recomendações de Modelos**: Modelos AI destacados incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart  
- **Integração Comunitária**: Suporte comunitário Discord ampliado com canais e discussões específicas para AI  

#### Foco em Segurança & Produção  
- **Padrões de Identidade Gerida**: Configurações de autenticação e segurança específicas para AI  
- **Otimização de Custos**: Monitorização de uso de tokens e controlo orçamental para workloads AI  
- **Implementação Multi-Região**: Estratégias para implementação global de aplicações AI  
- **Monitorização de Desempenho**: Métricas específicas AI e integração com Application Insights  

#### Qualidade da Documentação  
- **Estrutura Linear do Curso**: Progressão lógica do iniciante aos padrões avançados de implementação AI  
- **URLs Validadas**: Todos os links externos verificados e acessíveis  
- **Referência Completa**: Todos os links internos da documentação validados e funcionais  
- **Pronto para Produção**: Padrões empresariais com exemplos do mundo real  

### [v2.0.0] - 2025-09-09  

#### Alterações Maiores - Reestruturação do Repositório e Aperfeiçoamento Profissional  
**Esta versão representa uma revisão significativa da estrutura do repositório e apresentação de conteúdos.**  

#### Adicionado  
- **Estrutura de Aprendizagem Estruturada**: Todas as páginas de documentação incluem agora Introdução, Objetivos de Aprendizagem e Resultados de Aprendizagem  
- **Sistema de Navegação**: Adição de links para lições Anterior/Seguinte em toda a documentação para progressão guiada  
- **Guia de Estudo**: ficheiro study-guide.md abrangente com objetivos de aprendizagem, exercícios práticos e materiais de avaliação  
- **Apresentação Profissional**: Remoção de todos os emojis para maior acessibilidade e aspeto profissional  
- **Estrutura de Conteúdos Aprimorada**: Organização e fluxo dos materiais de aprendizagem melhorados  

#### Alterado  
- **Formato da Documentação**: Padronização de toda a documentação com estrutura focada na aprendizagem  
- **Fluxo de Navegação**: Implementação de progressão lógica em todo o material didático  
- **Apresentação de Conteúdos**: Remoção de elementos decorativos em favor de formatação clara e profissional  
- **Estrutura de Links**: Atualização de todos os links internos para suportar novo sistema de navegação  

#### Melhorado  
- **Acessibilidade**: Remoção da dependência de emojis para melhor compatibilidade com leitores de ecrã  
- **Aspeto Profissional**: Apresentação limpa, em estilo académico, adequada para aprendizagem empresarial  
- **Experiência de Aprendizagem**: Abordagem estruturada com objetivos e resultados claros para cada lição  
- **Organização dos Conteúdos**: Fluxo lógico e conexão melhorada entre tópicos relacionados  

### [v1.0.0] - 2025-09-09  

#### Lançamento Inicial - Repositório Abrangente de Aprendizagem AZD  

#### Adicionado  
- **Estrutura Básica de Documentação**  
  - Série completa de guias de início rápido  
  - Documentação abrangente de implantação e provisionamento  
  - Recursos detalhados para resolução de problemas e depuração  
  - Ferramentas e procedimentos de validação pré-implementação  

- **Módulo de Início**  
  - Fundamentos AZD: conceitos e terminologia essenciais  
  - Guia de Instalação: instruções específicas de plataforma  
  - Guia de Configuração: configuração do ambiente e autenticação  
  - Tutorial do Primeiro Projeto: aprendizagem prática passo a passo  

- **Módulo de Implantação e Provisionamento**  
  - Guia de Implantação: fluxo de trabalho completo documentado  
  - Guia de Provisionamento: infraestrutura como código com Bicep  
  - Melhores práticas para implementações em produção  
  - Padrões de arquitetura multi-serviços  

- **Módulo de Validação Pré-Implementação**  
  - Planeamento de Capacidade: validação de recursos Azure disponíveis  
  - Seleção de SKU: orientações completas sobre camadas de serviço  
  - Verificações Pré-voo: scripts automatizados de validação (PowerShell e Bash)  
  - Estimativa de custos e ferramentas de planeamento de orçamento  

- **Módulo de Resolução de Problemas**  
  - Problemas Comuns: problemas frequentes e soluções  
  - Guia de Depuração: metodologias sistemáticas de resolução de problemas  
  - Técnicas e ferramentas avançadas de diagnóstico  
  - Monitorização e otimização de desempenho  

- **Recursos e Referências**  
  - Folha de comandos: referência rápida para comandos essenciais  
  - Glossário: definições completas de termos e acrónimos  
  - FAQ: respostas detalhadas às perguntas comuns  
  - Links externos e conexões comunitárias  

- **Exemplos e Modelos**  
  - Exemplo de aplicação web simples  
  - Template de implantação de website estático  
  - Configuração de aplicação em container  
  - Padrões de integração de base de dados  
  - Exemplos de arquitetura de microserviços  
  - Implementações de funções serverless  

#### Funcionalidades  
- **Suporte Multi-Plataforma**: guias de instalação e configuração para Windows, macOS e Linux  
- **Vários Níveis de Competência**: conteúdos desenhados para estudantes até programadores profissionais  
- **Foco Prático**: exemplos hands-on e cenários do mundo real  
- **Cobertura Abrangente**: desde conceitos básicos até padrões empresariais avançados  
- **Abordagem Centrada na Segurança**: melhores práticas de segurança integradas  
- **Otimização de Custos**: orientações para implementações e gestão de recursos económico-eficientes  

#### Qualidade da Documentação  
- **Exemplos de Código Detalhados**: amostras de código práticas e testadas  
- **Instruções Passo a Passo**: orientações claras e aplicáveis  
- **Tratamento Abrangente de Erros**: resolução de problemas comuns  
- **Integração de Melhores Práticas**: padrões da indústria e recomendações  
- **Compatibilidade de Versão**: atualizado com os últimos serviços Azure e funcionalidades azd  

## Melhoramentos Planeados para o Futuro  

### Versão 3.1.0 (Planeada)  
#### Expansão da Plataforma AI
- **Suporte Multi-Modelo**: Padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados  
- **Frameworks de Agentes de IA**: Modelos para implementações LangChain, Semantic Kernel e AutoGen  
- **Padrões Avançados de RAG**: Opções de base de dados vetoriais além do Azure AI Search (Pinecone, Weaviate, etc.)  
- **Observabilidade de IA**: Monitorização melhorada para desempenho do modelo, uso de tokens e qualidade das respostas  

#### Experiência do Programador  
- **Extensão VS Code**: Experiência integrada de desenvolvimento AZD + Microsoft Foundry  
- **Integração GitHub Copilot**: Geração assistida por IA de modelos AZD  
- **Tutoriais Interativos**: Exercícios práticos de programação com validação automática para cenários de IA  
- **Conteúdo em Vídeo**: Tutoriais em vídeo suplementares para aprendizes visuais focados em implementações de IA  

### Versão 4.0.0 (Planeada)  
#### Padrões Empresariais de IA  
- **Framework de Governança**: Governança, conformidade e registos de auditoria de modelos de IA  
- **IA Multiinquilino**: Padrões para servir múltiplos clientes com serviços de IA isolados  
- **Implementação de IA na Edge**: Integração com Azure IoT Edge e instâncias de contentores  
- **IA Cloud Híbrida**: Padrões de implementação multi-cloud e híbridos para cargas de trabalho de IA  

#### Funcionalidades Avançadas  
- **Automação de Pipelines de IA**: Integração MLOps com pipelines do Azure Machine Learning  
- **Segurança Avançada**: Padrões zero-trust, endpoints privados e proteção avançada contra ameaças  
- **Otimização de Performance**: Estratégias avançadas de ajuste e dimensionamento para aplicações de IA de alto débito  
- **Distribuição Global**: Padrões de entrega de conteúdo e cache na edge para aplicações de IA  

### Versão 3.0.0 (Planeada) - Substituída pela Versão Atual  
#### Adições Propostas - Agora Implementadas na v3.0.0  
- ✅ **Conteúdo Focado em IA**: Integração completa com Microsoft Foundry (Concluído)  
- ✅ **Tutoriais Interativos**: Laboratório prático de IA (Concluído)  
- ✅ **Módulo Avançado de Segurança**: Padrões de segurança específicos para IA (Concluído)  
- ✅ **Otimização de Performance**: Estratégias de ajuste para cargas de IA (Concluído)  

### Versão 2.1.0 (Planeada) - Parcialmente Implementada na v3.0.0  
#### Melhorias Menores - Algumas Concluídas na Versão Atual  
- ✅ **Exemplos Adicionais**: Cenários de implementação focados em IA (Concluído)  
- ✅ **FAQ Estendido**: Perguntas e resolução de problemas específicos de IA (Concluído)  
- **Integração de Ferramentas**: Guias melhorados para integração em IDEs e editores  
- ✅ **Expansão da Monitorização**: Padrões específicos de monitorização e alertas para IA (Concluído)  

#### Ainda Planeadas para Versão Futura  
- **Documentação Mobile-Friendly**: Design responsivo para aprendizagem móvel  
- **Acesso Offline**: Pacotes de documentação descarregáveis  
- **Integração Aprimorada em IDEs**: Extensão VS Code para fluxos de trabalho AZD + IA  
- **Dashboard Comunitário**: Métricas e acompanhamento de contribuições em tempo real  

## Contribuir para o Changelog  

### Reportar Alterações  
Ao contribuir para este repositório, por favor assegure que as entradas do changelog incluem:

1. **Número da Versão**: Seguindo versionamento semântico (major.minor.patch)  
2. **Data**: Data de lançamento ou atualização em formato AAAA-MM-DD  
3. **Categoria**: Adicionado, Alterado, Obsoleto, Removido, Corrigido, Segurança  
4. **Descrição Clara**: Descrição concisa do que mudou  
5. **Avaliação de Impacto**: Como as alterações afetam os utilizadores existentes  

### Categorias de Alteração  

#### Adicionado  
- Novas funcionalidades, secções de documentação ou capacidades  
- Novos exemplos, modelos ou recursos de aprendizagem  
- Ferramentas adicionais, scripts ou utilitários  

#### Alterado  
- Modificações em funcionalidades ou documentação existentes  
- Atualizações para melhorar clareza ou precisão  
- Reestruturação de conteúdo ou organização  

#### Obsoleto  
- Funcionalidades ou abordagens a serem descontinuadas  
- Secções de documentação programadas para remoção  
- Métodos com alternativas melhores  

#### Removido  
- Funcionalidades, documentação ou exemplos já não relevantes  
- Informação desatualizada ou abordagens obsoletas  
- Conteúdo redundante ou consolidado  

#### Corrigido  
- Correções de erros na documentação ou código  
- Resolução de problemas reportados  
- Melhorias na precisão ou funcionalidade  

#### Segurança  
- Melhorias ou correções relacionadas com segurança  
- Atualizações de melhores práticas de segurança  
- Resolução de vulnerabilidades de segurança  

### Diretrizes de Versionamento Semântico  

#### Versão Major (X.0.0)  
- Alterações que quebram compatibilidade e requerem ação do utilizador  
- Reestruturações significativas de conteúdo ou organização  
- Mudanças que alteram a abordagem ou metodologia fundamental  

#### Versão Minor (X.Y.0)  
- Novas funcionalidades ou adições de conteúdo  
- Melhorias que mantêm compatibilidade retroativa  
- Exemplos, ferramentas ou recursos adicionais  

#### Versão Patch (X.Y.Z)  
- Correções de bugs e reparações  
- Melhorias menores ao conteúdo existente  
- Esclarecimentos e pequenas melhorias  

## Feedback e Sugestões da Comunidade  

Encorajamos ativamente o feedback da comunidade para melhorar este recurso de aprendizagem:

### Como Fornecer Feedback  
- **GitHub Issues**: Reportar problemas ou sugerir melhorias (problemas específicos de IA são bem-vindos)  
- **Discussões Discord**: Partilhar ideias e interagir com a comunidade Microsoft Foundry  
- **Pull Requests**: Contribuir diretamente com melhorias no conteúdo, especialmente modelos e guias de IA  
- **Microsoft Foundry Discord**: Participar no canal #Azure para discussões AZD + IA  
- **Fóruns da Comunidade**: Participar em discussões mais amplas para programadores Azure  

### Categorias de Feedback  
- **Precisão de Conteúdo de IA**: Correções em integrações e informações sobre implantações de IA  
- **Experiência de Aprendizagem**: Sugestões para melhorar o fluxo de aprendizagem para programadores de IA  
- **Conteúdo de IA em Falta**: Pedidos de modelos, padrões ou exemplos adicionais de IA  
- **Acessibilidade**: Melhorias para diferentes necessidades de aprendizagem  
- **Integração de Ferramentas de IA**: Sugestões para melhor integração nos fluxos de desenvolvimento de IA  
- **Padrões de IA para Produção**: Pedidos de padrões para implementações empresariais de IA  

### Compromisso de Resposta  
- **Resposta a Issues**: Dentro de 48 horas para problemas reportados  
- **Pedidos de Funcionalidade**: Avaliação dentro de uma semana  
- **Contribuições da Comunidade**: Revisão dentro de uma semana  
- **Questões de Segurança**: Prioridade imediata com resposta acelerada  

## Calendário de Manutenção  

### Atualizações Regulares  
- **Revisões Mensais**: Precisão do conteúdo e validação de links  
- **Atualizações Trimestrais**: Principais adições e melhorias de conteúdo  
- **Revisões Semestrais**: Reestruturação abrangente e aprimoramentos  
- **Lançamentos Anuais**: Atualizações principais com melhorias significativas  

### Monitorização e Garantia de Qualidade  
- **Testes Automatizados**: Validação regular de exemplos de código e links  
- **Integração de Feedback da Comunidade**: Incorporação regular de sugestões dos utilizadores  
- **Atualizações Tecnológicas**: Alinhamento com os últimos serviços Azure e versões azd  
- **Auditorias de Acessibilidade**: Revisão periódica para princípios de design inclusivo  

## Política de Suporte de Versão  

### Suporte da Versão Atual  
- **Última Versão Major**: Suporte completo com atualizações regulares  
- **Versão Major Anterior**: Atualizações de segurança e correções críticas por 12 meses  
- **Versões Legadas**: Suporte comunitário apenas, sem atualizações oficiais  

### Orientação de Migração  
Quando versões major são lançadas, fornecemos:  
- **Guias de Migração**: Instruções passo a passo para transição  
- **Notas de Compatibilidade**: Detalhes sobre alterações que quebram compatibilidade  
- **Suporte de Ferramentas**: Scripts ou utilitários para ajudar na migração  
- **Suporte Comunitário**: Fóruns dedicados para questões de migração  

---

**Navegação**  
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)  
- **Próxima Lição**: Retornar ao [README Principal](README.md)  

**Mantenha-se Atualizado**: Siga este repositório para notificações sobre novos lançamentos e atualizações importantes aos materiais de aprendizagem.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, tenha em atenção que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional feita por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->