# Changelog - AZD Para Iniciantes

## Introdução

Este changelog documenta todas as mudanças, atualizações e melhorias notáveis no repositório AZD Para Iniciantes. Seguimos os princípios de versionamento semântico e mantemos este registo para ajudar os utilizadores a compreender o que mudou entre versões.

## Objetivos de Aprendizagem

Ao rever este changelog, você irá:
- Manter-se informado sobre novas funcionalidades e adições de conteúdo
- Compreender as melhorias feitas na documentação existente
- Acompanhar correções de erros e correções para garantir a precisão
- Seguir a evolução dos materiais de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Após rever as entradas do changelog, você será capaz de:
- Identificar novo conteúdo e recursos disponíveis para aprendizagem
- Compreender quais secções foram atualizadas ou melhoradas
- Planear o seu percurso de aprendizagem com base nos materiais mais atuais
- Contribuir com feedback e sugestões para melhorias futuras

## Histórico de Versões

### [v3.22.0] - 2026-06-16

#### Preenchimento de Lacunas para Iniciantes #2: Criação de Templates, Contêineres de Desenvolvimento, Pulumi, Azure DevOps, Princípios de Serviço, e Mais
**Esta versão fecha as lacunas intermediárias restantes reveladas pela análise azd-coverage: como criar e publicar o seu próprio template, ambientes reproduzíveis de dev-container/Codespaces, o fornecedor de infraestrutura Pulumi, um walkthrough CI/CD do Azure DevOps, autenticação por princípio de serviço, orientação para seleção de hostes (AKS/Apps Spring), explicações de `azd restore`/`azd package`, tratamento de erros em hooks, e práticas de ambientes de equipa/partilhados.**

#### Adicionado
- **🧱 Nova lição do Capítulo 4** `docs/chapter-04-infrastructure/custom-templates.md` — criação do seu próprio template azd: estrutura requerida (`azure.yaml`, `infra/`, `src/`), o campo `metadata.template`, parametrização da infraestrutura com o token de recurso `uniqueString()` e a etiqueta `azd-env-name`, testes locais com `azd init --template <local-path>`, publicação no GitHub, e submissão para a galeria Awesome AZD
- **📦 Nova lição do Capítulo 1** `docs/chapter-01-foundation/dev-containers.md` — ambientes azd reproduzíveis com Dev Containers e GitHub Codespaces: um `.devcontainer/devcontainer.json` mínimo usando a feature oficial `ghcr.io/azure/azure-dev/azd`, features específicas de linguagem, `docker-in-docker` para hosts de contêiner, e `azd auth login --use-device-code` para login remoto
- **🧩 Pulumi com azd** seção em `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, organização de pastas Pulumi, stacks mapeados para ambientes azd, outputs/marcações requeridas, e o idêntico fluxo de trabalho `azd up` / `azd down`
- **🎯 Orientação para seleção de host** em `docs/chapter-04-infrastructure/provisioning.md` — uma comparação amigável para iniciantes entre `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` e `springapp`, com orientações sobre quando escolher AKS ou Azure Spring Apps
- **🛠️ Walkthrough CI/CD do Azure DevOps** em `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, conexão de serviço com federação de identidade de carga de trabalho (OIDC), o `azure-dev.yml` gerado, e configuração de grupos de variáveis
- **🔑 Princípios de Serviço (Padrão 4)** adicionado a `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` não interativo com segredo de cliente vs. credenciais federadas/OIDC, quando usar e armazenamento seguro de credenciais
- **🪝 Tratamento de erros em hooks** subseção em `docs/chapter-04-infrastructure/deployment-guide.md` — códigos de saída e `set -e`, `continueOnError`, teste de hooks isoladamente com `azd hooks run`, shells específicos para SO, e `--debug`
- **👥 Ambientes de equipa / partilhados** seção em `docs/chapter-03-configuration/configuration.md` — o que vive em `.azure/`, o que deve ser ignorado no git, ambientes por desenvolvedor, `azd env list`/`select`, e fornecer valores de ambiente em CI/CD
- **🧰 Explicações de `azd restore` e expansão de `azd package`** em `resources/cheat-sheet.md` — restaurar dependências e construir um artefato implantável sem implantar

#### Alterado
- **🧭 Tabela de lições do Capítulo 4** atualizada para incluir a nova lição "Criação do Seu Próprio Template" (Lição 3)
- **🧭 Tabela de lições do Capítulo 1** atualizada para incluir a nova lição "Dev Containers & Codespaces" (Lição 5); rodapés de navegação ligados entre `bring-your-own-app.md` e `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Preenchimento de Lacunas para Iniciantes: Lição Prática Multi-Agente, "Traga a Sua Própria App", Terraform e Walkthrough CI/CD
**Esta versão fecha as maiores lacunas para um guia completo para iniciantes adicionando duas novas lições práticas (um walkthrough de multi-agente implantável e adicionar azd a uma app existente), uma introdução amigável a hooks, uma seção Terraform com azd, um walkthrough passo-a-passo do pipeline GitHub Actions, uma explicação para as novas extensões preview, e uma checklist explícita de verificação de implantação.**

#### Adicionado
- **🤝 Nova lição do Capítulo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — um walkthrough totalmente prático e implantável com dois agentes (orquestrador + especialistas) usando um template real (`contoso-creative-writer`), cobrindo quando usar multi-agente, o fluxo `azd up`, compreensão dos recursos implantados, rastreamento entre agentes, personalização, e limpeza
- **📦 Nova lição do Capítulo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — como adicionar azd a um projeto existente com `azd init` ("usar código no diretório atual"), compreender `azure.yaml` e `infra/`, `azd infra generate`, deteção de host, e implantação com `azd up`
- **🌐 Terraform com azd** seção adicionada a `docs/chapter-04-infrastructure/provisioning.md` — config `infra.provider: terraform`, organização da pasta `.tf`, outputs `AZURE_*` requeridos e marcação `azd-env-name`, e o idêntico fluxo de trabalho `azd up` / `azd down` (fecha a lacuna onde era declarada a suporte a Terraform mas só era mostrado Bicep)
- **⚙️ Walkthrough passo a passo do GitHub Actions** em `docs/chapter-08-production/production-ai-practices.md` — do repositório GitHub às implantações automatizadas: `azd pipeline config`, credenciais federadas OIDC (sem segredos armazenados), o arquivo `azure-dev.yml` gerado, e orientação sobre segredos vs variáveis
- **🪝 Introdução para iniciantes "Novo em hooks?"** em `docs/chapter-04-infrastructure/deployment-guide.md` — o que é um hook, tabela de estágios de hook, um hook mínimo inicial, e execução manual de hooks com `azd hooks run`
- **✅ Checklist "Verifique a Sua Implantação"** adicionada ao Passo 5 de `docs/chapter-01-foundation/first-project.md` — teste básico, verificação de endpoint de estado, e critérios explícitos de sucesso
- **🧩 Explicação das novas extensões preview** `azure.ai.skills` e `azure.ai.connections` (o que são e quando usá-las) em `docs/chapter-08-production/production-ai-practices.md`

#### Alterado
- **🧭 Tabela de lições do Capítulo 5** corrigida: `multi-agent-basics.md` é agora a Lição 1 (a única lição totalmente prática), com rotulagem clara que a Lição 2 está no Capítulo 6 e o cenário Retail é um modelo de arquitetura, não um template de um comando
- **🧭 Tabela de lições do Capítulo 1** agora inclui a nova lição "Traga a Sua Própria App" (Lição 4)
- **🔗 Rodapés de navegação** atualizados: `first-project.md` agora liga em frente para `bring-your-own-app.md`

#### Corrigido
- **🧱 Fechada a lacuna "reclamada mas ausente" do Terraform** — o curso referenciava anteriormente o suporte a Terraform sem o mostrar
- **🔀 Corrigidos links cruzados enganosos do Capítulo 5** que sugeriam a existência de uma implementação completa multi-agente quando só havia um modelo de arquitetura

#### Ficheiros Atualizados
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

#### Atualização AZD 1.25.6, Comandos Completos de Ciclo de Vida do Agente & Rebranding Aspire
**Esta versão revalida o curso contra o `azd` `1.25.6` (Junho 2026) e a extensão preview `azure.ai.agents` `0.1.40-preview`, expande a orientação AI de "criar um agente" para o ciclo de vida completo do agente (testar → avaliar → otimizar → inspecionar → apagar), apresenta as novas extensões preview `azure.ai.skills` e `azure.ai.connections`, e nota o rebranding do produto ".NET Aspire" para simplesmente "Aspire".**

#### Adicionado
- **🔁 Cobertura completa do ciclo de vida do agente** para iniciantes e engenheiros de AI em toda a documentação:
  - `docs/chapter-01-foundation/azd-basics.md` — tabela do ciclo de vida (criar → testar → medir → melhorar → inspecionar → limpar) adicionada à secção Extensões e Comandos AI
  - `docs/chapter-08-production/production-ai-practices.md` — nova seção "Gestão do Ciclo de Vida do Agente" cobrindo `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` e `delete --force`
  - `resources/cheat-sheet.md` — comandos AI ampliados com `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` e `delete --force`
- **🧩 Novas extensões preview** documentadas: `azure.ai.skills` (competências reutilizáveis do agente) e `azure.ai.connections` (conexões Foundry) adicionadas à tabela de extensões e folha de dicas
- **⏱️ Orientação sobre tempos de resposta** — exemplos de `azd ai agent invoke` agora indicam que imprime latência total e tempo para o primeiro byte
- **📌 Banner de versão** no README principal apontando os aprendentes para `azd version` e `azd upgrade`

#### Alterado
- **✅ Linha base de validação atualizada** de `azd 1.23.12` (Março 2026) para `azd 1.25.6` (Junho 2026) em todos os READMEs dos capítulos e documentos do workshop
- **🤖 Nota de extensão do Capítulo 2** atualizada de `azure.ai.agents` `0.1.18-preview` para `0.1.40-preview`
- **🧪 Exemplo de validação do workshop** (`azd version` output) atualizado para `1.25.6`
- **🧭 README "Novidades no azd Hoje"** renovado para destacar o ciclo de vida completo do agente, novas extensões AI, e recentes correções de qualidade de vida (`azd init` idempotência, limpeza de token expirado em `azd auth login`, prompt de primeira execução em `azd tool`)
- **📖 Capítulo 2 agents.md (Opção 4)** agora direciona os aprendentes para comandos do ciclo de vida pós-implantação em vez de parar no `azd up`

#### Corrigido
- **🏷️ Nome do produto** — adicionada nota do rebranding Aspire (".NET Aspire" é agora simplesmente "Aspire"); suporte azd a Aspire permanece inalterado
- **🔎 Validação ao vivo da versão** confirmada contra o feed de lançamento do Azure Developer CLI: CLI estável `1.25.6` (2026-06-12) e `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Ficheiros Atualizados
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
#### Esclarecimento para Iniciação de Iniciantes, Validação de Configuração e Limpeza Final do Comando AZD
**Esta versão dá seguimento à verificação de validação do AZD 1.23 com uma revisão da documentação orientada para iniciantes: clarifica as orientações para autenticação preferencial ao AZD, adiciona scripts locais de validação de configuração, verifica os comandos principais contra o AZD CLI ao vivo e remove as últimas referências obsoletas de comandos na origem inglesa fora do changelog.**

#### Adicionado
- **🧪 Scripts de validação de configuração para iniciantes** com `validate-setup.ps1` e `validate-setup.sh` para os utilizadores confirmarem as ferramentas necessárias antes de começar o Capítulo 1
- **✅ Passos de validação da configuração antecipados** no README raiz e README do Capítulo 1 para detectar pré-requisitos em falta antes do `azd up`

#### Alterado
- **🔐 Orientação para autenticação de iniciantes** agora trata consistentemente `azd auth login` como o caminho principal para fluxos de trabalho AZD, com `az login` destacado como opcional a menos que comandos Azure CLI sejam usados diretamente
- **📚 Fluxo de iniciação do Capítulo 1** agora dirige os utilizadores a validar a configuração local antes dos passos de instalação, autenticação e primeiro deployment
- **🛠️ Mensagens do validador**param claramente os requisitos bloqueantes dos avisos opcionais do Azure CLI para o caminho AZD-only de iniciantes
- **📖 Documentação de configuração, resolução de problemas e exemplos** diferencia agora entre autenticação AZD obrigatória e login Azure CLI opcional onde ambas eram apresentadas previamente sem contexto

#### Corrigido
- **📋 Referências restantes em comandos na origem inglesa** atualizadas para formas AZD atuais, incluindo `azd config show` na folha de referência rápida e `azd monitor --overview` onde a orientação para visão geral do Azure Portal se pretendia
- **🧭 Ameaças para iniciantes no Capítulo 1** suavizadas para evitar promessas exageradas de comportamento garantido sem erros ou rollback em todos os templates e recursos Azure
- **🔎 Validação CLI ao vivo** confirmou suporte atual para `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` e `azd down --force --purge`

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

#### Validação AZD 1.23.12, Expansão do Ambiente do Workshop e Atualização do Modelo de IA
**Esta versão realiza uma verificação de validação da documentação contra `azd` `1.23.12`, atualiza exemplos de comandos AZD desatualizados, atualiza as orientações do modelo de IA para os padrões atuais e alarga as instruções do workshop para além do GitHub Codespaces, suportando também contentores de desenvolvimento e clones locais.**

#### Adicionado
- **✅ Notas de validação em capítulos principais e documentação do workshop** para tornar explícita a linha base AZD testada para utilizadores com versões CLI mais recentes ou antigas
- **⏱️ Orientação para timeout de deployments** para aplicações de IA de longa duração usando `azd deploy --timeout 1800`
- **🔎 Passos de inspeção de extensão** com `azd extension show azure.ai.agents` em documentação de fluxos de trabalho de IA
- **🌐 Orientação alargada para ambiente de workshop** cobrindo GitHub Codespaces, contentores de desenvolvimento e clones locais com MkDocs

#### Alterado
- **📚 README de introdução dos capítulos** agora indicam consistentemente a validação contra `azd 1.23.12` nas secções de fundação, configuração, infraestrutura, multi-agente, pré-deployment, resolução de problemas e produção
- **🛠️ Referências a comandos AZD** atualizadas para formas atuais em toda a documentação:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ou `azd env get-value(s)` dependendo do contexto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` onde se pretende visão geral do Application Insights
- **🧪 Exemplos de pré-visualização de provisionamento** simplificados para uso atual suportado, como `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Fluxo do workshop** atualizado para que os formandos possam completar os laboratórios em Codespaces, contentor de desenvolvimento ou clone local ao invés de presumir execução só em Codespaces
- **🔐 Orientação de autenticação** agora prefere `azd auth login` para fluxos AZD, com `az login` posicionado como opcional quando comandos Azure CLI são usados diretamente

#### Corrigido
- **🪟 Comandos de instalação no Windows** normalizados para casing atual do pacote `winget` no guia de instalação
- **🐧 Orientação de instalação no Linux** corrigida para evitar instruções do gestor de pacotes específicas de distro não suportadas para `azd` e em vez disso apontar para os assets das releases conforme apropriado
- **📦 Exemplos de modelos de IA** atualizados de padrões antigos como `gpt-35-turbo` e `text-embedding-ada-002` para exemplos atuais tais como `gpt-4.1-mini`, `gpt-4.1` e `text-embedding-3-large`
- **📋 Trechos de implementação e diagnóstico** corrigidos para uso correto de comandos de ambiente e estado atuais em logs, scripts e passos de troubleshooting
- **⚙️ Orientação GitHub Actions** atualizada de `Azure/setup-azd@v1.0.0` para `Azure/setup-azd@v2`
- **🤖 Orientação MCP/Copilot de consentimento** atualizada de `azd mcp consent` para `azd copilot consent list`

#### Melhorado
- **🧠 Orientação do capítulo de IA** explica melhor o comportamento sensível a pré-visualizações do `azd ai`, login específico de tenant, uso atual da extensão e recomendações atualizadas de deployment de modelos
- **🧪 Instruções do workshop** usam agora exemplos de versões mais realistas e linguagem de configuração de ambiente mais clara para laboratórios práticos
- **📈 Documentação de produção e troubleshooting** alinham melhor com os exemplos atuais de monitorização, fallback de modelo e escalão de custos

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

#### Comandos AZD AI CLI, Validação de Conteúdo e Expansão de Templates
**Esta versão adiciona cobertura dos comandos `azd ai`, `azd extension` e `azd mcp` em todos os capítulos relacionados com IA, corrige links quebrados e código obsoleto em agents.md, atualiza a folha de referência rápida e renova a secção de Exemplos de Templates com descrições validadas e novos templates AZD de Azure AI.**

#### Adicionado
- **🤖 Cobertura AZD AI CLI** em 7 ficheiros (anteriormente apenas no Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova secção "Extensões e Comandos AI" introduzindo `azd extension`, `azd ai agent init` e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opção 4: `azd ai agent init` com tabela comparativa (template vs abordagem manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subseções "Extensões AZD para Foundry" e "Deployment orientado por agente"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start agora mostra ambos os caminhos de deployment por template e por manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Secção de deployment agora inclui opção `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseção "Comandos AZD AI Extension para Diagnóstico"
  - `resources/cheat-sheet.md` — Nova secção "Comandos AI & Extensões" com `azd extension`, `azd ai agent init`, `azd mcp` e `azd infra generate`
- **📦 Novos templates de exemplo AZD AI** em `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET com Blazor WebAssembly, Semantic Kernel e suporte de chat por voz
  - **azure-search-openai-demo-java** — Chat RAG Java usando Langchain4J com opções ACA/AKS de deployment
  - **contoso-creative-writer** — App criativa multi-agente usando Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB com suporte local Ollama dev
  - **chat-with-your-data-solution-accelerator** — Acelerador empresarial RAG com portal de admin, integração Teams e opções PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — App de referência MCP multi-agente com servidores em .NET, Python, Java e TypeScript
  - **azd-ai-starter** — Template minimal Bicep de infraestrutura Azure AI para começar
  - **🔗 Link para Galeria incrível AZD AI** — Referência à [galeria awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (mais de 80 templates)

#### Corrigido
- **🔗 Navegação em agents.md**: Links Anterior/Seguinte agora correspondem à ordem das lições do README do Capítulo 2 (Integração Microsoft Foundry → Agents → Deployment modelo AI)
- **🔗 Links quebrados em agents.md**: `production-ai-practices.md` corrigido para `../chapter-08-production/production-ai-practices.md` (3 ocorrências)
- **📦 Código obsoleto em agents.md**: Substituído `opencensus` por `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API inválida em agents.md**: `max_tokens` movido de `create_agent()` para `create_run()` como `max_completion_tokens`
- **🔢 Contagem de tokens em agents.md**: Substituído cálculo aproximado `len//4` por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Serviços corrigidos de "Cognitive Search + App Service" para "Azure AI Search + Azure Container Apps" (host padrão mudou em Outubro 2024)
- **contoso-chat**: Descrição atualizada para referenciar Azure AI Foundry + Prompty, correspondendo ao título real do repositório e stack tecnológica

#### Removido
- **ai-document-processing**: Removida referência a template não funcional (repositório não acessível publicamente como template AZD)

#### Melhorado
- **📝 Exercícios em agents.md**: Exercício 1 agora mostra output esperado e passo `azd monitor`; Exercício 2 inclui código completo de registo do `FunctionTool`; Exercício 3 substitui instrução vaga por comandos concretos `prepdocs.py`
- **📚 Recursos em agents.md**: Links de documentação atualizados para documentação atual do Azure AI Agent Service e quickstart
- **📋 Tabela Next Steps em agents.md**: Adicionado link para AI Workshop Lab para cobertura completa do capítulo

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
**Esta versão melhora a navegação por capítulos no README.md com um formato de tabela aprimorado.**

#### Alterado
- **Tabela do Mapa do Curso**: Aprimorada com links diretos para as lições, estimativas de duração e classificações de complexidade
- **Limpeza de Pastas**: Removidas pastas antigas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validação de Links**: Todos os mais de 21 links internos na tabela do Mapa do Curso verificados

### [v3.16.0] - 2026-02-05

#### Atualizações de Nome de Produto
**Esta versão atualiza as referências de produtos para a atual marca Microsoft.**

#### Alterado
- **Microsoft Foundry → Microsoft Foundry**: Todas as referências atualizadas nos ficheiros que não são de tradução
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir a marca atual

#### Ficheiros Atualizados
- `README.md` - Página principal do curso
- `changelog.md` - Histórico de versões
- `course-outline.md` - Estrutura do curso
- `docs/chapter-02-ai-development/agents.md` - Guia de agentes de IA
- `examples/README.md` - Documentação de exemplos
- `workshop/README.md` - Página principal do workshop
- `workshop/docs/index.md` - Índice do workshop
- `workshop/docs/instructions/*.md` - Todos os ficheiros de instruções do workshop

---

### [v3.15.0] - 2026-02-05

#### Reestruturação Maior do Repositório: Nomes de Pastas por Capítulo
**Esta versão reestrutura a documentação em pastas dedicadas por capítulo, para uma navegação mais clara.**

#### Renomeação de Pastas
As pastas antigas foram substituídas por pastas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Adicionado novo: `docs/chapter-05-multi-agent/`

#### Migração de Ficheiros
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
| Todos os ficheiros de pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Todos os ficheiros de troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Adicionado
- **📚 Ficheiros README de Capítulo**: Criado README.md em cada pasta de capítulo com:
  - Objetivos de aprendizagem e duração
  - Tabela de lições com descrições
  - Comandos de início rápido
  - Navegação para outros capítulos

#### Alterado
- **🔗 Atualizados todos os links internos**: Mais de 78 caminhos atualizados em toda a documentação
- **🗺️ README.md principal**: Atualizado o Mapa do Curso com a nova estrutura por capítulos
- **📝 examples/README.md**: Atualizadas as referências cruzadas para pastas por capítulo

#### Removido
- Estrutura antiga de pastas (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestruturação do Repositório: Navegação por Capítulo
**Esta versão adicionou ficheiros README de navegação por capítulo (substituídos pela v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novo Guia de Agentes de IA
**Esta versão adiciona um guia completo para implantação de agentes de IA com Azure Developer CLI.**

#### Adicionado
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo que cobre:
  - O que são agentes de IA e como diferem dos chatbots
  - Três modelos rápidos de agentes para começar (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agentes (agente único, RAG, multi-agente)
  - Configuração e personalização de ferramentas
  - Monitorização e rastreamento de métricas
  - Considerações e otimizações de custos
  - Cenários comuns de resolução de problemas
  - Três exercícios práticos com critérios de sucesso

#### Estrutura do Conteúdo
- **Introdução**: Conceitos de agentes para principiantes
- **Início Rápido**: Implantar agentes com `azd init --template get-started-with-ai-agents`
- **Padrões de Arquitetura**: Diagramas visuais dos padrões de agentes
- **Configuração**: Configuração de ferramentas e variáveis de ambiente
- **Monitorização**: Integração com Application Insights
- **Exercícios**: Aprendizagem prática progressiva (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### Atualização do Ambiente DevContainer
**Esta versão atualiza a configuração do contêiner de desenvolvimento com ferramentas modernas e melhores predefinições para a experiência de aprendizagem AZD.**

#### Alterado
- **🐳 Imagem Base**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (Debian estável mais recente)
- **📛 Nome do Contêiner**: Renomeado de "Python 3" para "AZD for Beginners" para maior clareza

#### Adicionado
- **🔧 Novas Funcionalidades no Contêiner de Desenvolvimento**:
  - `azure-cli` com suporte ativado para Bicep
  - `node:20` (versão LTS para modelos AZD)
  - `github-cli` para gestão de templates
  - `docker-in-docker` para implantações de aplicações em contêiner

- **🔌 Encaminhamento de Portas**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (pré-visualização MkDocs)
  - 3000 (aplicações web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Novas Extensões VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python melhorado
  - `ms-azuretools.vscode-azurefunctions` - Suporte a Azure Functions
  - `ms-azuretools.vscode-docker` - Suporte a Docker
  - `ms-azuretools.vscode-bicep` - Suporte para linguagem Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestão de grupos de recursos Azure
  - `yzhang.markdown-all-in-one` - Edição Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - Suporte a YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualização Git
  - `mhutchie.git-graph` - Histórico Git

- **⚙️ Configurações VS Code**: Adicionadas configurações padrão para interpretador Python, formatação ao guardar e remoção de espaços em branco

- **📦 Requisitos Atualizados requirements-dev.txt**:
  - Adicionado plugin de minificação MkDocs
  - Adicionado pre-commit para qualidade do código
  - Adicionados pacotes Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigido
- **Comando Pós-Criação**: Agora verifica instalação do AZD e Azure CLI ao iniciar o contêiner

---

### [v3.11.0] - 2026-02-05

#### Reformulação do README para Iniciantes
**Esta versão melhora significativamente o README.md para ser mais acessível a iniciantes e adiciona recursos essenciais para desenvolvedores de IA.**

#### Adicionado
- **🆚 Comparação Azure CLI vs AZD**: Explicação clara de quando usar cada ferramenta com exemplos práticos
- **🌟 Links Awesome AZD**: Links diretos para galeria de templates comunitários e recursos de contributo:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Mais de 200 templates prontos para implantação
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Contributo comunitário
- **🎯 Guia de Início Rápido**: Secção simplificada de 3 passos para começar (Instalar → Entrar → Implantar)
- **📊 Tabela de Navegação Baseada em Experiência**: Orientação clara de onde começar consoante experiência do desenvolvedor

#### Alterado
- **Estrutura do README**: Reorganizada para divulgação progressiva - informações chave primeiro
- **Secção Introdução**: Reescrita para explicar "A Magia do `azd up`" para principiantes completos
- **Conteúdo Duplicado Removido**: Secção duplicada de resolução de problemas eliminada
- **Comandos para Resolução de Problemas**: Corrigida referência `azd logs` para usar `azd monitor --logs` válido

#### Corrigido
- **🔐 Comandos de Autenticação**: Adicionados `azd auth login` e `azd auth logout` em cheat-sheet.md
- **Referências a Comandos Inválidos**: Removidas referências restantes a `azd logs` na secção de resolução de problemas do README

#### Notas
- **Âmbito**: Alterações aplicadas ao README.md principal e resources/cheat-sheet.md
- **Público-Alvo**: Melhorias especificamente direcionadas a desenvolvedores novos no AZD

---

### [v3.10.0] - 2026-02-05

#### Atualização de Precisão nos Comandos Azure Developer CLI
**Esta versão corrige comandos AZD inexistentes na documentação, garantindo que todos os exemplos de código usam sintaxe válida do Azure Developer CLI.**

#### Corrigido
- **🔧 Comandos AZD Inexistentes Removidos**: Auditoria abrangente e correção de comandos inválidos:
  - `azd logs` (não existe) → substituído por `azd monitor --logs` ou alternativas Azure CLI
  - Subcomandos `azd service` (não existem) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (não existem) → removidos ou substituídos por alternativas válidas
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (não existem) → removidas
  - Flags `azd provision --what-if/--rollback` (não existem) → atualizadas para usar `--preview`
  - `azd config validate` (não existe) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (não existem) → removidos

- **📚 Ficheiros Atualizados com Correções de Comando**:
  - `resources/cheat-sheet.md`: Revisão completa da referência de comandos
  - `docs/deployment/deployment-guide.md`: Corrigidas estratégias de rollback e implantação
  - `docs/troubleshooting/debugging.md`: Corrigidas secções de análise de logs
  - `docs/troubleshooting/common-issues.md`: Atualizados comandos de resolução de problemas
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigida secção de debugging AZD
  - `docs/getting-started/azd-basics.md`: Comandos de monitorização corrigidos
  - `docs/getting-started/first-project.md`: Exemplos de monitorização e debugging atualizados
  - `docs/getting-started/installation.md`: Exemplos de ajuda e versão corrigidos
  - `docs/pre-deployment/application-insights.md`: Comandos de visualização de logs corrigidos
  - `docs/pre-deployment/coordination-patterns.md`: Comandos de debugging de agentes corrigidos

- **📝 Referência de Versão Atualizada**: 
  - `docs/getting-started/installation.md`: Versão hardcoded `1.5.0` alterada para genérica `1.x.x` com link para releases

#### Alterado
- **Estratégias de Rollback**: Documentação atualizada para usar rollback baseado em Git (AZD não tem rollback nativo)
- **Visualização de Logs**: Referências a `azd logs` substituídas por `azd monitor --logs`, `azd monitor --live` e comandos Azure CLI
- **Secção de Performance**: Flags de implantação paralela/incremental inexistentes removidos, fornecidas alternativas válidas

#### Detalhes Técnicos
- **Comandos AZD Válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags Válidas azd monitor**: `--live`, `--logs`, `--overview`
- **Funcionalidades Removidas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificação**: Comandos validados com Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Conclusão do Workshop e Atualização da Qualidade de Documentação
**Esta versão conclui os módulos interativos do workshop, corrige todos os links quebrados na documentação e melhora a qualidade geral do conteúdo para desenvolvedores de IA usando Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes para contribuições com:
  - Instruções claras para reportar problemas e propor alterações
  - Padrões de documentação para novos conteúdos

  - Diretrizes para exemplos de código e convenções de mensagens de commit
  - Informação sobre envolvimento da comunidade

#### Concluído
- **🎯 Módulo 7 do Workshop (Resumo Final)**: Módulo de resumo totalmente concluído com:
  - Resumo abrangente dos resultados do workshop
  - Secção de conceitos chave dominados cobrindo AZD, modelos e Microsoft Foundry
  - Recomendações para continuação da jornada de aprendizagem
  - Exercícios de desafio do workshop com avaliações de dificuldade
  - Feedback da comunidade e ligações para suporte

- **📚 Módulo 3 do Workshop (Desconstrução)**: Objetivos de aprendizagem atualizados com:
  - Orientação para ativação do GitHub Copilot com servidores MCP
  - Compreensão da estrutura de pastas dos templates AZD
  - Padrões de organização de infraestrutura como código (Bicep)
  - Instruções para laboratório prático

- **🔧 Módulo 6 do Workshop (Desmontagem)**: Concluído com:
  - Objetivos de limpeza de recursos e gestão de custos
  - Uso do `azd down` para desprovisionamento seguro da infraestrutura
  - Orientação para recuperação de serviços cognitivos apagados temporariamente
  - Sugestões de exploração extra para GitHub Copilot e Portal Azure

#### Corrigido
- **🔗 Correção de Ligações Quebradas**: Resolvidos mais de 15 links internos quebrados na documentação:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrigidos caminhos para microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigidos caminhos de ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Substituído cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Corrigidos caminhos para FAQ e guia de resolução de problemas
  - `examples/container-app/microservices/README.md`: Corrigidos caminhos para página inicial do curso e guia de implantação
  - `resources/faq.md` e `resources/glossary.md`: Atualizadas referências do capítulo de IA
  - `course-outline.md`: Corrigidos guias para instrutores e laboratórios do workshop de IA

- **📅 Banner de Estado do Workshop**: Atualizado de "Em Construção" para estado ativo do workshop com data de fevereiro de 2026

- **🔗 Navegação do Workshop**: Corrigidos links quebrados de navegação no README.md do workshop que apontavam para a pasta inexistente lab-1-azd-basics

#### Alterado
- **Apresentação do Workshop**: Removida a advertência de "em construção", workshop agora está completo e pronto para uso
- **Consistência de Navegação**: Garantida navegação adequada entre todos os módulos do workshop
- **Referências do Caminho de Aprendizagem**: Atualizadas referências cruzadas dos capítulos para usar caminhos corretos do microsoft-foundry

#### Validado
- ✅ Todos os ficheiros markdown em inglês têm links internos válidos
- ✅ Módulos 0-7 do workshop completos com objetivos de aprendizagem
- ✅ Navegação entre capítulos e módulos funciona corretamente
- ✅ Conteúdo adequado para desenvolvedores de IA que utilizam Microsoft AZD
- ✅ Linguagem e estrutura amigáveis para iniciantes mantidas em todo o conteúdo
- ✅ CONTRIBUTING.md fornece orientação clara para contribuintes da comunidade

#### Implementação Técnica
- **Validação de Links**: Script PowerShell automatizado verificou todos os links internos .md
- **Auditoria de Conteúdo**: Revisão manual da completude do workshop e adequação para iniciantes
- **Sistema de Navegação**: Aplicados padrões consistentes de navegação entre capítulos e módulos

#### Notas
- **Âmbito**: Alterações aplicadas apenas à documentação em inglês
- **Traduções**: Pastas de tradução não foram atualizadas nesta versão (tradução automática será sincronizada posteriormente)
- **Duração do Workshop**: Workshop completo oferece agora 3-4 horas de aprendizagem prática

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitorização, Segurança e Padrões Multi-Agente
**Esta versão adiciona lições abrangentes de grau A sobre integração do Application Insights, padrões de autenticação e coordenação multi-agente para implantações em produção.**

#### Adicionado
- **📊 Aula de Integração do Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Implantação focada no AZD com provisão automática
  - Templates completos Bicep para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria personalizada (mais de 1.200 linhas)
  - Padrões de monitorização AI/LLM (rastreio de tokens/custos dos Modelos Microsoft Foundry)
  - 6 diagramas Mermaid (arquitetura, rastreio distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, dashboards, monitorização AI)
  - Exemplos de queries Kusto e estratégias de otimização de custos
  - Streaming de métricas em tempo real e debug ao vivo
  - Tempo de aprendizagem de 40-50 minutos com padrões prontos para produção

- **🔐 Aula de Padrões de Autenticação & Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (strings de ligação, Key Vault, identidade gerida)
  - Templates completos Bicep para infraestrutura segura
  - Código de aplicação Node.js com integração Azure SDK
  - 3 exercícios completos (ativar identidade gerida, identidade atribuída a utilizador, rotação de Key Vault)
  - Melhores práticas de segurança e configurações RBAC
  - Guia de resolução de problemas e análise de custos
  - Padrões de autenticação sem palavra-passe prontos para produção

- **🤖 Aula de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, orientado a eventos, consenso)
  - Implementação completa de serviço orquestrador (Python/Flask, mais de 1.500 linhas)
  - 3 implementações especializadas de agentes (Pesquisa, Escritor, Editor)
  - Integração de Service Bus para enfileiramento de mensagens
  - Gestão de estado no Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interações de agentes
  - 3 exercícios avançados (gestão de timeouts, lógica de retry, circuit breaker)
  - Análise de custos ($240-565/mês) com estratégias de otimização
  - Integração Application Insights para monitorização

#### Melhorado
- **Capítulo Pré-implantação**: Agora inclui monitorização abrangente e padrões de coordenação
- **Capítulo Introdução**: Melhorado com padrões de autenticação profissionais
- **Prontidão para Produção**: Cobertura completa desde segurança até observabilidade
- **Cronograma do Curso**: Atualizado para referenciar novas lições nos Capítulos 3 e 6

#### Alterado
- **Progressão de Aprendizagem**: Melhor integração de segurança e monitorização no curso
- **Qualidade da Documentação**: Padrões consistentes de grau A (95-97%) nas novas lições
- **Padrões para Produção**: Cobertura completa fim a fim para implantações empresariais

#### Aperfeiçoado
- **Experiência do Desenvolvedor**: Caminho claro do desenvolvimento à monitorização em produção
- **Padrões de Segurança**: Padrões profissionais para autenticação e gestão de segredos
- **Observabilidade**: Integração completa do Application Insights com AZD
- **Cargas de Trabalho AI**: Monitorização especializada para Modelos Microsoft Foundry e sistemas multi-agente

#### Validado
- ✅ Todas as lições incluem código funcional completo (não fragmentos)
- ✅ Diagramas Mermaid para aprendizagem visual (19 no total em 3 lições)
- ✅ Exercícios práticos com passos de verificação (9 no total)
- ✅ Templates Bicep prontos para produção implantáveis via `azd up`
- ✅ Análise de custos e estratégias de otimização
- ✅ Guias de resolução de problemas e melhores práticas
- ✅ Checkpoints de conhecimento com comandos de verificação

#### Resultados da Avaliação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia abrangente de monitorização
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas multi-agente avançadas
- **Conteúdo Novo Geral**: - Padrões consistentes de alta qualidade

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria personalizada + rastreio distribuído
- **Autenticação**: Identidade Gerida + Key Vault + padrões RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitorização**: Métricas ao vivo + queries Kusto + alertas + dashboards
- **Gestão de Custos**: Estratégias de amostragem, políticas de retenção, controlos orçamentais

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo de Modelos Microsoft Foundry
**Esta versão melhora a qualidade da documentação em todo o repositório e adiciona um exemplo completo de implantação dos Modelos Microsoft Foundry com interface de chat gpt-4.1.**

#### Adicionado
- **🤖 Exemplo de Chat com Modelos Microsoft Foundry**: Implantação completa do gpt-4.1 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa dos Modelos Microsoft Foundry (implantação do modelo gpt-4.1)
  - Interface de chat Python em linha de comando com histórico de conversas
  - Integração com Key Vault para armazenamento seguro de chaves API
  - Rastreio de uso de tokens e estimativa de custos
  - Limitação de taxa e tratamento de erros
  - README abrangente com guia de implantação de 35-45 minutos
  - 11 ficheiros prontos para produção (templates Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Exercícios práticos adicionados ao guia de configuração:
  - Exercício 1: Configuração multi-ambiente (15 minutos)
  - Exercício 2: Prática de gestão de segredos (10 minutos)
  - Critérios claros de sucesso e passos de verificação
- **✅ Verificação da Implantação**: Seção de verificação adicionada ao guia de implantação:
  - Procedimentos de verificação de integridade
  - Checklist de critérios de sucesso
  - Resultados esperados para todos os comandos de implantação
  - Referência rápida para resolução de problemas

#### Melhorado
- **examples/README.md**: Atualizado para qualidade de grau A (93%):
  - Adicionado azure-openai-chat a todas as seções relevantes
  - Atualizado contador de exemplos locais de 3 para 4
  - Adicionado à tabela de Exemplos de Aplicações AI
  - Integrado no Quick Start para utilizadores intermédios
  - Adicionado à secção de Modelos Microsoft Foundry
  - Atualizadas matriz comparativa e secções tecnológicas

- **Qualidade da Documentação**: Melhorado de B+ (87%) para A- (92%) na pasta docs:
  - Adicionados resultados esperados a exemplos de comandos críticos
  - Incluídos passos de verificação para alterações de configuração
  - Aprendizagem prática enriquecida com exercícios

#### Alterado
- **Progressão de Aprendizagem**: Melhor integração de exemplos AI para utilizadores intermédios
- **Estrutura da Documentação**: Exercícios mais acionáveis com resultados claros
- **Processo de Verificação**: Critérios de sucesso explícitos adicionados a fluxos chave

#### Aperfeiçoado
- **Experiência do Desenvolvedor**: Implantação dos Modelos Microsoft Foundry agora demora 35-45 minutos (vs 60-90 para alternativas complexas)
- **Transparência de Custos**: Estimativas claras ($50-200/mês) para exemplo Microsoft Foundry Models
- **Caminho de Aprendizagem**: Desenvolvedores AI têm ponto de entrada claro com azure-openai-chat
- **Padrões de Documentação**: Resultados esperados e passos de verificação consistentes

#### Validado
- ✅ Exemplo dos Modelos Microsoft Foundry totalmente funcional com `azd up`
- ✅ Todos os 11 ficheiros de implementação sintaticamente corretos
- ✅ Instruções do README correspondem à experiência real de implantação
- ✅ Links de documentação atualizados em mais de 8 locais
- ✅ Índice de exemplos reflete corretamente 4 exemplos locais
- ✅ Nenhum link externo duplicado em tabelas
- ✅ Todas as referências de navegação corretas

#### Implementação Técnica
- **Arquitetura Modelos Microsoft Foundry**: gpt-4.1 + Key Vault + padrão Container Apps
- **Segurança**: Pronto para Identidade Gerida, segredos em Key Vault
- **Monitorização**: Integração Application Insights
- **Gestão de Custos**: Rastreio de tokens e otimização do uso
- **Implantação**: Comando único `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Principal: Exemplos de Implantação de Container App
**Esta versão introduz exemplos abrangentes de implantação de aplicações containerizadas prontas para produção usando Azure Developer CLI (AZD), com documentação completa e integração no percurso de aprendizagem.**

#### Adicionado
- **🚀 Exemplos de Container App**: Novos exemplos locais em `examples/container-app/`:
  - [Guia Mestre](examples/container-app/README.md): Visão geral completa de implantações containerizadas, início rápido, produção e padrões avançados
  - [API Flask Simples](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com escala para zero, sondas de estado, monitorização e resolução de problemas
  - [Arquitetura de Microsserviços](../../examples/container-app/microservices): Implantação multi-serviços pronta para produção (API Gateway, Produto, Encomenda, Utilizador, Notificação), mensagens assíncronas, Service Bus, Cosmos DB, Azure SQL, rastreio distribuído, implantação blue-green/canary
- **Melhores Práticas**: Segurança, monitorização, otimização de custos e orientação CI/CD para cargas containerizadas
- **Amostras de Código**: `azure.yaml` completo, templates Bicep e implementações multi-linguagem de serviços (Python, Node.js, C#, Go)
- **Testes e Resolução de Problemas**: Cenários de testes ponta a ponta, comandos de monitorização, guias de troubleshooting

#### Alterado
- **README.md**: Atualizado para apresentar e ligar aos novos exemplos de container app sob "Exemplos Locais - Aplicações Containerizadas"
- **examples/README.md**: Atualizado para destacar exemplos container app, adicionar entradas na matriz de comparação e atualizar referências tecnológicas/arquiteto
- **Outline do Curso & Guia de Estudo**: Atualizados para referenciar novos exemplos container app e padrões de implantação nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos implantáveis com `azd up` e seguirem melhores práticas
- ✅ Links cruzados e navegação da documentação atualizados
- ✅ Exemplos cobrem cenários do iniciantes ao avançados, incluindo microsserviços em produção

#### Notas
- **Âmbito**: Documentação e exemplos apenas em inglês
- **Próximos Passos**: Expansão com padrões avançados de container e automação CI/CD em futuras versões

### [v3.5.0] - 2025-11-19

#### Rebranding do Produto: Microsoft Foundry
**Esta versão implementa a alteração abrangente do nome do produto de "Microsoft Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**

#### Alterado
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Microsoft Foundry" para "Microsoft Foundry"
  - Atualizadas todas as referências em toda a documentação em inglês na pasta `docs/`
  - Pasta renomeada: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Ficheiro renomeado: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referências de conteúdo atualizadas em 7 ficheiros de documentação

- **📁 Alterações na Estrutura das Pastas**:
  - `docs/ai-foundry/` renomeada para `docs/microsoft-foundry/`
  - Todas as referências cruzadas atualizadas para refletir a nova estrutura das pastas
  - Links de navegação validados em toda a documentação

- **📄 Renomeação de Ficheiros**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos os links internos atualizados para referenciar o novo nome do ficheiro

#### Ficheiros Atualizados
- **Documentação dos Capítulos** (7 ficheiros):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações em links de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências ao nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já utiliza Microsoft Foundry (de atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback da comunidade, documentação)
  - `docs/getting-started/azd-basics.md` - 4 links de referências cruzadas atualizados
  - `docs/getting-started/first-project.md` - 2 links de navegação do capítulo atualizados
  - `docs/getting-started/installation.md` - 2 links para capítulo seguinte atualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navegação atualizado
  - `docs/troubleshooting/debugging.md` - 1 link de navegação atualizado

- **Ficheiros da Estrutura do Curso** (2 ficheiros):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos dos capítulos, secção de templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizagem, recursos dos capítulos)

#### Validado
- ✅ Nenhuma referência remanescente à pasta "ai-foundry" na documentação em inglês
- ✅ Nenhuma referência remanescente ao nome do produto "Microsoft Foundry" na documentação em inglês
- ✅ Todos os links de navegação funcionais com a nova estrutura das pastas
- ✅ Renomeações de ficheiros e pastas concluídas com sucesso
- ✅ Referências cruzadas entre capítulos validadas

#### Notas
- **Âmbito**: Alterações aplicadas apenas à documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de tradução (`translations/`) não atualizadas nesta versão
- **Workshop**: Materiais de workshop (`workshop/`) não atualizados nesta versão
- **Exemplos**: Ficheiros de exemplo podem ainda referenciar nomes legados (a tratar numa atualização futura)
- **Links Externos**: URLs externas e referências ao repositório GitHub mantidas inalteradas

#### Guia de Migração para Contribuidores
Se tiverem branches locais ou documentação que refira a estrutura antiga:
1. Atualizem as referências da pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualizem as referências dos ficheiros: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substituam o nome do produto: "Microsoft Foundry" → "Microsoft Foundry"
4. Validem que todos os links internos da documentação continuam a funcionar

---

### [v3.4.0] - 2025-10-24

#### Melhorias na Pré-visualização e Validação da Infraestrutura
**Esta versão introduz suporte abrangente para a nova funcionalidade de pré-visualização do Azure Developer CLI e melhora a experiência do utilizador no workshop.**

#### Adicionado
- **🧪 Documentação da funcionalidade azd provision --preview**: Cobertura completa da nova capacidade de pré-visualização da infraestrutura
  - Referência ao comando e exemplos de uso no resumo rápido
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Verificação pré-implementação para validação de implantação mais segura
  - Atualizações no guia de início rápido com práticas de implantação com foco na segurança
- **🚧 Banner de Estado do Workshop**: Banner HTML profissional indicando estado de desenvolvimento do workshop
  - Design em gradiente com indicadores de construção para comunicação clara ao utilizador
  - Timestamp da última atualização para transparência
  - Design responsivo para dispositivos móveis de todos os tipos

#### Melhorado
- **Segurança da Infraestrutura**: Função de pré-visualização integrada por toda a documentação de implantação
- **Validação Pré-implementação**: Scripts automatizados agora incluem testes de pré-visualização da infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir pré-visualização como prática recomendada
- **Experiência do Workshop**: Definição clara de expectativas para os utilizadores sobre o estado de desenvolvimento do conteúdo

#### Alterado
- **Melhores Práticas de Implantação**: Fluxo de trabalho com prioridade à pré-visualização agora recomendada
- **Fluxo da Documentação**: Validação de infraestrutura movida para etapas anteriores no processo de aprendizagem
- **Apresentação do Workshop**: Comunicação profissional do estado com cronograma claro de desenvolvimento

#### Melhorado
- **Abordagem com Prioridade à Segurança**: Alterações na infraestrutura podem agora ser validadas antes da implantação
- **Colaboração de Equipa**: Resultados da pré-visualização podem ser partilhados para revisão e aprovação
- **Consciência de Custos**: Melhor compreensão dos custos dos recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas de implantação através de validação antecipada

#### Implementação Técnica
- **Integração em Múltiplos Documentos**: Função de pré-visualização documentada em 4 ficheiros principais
- **Padrões de Comando**: Sintaxe e exemplos consistentes por toda a documentação
- **Integração de Melhores Práticas**: Pré-visualização incluída nos fluxos de validação e scripts
- **Indicadores Visuais**: Marcação clara de funcionalidade NOVA para melhor descoberta

#### Infraestrutura do Workshop
- **Comunicação de Estado**: Banner HTML profissional com estilo em gradiente
- **Experiência do Utilizador**: Estado de desenvolvimento claro evita confusão
- **Apresentação Profissional**: Mantém a credibilidade do repositório enquanto define expectativas
- **Transparência no Cronograma**: Timestamp da última atualização em outubro de 2025 para responsabilidade

### [v3.3.0] - 2025-09-24

#### Materiais do Workshop Aprimorados e Experiência de Aprendizagem Interativa
**Esta versão apresenta materiais abrangentes para workshop com guias interativos baseados no navegador e percursos de aprendizagem estruturados.**

#### Adicionado
- **🎥 Guia Interativo do Workshop**: Experiência do workshop baseada no navegador com capacidade de pré-visualização MkDocs
- **📝 Instruções Estruturadas para Workshop**: Percurso guiado de 7 passos desde descoberta até personalização
  - 0-Introdução: Panorama e configuração do workshop
  - 1-Selecionar-Template-AI: Descoberta e seleção de templates
  - 2-Validar-Template-AI: Procedimentos de implantação e validação
  - 3-Desconstruir-Template-AI: Compreensão da arquitetura do template
  - 4-Configurar-Template-AI: Configuração e personalização
  - 5-Personalizar-Template-AI: Modificações avançadas e iterações
  - 6-Desmontar-Infraestrutura: Limpeza e gestão de recursos
  - 7-Conclusão: Resumo e próximos passos
- **🛠️ Ferramentas para Workshop**: Configuração MkDocs com tema Material para melhor experiência de aprendizagem
- **🎯 Percurso de Aprendizagem Prático**: Metodologia de 3 passos (Descoberta → Implantação → Personalização)
- **📱 Integração com GitHub Codespaces**: Configuração fluida do ambiente de desenvolvimento

#### Melhorado
- **Laboratório de Workshop AI**: Estendido com experiência de aprendizagem estruturada de 2-3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e auxiliares visuais
- **Progressão na Aprendizagem**: Orientação passo a passo clara desde seleção de template até implantação em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho simplificados

#### Melhorado
- **Acessibilidade**: Interface baseada no navegador com funcionalidade de pesquisa, copiar e alternar temas
- **Aprendizagem Autodirigida**: Estrutura flexível para acomodar diferentes velocidades de aprendizagem
- **Aplicação Prática**: Cenários reais de implantação de templates AI
- **Integração Comunitária**: Integração Discord para suporte e colaboração no workshop

#### Funcionalidades do Workshop
- **Pesquisa Incorporada**: Descoberta rápida de palavras-chave e lições
- **Copiar Blocos de Código**: Funcionalidade "hover-to-copy" em todos os exemplos de código
- **Alternar Tema**: Suporte para modo claro/escuro conforme preferências
- **Ativos Visuais**: Capturas de ecrã e diagramas para melhor compreensão
- **Integração de Ajuda**: Acesso direto ao Discord para suporte da comunidade

### [v3.2.0] - 2025-09-17

#### Grande Reestruturação da Navegação e Sistema de Aprendizagem por Capítulos
**Esta versão introduz uma estrutura abrangente de aprendizagem baseada em capítulos com navegação melhorada em todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizagem Baseado em Capítulos**: Reorganização completa do curso em 8 capítulos progressivos
  - Capítulo 1: Fundamentos e Início Rápido (⭐ - 30-45 minutos)
  - Capítulo 2: Desenvolvimento AI-First (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração & Autenticação (⭐⭐ - 45-60 minutos)
  - Capítulo 4: Infraestrutura como Código & Implantação (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluções Multi-Agente AI (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação e Planeamento Pré-Implementação (⭐⭐ - 1 hora)
  - Capítulo 7: Resolução de Problemas & Debugging (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Padrões de Produção & Enterprise (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema Abrangente de Navegação**: Cabeçalhos e rodapés de navegação consistentes por toda a documentação
- **🎯 Acompanhamento do Progresso**: Lista de verificação para conclusão do curso e sistema de verificação de aprendizagem
- **🗺️ Orientação no Percurso de Aprendizagem**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação de Referências Cruzadas**: Capítulos relacionados e pré-requisitos claramente ligados

#### Melhorado
- **Estrutura README**: Transformada numa plataforma estruturada de aprendizagem com organização por capítulos
- **Navegação na Documentação**: Cada página inclui agora contexto do capítulo e orientação na progressão
- **Organização dos Templates**: Exemplos e templates mapeados para os capítulos de aprendizagem adequados
- **Integração de Recursos**: Resumos rápidos, FAQs e guias de estudo ligados aos capítulos relevantes
- **Integração do Workshop**: Laboratórios práticos mapeados para múltiplos objetivos dos capítulos

#### Alterado
- **Progressão da Aprendizagem**: Passagem da documentação linear para aprendizagem flexível baseada em capítulos
- **Colocação da Configuração**: Guia de configuração reposicionado como Capítulo 3 para melhor fluxo de aprendizagem
- **Integração de Conteúdo AI**: Melhor integração de conteúdo específico AI em toda a jornada de aprendizagem
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para alunos empresariais

#### Melhorado
- **Experiência do Utilizador**: Navegação clara com migalhas de pão e indicadores de progressão dos capítulos
- **Acessibilidade**: Padrões de navegação consistentes para facilitar o percurso no curso
- **Apresentação Profissional**: Estrutura tipo universitária adequada para formação académica e corporativa
- **Eficiência da Aprendizagem**: Redução do tempo para encontrar conteúdo relevante através de organização aprimorada

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação padronizada por capítulos em mais de 40 ficheiros de documentação
- **Navegação no Rodapé**: Orientação consistente para progressão e indicadores de conclusão de capítulos
- **Ligação Cruzada**: Sistema abrangente de links internos conectando conceitos relacionados
- **Mapeamento por Capítulos**: Templates e exemplos claramente associados a objetivos de aprendizagem

#### Aprimoramento do Guia de Estudo
- **📚 Objetivos de Aprendizagem Abrangentes**: Guia de estudo reestruturado para alinhar com o sistema de 8 capítulos
- **🎯 Avaliação Baseada nos Capítulos**: Cada capítulo inclui objetivos específicos e exercícios práticos
- **📋 Acompanhamento do Progresso**: Plano semanal de aprendizagem com resultados mensuráveis e listas de verificação de conclusão
- **❓ Perguntas de Avaliação**: Perguntas de validação do conhecimento para cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades práticas com cenários reais de implantação e resolução de problemas
- **📊 Progressão de Competências**: Avanço claro desde conceitos básicos a padrões empresariais com foco em desenvolvimento de carreira
- **🎓 Estrutura de Certificação**: Resultados de desenvolvimento profissional e sistema de reconhecimento comunitário
- **⏱️ Gestão de Cronograma**: Plano estruturado de aprendizagem de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Soluções Multi-Agente AI Aprimoradas
**Esta versão melhora a solução multi-agente de retalho com melhor nomeação dos agentes e documentação aprimorada.**

#### Alterado
- **Terminologia Multi-Agente**: Substituído "agente Cora" por "agente Cliente" em toda a solução multi-agente de retalho para maior clareza
- **Arquitetura do Agente**: Atualizada toda documentação, templates ARM e exemplos de código para usar nomenclatura consistente "agente Cliente"
- **Exemplos de Configuração**: Modernizados padrões de configuração do agente com convenções de nomeação atualizadas
- **Consistência da Documentação**: Garantido que todas as referências usam nomes profissionais e descritivos para os agentes

#### Melhorado
- **Pacote de Template ARM**: Atualizado retail-multiagent-arm-template com referências ao agente Cliente
- **Diagramas de Arquitetura**: Diagramas Mermaid atualizados com nomenclatura do agente atualizada
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam nomeação CustomerAgent
- **Variáveis de Ambiente**: Atualizados todos os scripts de implantação para usar convenções CUSTOMER_AGENT_NAME

#### Melhorado
- **Experiência do Desenvolvedor**: Funções e responsabilidades dos agentes mais claras na documentação
- **Preparação para Produção**: Melhor alinhamento com convenções de nomeação empresariais
- **Materiais de Aprendizagem**: Nomeação de agentes mais intuitiva para fins educacionais
- **Usabilidade dos Templates**: Facilidade de compreensão das funções dos agentes e padrões de implantação

#### Detalhes Técnicos
- Diagramas Mermaid atualizados com referências a CustomerAgent
- Nomes de classes CoraAgent substituídos por CustomerAgent em exemplos Python
- Configurações JSON do template ARM modificadas para usar tipo de agente "customer"
- Variáveis ambientais atualizadas de CORA_AGENT_* para CUSTOMER_AGENT_*
- Comandos de implantação e configurações de containers atualizados

### [v3.0.0] - 2025-09-12

#### Grandes Alterações - Foco no Desenvolvedor AI e Integração Microsoft Foundry
**Esta versão transforma o repositório num recurso de aprendizagem abrangente focado em AI com integração Microsoft Foundry.**

#### Adicionado
- **🤖 Percurso de Aprendizagem AI-First**: Reestruturação completa dando prioridade a desenvolvedores e engenheiros AI
- **Guia de Integração Microsoft Foundry**: Documentação completa para conectar AZD com serviços Microsoft Foundry
- **Padrões de Implantação de Modelos AI**: Guia detalhado cobrindo seleção, configuração e estratégias de implantação em produção
- **Laboratório de Workshop de IA**: Workshop prático de 2-3 horas para converter aplicações de IA em soluções implementáveis com AZD  
- **Melhores Práticas para IA em Produção**: Padrões prontos para empresas para escalamento, monitorização e segurança de cargas de trabalho de IA  
- **Guia de Resolução de Problemas Específico para IA**: Resolução de problemas abrangente para Modelos Microsoft Foundry, Serviços Cognitivos e questões de implementação de IA  
- **Galeria de Templates de IA**: Coleção destacada de templates Microsoft Foundry com classificações de complexidade  
- **Materiais do Workshop**: Estrutura completa do workshop com laboratórios práticos e materiais de referência  

#### Aprimorado  
- **Estrutura do README**: Focada em desenvolvedores de IA com 45% de dados de interesse da comunidade do Discord Microsoft Foundry  
- **Caminhos de Aprendizagem**: Jornada dedicada para desenvolvedores de IA junto aos caminhos tradicionais para estudantes e engenheiros DevOps  
- **Recomendações de Templates**: Templates de IA destacados incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart  
- **Integração Comunitária**: Suporte comunitário aprimorado no Discord com canais e discussões específicas para IA  

#### Foco em Segurança & Produção  
- **Padrões de Identidade Gerida**: Configurações de autenticação e segurança específicas para IA  
- **Otimização de Custos**: Monitorização do uso de tokens e controlo de orçamentos para cargas de trabalho de IA  
- **Implementação Multi-Região**: Estratégias para implementação global de aplicações de IA  
- **Monitorização de Performance**: Métricas específicas de IA e integração com Application Insights  

#### Qualidade da Documentação  
- **Estrutura Linear do Curso**: Progressão lógica desde padrões básicos a avançados de implementação de IA  
- **URLs Validadas**: Todos os links externos do repositório verificados e acessíveis  
- **Referência Completa**: Todos os links internos da documentação validados e funcionais  
- **Pronto para Produção**: Padrões empresariais de implementação com exemplos do mundo real  

### [v2.0.0] - 2025-09-09

#### Alterações Principais - Reestruturação do Repositório e Aprimoramento Profissional  
**Esta versão representa uma reformulação significativa da estrutura do repositório e da apresentação do conteúdo.**  

#### Adicionado  
- **Estrutura de Aprendizagem Estruturada**: Todas as páginas de documentação incluem agora Introdução, Objetivos de Aprendizagem e Resultados da Aprendizagem  
- **Sistema de Navegação**: Links de Aula Anterior/Próxima adicionados em toda a documentação para progressão guiada do aprendizado  
- **Guia de Estudo**: study-guide.md abrangente com objetivos de aprendizagem, exercícios práticos e materiais de avaliação  
- **Apresentação Profissional**: Remoção de todos os ícones emoji para melhorar acessibilidade e aparência profissional  
- **Estrutura de Conteúdo Aprimorada**: Organização e fluxo dos materiais de aprendizagem melhorados  

#### Alterado  
- **Formato da Documentação**: Padronização de toda a documentação com estrutura consistente focada no aprendizado  
- **Fluxo de Navegação**: Implementação de progressão lógica em todos os materiais de aprendizagem  
- **Apresentação do Conteúdo**: Remoção de elementos decorativos em favor de formatação clara e profissional  
- **Estrutura de Links**: Atualização de todos os links internos para suportar o novo sistema de navegação  

#### Melhorado  
- **Acessibilidade**: Remoção de dependências de emoji para melhor compatibilidade com leitores de ecrã  
- **Aparência Profissional**: Apresentação limpa e estilo académico adequada para aprendizagem empresarial  
- **Experiência de Aprendizagem**: Abordagem estruturada com objetivos claros e resultados definidos para cada aula  
- **Organização do Conteúdo**: Melhor fluxo lógico e conexão entre tópicos relacionados  

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório de Aprendizagem AZD Abrangente  

#### Adicionado  
- **Estrutura Central da Documentação**  
  - Série completa de guias de introdução  
  - Documentação abrangente para implementação e provisionamento  
  - Recursos detalhados de resolução de problemas e guias de debugging  
  - Ferramentas e procedimentos de validação pré-implementação  

- **Módulo de Introdução**  
  - AZD Básico: conceitos centrais e terminologia  
  - Guia de Instalação: instruções específicas para cada plataforma  
  - Guia de Configuração: preparação do ambiente e autenticação  
  - Tutorial do Primeiro Projeto: aprendizado prático passo a passo  

- **Módulo de Implementação e Provisionamento**  
  - Guia de Implementação: documentação completa do fluxo de trabalho  
  - Guia de Provisionamento: Infraestrutura como Código com Bicep  
  - Melhores práticas para implementações em produção  
  - Padrões de arquitetura multi-serviço  

- **Módulo de Validação Pré-Implementação**  
  - Planeamento de Capacidade: validação da disponibilidade de recursos Azure  
  - Seleção de SKU: orientação completa sobre níveis de serviço  
  - Checks Pré-voo: scripts de validação automatizados (PowerShell e Bash)  
  - Estimativa de custos e ferramentas de planeamento orçamental  

- **Módulo de Resolução de Problemas**  
  - Problemas Comuns: problemas enfrentados frequentemente e soluções  
  - Guia de Debugging: metodologias sistemáticas de resolução de problemas  
  - Técnicas avançadas de diagnóstico e ferramentas  
  - Monitorização e otimização de performance  

- **Recursos e Referências**  
  - Folha de Comandos: referência rápida para comandos essenciais  
  - Glossário: definições completas de terminologia e acrónimos  
  - FAQ: respostas detalhadas a questões frequentes  
  - Links para recursos externos e conexões comunitárias  

- **Exemplos e Templates**  
  - Exemplo de aplicação web simples  
  - Template para implementação de website estático  
  - Configuração de aplicação em containers  
  - Padrões de integração de base de dados  
  - Exemplos de arquitetura microservices  
  - Implementações de funções serverless  

#### Funcionalidades  
- **Suporte Multiplataforma**: guias de instalação e configuração para Windows, macOS, e Linux  
- **Níveis de Competência Variados**: conteúdo destinado desde estudantes a desenvolvedores profissionais  
- **Foco Prático**: exemplos práticos e cenários do mundo real  
- **Cobertura Abrangente**: desde conceitos básicos até padrões empresariais avançados  
- **Abordagem de Segurança Primeiro**: melhores práticas de segurança integradas em toda a documentação  
- **Otimização de Custos**: orientação para implementações e gestão de recursos de forma económica  

#### Qualidade da Documentação  
- **Exemplos Detalhados de Código**: amostras práticas e testadas  
- **Instruções Passo a Passo**: orientação clara e acionável  
- **Gestão Abrangente de Erros**: resolução de problemas comuns  
- **Integração de Melhores Práticas**: normas e recomendações do setor  
- **Compatibilidade de Versões**: atualizado com os serviços Azure mais recentes e funcionalidades azd  

## Melhorias Futuras Planeadas

### Versão 3.1.0 (Planeada)  
#### Expansão da Plataforma de IA  
- **Suporte Multi-Modelo**: padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados  
- **Frameworks para Agentes de IA**: templates para implementações LangChain, Semantic Kernel e AutoGen  
- **Padrões Avançados RAG**: opções de bases de dados vetoriais além do Azure AI Search (Pinecone, Weaviate, etc.)  
- **Observabilidade de IA**: monitorização avançada para desempenho de modelos, uso de tokens e qualidade de resposta  

#### Experiência do Desenvolvedor  
- **Extensão VS Code**: experiência de desenvolvimento integrada AZD + Microsoft Foundry  
- **Integração GitHub Copilot**: geração assistida por IA de templates AZD  
- **Tutoriais Interativos**: exercícios práticos com validação automatizada para cenários de IA  
- **Conteúdo em Vídeo**: tutoriais complementares para aprendizagem visual com foco em implementações de IA  

### Versão 4.0.0 (Planeada)  
#### Padrões Empresariais para IA  
- **Framework de Governança**: governança de modelos de IA, conformidade e auditorias  
- **IA Multi-Inquilino**: padrões para servir múltiplos clientes com serviços de IA isolados  
- **Implementação de IA em Edge**: integração com Azure IoT Edge e instâncias de containers  
- **IA em Cloud Híbrida**: padrões de implementação multi-cloud e híbrida para cargas de trabalho de IA  

#### Funcionalidades Avançadas  
- **Automação de Pipelines IA**: integração MLOps com pipelines do Azure Machine Learning  
- **Segurança Avançada**: padrões de zero-trust, endpoints privados e proteção avançada contra ameaças  
- **Otimização de Performance**: estratégias avançadas de ajuste e escalamento para aplicações IA de alto rendimento  
- **Distribuição Global**: padrões de entrega de conteúdo e cache de edge para aplicações de IA  

### Versão 3.0.0 (Planeada) - Substituída pela Versão Atual  
#### Adições Propostas - Agora Implementadas em v3.0.0  
- ✅ **Conteúdo Focado em IA**: integração abrangente com Microsoft Foundry (Concluído)  
- ✅ **Workshops Interativos**: laboratório prático de IA (Concluído)  
- ✅ **Módulo Avançado de Segurança**: padrões de segurança específicos para IA (Concluído)  
- ✅ **Otimização de Performance**: estratégias para cargas de trabalho IA (Concluído)  

### Versão 2.1.0 (Planeada) - Parcialmente Implementada em v3.0.0  
#### Melhorias Menores - Algumas Concluídas na Versão Atual  
- ✅ **Exemplos Adicionais**: cenários de implementação focados em IA (Concluído)  
- ✅ **FAQ Estendida**: perguntas e resolução específicas para IA (Concluído)  
- **Integração de Ferramentas**: guias aprimorados para integração em IDEs e editores  
- ✅ **Expansão de Monitorização**: padrões específicos de IA para monitorização e alertas (Concluído)  

#### Ainda Planeadas para Futuras Versões  
- **Documentação Mobile-Friendly**: design responsivo para aprendizagem móvel  
- **Acesso Offline**: pacotes de documentação descarregáveis  
- **Integração Avançada IDE**: extensão VS Code para workflows AZD + IA  
- **Dashboard Comunitário**: métricas em tempo real e monitorização de contribuições  

## Contribuir para o Changelog

### Reportar Alterações  
Ao contribuir para este repositório, assegure que as entradas do changelog incluem:  

1. **Número da Versão**: Conforme versionamento semântico (major.minor.patch)  
2. **Data**: Data do lançamento ou atualização no formato AAAA-MM-DD  
3. **Categoria**: Adicionado, Alterado, Obsoleto, Removido, Corrigido, Segurança  
4. **Descrição Clara**: Descrição sucinta das alterações efetuadas  
5. **Avaliação de Impacto**: Como as mudanças afetam os utilizadores existentes  

### Categorias de Alteração

#### Adicionado  
- Novas funcionalidades, secções de documentação ou capacidades  
- Exemplos, templates ou recursos de aprendizagem novos  
- Ferramentas adicionais, scripts ou utilitários  

#### Alterado  
- Modificações em funcionalidades ou documentação existentes  
- Atualizações para melhorar clareza ou precisão  
- Reestruturação de conteúdo ou organização  

#### Obsoleto  
- Funcionalidades ou abordagens que estão a ser descontinuadas  
- Secções da documentação programadas para remoção  
- Métodos que têm alternativas melhores  

#### Removido  
- Funcionalidades, documentação ou exemplos que já não são relevantes  
- Informação desatualizada ou abordagens obsoletas  
- Conteúdos redundantes ou consolidados  

#### Corrigido  
- Correções de erros na documentação ou código  
- Resolução de problemas reportados  
- Melhorias na precisão ou funcionalidade  

#### Segurança  
- Melhorias ou correções relacionadas com segurança  
- Atualizações das melhores práticas de segurança  
- Resolução de vulnerabilidades de segurança  

### Diretrizes para Versionamento Semântico

#### Versão Major (X.0.0)  
- Alterações rupturas que exigem ação dos utilizadores  
- Reestruturação significativa do conteúdo ou organização  
- Mudanças que alteram a abordagem ou metodologia fundamental  

#### Versão Minor (X.Y.0)  
- Novas funcionalidades ou adições de conteúdo  
- Melhorias que mantêm compatibilidade retroativa  
- Exemplos, ferramentas ou recursos adicionais  

#### Versão Patch (X.Y.Z)  
- Correção de bugs e erros  
- Melhorias menores em conteúdos existentes  
- Esclarecimentos e pequenas melhorias  

## Feedback e Sugestões da Comunidade

Incentivamos ativamente o feedback da comunidade para melhorar este recurso de aprendizagem:  

### Como Fornecer Feedback  
- **GitHub Issues**: Reportar problemas ou sugerir melhorias (questões específicas de IA são bem-vindas)  
- **Discussões no Discord**: Partilhar ideias e interagir com a comunidade Microsoft Foundry  
- **Pull Requests**: Contribuir melhorias diretas ao conteúdo, especialmente templates e guias de IA  
- **Discord Microsoft Foundry**: Participar no canal #Azure para discussões AZD + IA  
- **Fóruns Comunitários**: Participar em discussões amplas para desenvolvedores Azure  

### Categorias de Feedback  
- **Precisão do Conteúdo IA**: Correções em integração e informações de implementação de serviços de IA  
- **Experiência de Aprendizagem**: Sugestões para melhorar o fluxo de aprendizagem para desenvolvedores de IA  
- **Conteúdo IA em Falta**: Solicitações para templates, padrões ou exemplos adicionais de IA  
- **Acessibilidade**: Melhorias para necessidades de aprendizagem diversas  
- **Integração de Ferramentas IA**: Sugestões para melhor integração dos workflows de desenvolvimento de IA  
- **Padrões IA de Produção**: Pedidos de padrões empresariais para implementação de IA  

### Compromisso de Resposta  
- **Resposta a Issues**: Dentro de 48 horas para problemas reportados  
- **Pedidos de Funcionalidade**: Avaliação dentro de uma semana  
- **Contribuições Comunais**: Revisão dentro de uma semana  
- **Questões de Segurança**: Prioridade imediata com resposta acelerada  

## Calendário de Manutenção

### Atualizações Regulares  
- **Revisões Mensais**: Precisão do conteúdo e validação de links  
- **Atualizações Trimestrais**: Grandes adições e melhorias de conteúdo  
- **Revisões Semestrais**: Reestruturação ampla e aprimoramento  
- **Lançamentos Anuais**: Atualizações de versões maiores com melhorias significativas  

### Monitorização e Garantia de Qualidade  
- **Testes Automatizados**: Validação regular de exemplos de código e links  
- **Integração de Feedback Comunitário**: Incorporação regular de sugestões dos utilizadores  
- **Atualizações Tecnológicas**: Alinhamento com os serviços Azure e funcionalidades azd mais recentes  
- **Auditorias de Acessibilidade**: Revisão periódica para princípios de design inclusivo  

## Política de Suporte de Versões

### Suporte da Versão Atual  
- **Última Versão Major**: Suporte total com atualizações regulares  
- **Versão Major Anterior**: Atualizações de segurança e correções críticas por 12 meses  
- **Versões Legadas**: Suporte comunitário apenas, sem atualizações oficiais  

### Orientações para Migração  
Quando versões major são lançadas, fornecemos:  
- **Guias de Migração**: Instruções passo a passo para transição  
- **Notas de Compatibilidade**: Detalhes sobre alterações rupturas  
- **Suporte de Ferramentas**: Scripts ou utilitários para ajudar a migração  
- **Suporte Comunitário**: Fóruns dedicados para questões de migração  

---

**Navegação**  
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)  
- **Lição Seguinte**: Retornar ao [README Principal](README.md)  

**Mantenha-se Atualizado**: Siga este repositório para receber notificações sobre novos lançamentos e atualizações importantes dos materiais de aprendizagem.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->