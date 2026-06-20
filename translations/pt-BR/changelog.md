# Changelog - AZD For Beginners

## Introdução

Este changelog documenta todas as alterações, atualizações e melhorias notáveis no repositório AZD For Beginners. Seguimos os princípios de versionamento semântico e mantemos este registro para ajudar os usuários a entender o que mudou entre as versões.

## Objetivos de Aprendizagem

Ao revisar este changelog, você irá:
- Manter-se informado sobre novos recursos e adições de conteúdo
- Entender melhorias feitas na documentação existente
- Acompanhar correções de bugs e ajustes para garantir precisão
- Seguir a evolução do material de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Após revisar as entradas do changelog, você será capaz de:
- Identificar novo conteúdo e recursos disponíveis para aprendizagem
- Entender quais seções foram atualizadas ou melhoradas
- Planejar sua trilha de aprendizagem com base nos materiais mais atuais
- Contribuir com feedback e sugestões para melhorias futuras

## Histórico de Versões

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Esta versão fecha as lacunas intermediárias restantes identificadas pela análise azd-coverage: como criar e publicar seu próprio template, ambientes reproduzíveis com dev-container/Codespaces, o provedor de infraestrutura Pulumi, um walkthrough de Azure DevOps CI/CD, autenticação por service-principal, orientação de seleção de host (AKS/Spring Apps), explicações de `azd restore`/`azd package`, tratamento de erros em hooks, e práticas de equipe/ambientes compartilhados.**

#### Adicionado
- **🧱 Nova lição do Capítulo 4** `docs/chapter-04-infrastructure/custom-templates.md` — criar seu próprio template azd: estrutura requerida (`azure.yaml`, `infra/`, `src/`), o campo `metadata.template`, parametrizar infraestrutura com o token de recurso `uniqueString()` e a tag `azd-env-name`, testar localmente com `azd init --template <local-path>`, publicar no GitHub, e submeter à galeria Awesome AZD
- **📦 Nova lição do Capítulo 1** `docs/chapter-01-foundation/dev-containers.md` — ambientes azd reproduzíveis com Dev Containers e GitHub Codespaces: um `.devcontainer/devcontainer.json` mínimo usando a feature oficial `ghcr.io/azure/azure-dev/azd`, features específicas de linguagem, `docker-in-docker` para hosts de contêiner, e `azd auth login --use-device-code` para login remoto
- **🧩 Pulumi com azd** seção em `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, layout de pasta do Pulumi, stacks mapeados para ambientes azd, outputs/tags requeridos, e o mesmo fluxo de trabalho `azd up` / `azd down`
- **🎯 Orientação de seleção de host** em `docs/chapter-04-infrastructure/provisioning.md` — uma comparação amigável para iniciantes entre `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, e `springapp`, com orientação sobre quando escolher AKS ou Azure Spring Apps
- **🛠️ Walkthrough de Azure DevOps CI/CD** em `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection com workload identity federation (OIDC), o `azure-dev.yml` gerado, e configuração de variable-group
- **🔑 Service Principals (Pattern 4)** adicionado a `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` não interativo com client secret vs. credenciais federadas/OIDC, quando usar, e armazenamento seguro de credenciais
- **🪝 Tratamento de erros em hooks** subseção em `docs/chapter-04-infrastructure/deployment-guide.md` — códigos de saída e `set -e`, `continueOnError`, testar hooks isoladamente com `azd hooks run`, shells específicos de SO, e `--debug`
- **👥 Equipes / ambientes compartilhados** seção em `docs/chapter-03-configuration/configuration.md` — o que vive em `.azure/`, o que deve ser ignorado pelo git, ambientes por desenvolvedor, `azd env list`/`select`, e fornecer valores de ambiente em CI/CD
- **🧰 Explicações de `azd restore` e `azd package` ampliadas** em `resources/cheat-sheet.md` — restaurando dependências e construindo um artefato implantável sem realizar o deploy

#### Alterado
- **🧭 Tabela de lições do Capítulo 4** atualizada para incluir a nova lição "Authoring Your Own Template" (Lição 3)
- **🧭 Tabela de lições do Capítulo 1** atualizada para incluir a nova lição "Dev Containers & Codespaces" (Lição 5); rodapés de navegação conectados entre `bring-your-own-app.md` e `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Esta versão fecha as maiores lacunas para um guia completo para iniciantes adicionando duas novas lições práticas (um walkthrough multi-agent implantável e adicionar azd a um app existente), uma introdução amigável a hooks, uma seção sobre Terraform com azd, um walkthrough passo a passo do pipeline GitHub Actions, um explicador para as novas extensões em preview, e um checklist explícito de verificação de implantação.**

#### Adicionado
- **🤝 Nova lição do Capítulo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — um walkthrough totalmente prático e implantável com dois agentes (orquestrador + especialistas) usando um template real (`contoso-creative-writer`), cobrindo quando usar multi-agent, o fluxo `azd up`, entendendo os recursos implantados, tracing entre agentes, customização, e limpeza
- **📦 Nova lição do Capítulo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — como adicionar azd a um projeto existente com `azd init` ("use code in the current directory"), entendendo `azure.yaml` e `infra/`, `azd infra generate`, detecção de host, e deploy com `azd up`
- **🌐 Terraform com azd** seção adicionada a `docs/chapter-04-infrastructure/provisioning.md` — configuração `infra.provider: terraform`, layout de pasta `.tf`, outputs `AZURE_*` requeridos e tagging `azd-env-name`, e o mesmo fluxo `azd up` / `azd down` (fecha a lacuna onde o suporte a Terraform era mencionado mas apenas Bicep era demonstrado)
- **⚙️ Walkthrough passo a passo do GitHub Actions** em `docs/chapter-08-production/production-ai-practices.md` — do repositório GitHub a deploys automatizados: `azd pipeline config`, credenciais federadas OIDC (sem segredos armazenados), o `azure-dev.yml` gerado, e orientação sobre secrets vs. variables
- **🪝 Introdução "Novo em hooks?" para iniciantes** em `docs/chapter-04-infrastructure/deployment-guide.md` — o que é um hook, uma tabela de estágios de hook, um hook mínimo inicial, e executar hooks manualmente com `azd hooks run`
- **✅ Checklist "Verifique Sua Implantação"** adicionado ao Passo 5 de `docs/chapter-01-foundation/first-project.md` — smoke test, verificação do endpoint de saúde, e critérios explícitos de sucesso
- **🧩 Explicador para novas extensões em preview** `azure.ai.skills` e `azure.ai.connections` (o que são e quando usá-las) em `docs/chapter-08-production/production-ai-practices.md`

#### Alterado
- **🧭 Tabela de lições do Capítulo 5** corrigida: `multi-agent-basics.md` agora é a Lição 1 (a única lição totalmente prática), com rotulagem honesta que a Lição 2 vive no Capítulo 6 e que o cenário Retail é um blueprint de arquitetura, não um template de um comando só
- **🧭 Tabela de lições do Capítulo 1** agora inclui a nova lição "Bring Your Own App" (Lição 4)
- **🔗 Rodapés de navegação** atualizados: `first-project.md` agora aponta para frente para `bring-your-own-app.md`

#### Corrigido
- **🧱 Fechada a lacuna do Terraform "reclamado mas ausente"** — o curso anteriormente referenciava suporte a Terraform sem mostrá-lo
- **🔀 Corrigidos cross-links enganosos do Capítulo 5** que implicavam que uma implementação multi-agent completa existia quando apenas um blueprint de arquitetura estava disponível

#### Arquivos Atualizados
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(novo)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(novo)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Esta versão revalida o curso contra `azd` `1.25.6` (junho de 2026) e a extensão `azure.ai.agents` `0.1.40-preview`, expande a orientação de IA de "esboçar um agente" para o ciclo de vida completo do agente (testar → avaliar → otimizar → inspecionar → excluir), destaca as novas extensões preview `azure.ai.skills` e `azure.ai.connections`, e observa o rebranding do produto ".NET Aspire" → "Aspire".**

#### Adicionado
- **🔁 Cobertura completa do ciclo de vida do agente** para iniciantes e engenheiros de IA ao longo dos docs:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabela de ciclo de vida (scaffold → test → measure → improve → inspect → clean up) adicionada à seção Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — Nova seção "Managing the Agent Lifecycle" cobrindo `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
  - `resources/cheat-sheet.md` — Comandos de Agente de IA expandidos com `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
- **🧩 Novas extensões em preview** documentadas: `azure.ai.skills` (skills reutilizáveis para agentes) e `azure.ai.connections` (Foundry connections) adicionadas à tabela de extensões e ao cheat sheet
- **⏱️ Orientação sobre tempos de resposta** — exemplos de `azd ai agent invoke` agora indicam que ele imprime latência total e time-to-first-byte
- **📌 Banner de versão** no README raiz apontando aprendizes para `azd version` e `azd upgrade`

#### Alterado
- **✅ Baseline de validação atualizada** de `azd 1.23.12` (março de 2026) para `azd 1.25.6` (junho de 2026) em todos os READMEs dos capítulos e nos docs do workshop
- **🤖 Nota de extensão do Capítulo 2** atualizada de `azure.ai.agents` `0.1.18-preview` para `0.1.40-preview`
- **🧪 Exemplo de validação do workshop** (saída de `azd version`) atualizado para `1.25.6`
- **🧭 README "What's New in azd Today"** atualizado para destacar o ciclo de vida de agente ponta a ponta, novas extensões de IA, e correções recentes de qualidade de vida (`azd init` idempotência, `azd auth login` limpeza de token expirado, prompt first-run do `azd tool`)
- **📖 Chapter 2 agents.md (Option 4)** agora aponta aprendizes para os comandos de ciclo de vida pós-deploy em vez de parar no `azd up`

#### Corrigido
- **🏷️ Nome do produto** — adicionada nota de rebranding Aspire (".NET Aspire" agora é simplesmente "Aspire"); o suporte do azd ao Aspire permanece inalterado
- **🔎 Validação de release ao vivo** confirmada contra o feed de releases do Azure Developer CLI: CLI estável `1.25.6` (2026-06-12) e `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Arquivos Atualizados
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Esclarecimentos de Onboarding para Iniciantes, Validação de Configuração e Limpeza Final dos Comandos AZD
**Esta versão dá seguimento à varredura de validação do AZD 1.23 com uma revisão de documentação focada em iniciantes: esclarece a orientação de autenticação priorizando o AZD, adiciona scripts de validação de configuração local, verifica comandos-chave contra o CLI AZD ao vivo e remove as últimas referências de comandos em inglês obsoletas fora do changelog.**

#### Added
- **🧪 Scripts de validação de configuração para iniciantes** com `validate-setup.ps1` e `validate-setup.sh` para que os aprendizes possam confirmar as ferramentas necessárias antes de iniciar o Capítulo 1
- **✅ Etapas de validação de configuração antecipada** no README raiz e no README do Capítulo 1 para que pré-requisitos ausentes sejam detectados antes do `azd up`

#### Changed
- **🔐 Orientação de autenticação para iniciantes** agora trata consistentemente `azd auth login` como o caminho primário para fluxos de trabalho AZD, com `az login` destacado como opcional a menos que comandos do Azure CLI sejam usados diretamente
- **📚 Fluxo de onboarding do Capítulo 1** agora direciona os aprendizes a validar sua configuração local antes da instalação, autenticação e primeiros passos de deployment
- **🛠️ Mensagens do validador** agora separam claramente requisitos bloqueantes de avisos opcionais do Azure CLI para o caminho iniciante focado apenas em AZD
- **📖 Documentos de configuração, solução de problemas e exemplos** agora distinguem entre autenticação AZD obrigatória e login opcional no Azure CLI onde anteriormente ambos eram apresentados sem contexto

#### Fixed
- **📋 Referências restantes de comandos na fonte em inglês** atualizadas para as formas AZD atuais, incluindo `azd config show` na folha de referência e `azd monitor --overview` onde se pretendia orientação de visão geral do Azure Portal
- **🧭 Afirmações para iniciantes no Capítulo 1** suavizadas para evitar prometer garantias de ausência de erros ou comportamento de rollback em todos os templates e recursos do Azure
- **🔎 Validação ao vivo do CLI** confirmou suporte atual para `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` e `azd down --force --purge`

#### Files Updated
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

#### Validação AZD 1.23.12, Expansão do Ambiente de Workshop e Atualização do Modelo de IA
**Esta versão realiza uma varredura de validação de documentação contra `azd` `1.23.12`, atualiza exemplos de comandos AZD desatualizados, atualiza as orientações de modelo de IA para os padrões atuais e amplia as instruções do workshop além do GitHub Codespaces para também suportar dev containers e clones locais.**

#### Added
- **✅ Notas de validação em capítulos principais e documentos do workshop** para tornar explícita a baseline AZD testada para aprendizes que estejam usando builds do CLI mais recentes ou mais antigos
- **⏱️ Orientação de timeout de deployment** para implantações de apps de IA de longa duração usando `azd deploy --timeout 1800`
- **🔎 Etapas de inspeção de extensão** com `azd extension show azure.ai.agents` nos documentos do fluxo de trabalho de IA
- **🌐 Orientação mais ampla do ambiente do workshop** cobrindo GitHub Codespaces, dev containers e clones locais com MkDocs

#### Changed
- **📚 READMEs de introdução dos capítulos** agora observam consistentemente a validação contra `azd 1.23.12` em fundação, configuração, infraestrutura, multi-agente, pré-implantação, solução de problemas e seções de produção
- **🛠️ Referências de comandos AZD** atualizadas para as formas atuais em toda a documentação:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ou `azd env get-value(s)` dependendo do contexto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` onde a visão geral do Application Insights é pretendida
- **🧪 Exemplos de provision preview** simplificados para uso suportado atual, como `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Fluxo do workshop** atualizado para que aprendizes possam completar os labs em Codespaces, um dev container ou um clone local em vez de assumir execução exclusiva em Codespaces
- **🔐 Orientação de autenticação** agora prefere `azd auth login` para fluxos AZD, com `az login` posicionado como opcional quando comandos do Azure CLI são usados diretamente

#### Fixed
- **🪟 Comandos de instalação no Windows** normalizados para o casing atual do pacote `winget` no guia de instalação
- **🐧 Orientação de instalação no Linux** corrigida para evitar instruções de gerenciador de pacotes `azd` específicas de distro não suportadas e, em vez disso, apontar para os artefatos de release quando apropriado
- **📦 Exemplos de modelos de IA** atualizados de padrões antigos como `gpt-35-turbo` e `text-embedding-ada-002` para exemplos atuais como `gpt-4.1-mini`, `gpt-4.1` e `text-embedding-3-large`
- **📋 Trechos de deployment e diagnóstico** corrigidos para usar comandos atuais de ambiente e status em logs, scripts e passos de solução de problemas
- **⚙️ Orientação de GitHub Actions** atualizada de `Azure/setup-azd@v1.0.0` para `Azure/setup-azd@v2`
- **🤖 Orientação de consentimento MCP/Copilot** atualizada de `azd mcp consent` para `azd copilot consent list`

#### Improved
- **🧠 Orientação do capítulo de IA** agora explica melhor o comportamento preview-sensível de `azd ai`, login específico de tenant, uso atual de extensões e recomendações atualizadas de deployment de modelos
- **🧪 Instruções do workshop** agora usam exemplos de versão mais realistas e linguagem de configuração de ambiente mais clara para labs práticos
- **📈 Documentos de produção e solução de problemas** agora alinham melhor os exemplos atuais de monitoramento, fallback de modelo e níveis de custo

#### Files Updated
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
**Esta versão adiciona cobertura de `azd ai`, `azd extension` e `azd mcp` em todos os capítulos relacionados a IA, corrige links quebrados e código obsoleto em agents.md, atualiza a folha de referências e reformula a seção de Exemplos de Templates com descrições validadas e novos templates AZD do Azure AI.**

#### Added
- **🤖 Cobertura do AZD AI CLI** em 7 arquivos (anteriormente apenas no Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova seção "Extensions and AI Commands" introduzindo `azd extension`, `azd ai agent init` e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opção 4: `azd ai agent init` com tabela comparativa (abordagem template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subseções "AZD Extensions for Foundry" e "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start agora mostra caminhos de deployment baseados em template e em manifesto
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Seção Deploy agora inclui a opção `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseção "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nova seção "AI & Extensions Commands" com `azd extension`, `azd ai agent init`, `azd mcp` e `azd infra generate`
- **📦 Novos templates de exemplo AZD AI** em `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — chat RAG .NET com Blazor WebAssembly, Semantic Kernel e suporte a chat por voz
  - **azure-search-openai-demo-java** — chat RAG Java usando Langchain4J com opções de deployment em ACA/AKS
  - **contoso-creative-writer** — app multi-agente de escrita criativa usando Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB com suporte a desenvolvimento local Ollama
  - **chat-with-your-data-solution-accelerator** — acelerador enterprise RAG com portal admin, integração com Teams e opções PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — app de referência de orquestração multi-agente MCP com servidores em .NET, Python, Java e TypeScript
  - **azd-ai-starter** — template starter Bicep mínimo para infraestrutura Azure AI
  - **🔗 Link para a Galeria awesome-azd de IA** — Referência para a [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 Navegação em agents.md**: links Anterior/Próximo agora correspondem à ordem das lições do README do Capítulo 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Links quebrados em agents.md**: `production-ai-practices.md` corrigido para `../chapter-08-production/production-ai-practices.md` (3 ocorrências)
- **📦 Código obsoleto em agents.md**: `opencensus` substituído por `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API inválida em agents.md**: `max_tokens` movido de `create_agent()` para `create_run()` como `max_completion_tokens`
- **🔢 Contagem de tokens em agents.md**: substituída a estimativa aproximada `len//4` por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: serviços corrigidos de "Cognitive Search + App Service" para "Azure AI Search + Azure Container Apps" (host padrão alterado em Out 2024)
- **contoso-chat**: descrição atualizada para referenciar Azure AI Foundry + Prompty, correspondendo ao título real do repositório e stack tecnológico

#### Removed
- **ai-document-processing**: Removida referência a template não funcional (repositório não publicamente acessível como template AZD)

#### Improved
- **📝 Exercícios em agents.md**: Exercício 1 agora mostra saída esperada e passo `azd monitor`; Exercício 2 inclui código completo de registro do `FunctionTool`; Exercício 3 substitui orientação vaga por comandos concretos `prepdocs.py`
- **📚 Recursos em agents.md**: links de documentação atualizados para os docs atuais do Azure AI Agent Service e quickstart
- **📋 Tabela Next Steps em agents.md**: Adicionado link do AI Workshop Lab para cobertura completa do capítulo

#### Files Updated
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
**Esta versão melhora a navegação dos capítulos no README.md com um formato de tabela aprimorado.**

#### Alterado
- **Tabela do Mapa do Curso**: Aprimorada com links diretos para as aulas, estimativas de duração e classificações de complexidade
- **Limpeza de Pastas**: Removidas pastas antigas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validação de Links**: Todos os 21+ links internos na tabela do Mapa do Curso verificados

### [v3.16.0] - 2026-02-05

#### Atualizações de Nomes de Produtos
**Esta versão atualiza referências de produtos para a identidade atual da Microsoft.**

#### Alterado
- **Microsoft Foundry → Microsoft Foundry**: Todas as referências atualizadas em arquivos não relacionados a traduções
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir a identidade atual da marca

#### Arquivos Atualizados
- `README.md` - Página inicial principal do curso
- `changelog.md` - Histórico de versões
- `course-outline.md` - Estrutura do curso
- `docs/chapter-02-ai-development/agents.md` - Guia de agentes de IA
- `examples/README.md` - Documentação de exemplos
- `workshop/README.md` - Página inicial do workshop
- `workshop/docs/index.md` - Índice do workshop
- `workshop/docs/instructions/*.md` - Todos os arquivos de instruções do workshop

---

### [v3.15.0] - 2026-02-05

#### Reestruturação Significativa do Repositório: Nomes de Pastas por Capítulo
**Esta versão reestrutura a documentação em pastas de capítulos dedicadas para uma navegação mais clara.**

#### Renomeação de Pastas
Pastas antigas foram substituídas por pastas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Migrações de Arquivos
| Arquivo | De | Para |
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
- **📚 Arquivos README de Capítulo**: Criado README.md em cada pasta de capítulo com:
  - Objetivos de aprendizagem e duração
  - Tabela de aulas com descrições
  - Comandos de início rápido
  - Navegação para outros capítulos

#### Alterado
- **🔗 Atualizados todos os links internos**: 78+ caminhos atualizados em todos os arquivos de documentação
- **🗺️ README.md principal**: Mapa do Curso atualizado com a nova estrutura de capítulos
- **📝 examples/README.md**: Referências cruzadas para pastas de capítulos atualizadas

#### Removido
- Estrutura de pastas antiga (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestruturação do Repositório: Navegação por Capítulo
**Esta versão adicionou arquivos README de navegação por capítulo (substituídos pela v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novo Guia de Agentes de IA
**Esta versão adiciona um guia abrangente para implantar agentes de IA com o Azure Developer CLI.**

#### Adicionado
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo cobrindo:
  - O que são agentes de IA e como eles diferem de chatbots
  - Três modelos de agente para início rápido (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agente (agente único, RAG, multiagente)
  - Configuração e personalização de ferramentas
  - Monitoramento e rastreamento de métricas
  - Considerações de custo e otimização
  - Cenários comuns de solução de problemas
  - Três exercícios práticos com critérios de sucesso

#### Estrutura do Conteúdo
- **Introdução**: Conceitos de agentes para iniciantes
- **Início Rápido**: Implante agentes com `azd init --template get-started-with-ai-agents`
- **Padrões de Arquitetura**: Diagramas visuais dos padrões de agente
- **Configuração**: Configuração de ferramentas e variáveis de ambiente
- **Monitoramento**: Integração com Application Insights
- **Exercícios**: Aprendizado prático progressivo (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### Atualização do Ambiente DevContainer
**Esta versão atualiza a configuração do container de desenvolvimento com ferramentas modernas e padrões melhores para a experiência de aprendizado do AZD.**

#### Alterado
- **🐳 Imagem Base**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (última versão estável do Debian)
- **📛 Nome do Container**: Renomeado de "Python 3" para "AZD for Beginners" para maior clareza

#### Adicionado
- **🔧 Novos Recursos do Dev Container**:
  - `azure-cli` com suporte a Bicep habilitado
  - `node:20` (versão LTS para templates AZD)
  - `github-cli` para gerenciamento de templates
  - `docker-in-docker` para implantações de aplicativos em container

- **🔌 Encaminhamento de Portas**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (visualização do MkDocs)
  - 3000 (aplicativos web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Novas Extensões do VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense para Python aprimorado
  - `ms-azuretools.vscode-azurefunctions` - Suporte ao Azure Functions
  - `ms-azuretools.vscode-docker` - Suporte ao Docker
  - `ms-azuretools.vscode-bicep` - Suporte à linguagem Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gerenciamento de recursos do Azure
  - `yzhang.markdown-all-in-one` - Edição de Markdown
  - `DavidAnson.vscode-markdownlint` - Linting de Markdown
  - `bierner.markdown-mermaid` - Suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - Suporte a YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualização do Git
  - `mhutchie.git-graph` - Histórico do Git

- **⚙️ Configurações do VS Code**: Adicionadas configurações padrão para interpretador Python, formatação ao salvar e remoção de espaços em branco

- **📦 Atualizado requirements-dev.txt**:
  - Adicionado plugin de minificação do MkDocs
  - Adicionado pre-commit para qualidade de código
  - Adicionados pacotes do Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigido
- **Comando Pós-Criação**: Agora verifica a instalação do AZD e do Azure CLI ao iniciar o container

---

### [v3.11.0] - 2026-02-05

#### Reformulação do README Amigável para Iniciantes
**Esta versão melhora significativamente o README.md para torná-lo mais acessível para iniciantes e adiciona recursos essenciais para desenvolvedores de IA.**

#### Adicionado
- **🆚 Comparação Azure CLI vs AZD**: Explicação clara de quando usar cada ferramenta com exemplos práticos
- **🌟 Awesome AZD Links**: Links diretos para a galeria de templates da comunidade e recursos de contribuição:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ templates prontos para implantar
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Contribuição da comunidade
- **🎯 Guia de Início Rápido**: Seção simplificada de 3 passos para começar (Instalar → Entrar → Implantar)
- **📊 Tabela de Navegação Baseada na Experiência**: Orientação clara sobre onde começar com base na experiência do desenvolvedor

#### Alterado
- **Estrutura do README**: Reorganizada para divulgação progressiva - informação chave primeiro
- **Seção de Introdução**: Reescrita para explicar "The Magic of `azd up`" para iniciantes completos
- **Conteúdo Duplicado Removido**: Seção duplicada de solução de problemas eliminada
- **Comandos de Solução de Problemas**: Corrigida referência `azd logs` para usar o válido `azd monitor --logs`

#### Corrigido
- **🔐 Comandos de Autenticação**: Adicionados `azd auth login` e `azd auth logout` ao cheat-sheet.md
- **Referências de Comandos Inválidos**: Removido o restante de `azd logs` da seção de solução de problemas do README

#### Observações
- **Escopo**: Alterações aplicadas ao README.md principal e resources/cheat-sheet.md
- **Público-Alvo**: Melhorias especificamente direcionadas a desenvolvedores novos no AZD

---

### [v3.10.0] - 2026-02-05

#### Atualização de Precisão de Comandos do Azure Developer CLI
**Esta versão corrige comandos AZD inexistentes em toda a documentação, garantindo que todos os exemplos de código usem a sintaxe válida do Azure Developer CLI.**

#### Corrigido
- **🔧 Comandos AZD Inexistentes Removidos**: Auditoria abrangente e correção de comandos inválidos:
  - `azd logs` (não existe) → substituído por `azd monitor --logs` ou alternativas do Azure CLI
  - `azd service` subcomandos (não existem) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (não existem) → removidos ou substituídos por alternativas válidas
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (não existem) → removidos
  - `azd provision --what-if/--rollback` flags (não existem) → atualizados para usar `--preview`
  - `azd config validate` (não existe) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (não existem) → removidos

- **📚 Arquivos Atualizados com Correções de Comandos**:
  - `resources/cheat-sheet.md`: Grande reformulação da referência de comandos
  - `docs/deployment/deployment-guide.md`: Corrigidas estratégias de rollback e implantação
  - `docs/troubleshooting/debugging.md`: Seções de análise de logs corrigidas
  - `docs/troubleshooting/common-issues.md`: Comandos de solução de problemas atualizados
  - `docs/troubleshooting/ai-troubleshooting.md`: Seção de depuração do AZD corrigida
  - `docs/getting-started/azd-basics.md`: Comandos de monitoramento corrigidos
  - `docs/getting-started/first-project.md`: Exemplos de monitoramento e depuração atualizados
  - `docs/getting-started/installation.md`: Exemplos de ajuda e versão corrigidos
  - `docs/pre-deployment/application-insights.md`: Comandos de visualização de logs corrigidos
  - `docs/pre-deployment/coordination-patterns.md`: Comandos de depuração de agentes corrigidos

- **📝 Referência de Versão Atualizada**: 
  - `docs/getting-started/installation.md`: Alterada a versão fixa `1.5.0` para genérica `1.x.x` com link para releases

#### Alterado
- **Estratégias de Rollback**: Documentação atualizada para usar rollback baseado em Git (AZD não possui rollback nativo)
- **Visualização de Logs**: Referências a `azd logs` substituídas por `azd monitor --logs`, `azd monitor --live` e comandos do Azure CLI
- **Seção de Desempenho**: Removidos flags de implantação paralela/incremental inexistentes, fornecidas alternativas válidas

#### Detalhes Técnicos
- **Comandos AZD Válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidos do azd monitor**: `--live`, `--logs`, `--overview`
- **Recursos Removidos**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Observações
- **Verificação**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Conclusão do Workshop e Atualização da Qualidade da Documentação
**Esta versão conclui os módulos interativos do workshop, corrige todos os links quebrados da documentação e melhora a qualidade geral do conteúdo para desenvolvedores de IA que usam o Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes de contribuição com:
  - Instruções claras para relatar problemas e propor alterações
  - Padrões de documentação para novo conteúdo
  - Diretrizes de exemplos de código e convenções de mensagens de commit
  - Informações de engajamento da comunidade

#### Concluído
- **🎯 Módulo do Workshop 7 (Encerramento)**: Módulo de encerramento totalmente concluído com:
  - Resumo abrangente das realizações do workshop
  - Seção de conceitos-chave dominados cobrindo AZD, templates e Microsoft Foundry
  - Recomendações para continuidade da jornada de aprendizado
  - Exercícios desafiadores do workshop com classificações de dificuldade
  - Links de feedback da comunidade e suporte

- **📚 Módulo do Workshop 3 (Deconstruct)**: Objetivos de aprendizagem atualizados com:
  - Orientação para ativação do GitHub Copilot com servidores MCP
  - Entendimento da estrutura de pastas de templates AZD
  - Padrões de organização de Infrastructure-as-Code (Bicep)
  - Instruções de laboratório hands-on

- **🔧 Módulo do Workshop 6 (Teardown)**: Concluído com:
  - Objetivos de limpeza de recursos e gerenciamento de custos
  - Uso de `azd down` para desprovisionamento seguro da infraestrutura
  - Orientação para recuperação de serviços cognitivos soft-deleted
  - Prompts de exploração bônus para GitHub Copilot e Azure Portal

#### Corrigido
- **🔗 Correções de Links Quebrados**: Resolvidos mais de 15 links internos quebrados na documentação:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrigidos caminhos para microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigidos ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Substituído cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Corrigidos caminhos do FAQ e do guia de solução de problemas
  - `examples/container-app/microservices/README.md`: Corrigidos caminhos do course home e do deployment guide
  - `resources/faq.md` e `resources/glossary.md`: Atualizadas referências do capítulo de AI
  - `course-outline.md`: Corrigidos guias de instrutor e referências do laboratório do AI workshop

- **📅 Banner de Status do Workshop**: Atualizado de "Under Construction" para status ativo do workshop com data de fevereiro de 2026

- **🔗 Navegação do Workshop**: Corrigidos links de navegação quebrados no README.md do workshop apontando para a pasta lab-1-azd-basics inexistente

#### Alterado
- **Apresentação do Workshop**: Removido aviso "under construction", o workshop agora está completo e pronto para uso
- **Consistência de Navegação**: Garantido que todos os módulos do workshop tenham navegação inter-módulos apropriada
- **Referências do Caminho de Aprendizagem**: Atualizadas as referências cruzadas de capítulos para usar caminhos corretos do microsoft-foundry

#### Validado
- ✅ Todos os arquivos markdown em inglês têm links internos válidos
- ✅ Os módulos do workshop 0-7 estão completos com objetivos de aprendizagem
- ✅ A navegação entre capítulos e módulos funciona corretamente
- ✅ O conteúdo é adequado para desenvolvedores de IA usando Microsoft AZD
- ✅ Linguagem e estrutura amigáveis para iniciantes mantidas em todo o material
- ✅ CONTRIBUTING.md fornece orientações claras para contribuintes da comunidade

#### Implementação Técnica
- **Validação de Links**: Script automatizado em PowerShell verificou todos os links internos .md
- **Auditoria de Conteúdo**: Revisão manual da completude do workshop e adequação para iniciantes
- **Sistema de Navegação**: Padrões consistentes de navegação entre capítulos e módulos aplicados

#### Observações
- **Escopo**: Alterações aplicadas somente à documentação em inglês
- **Traduções**: Pastas de tradução não foram atualizadas nesta versão (tradução automatizada será sincronizada depois)
- **Duração do Workshop**: Workshop completo agora oferece 3-4 horas de aprendizado prático

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitoramento, Segurança e Padrões Multi-Agente
**Esta versão adiciona lições abrangentes de nível A sobre integração com Application Insights, padrões de autenticação e coordenação multi-agente para implantações de produção.**

#### Adicionado
- **📊 Lição de Integração com Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Implantação focada em AZD com provisionamento automático
  - Templates Bicep completos para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria personalizada (1.200+ linhas)
  - Padrões de monitoramento para AI/LLM (rastreio de tokens/custos de Microsoft Foundry Models)
  - 6 diagramas Mermaid (arquitetura, tracing distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alerts, dashboards, monitoramento de AI)
  - Exemplos de queries Kusto e estratégias de otimização de custos
  - Streaming de métricas ao vivo e depuração em tempo real
  - Tempo de aprendizado de 40–50 minutos com padrões prontos para produção

- **🔐 Lição de Padrões de Autenticação & Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (connection strings, Key Vault, managed identity)
  - Templates Bicep completos para infra segura
  - Código de aplicação Node.js com integração do Azure SDK
  - 3 exercícios completos (habilitar managed identity, user-assigned identity, rotação de Key Vault)
  - Melhores práticas de segurança e configurações RBAC
  - Guia de solução de problemas e análise de custos
  - Padrões prontos para produção de autenticação sem senha

- **🤖 Lição de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, orientado a eventos, consenso)
  - Implementação completa de serviço orquestrador (Python/Flask, 1.500+ linhas)
  - 3 implementações especializadas de agente (Research, Writer, Editor)
  - Integração com Service Bus para enfileiramento de mensagens
  - Gerenciamento de estado com Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interações entre agentes
  - 3 exercícios avançados (tratamento de timeout, lógica de retry, circuit breaker)
  - Análise de custos ($240–565/mês) com estratégias de otimização
  - Integração com Application Insights para monitoramento

#### Aprimorado
- **Capítulo Pre-deployment**: Agora inclui monitoramento abrangente e padrões de coordenação
- **Capítulo Getting Started**: Aprimorado com padrões profissionais de autenticação
- **Prontidão para Produção**: Cobertura completa de segurança a observabilidade
- **Currículo**: Atualizado para referenciar novas lições nos Capítulos 3 e 6

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de segurança e monitoramento ao longo do curso
- **Qualidade da Documentação**: Padrões consistentes de nível A (95–97%) nas novas lições
- **Padrões de Produção**: Cobertura completa ponta a ponta para implantações empresariais

#### Melhorado
- **Experiência do Desenvolvedor**: Caminho claro do desenvolvimento até o monitoramento em produção
- **Padrões de Segurança**: Padrões profissionais para autenticação e gerenciamento de segredos
- **Observabilidade**: Integração completa com Application Insights usando AZD
- **Workloads de IA**: Monitoramento especializado para Microsoft Foundry Models e sistemas multi-agente

#### Validado
- ✅ Todas as lições incluem código de trabalho completo (não apenas trechos)
- ✅ Diagramas Mermaid para aprendizagem visual (19 no total nas 3 lições)
- ✅ Exercícios práticos com passos de verificação (9 no total)
- ✅ Templates Bicep prontos para produção implantáveis via `azd up`
- ✅ Análise de custos e estratégias de otimização
- ✅ Guias de solução de problemas e melhores práticas
- ✅ Checkpoints de conhecimento com comandos de verificação

#### Resultados da Avaliação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia abrangente de monitoramento
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas multi-agente avançadas
- **Novo Conteúdo Geral**: - Padrões consistentes de alta qualidade

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria personalizada + tracing distribuído
- **Autenticação**: Managed Identity + Key Vault + padrões RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitoramento**: Métricas ao vivo + queries Kusto + alerts + dashboards
- **Gerenciamento de Custos**: Estratégias de sampling, políticas de retenção, controles de orçamento

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo de Microsoft Foundry Models
**Esta versão aprimora a qualidade da documentação em todo o repositório e adiciona um exemplo completo de implantação de Microsoft Foundry Models com interface de chat gpt-4.1.**

#### Adicionado
- **🤖 Exemplo de Chat com Microsoft Foundry Models**: Implantação completa gpt-4.1 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa de Microsoft Foundry Models (implantação do modelo gpt-4.1)
  - Interface de chat em linha de comando Python com histórico de conversas
  - Integração com Key Vault para armazenamento seguro de chaves de API
  - Rastreamento de uso de tokens e estimativa de custos
  - Rate limiting e tratamento de erros
  - README abrangente com guia de implantação de 35–45 minutos
  - 11 arquivos prontos para produção (templates Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Adicionados exercícios práticos ao guia de configuração:
  - Exercício 1: Configuração multi-ambiente (15 minutos)
  - Exercício 2: Prática de gerenciamento de segredos (10 minutos)
  - Critérios de sucesso claros e passos de verificação
- **✅ Verificação de Implantação**: Seção de verificação adicionada ao guia de implantação:
  - Procedimentos de health check
  - Checklist de critérios de sucesso
  - Saídas esperadas para todos os comandos de implantação
  - Referência rápida de solução de problemas

#### Aprimorado
- **examples/README.md**: Atualizado para qualidade A (93%):
  - Adicionado azure-openai-chat a todas as seções relevantes
  - Atualizado número de exemplos locais de 3 para 4
  - Adicionado à tabela de Exemplos de Aplicações de AI
  - Integrado ao Quick Start para Usuários Intermediários
  - Adicionado à seção de Microsoft Foundry Templates
  - Atualizada Matriz de Comparação e seções de levantamento de tecnologias
- **Qualidade da Documentação**: Melhoria de B+ (87%) → A- (92%) na pasta docs:
  - Adicionados outputs esperados a exemplos de comandos críticos
  - Incluídos passos de verificação para alterações de configuração
  - Aprendizagem prática aprimorada com exercícios aplicáveis

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de exemplos de IA para aprendizes intermediários
- **Estrutura da Documentação**: Exercícios mais acionáveis com resultados claros
- **Processo de Verificação**: Critérios explícitos de sucesso adicionados a fluxos de trabalho chave

#### Melhorado
- **Experiência do Desenvolvedor**: Implantação de Microsoft Foundry Models agora leva 35–45 minutos (vs 60–90 para alternativas complexas)
- **Transparência de Custos**: Estimativas claras de custo ($50–200/mês) para o exemplo Microsoft Foundry Models
- **Caminho de Aprendizado**: Desenvolvedores de IA têm ponto de entrada claro com azure-openai-chat
- **Padrões de Documentação**: Outputs esperados e passos de verificação consistentes

#### Validado
- ✅ Exemplo Microsoft Foundry Models totalmente funcional com `azd up`
- ✅ Todos os 11 arquivos de implementação sintaticamente corretos
- ✅ Instruções do README correspondem à experiência real de implantação
- ✅ Links da documentação atualizados em mais de 8 locais
- ✅ Índice de exemplos reflete corretamente 4 exemplos locais
- ✅ Nenhum link externo duplicado em tabelas
- ✅ Todas as referências de navegação corretas

#### Implementação Técnica
- **Arquitetura Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps
- **Segurança**: Pronto para Managed Identity, segredos no Key Vault
- **Monitoramento**: Integração com Application Insights
- **Gerenciamento de Custos**: Rastreamento de tokens e otimização de uso
- **Implantação**: Comando único `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Principal: Exemplos de Implantação com Container App
**Esta versão introduz exemplos abrangentes de implantação de aplicações containerizadas prontos para produção usando Azure Developer CLI (AZD), com documentação completa e integração ao caminho de aprendizagem.**

#### Adicionado
- **🚀 Exemplos de Container App**: Novos exemplos locais em `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Visão geral completa de implantações containerizadas, quick start, produção e padrões avançados
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com scale-to-zero, probes de health, monitoramento e solução de problemas
  - [Microservices Architecture](../../examples/container-app/microservices): Implantação multi-serviço pronta para produção (API Gateway, Product, Order, User, Notification), mensageria assíncrona, Service Bus, Cosmos DB, Azure SQL, tracing distribuído, deployment blue-green/canary
- **Melhores Práticas**: Segurança, monitoramento, otimização de custos e orientação de CI/CD para workloads containerizados
- **Exemplos de Código**: `azure.yaml` completo, templates Bicep e implementações de serviços em múltiplas linguagens (Python, Node.js, C#, Go)
- **Testes & Solução de Problemas**: Cenários de teste ponta a ponta, comandos de monitoramento, orientações de troubleshooting

#### Alterado
- **README.md**: Atualizado para destacar e linkar novos exemplos de container app em "Local Examples - Container Applications"
- **examples/README.md**: Atualizado para destacar exemplos de container app, adicionar entradas na matriz de comparação e atualizar referências de tecnologia/arquitetura
- **Course Outline & Study Guide**: Atualizados para referenciar novos exemplos de container app e padrões de implantação nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos são implantáveis com `azd up` e seguem as melhores práticas
- ✅ Cross-links e navegação da documentação atualizados
- ✅ Exemplos cobrem cenários do iniciante ao avançado, incluindo microserviços prontos para produção

#### Observações
- **Escopo**: Documentação e exemplos em inglês somente
- **Próximos Passos**: Expandir com padrões avançados adicionais de container e automação de CI/CD em lançamentos futuros

### [v3.5.0] - 2025-11-19

#### Rebranding do Produto: Microsoft Foundry
**Esta versão implementa uma mudança abrangente de nome de produto de "Microsoft Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**

#### Alterado
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Microsoft Foundry" para "Microsoft Foundry"
  - Atualizadas todas as referências na documentação em inglês na pasta `docs/`
  - Renomeada a pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Arquivo renomeado: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referências de conteúdo atualizadas em 7 arquivos de documentação

- **📁 Alterações na Estrutura de Pastas**:
  - `docs/ai-foundry/` renomeado para `docs/microsoft-foundry/`
  - Todas as referências cruzadas atualizadas para refletir a nova estrutura de pastas
  - Links de navegação validados em toda a documentação

- **📄 Renomeações de Arquivos**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos os links internos atualizados para referenciar o novo nome de arquivo

#### Arquivos Atualizados
- **Documentação por Capítulo** (7 arquivos):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações de links de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências ao nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já usando Microsoft Foundry (a partir de atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback da comunidade, documentação)
  - `docs/getting-started/azd-basics.md` - 4 links de referência cruzada atualizados
  - `docs/getting-started/first-project.md` - 2 links de navegação de capítulo atualizados
  - `docs/getting-started/installation.md` - 2 links do próximo capítulo atualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade no Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navegação atualizado
  - `docs/troubleshooting/debugging.md` - 1 link de navegação atualizado

- **Arquivos da Estrutura do Curso** (2 arquivos):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos de capítulos, seção de templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizagem, recursos dos capítulos)

#### Validado
- ✅ Zero referências restantes ao caminho de pasta "ai-foundry" nos documentos em inglês
- ✅ Zero referências restantes ao nome do produto "Microsoft Foundry" nos documentos em inglês
- ✅ Todos os links de navegação funcionais com a nova estrutura de pastas
- ✅ Renomeações de arquivos e pastas concluídas com sucesso
- ✅ Referências cruzadas entre capítulos validadas

#### Observações
- **Escopo**: Alterações aplicadas apenas à documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de tradução (`translations/`) não foram atualizadas nesta versão
- **Workshop**: Materiais do workshop (`workshop/`) não foram atualizados nesta versão
- **Exemplos**: Arquivos de exemplo podem ainda referenciar nomes legados (a serem tratados em atualização futura)
- **Links Externos**: URLs externas e referências ao repositório GitHub permanecem inalteradas

#### Guia de Migração para Colaboradores
Se você tiver branches locais ou documentação referenciando a estrutura antiga:
1. Atualize referências de pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualize referências de arquivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substitua o nome do produto: "Microsoft Foundry" → "Microsoft Foundry"
4. Valide se todos os links internos da documentação ainda funcionam

---

### [v3.4.0] - 2025-10-24

#### Aprimoramentos de Visualização de Infraestrutura e Validação
**Esta versão introduz suporte abrangente para o novo recurso de visualização do Azure Developer CLI e melhora a experiência dos usuários do workshop.**

#### Adicionado
- **🧪 azd provision --preview Documentação do Recurso**: Cobertura completa da nova capacidade de visualização de infraestrutura
  - Referência de comando e exemplos de uso no cheat sheet
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Integração de checagem pré-voo para validação de implantação mais segura
  - Atualizações no guia de primeiros passos com práticas de implantação com foco em segurança
- **🚧 Banner de Status do Workshop**: Banner HTML profissional indicando o status de desenvolvimento do workshop
  - Design em gradiente com indicadores de construção para comunicação clara ao usuário
  - Marca temporal de última atualização para transparência
  - Design responsivo para dispositivos móveis

#### Aprimorado
- **Segurança da Infraestrutura**: Funcionalidade de visualização integrada por toda a documentação de implantação
- **Validação Pré-Implantação**: Scripts automatizados agora incluem testes de visualização de infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comando atualizadas para incluir a visualização como prática recomendada
- **Experiência do Workshop**: Expectativas claras para os usuários sobre o status de desenvolvimento do conteúdo

#### Alterado
- **Melhores Práticas de Implantação**: Fluxo de trabalho com foco na visualização agora recomendado como abordagem
- **Fluxo da Documentação**: Validação da infraestrutura movida para etapas anteriores no processo de aprendizagem
- **Apresentação do Workshop**: Comunicação profissional do status com linha do tempo de desenvolvimento clara

#### Melhorado
- **Abordagem de Segurança em Primeiro Lugar**: Alterações de infraestrutura agora podem ser validadas antes da implantação
- **Colaboração em Equipe**: Resultados da visualização podem ser compartilhados para revisão e aprovação
- **Consciência de Custos**: Melhor compreensão dos custos de recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas de implantação por meio de validação antecipada

#### Implementação Técnica
- **Integração Multi-documento**: Recurso de visualização documentado em 4 arquivos principais
- **Padrões de Comando**: Sintaxe e exemplos consistentes em toda a documentação
- **Integração de Melhores Práticas**: Visualização incluída em fluxos de validação e scripts
- **Indicadores Visuais**: Marcação clara de recurso NOVO para descobribilidade

#### Infraestrutura do Workshop
- **Comunicação de Status**: Banner HTML profissional com estilo em gradiente
- **Experiência do Usuário**: Status de desenvolvimento claro evita confusão
- **Apresentação Profissional**: Mantém a credibilidade do repositório enquanto define expectativas
- **Transparência de Linha do Tempo**: Marca temporal de última atualização em outubro de 2025 para responsabilidade

### [v3.3.0] - 2025-09-24

#### Materiais de Workshop Aprimorados e Experiência de Aprendizado Interativa
**Esta versão introduz materiais de workshop abrangentes com guias interativos baseados em navegador e caminhos de aprendizado estruturados.**

#### Adicionado
- **🎥 Guia Interativo do Workshop**: Experiência de workshop baseada em navegador com capacidade de visualização MkDocs
- **📝 Instruções Estruturadas do Workshop**: Caminho de aprendizado guiado em 7 etapas, do descobrimento à customização
  - 0-Introduction: Visão geral do workshop e configuração
  - 1-Select-AI-Template: Descoberta e processo de seleção de templates
  - 2-Validate-AI-Template: Procedimentos de implantação e validação
  - 3-Deconstruct-AI-Template: Compreensão da arquitetura do template
  - 4-Configure-AI-Template: Configuração e customização
  - 5-Customize-AI-Template: Modificações avançadas e iterações
  - 6-Teardown-Infrastructure: Limpeza e gerenciamento de recursos
  - 7-Wrap-up: Resumo e próximos passos
- **🛠️ Ferramentas do Workshop**: Configuração MkDocs com o tema Material para melhor experiência de aprendizado
- **🎯 Caminho de Aprendizado Prático**: Metodologia em 3 etapas (Descoberta → Implantação → Customização)
- **📱 Integração com GitHub Codespaces**: Configuração fluida do ambiente de desenvolvimento

#### Aprimorado
- **Laboratório AI Workshop**: Ampliado com experiência de aprendizado estruturada de 2-3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e recursos visuais
- **Progressão de Aprendizado**: Orientação clara passo a passo da seleção do template até a implantação em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho de desenvolvimento otimizados

#### Melhorado
- **Acessibilidade**: Interface baseada em navegador com busca, funcionalidade de copiar e alternância de tema
- **Aprendizado Autônomo**: Estrutura flexível do workshop acomodando diferentes ritmos de aprendizado
- **Aplicação Prática**: Cenários reais de implantação de templates de IA
- **Integração com a Comunidade**: Integração com Discord para suporte e colaboração do workshop

#### Recursos do Workshop
- **Busca integrada**: Descoberta rápida por palavras-chave e lições
- **Copiar blocos de código**: Funcionalidade hover-to-copy para todos os exemplos de código
- **Alternador de tema**: Suporte a modo escuro/claro para diferentes preferências
- **Ativos visuais**: Capturas de tela e diagramas para compreensão aprimorada
- **Integração de ajuda**: Acesso direto ao Discord para suporte da comunidade

### [v3.2.0] - 2025-09-17

#### Reestruturação de Navegação e Sistema de Aprendizado por Capítulos
**Esta versão introduz uma estrutura abrangente de aprendizado por capítulos com navegação aprimorada em todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizado por Capítulos**: Reestruturado todo o curso em 8 capítulos progressivos de aprendizagem
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Sistema de Navegação Abrangente**: Cabeçalhos e rodapés de navegação consistentes em toda a documentação
- **🎯 Rastreamento de Progresso**: Checklist de conclusão do curso e sistema de verificação de aprendizado
- **🗺️ Orientação do Caminho de Aprendizado**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação por Referência Cruzada**: Capítulos relacionados e pré-requisitos claramente vinculados

#### Aprimorado
- **Estrutura do README**: Transformado em uma plataforma de aprendizagem estruturada com organização por capítulos
- **Navegação da Documentação**: Toda página agora inclui contexto do capítulo e orientação de progressão
- **Organização de Templates**: Exemplos e templates mapeados para capítulos de aprendizagem apropriados
- **Integração de Recursos**: Cheat sheets, FAQs e guias de estudo conectados aos capítulos relevantes
- **Integração do Workshop**: Laboratórios práticos mapeados para múltiplos objetivos de aprendizagem dos capítulos

#### Alterado
- **Progressão de Aprendizado**: Movida de documentação linear para aprendizado flexível por capítulos
- **Posicionamento da Configuração**: Guia de configuração reposicionado como Capítulo 3 para melhor fluxo de aprendizado
- **Integração de Conteúdo de IA**: Melhor integração de conteúdo específico de IA ao longo da jornada de aprendizagem
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para aprendizes corporativos

#### Melhorado
- **Experiência do Usuário**: Breadcrumbs de navegação claras e indicadores de progressão por capítulo
- **Acessibilidade**: Padrões de navegação consistentes para facilitar a travessia do curso
- **Apresentação Profissional**: Estrutura estilo universitário adequada para treinamento acadêmico e corporativo
- **Eficiência de Aprendizado**: Redução do tempo para encontrar conteúdo relevante por meio de melhor organização

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação de capítulo padronizada em mais de 40 arquivos de documentação
- **Navegação no Rodapé**: Orientação de progressão consistente e indicadores de conclusão de capítulo
- **Cross-Linking**: Sistema abrangente de links internos conectando conceitos relacionados
- **Mapeamento de Capítulos**: Templates e exemplos claramente associados aos objetivos de aprendizagem

#### Aprimoramento do Guia de Estudo
- **📚 Objetivos de Aprendizagem Abrangentes**: Guia de estudo reestruturado para alinhar com o sistema de 8 capítulos
- **🎯 Avaliação por Capítulo**: Cada capítulo inclui objetivos específicos de aprendizagem e exercícios práticos
- **📋 Rastreamento de Progresso**: Cronograma semanal de aprendizado com resultados mensuráveis e checklists de conclusão
- **❓ Questões de Avaliação**: Perguntas de validação de conhecimento para cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades práticas com cenários reais de implantação e solução de problemas
- **📊 Progressão de Habilidades**: Avanço claro de conceitos básicos a padrões empresariais com foco em desenvolvimento de carreira
- **🎓 Estrutura de Certificação**: Resultados de desenvolvimento profissional e sistema de reconhecimento da comunidade
- **⏱️ Gerenciamento de Linha do Tempo**: Plano de aprendizado estruturado de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Soluções de IA Multi-Agente Aprimoradas
**Esta versão melhora a solução multi-agente para varejo com melhor nomeação de agentes e documentação aprimorada.**

#### Alterado
- **Terminologia Multi-Agente**: Substituído "Cora agent" por "Customer agent" em toda a solução multi-agente de varejo para maior clareza
- **Arquitetura de Agentes**: Atualizada toda a documentação, templates ARM e exemplos de código para usar nomeação consistente "Customer agent"
- **Exemplos de Configuração**: Padronizados padrões de configuração de agentes com convenções de nome atualizadas
- **Consistência na Documentação**: Garantido que todas as referências usem nomes de agente profissionais e descritivos

#### Aprimorado
- **Pacote de Template ARM**: Atualizado retail-multiagent-arm-template com referências a Customer agent
- **Diagramas de Arquitetura**: Diagramas Mermaid atualizados com nomeação de agente revisada
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam CustomerAgent naming
- **Variáveis de Ambiente**: Atualizados todos os scripts de implantação para usar convenções CUSTOMER_AGENT_NAME

#### Melhorado
- **Experiência do Desenvolvedor**: Papéis e responsabilidades de agentes mais claros na documentação
- **Prontidão para Produção**: Melhor alinhamento com convenções de nomeação empresariais
- **Materiais de Aprendizado**: Nomeação de agente mais intuitiva para fins educacionais
- **Usabilidade de Templates**: Compreensão simplificada das funções dos agentes e padrões de implantação

#### Detalhes Técnicos
- Diagramas de arquitetura Mermaid atualizados com referências CustomerAgent
- Substituídas as classes CoraAgent por CustomerAgent em exemplos Python
- Modificadas as configurações JSON dos templates ARM para usar o tipo de agente "customer"
- Atualizadas variáveis de ambiente de CORA_AGENT_* para padrões CUSTOMER_AGENT_*
- Atualizados todos os comandos de implantação e configurações de contêiner

### [v3.0.0] - 2025-09-12

#### Grandes Mudanças - Foco no Desenvolvedor de IA e Integração com Microsoft Foundry
**Esta versão transforma o repositório em um recurso de aprendizado abrangente focado em IA com integração Microsoft Foundry.**

#### Adicionado
- **🤖 Caminho de Aprendizado AI-First**: Reestruturação completa priorizando desenvolvedores e engenheiros de IA
- **Guia de Integração Microsoft Foundry**: Documentação abrangente para conectar AZD aos serviços Microsoft Foundry
- **Padrões de Implantação de Modelos de IA**: Guia detalhado cobrindo seleção de modelos, configuração e estratégias de implantação em produção
- **AI Workshop Lab**: workshop prático de 2-3 horas para converter aplicações de IA em soluções implantáveis com AZD
- **Production AI Best Practices**: padrões prontos para empresas para escalar, monitorar e proteger cargas de trabalho de IA
- **AI-Specific Troubleshooting Guide**: guia abrangente de solução de problemas para Microsoft Foundry Models, Cognitive Services e problemas de implantação de IA
- **AI Template Gallery**: coleção destacada de templates do Microsoft Foundry com classificações de complexidade
- **Workshop Materials**: estrutura completa do workshop com laboratórios práticos e materiais de referência

#### Enhanced
- **README Structure**: focado em desenvolvedores de IA com 45% de dados de interesse da comunidade do Microsoft Foundry Discord
- **Learning Paths**: jornada dedicada para desenvolvedores de IA junto com trilhas tradicionais para estudantes e engenheiros DevOps
- **Template Recommendations**: templates de IA em destaque incluindo azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: suporte comunitário do Discord aprimorado com canais e discussões específicas de IA

#### Security & Production Focus
- **Managed Identity Patterns**: configurações de autenticação e segurança específicas para IA
- **Cost Optimization**: rastreamento de uso de tokens e controles de orçamento para cargas de trabalho de IA
- **Multi-Region Deployment**: estratégias para implantação global de aplicações de IA
- **Performance Monitoring**: métricas específicas de IA e integração com Application Insights

#### Documentation Quality
- **Linear Course Structure**: progressão lógica do iniciante a padrões avançados de implantação de IA
- **Validated URLs**: todos os links de repositórios externos verificados e acessíveis
- **Complete Reference**: todos os links de documentação interna validados e funcionais
- **Production Ready**: padrões de implantação corporativa com exemplos do mundo real

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: todas as páginas de documentação agora incluem seções de Introduction, Learning Goals e Learning Outcomes
- **Navigation System**: adicionados links de Previous/Next lesson em toda a documentação para progressão guiada de aprendizado
- **Study Guide**: study-guide.md abrangente com objetivos de aprendizagem, exercícios práticos e materiais de avaliação
- **Professional Presentation**: remoção de todos os ícones emoji para melhor acessibilidade e aparência profissional
- **Enhanced Content Structure**: organização e fluxo do material de aprendizagem aprimorados

#### Changed
- **Documentation Format**: padronização de toda a documentação com estrutura consistente voltada para o aprendizado
- **Navigation Flow**: implementação de progressão lógica através de todos os materiais de aprendizagem
- **Content Presentation**: remoção de elementos decorativos em favor de formatação clara e profissional
- **Link Structure**: atualização de todos os links internos para suportar o novo sistema de navegação

#### Improved
- **Accessibility**: remoção de dependências de emoji para melhor compatibilidade com leitores de tela
- **Professional Appearance**: apresentação limpa em estilo acadêmico adequada para aprendizado empresarial
- **Learning Experience**: abordagem estruturada com objetivos e resultados claros para cada lição
- **Content Organization**: melhor fluxo lógico e conexão entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Série completa de guias getting-started
  - Documentação abrangente de implantação e provisionamento
  - Recursos detalhados de solução de problemas e guias de depuração
  - Ferramentas e procedimentos de validação pré-implantação

- **Getting Started Module**
  - AZD Basics: conceitos e terminologia essenciais
  - Installation Guide: instruções de configuração específicas por plataforma
  - Configuration Guide: configuração de ambiente e autenticação
  - First Project Tutorial: aprendizado prático passo a passo

- **Deployment and Provisioning Module**
  - Deployment Guide: documentação completa do fluxo de trabalho
  - Provisioning Guide: Infrastructure as Code com Bicep
  - Melhores práticas para implantações em produção
  - Padrões de arquitetura multi-serviço

- **Pre-deployment Validation Module**
  - Capacity Planning: validação de disponibilidade de recursos do Azure
  - SKU Selection: orientação abrangente sobre níveis de serviço
  - Pre-flight Checks: scripts de validação automatizada (PowerShell e Bash)
  - Ferramentas de estimativa de custos e planejamento orçamentário

- **Troubleshooting Module**
  - Common Issues: problemas frequentemente encontrados e soluções
  - Debugging Guide: metodologias sistemáticas de solução de problemas
  - Técnicas e ferramentas avançadas de diagnóstico
  - Monitoramento de desempenho e otimização

- **Resources and References**
  - Command Cheat Sheet: referência rápida para comandos essenciais
  - Glossary: definições abrangentes de terminologia e siglas
  - FAQ: respostas detalhadas para perguntas comuns
  - Links de recursos externos e conexões comunitárias

- **Examples and Templates**
  - Exemplo de aplicação web simples
  - Template de implantação de site estático
  - Configuração de aplicação em container
  - Padrões de integração de banco de dados
  - Exemplos de arquitetura de microserviços
  - Implementações de funções serverless

#### Features
- **Multi-Platform Support**: guias de instalação e configuração para Windows, macOS e Linux
- **Multiple Skill Levels**: conteúdo projetado para estudantes até desenvolvedores profissionais
- **Practical Focus**: exemplos práticos e cenários do mundo real
- **Comprehensive Coverage**: dos conceitos básicos aos padrões empresariais avançados
- **Security-First Approach**: melhores práticas de segurança integradas ao longo do conteúdo
- **Cost Optimization**: orientações para implantações econômicas e gerenciamento de recursos

#### Documentation Quality
- **Detailed Code Examples**: exemplos de código práticos e testados
- **Step-by-Step Instructions**: orientações claras e acionáveis
- **Comprehensive Error Handling**: solução de problemas para questões comuns
- **Best Practices Integration**: padrões e recomendações da indústria
- **Version Compatibility**: atualizado com os serviços mais recentes do Azure e recursos do azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: padrões de integração para Hugging Face, Azure Machine Learning e modelos customizados
- **AI Agent Frameworks**: templates para LangChain, Semantic Kernel e implantações AutoGen
- **Advanced RAG Patterns**: opções de bancos de dados vetoriais além do Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: monitoramento aprimorado para desempenho de modelos, uso de tokens e qualidade de resposta

#### Developer Experience
- **VS Code Extension**: experiência de desenvolvimento integrada AZD + Microsoft Foundry no VS Code
- **GitHub Copilot Integration**: geração assistida por IA de templates AZD
- **Interactive Tutorials**: exercícios práticos de codificação com validação automática para cenários de IA
- **Video Content**: tutoriais em vídeo suplementares para aprendizes visuais focados em implantações de IA

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: governança de modelos de IA, conformidade e trilhas de auditoria
- **Multi-Tenant AI**: padrões para atender múltiplos clientes com serviços de IA isolados
- **Edge AI Deployment**: integração com Azure IoT Edge e instâncias de container
- **Hybrid Cloud AI**: padrões de implantação multi-cloud e híbrida para cargas de trabalho de IA

#### Advanced Features
- **AI Pipeline Automation**: integração MLOps com pipelines do Azure Machine Learning
- **Advanced Security**: padrões de zero-trust, endpoints privados e proteção avançada contra ameaças
- **Performance Optimization**: ajuste avançado e estratégias de escalonamento para aplicações de IA de alto throughput
- **Global Distribution**: padrões de entrega de conteúdo e cache de borda para aplicações de IA

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: integração abrangente com Microsoft Foundry (Concluído)
- ✅ **Interactive Tutorials**: workshop prático de IA (Concluído)
- ✅ **Advanced Security Module**: padrões de segurança específicos para IA (Concluído)
- ✅ **Performance Optimization**: estratégias de ajuste para cargas de trabalho de IA (Concluído)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: cenários de implantação com foco em IA (Concluído)
- ✅ **Extended FAQ**: perguntas e solução de problemas específicas de IA (Concluído)
- **Tool Integration**: guias aprimorados de integração com IDEs e editores
- ✅ **Monitoring Expansion**: monitoramento e padrões de alerta específicos de IA (Concluído)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: design responsivo para aprendizado em dispositivos móveis
- **Offline Access**: pacotes de documentação para download
- **Enhanced IDE Integration**: extensão do VS Code para fluxos de trabalho AZD + IA
- **Community Dashboard**: métricas comunitárias em tempo real e rastreamento de contribuições

## Contributing to the Changelog

### Reporting Changes
Ao contribuir com este repositório, por favor garanta que as entradas no changelog incluam:

1. **Version Number**: seguindo versionamento semântico (major.minor.patch)
2. **Date**: data de lançamento ou atualização no formato YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: descrição concisa do que mudou
5. **Impact Assessment**: como as mudanças afetam usuários existentes

### Change Categories

#### Added
- Novos recursos, seções de documentação ou capacidades
- Novos exemplos, templates ou recursos de aprendizado
- Ferramentas, scripts ou utilitários adicionais

#### Changed
- Modificações em funcionalidades ou documentação existentes
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Deprecated
- Recursos ou abordagens que estão sendo descontinuadas
- Seções de documentação programadas para remoção
- Métodos que têm alternativas melhores

#### Removed
- Recursos, documentação ou exemplos que não são mais relevantes
- Informações desatualizadas ou abordagens depreciadas
- Conteúdo redundante ou consolidado

#### Fixed
- Correções de erros na documentação ou código
- Resolução de problemas relatados
- Melhorias na precisão ou funcionalidade

#### Security
- Melhorias ou correções relacionadas à segurança
- Atualizações às melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Mudanças incompatíveis que requerem ação do usuário
- Reestruturação significativa de conteúdo ou organização
- Mudanças que alteram a abordagem ou metodologia fundamental

#### Minor Version (X.Y.0)
- Novos recursos ou adições de conteúdo
- Melhorias que mantêm compatibilidade retroativa
- Exemplos, ferramentas ou recursos adicionais

#### Patch Version (X.Y.Z)
- Correções de bugs e correções
- Melhorias menores no conteúdo existente
- Esclarecimentos e pequenos aprimoramentos

## Community Feedback and Suggestions

Incentivamos ativamente o feedback da comunidade para melhorar este recurso de aprendizado:

### How to Provide Feedback
- **GitHub Issues**: reporte problemas ou sugira melhorias (issues específicas de IA são bem-vindas)
- **Discord Discussions**: compartilhe ideias e envolva-se com a comunidade Microsoft Foundry
- **Pull Requests**: contribua com melhorias diretas no conteúdo, especialmente templates e guias de IA
- **Microsoft Foundry Discord**: participe do canal #Azure para discussões sobre AZD + IA
- **Community Forums**: participe de discussões mais amplas para desenvolvedores Azure

### Feedback Categories
- **AI Content Accuracy**: correções sobre integração e implantação de serviços de IA
- **Learning Experience**: sugestões para melhorar o fluxo de aprendizado para desenvolvedores de IA
- **Missing AI Content**: solicitações por templates, padrões ou exemplos adicionais de IA
- **Accessibility**: melhorias para necessidades de aprendizado diversas
- **AI Tool Integration**: sugestões para melhor integração do fluxo de trabalho de desenvolvimento com IA
- **Production AI Patterns**: solicitações de padrões de implantação de IA para empresas

### Response Commitment
- **Issue Response**: dentro de 48 horas para problemas relatados
- **Feature Requests**: avaliação dentro de uma semana
- **Community Contributions**: revisão dentro de uma semana
- **Security Issues**: prioridade imediata com resposta acelerada

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: revisão de precisão do conteúdo e validação de links
- **Quarterly Updates**: adições e melhorias principais de conteúdo
- **Semi-Annual Reviews**: reestruturação e aprimoramento abrangentes
- **Annual Releases**: atualizações de versão major com melhorias significativas

### Monitoring and Quality Assurance
- **Automated Testing**: validação regular de exemplos de código e links
- **Community Feedback Integration**: incorporação regular de sugestões de usuários
- **Technology Updates**: alinhamento com os serviços Azure mais recentes e lançamentos do azd
- **Accessibility Audits**: revisão regular para princípios de design inclusivo

## Version Support Policy

### Current Version Support
- **Latest Major Version**: suporte completo com atualizações regulares
- **Previous Major Version**: atualizações de segurança e correções críticas por 12 meses
- **Legacy Versions**: suporte pela comunidade apenas, sem atualizações oficiais

### Migration Guidance
Quando versões major forem lançadas, fornecemos:
- **Migration Guides**: instruções passo a passo para a transição
- **Compatibility Notes**: detalhes sobre mudanças incompatíveis
- **Tool Support**: scripts ou utilitários para auxiliar na migração
- **Community Support**: fóruns dedicados para perguntas sobre migração

---

**Navigation**
- **Previous Lesson**: [Guia de Estudo](resources/study-guide.md)
- **Next Lesson**: Retornar para [README Principal](README.md)

**Stay Updated**: Watch this repository for notifications about new releases and important updates to the learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->