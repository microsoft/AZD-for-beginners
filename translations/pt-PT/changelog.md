# Registo de Alterações - AZD Para Iniciantes

## Introdução

Este registo de alterações documenta todas as alterações, atualizações e melhorias notáveis no repositório AZD Para Iniciantes. Seguimos os princípios de versionamento semântico e mantemos este registo para ajudar os utilizadores a entender o que mudou entre versões.

## Objetivos de Aprendizagem

Ao rever este registo de alterações, você irá:
- Manter-se informado sobre novas funcionalidades e adições de conteúdo
- Compreender melhorias feitas na documentação existente
- Acompanhar correções de bugs e correções para garantir a precisão
- Seguir a evolução dos materiais de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Após rever as entradas do registo de alterações, será capaz de:
- Identificar novo conteúdo e recursos disponíveis para aprendizagem
- Compreender quais secções foram atualizadas ou melhoradas
- Planear o seu percurso de aprendizagem com base nos materiais mais atuais
- Contribuir com feedback e sugestões para futuras melhorias

## Histórico de Versões

### [v3.24.0]- 2026-11-04

#### Corrigido
- Reparada a navegação do curso em inglês, caminhos de páginas movidas, âncoras em falta e referências externas obsoletas, incluindo o link do Capítulo 2 para o guia de IA em produção.
- Revisada a orientação atual contra o AZD 1.37.2 publicado, agentes 1.0.0-beta.23, e avaliações 1.0.0-beta.2. Documentado o workflow separado `azd ai eval` e migração da configuração de otimização.
- Corrigidas flags CLI não suportadas, limites de autenticação, orientação para ambientes/segredos em texto plano, atualizações de infraestrutura, configuração de modelo e exemplos de recuperação destrutiva.
- Atualizado o workshop com a amostra atual de AI Agents, incluindo hooks reais, entradas de configuração, testes de avaliação, pontos de entrada para red-teaming e observabilidade.
- Corrigidas afirmações de implementação de exemplo e reparados problemas associados em aplicação/infraestrutura/configuração. Material da arquitetura de retalho explicitamente distinguido de uma aplicação completa e funcional.
- Restaurada a matriz de linguagens do CodeQL, selecionado Node.js 24 suportado para o container de desenvolvimento, e configurados validadores para reportar comandos de versão falhados.

#### Adicionado
- Um verificador offline só em inglês para links/âncoras, testes de regressão, e workflow de documentação que também constrói o workshop em modo estrito. Traduções geradas e imagens traduzidas estão excluídas.

#### Âmbito de validação
- Verificações de origem, sintaxe, configuração, comportamento local e ligações de rede não estabelecem a capacidade de implantação ao vivo no Azure, quota, RBAC, disponibilidade regional de modelos, faturação, conformidade de segurança ou prontidão para produção.
- Entradas mais antigas abaixo são registos históricos, não instruções atuais de comandos ou lançamentos.

### [v3.23.0] - 2026-07-13

#### Atualização de Moeda da Versão: Atualização de Refresco AZD 1.27.1
**Esta versão revalida o curso contra `azd` `1.27.1` (julho 2026, última versão estável) e a extensão de agente AI preview atual `azure.ai.agents` `1.0.0-beta.5`, atualizando todas as banners "validado contra" após os lançamentos 1.26.0, 1.27.0, e 1.27.1.**

#### Alterado
- **✅ Linha base de validação atualizada** de `azd 1.25.6` (junho 2026) para `azd 1.27.1` (julho 2026) no README raiz, todos os READMEs de capítulo, a lição do dev-container do Capítulo 1 (incluindo exemplos com versões fixadas), a lição de templates personalizados do Capítulo 4, a lição multi-agente do Capítulo 5 e documentação do workshop
- **🤖 Linha base do Capítulo 2 atualizada** de `azd 1.23.12` (março 2026) para `azd 1.27.1` através de `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` e `microsoft-foundry-integration.md`; datas da nota de validação atualizadas para 2026-07-13
- **🧩 Extensão de agente AI atualizada** de `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` para o lançamento atual `1.0.0-beta.5` no README do Capítulo 2 e `agents.md`
- **🧪 Exemplo de validação do workshop** (output `azd version`) atualizado para `1.27.1`

#### Notas sobre lançamentos relevantes azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Suporte Go para Azure Functions em Flex Consumption, filtros de subscrição por cliente `azd config sub-filter`, bundles de extensão autónomos (`azd x pack --bundle`) e `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelos de projetos/agentes Azure AI Foundry diretamente em `azure.yaml` (inicialização sem Bicep/Terraform), suporte a deploy de containers para App Service (`host: appservice` + `language: docker`), `-s/--source` direto para comandos `azd extension` e `azd tool uninstall`
- **1.27.1 (2026-07-09):** flag `--no-dependencies` para `azd extension install`, modelos descontinuados excluídos por defeito das indicações de catálogo/quota, e várias correções de bugs

#### Ficheiros Atualizados
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Preenchimento de Lacunas para Iniciantes #2: Autoria de Templates, Dev Containers, Pulumi, Azure DevOps, Service Principals e Mais
**Esta versão fecha as lacunas intermédias restantes apontadas pela análise azd-coverage: como criar e publicar o seu próprio template, ambientes reproducíveis de dev-container/Codespaces, o providenciador de infraestrutura Pulumi, um walkthrough CI/CD Azure DevOps, autenticação de service principal, orientação de seleção de anfitrião (AKS/Spring Apps), explicações `azd restore`/`azd package`, tratamento de erros de hooks, e práticas para ambientes partilhados/equipa.**

#### Adicionado
- **🧱 Nova lição no Capítulo 4** `docs/chapter-04-infrastructure/custom-templates.md` — criar o seu próprio template azd: estrutura requerida (`azure.yaml`, `infra/`, `src/`), o campo `metadata.template`, parametrização de infraestruturas com o token de recurso `uniqueString()` e etiqueta `azd-env-name`, testes locais com `azd init --template <local-path>`, publicar no GitHub e submeter à galeria Awesome AZD
- **📦 Nova lição no Capítulo 1** `docs/chapter-01-foundation/dev-containers.md` — ambientes azd reproducíveis com Dev Containers e GitHub Codespaces: um mínimo `.devcontainer/devcontainer.json` usando a funcionalidade oficial `ghcr.io/azure/azure-dev/azd`, funcionalidades específicas de linguagens, `docker-in-docker` para hosts de containers e `azd auth login --use-device-code` para login remoto
- **🧩 Secção Pulumi com azd** em `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, layout da pasta Pulumi, stacks mapeadas para ambientes azd, outputs/etiquetagem requerida, e o workflow idêntico `azd up` / `azd down`
- **🎯 Orientação para seleção de anfitrião** em `docs/chapter-04-infrastructure/provisioning.md` — comparação amigável para iniciantes entre `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` e `springapp`, com orientação sobre quando escolher AKS ou Azure Spring Apps
- **🛠️ Walkthrough CI/CD Azure DevOps** em `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, ligação de serviço com federação de identidade de workload (OIDC), `azure-dev.yml` gerado, e configuração de grupo de variáveis
- **🔑 Service Principals (Padrão 4)** adicionado em `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` não interativo com segredo cliente vs. credenciais federadas/OIDC, quando usar e armazenamento seguro de credenciais
- **🪝 Subsecção de tratamento de erros de hooks** em `docs/chapter-04-infrastructure/deployment-guide.md` — códigos de saída e `set -e`, `continueOnError`, testar hooks isolados com `azd hooks run`, shells específicos ao SO, e `--debug`
- **👥 Secção de ambientes partilhados/equipa** em `docs/chapter-03-configuration/configuration.md` — o que reside em `.azure/`, o que ignorar pelo git, ambientes por desenvolvedor, `azd env list`/`select`, e fornecer valores de ambiente no CI/CD
- **🧰 Explicações ampliadas ao `azd restore` e `azd package`** em `resources/cheat-sheet.md` — restaurar dependências e construir um artefacto para deploy sem efetuar o deploy

#### Alterado
- **🧭 Tabela das lições do Capítulo 4** atualizada para incluir a nova lição "Criar o Seu Próprio Template" (Lição 3)
- **🧭 Tabela das lições do Capítulo 1** atualizada para incluir a nova lição "Dev Containers & Codespaces" (Lição 5); rodapés de navegação interligados entre `bring-your-own-app.md` e `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Preenchimento de Lacunas para Iniciantes: Lição Prática Multi-Agente, "Traga a Sua Própria App," Terraform e Walkthrough CI/CD
**Esta versão fecha as maiores lacunas para um guia completo de iniciantes adicionando duas novas lições práticas (um walkthrough multi-agente implantável e adicionar azd a uma app existente), uma introdução amigável a hooks, uma secção Terraform com azd, um walkthrough passo a passo do pipeline GitHub Actions, explicação das novas extensões preview, e uma checklist explícita de verificação de implementações.**

#### Adicionado
- **🤝 Nova lição do Capítulo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — um walkthrough prático e implantável de dois agentes (orquestrador + especialistas) usando um template real (`contoso-creative-writer`), cobrindo quando usar multi-agente, o workflow `azd up`, compreensão dos recursos implantados, rastreamento entre agentes, personalização e limpeza
- **📦 Nova lição do Capítulo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — como adicionar azd a um projeto existente com `azd init` ("usar código no diretório atual"), compreender `azure.yaml` e `infra/`, `azd infra generate`, deteção de anfitrião e deploy com `azd up`
- **🌐 Secção Terraform com azd** adicionada em `docs/chapter-04-infrastructure/provisioning.md` — configuração `infra.provider: terraform`, layout da pasta `.tf`, outputs requeridos `AZURE_*` e etiquetagem `azd-env-name`, e o workflow idêntico `azd up` / `azd down` (fecha a lacuna onde suporte Terraform era afirmado mas só Bicep era mostrado)
- **⚙️ Walkthrough passo a passo do GitHub Actions** em `docs/chapter-08-production/production-ai-practices.md` — do repositório GitHub a deployments automáticos: `azd pipeline config`, credenciais federadas OIDC (sem segredos armazenados), `azure-dev.yml` gerado, e orientação sobre segredos vs. variáveis
- **🪝 Introdução para iniciantes "Novo em hooks?"** em `docs/chapter-04-infrastructure/deployment-guide.md` — o que é um hook, tabela de fases de hooks, primeiro hook mínimo e execução manual de hooks com `azd hooks run`
- **✅ Checklist "Verifique a Sua Implementação"** adicionada ao Passo 5 do `docs/chapter-01-foundation/first-project.md` — teste básico, verificação do endpoint de saúde e critérios explícitos de sucesso
- **🧩 Explicação das novas extensões preview** `azure.ai.skills` e `azure.ai.connections` (o que são e quando usá-las) em `docs/chapter-08-production/production-ai-practices.md`

#### Alterado
- **🧭 Tabela de lições do Capítulo 5** corrigida: `multi-agent-basics.md` é agora a Lição 1 (a única lição completamente prática), com rotulagem clara que a Lição 2 está no Capítulo 6 e que o cenário de Retalho é um plano de arquitetura, não um template de um comando
- **🧭 Tabela de lições do Capítulo 1** agora inclui a nova lição "Traga a Sua Própria App" (Lição 4)
- **🔗 Rodapés de navegação** atualizados: `first-project.md` agora aponta adiante para `bring-your-own-app.md`

#### Corrigido
- **🧱 Fechada a lacuna "afirmada mas em falta" do Terraform** — o curso anteriormente referia suporte a Terraform sem o demonstrarem
- **🔀 Corrigidos links cruzados enganosos no Capítulo 5** que implicavam que existia uma implementação multi-agente completa quando só havia um plano de arquitetura

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

#### Atualização AZD 1.25.6, Comandos Completos do Ciclo de Vida do Agente & Rebranding Aspire
**Esta versão revalida o curso contra `azd` `1.25.6` (Junho 2026) e a extensão `azure.ai.agents` `0.1.40-preview`, expande a orientação de IA de "estruturar um agente" para o ciclo de vida completo do agente (teste → avaliação → otimização → inspeção → eliminação), apresenta as novas prévias das extensões `azure.ai.skills` e `azure.ai.connections`, e nota o rebranding do produto ".NET Aspire" para "Aspire".**

#### Adicionado
- **🔁 Cobertura completa do ciclo de vida do agente** para iniciantes e engenheiros de IA em toda a documentação:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabela do ciclo de vida (estruturar → testar → medir → melhorar → inspecionar → limpar) adicionada à secção de Extensões e Comandos AI
  - `docs/chapter-08-production/production-ai-practices.md` — Nova secção "Gestão do Ciclo de Vida do Agente" cobrindo `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
  - `resources/cheat-sheet.md` — Comandos de Agente AI expandidos com `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
- **🧩 Novas extensões em pré-visualização** documentadas: `azure.ai.skills` (competências reutilizáveis do agente) e `azure.ai.connections` (ligações Foundry) adicionadas à tabela de extensões e folha de dicas
- **⏱️ Orientação sobre tempos de resposta** — exemplos `azd ai agent invoke` agora indicam que imprime latência total e tempo para o primeiro byte
- **📌 Banner de versão** no README raiz apontando os utilizadores para `azd version` e `azd upgrade`

#### Alterado
- **✅ Linha base de validação atualizada** de `azd 1.23.12` (Março 2026) para `azd 1.25.6` (Junho 2026) em todos os READMEs dos capítulos e documentação do workshop
- **🤖 Nota de extensão do Capítulo 2** atualizada de `azure.ai.agents` `0.1.18-preview` para `0.1.40-preview`
- **🧪 Exemplo de validação do workshop** (saída `azd version`) atualizado para `1.25.6`
- **🧭 README "Novidades em azd Hoje"** atualizado para destacar o ciclo de vida do agente de ponta a ponta, novas extensões AI, e recentes correções de qualidade de vida (`azd init` idempotência, `azd auth login` limpeza de token expirado, `azd tool` prompt de primeira execução)
- **📖 agentes.md do Capítulo 2 (Opção 4)** agora encaminha os utilizadores para os comandos do ciclo de vida pós-implantação em vez de parar em `azd up`

#### Corrigido
- **🏷️ Nomeação de produto** — adicionada nota sobre o rebranding Aspire (".NET Aspire" é agora simplesmente "Aspire"); o suporte azd para Aspire mantém-se inalterado
- **🔎 Validação da versão ao vivo** confirmada contra o feed de lançamento do Azure Developer CLI: CLI estável `1.25.6` (2026-06-12) e `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Esclarecimento para Iniciantes, Validação da Configuração & Limpeza Final de Comandos AZD
**Esta versão segue a varredura de validação AZD 1.23 com uma passagem de documentação focada em iniciantes: esclarece a orientação de autenticação AZD em primeiro lugar, adiciona scripts de validação da configuração local, verifica comandos chave contra o CLI AZD ao vivo, e remove as últimas referências obsoletas em inglês de comandos fora do changelog.**

#### Adicionado
- **🧪 Scripts de validação de configuração para iniciantes** com `validate-setup.ps1` e `validate-setup.sh` para que os utilizadores confirmem as ferramentas necessárias antes de iniciar o Capítulo 1
- **✅ Passos de validação inicial da configuração** no README raiz e README do Capítulo 1 para que as pré-requisitos em falta sejam detetados antes de `azd up`

#### Alterado
- **🔐 Orientação de autenticação para iniciantes** trata agora consistentemente `azd auth login` como caminho principal para fluxos de trabalho AZD, com `az login` destacado como opcional, a menos que os comandos Azure CLI sejam usados diretamente
- **📚 Fluxo de integração do Capítulo 1** agora encaminha os utilizadores para validar a sua configuração local antes da instalação, autenticação e primeiros passos de implantação
- **🛠️ Mensagens do validador** agora separam claramente requisitos que bloqueiam de avisos opcionais da Azure CLI para o caminho AZD apenas para iniciantes
- **📖 Configuração, resolução de problemas e documentação de exemplo** distinguem agora entre autenticação AZD obrigatória e início de sessão opcional na Azure CLI onde anteriormente ambos eram apresentados sem contexto

#### Corrigido
- **📋 Referências restantes a comandos em inglês** atualizadas para as formas atuais de AZD, incluindo `azd config show` na folha de dicas e `azd monitor --overview` onde se pretendia orientação sobre Visão Geral no Portal Azure
- **🧭 Afirmações para iniciantes no Capítulo 1** suavizadas para evitar promessas excessivas de comportamento sem erro garantido ou rollback em todos os modelos e recursos Azure
- **🔎 Validação ao vivo do CLI** confirmada para suporte atual de `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, e `azd down --force --purge`

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
**Esta versão realiza uma varredura de validação da documentação contra `azd` `1.23.12`, atualiza exemplos de comandos AZD obsoletos, refresca a orientação do modelo AI para os valores predefinidos atuais, e alarga as instruções do workshop para além do GitHub Codespaces para também suportar contentores de desenvolvimento e clones locais.**

#### Adicionado
- **✅ Notas de validação em capítulos principais e documentação do workshop** para explicitar a linha base AZD testada para utilizadores com versões mais novas ou mais antigas do CLI
- **⏱️ Orientações sobre timeout de implantação** para implantações de aplicações AI de longa duração usando `azd deploy --timeout 1800`
- **🔎 Passos de inspeção de extensões** com `azd extension show azure.ai.agents` na documentação do fluxo de trabalho AI
- **🌐 Orientações mais abrangentes do ambiente do workshop** cobrindo GitHub Codespaces, contentores de desenvolvimento e clones locais com MkDocs

#### Alterado
- **📚 READMEs de introdução dos capítulos** agora indicam consistentemente a validação contra `azd 1.23.12` em secções de base, configuração, infraestrutura, multi-agente, pré-implantação, resolução de problemas e produção
- **🛠️ Referências a comandos AZD** atualizadas para formas atuais em toda a documentação:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ou `azd env get-value(s)` dependendo do contexto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` onde se pretende uma visão geral do Application Insights
- **🧪 Exemplos de pré-visualização de provisionamento** simplificados para uso atualmente suportado como `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Fluxo do workshop** atualizado para que os utilizadores possam concluir os laboratórios em Codespaces, num contentor de desenvolvimento ou num clone local em vez de assumir execução exclusiva em Codespaces
- **🔐 Orientação de autenticação** agora prefere `azd auth login` para fluxos de trabalho AZD, com `az login` posicionado como opcional quando comandos Azure CLI são usados diretamente

#### Corrigido
- **🪟 Comandos de instalação Windows** normalizados para a caixa atual do pacote `winget` no guia de instalação
- **🐧 Orientação de instalação Linux** corrigida para evitar instruções de gestor de pacotes específicas da distro não suportadas `azd` e em vez disso apontar para os assets de lançamento onde apropriado
- **📦 Exemplos de modelos AI** atualizados de predefinições mais antigas como `gpt-35-turbo` e `text-embedding-ada-002` para exemplos atuais como `gpt-4.1-mini`, `gpt-4.1`, e `text-embedding-3-large`
- **📋 Fragmentos de implantação e diagnóstico** corrigidos para usar comandos atuais de ambiente e estado em logs, scripts e passos de resolução de problemas
- **⚙️ Orientação para GitHub Actions** atualizada de `Azure/setup-azd@v1.0.0` para `Azure/setup-azd@v2`
- **🤖 Orientação de consentimento MCP/Copilot** atualizada de `azd mcp consent` para `azd copilot consent list`

#### Melhorado
- **🧠 Orientação do capítulo AI** agora explica melhor o comportamento sensível a pré-visualização `azd ai`, login específico de inquilino, uso atual da extensão, e recomendações atualizadas de implantação de modelos
- **🧪 Instruções do workshop** usam agora exemplos de versão mais realistas e linguagem de configuração do ambiente mais clara para laboratórios práticos
- **📈 Documentação de produção e resolução de problemas** agora está mais alinhada com exemplos atuais de monitorização, modelo de fallback e níveis de custo

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

#### Comandos AZD AI CLI, Validação de Conteúdo & Expansão de Modelos
**Esta versão adiciona cobertura de comandos `azd ai`, `azd extension`, e `azd mcp` em todos os capítulos relacionados com AI, corrige links quebrados e código obsoleto em agents.md, atualiza a folha de dicas, e reforma a secção de Modelos de Exemplo com descrições validadas e novos modelos Azure AI AZD.**

#### Adicionado
- **🤖 Cobertura AZD AI CLI** em 7 ficheiros (anteriormente apenas no Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova secção "Extensões e Comandos AI" introduzindo `azd extension`, `azd ai agent init`, e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opção 4: `azd ai agent init` com tabela de comparação (modelo vs abordagem de manifesto)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subseções "Extensões AZD para Foundry" e "Implantação com o Agente Primeiro"
  - `docs/chapter-05-multi-agent/README.md` — Início rápido agora mostra ambos os caminhos de implantação baseados em modelo e manifesto
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Secção de implantação agora inclui opção `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseção "Comandos de Extensão AZD AI para Diagnóstico"
  - `resources/cheat-sheet.md` — Nova secção "Comandos AI & Extensões" com `azd extension`, `azd ai agent init`, `azd mcp`, e `azd infra generate`
- **📦 Novos modelos de exemplo AZD AI** em `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET com Blazor WebAssembly, Semantic Kernel, e suporte de chat por voz
  - **azure-search-openai-demo-java** — Chat RAG Java usando Langchain4J com opções de implantação ACA/AKS
  - **contoso-creative-writer** — Aplicação de escrita criativa multiagente usando Azure AI Agent Service, Bing Grounding, e Prompty
  - **serverless-chat-langchainjs** — RAG sem servidor usando Azure Functions + LangChain.js + Cosmos DB com suporte local de desenvolvimento Ollama
  - **chat-with-your-data-solution-accelerator** — Acelerador RAG empresarial com portal de administração, integração com Teams e opções PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicação de referência para orquestração MCP multi-agente com servidores em .NET, Python, Java e TypeScript
  - **azd-ai-starter** — Template inicial mínimo Bicep para infraestrutura Azure AI
  - **🔗 Awesome AZD AI Gallery link** — Referência à [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Corrigido
- **🔗 agents.md navigation**: Os links Anterior/Seguinte agora correspondem à ordem das aulas do capítulo 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: `production-ai-practices.md` corrigido para `../chapter-08-production/production-ai-practices.md` (3 ocorrências)
- **📦 agents.md deprecated code**: Substituído `opencensus` por `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md invalid API**: Movido `max_tokens` de `create_agent()` para `create_run()` como `max_completion_tokens`
- **🔢 agents.md token counting**: Substituído estimativa aproximada `len//4` por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Corrigidos serviços de "Cognitive Search + App Service" para "Azure AI Search + Azure Container Apps" (host padrão alterado em Out 2024)
- **contoso-chat**: Descrição atualizada para referenciar Azure AI Foundry + Prompty, ajustando ao título e pilha tecnológica reais do repositório

#### Removido
- **ai-document-processing**: Removida referência a template não funcional (repositório não acessível publicamente como template AZD)

#### Melhorado
- **📝 agents.md exercises**: Exercício 1 mostra agora a saída esperada e o passo `azd monitor`; Exercício 2 inclui o código completo de registo `FunctionTool`; Exercício 3 substitui indicações vagas por comandos concretos `prepdocs.py`
- **📚 agents.md resources**: Atualizados links de documentação para as atuais docs do Azure AI Agent Service e início rápido
- **📋 agents.md Next Steps table**: Adicionado link para AI Workshop Lab para cobertura completa do capítulo

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

#### Melhorias na Navegação do Curso
**Esta versão melhora a navegação dos capítulos README.md com um formato de tabela mais elaborado.**

#### Alterado
- **Tabela do Mapa do Curso**: Melhorada com links diretos para aulas, estimativas de duração e classificações de complexidade
- **Limpeza das Pastas**: Remoção de pastas antigas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validação de Links**: Verificação de mais de 21 links internos na tabela do Mapa do Curso

### [v3.16.0] - 2026-02-05

#### Atualizações de Nome de Produto
**Esta versão atualiza referências de produto para a marca atual da Microsoft.**

#### Alterado
- **Microsoft Foundry → Microsoft Foundry**: Todas as referências atualizadas nos ficheiros não de tradução
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir a marca atual

#### Ficheiros Atualizados
- `README.md` - Página principal do curso
- `changelog.md` - Histórico de versões
- `course-outline.md` - Estrutura do curso
- `docs/chapter-02-ai-development/agents.md` - Guia de agentes AI
- `examples/README.md` - Documentação de exemplos
- `workshop/README.md` - Página principal do workshop
- `workshop/docs/index.md` - Índice do workshop
- `workshop/docs/instructions/*.md` - Todos os ficheiros de instrução do workshop

---

### [v3.15.0] - 2026-02-05

#### Reestruturação Maior do Repositório: Pastas por Capítulo
**Esta versão reestrutura a documentação em pastas dedicadas por capítulo para uma navegação mais clara.**

#### Renomeação de Pastas
As pastas antigas foram substituídas por pastas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Adicionado novo: `docs/chapter-05-multi-agent/`

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
- **📚 Ficheiros README por Capítulo**: Criado README.md em cada pasta de capítulo com:
  - Objetivos de aprendizagem e duração
  - Tabela de aulas com descrições
  - Comandos de início rápido
  - Navegação para outros capítulos

#### Alterado
- **🔗 Atualizados todos os links internos**: Mais de 78 caminhos atualizados em todos os ficheiros de documentação
- **🗺️ README.md principal**: Mapa do Curso atualizado com nova estrutura por capítulos
- **📝 examples/README.md**: Atualizadas as referências cruzadas para pastas por capítulos

#### Removido
- Estrutura antiga das pastas (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestruturação do Repositório: Navegação por Capítulos
**Esta versão adicionou ficheiros README de navegação por capítulo (substituída pela v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novo Guia de Agentes AI
**Esta versão adiciona um guia completo para implementar agentes AI com Azure Developer CLI.**

#### Adicionado
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo cobrindo:
  - O que são agentes AI e como diferem dos chatbots
  - Três templates de início rápido para agentes (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agentes (agente único, RAG, multi-agente)
  - Configuração e personalização de ferramentas
  - Monitorização e acompanhamento de métricas
  - Considerações e otimização de custos
  - Cenários comuns de resolução de problemas
  - Três exercícios práticos com critérios de sucesso

#### Estrutura do Conteúdo
- **Introdução**: Conceitos de agentes para iniciantes
- **Início Rápido**: Implementar agentes com `azd init --template get-started-with-ai-agents`
- **Padrões de Arquitetura**: Diagramas visuais dos padrões de agentes
- **Configuração**: Configuração de ferramentas e variáveis de ambiente
- **Monitorização**: Integração com Application Insights
- **Exercícios**: Aprendizagem prática progressiva (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### Atualização do Ambiente DevContainer
**Esta versão atualiza a configuração do contentor de desenvolvimento com ferramentas modernas e melhores padrões para a experiência de aprendizagem AZD.**

#### Alterado
- **🐳 Imagem Base**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (última estável do Debian)
- **📛 Nome do Contentor**: Renomeado de "Python 3" para "AZD para Principiantes" para maior clareza

#### Adicionado
- **🔧 Novas Funcionalidades no Dev Container**:
  - `azure-cli` com suporte Bicep ativado
  - `node:20` (versão LTS para templates AZD)
  - `github-cli` para gestão de templates
  - `docker-in-docker` para implementações de container app

- **🔌 Encaminhamento de Portas**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (pré-visualização MkDocs)
  - 3000 (web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Novas Extensões VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python melhorado
  - `ms-azuretools.vscode-azurefunctions` - Suporte a Azure Functions
  - `ms-azuretools.vscode-docker` - Suporte Docker
  - `ms-azuretools.vscode-bicep` - Suporte à linguagem Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestão de recursos Azure
  - `yzhang.markdown-all-in-one` - Edição Markdown
  - `DavidAnson.vscode-markdownlint` - Validação Markdown
  - `bierner.markdown-mermaid` - Suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - Suporte YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualização Git
  - `mhutchie.git-graph` - Histórico Git

- **⚙️ Configurações VS Code**: Adicionadas configurações padrão para intérprete Python, formatar ao salvar, e remoção de espaços em branco

- **📦 Atualização do requirements-dev.txt**:
  - Adicionado plugin MkDocs minify
  - Adicionado pre-commit para qualidade de código
  - Adicionados pacotes Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigido
- **Comando Pós-Criação**: Agora verifica a instalação do AZD e Azure CLI na inicialização do contentor

---

### [v3.11.0] - 2026-02-05

#### Reformulação do README para Iniciantes
**Esta versão melhora significativamente o README.md para ser mais acessível a principiantes e adiciona recursos essenciais para desenvolvedores AI.**

#### Adicionado
- **🆚 Comparação Azure CLI vs AZD**: Explicação clara de quando usar cada ferramenta com exemplos práticos
- **🌟 Links Awesome AZD**: Links diretos para galeria de templates comunitários e recursos de contribuição:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ templates prontos para deploy
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Contribuição comunitária
- **🎯 Guia de Início Rápido**: Secção simplificada de 3 passos para começar (Instalar → Login → Deploy)
- **📊 Tabela de Navegação por Experiência**: Orientação clara sobre onde iniciar baseado na experiência do desenvolvedor

#### Alterado
- **Estrutura do README**: Reorganizado para divulgação progressiva - informação chave primeiro
- **Secção de Introdução**: Reescrita para explicar "A Magia do `azd up`" para principiantes completos
- **Conteúdo Duplicado Removido**: Eliminada secção duplicada de resolução de problemas
- **Comandos de Resolução de Problemas**: Corrigida referência `azd logs` para usar `azd monitor --logs` válida

#### Corrigido
- **🔐 Comandos de Autenticação**: Adicionados `azd auth login` e `azd auth logout` a cheat-sheet.md
- **Referências de Comandos Inválidas**: Removido o restante `azd logs` da secção de resolução de problemas do README

#### Notas
- **Âmbito**: Alterações aplicadas ao README.md principal e resources/cheat-sheet.md
- **Público-Alvo**: Melhorias direcionadas especificamente a desenvolvedores novos no AZD

---

### [v3.10.0] - 2026-02-05

#### Atualização de Comandos Azure Developer CLI
**Esta versão corrige comandos AZD inexistentes em toda a documentação, assegurando que todos os exemplos de código usam sintaxe válida do Azure Developer CLI.**

#### Corrigido
- **🔧 Remoção de Comandos AZD Inexistentes**: Auditoria abrangente e correção de comandos inválidos:
  - `azd logs` (inexistente) → substituído por `azd monitor --logs` ou alternativas Azure CLI
  - Subcomandos `azd service` (inexistentes) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (inexistente) → removido ou substituído por alternativas válidas
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (inexistentes) → removidas
  - Flags `azd provision --what-if/--rollback` (inexistentes) → atualizadas para usar `--preview`
  - `azd config validate` (inexistente) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (inexistentes) → removidos

- **📚 Ficheiros Atualizados com Correções de Comandos**:
  - `resources/cheat-sheet.md`: Revisão maior da referência de comandos
  - `docs/deployment/deployment-guide.md`: Correção de estratégias de rollback e deploy
  - `docs/troubleshooting/debugging.md`: Correção de secções de análise de logs
  - `docs/troubleshooting/common-issues.md`: Atualização de comandos de resolução de problemas
  - `docs/troubleshooting/ai-troubleshooting.md`: Correção da secção de debugging AZD
  - `docs/getting-started/azd-basics.md`: Comandos de monitorização corrigidos
  - `docs/getting-started/first-project.md`: Exemplos de monitorização e depuração atualizados
  - `docs/getting-started/installation.md`: Exemplos de ajuda e versão corrigidos
  - `docs/pre-deployment/application-insights.md`: Comandos de visualização de logs corrigidos
  - `docs/pre-deployment/coordination-patterns.md`: Comandos de depuração do agente corrigidos

- **📝 Referência de Versão Atualizada**: 
  - `docs/getting-started/installation.md`: Versão `1.5.0` codificada substituída por `1.x.x` genérica com ligação para releases

#### Alterado
- **Estratégias de Reversão**: Documentação atualizada para usar reversão baseada em Git (AZD não possui reversão nativa)
- **Visualização de Logs**: Referências a `azd logs` substituídas por `azd monitor --logs`, `azd monitor --live` e comandos Azure CLI
- **Secção de Performance**: Removidas flags de implantação paralela/incremental inexistentes, fornecidas alternativas válidas

#### Detalhes Técnicos
- **Comandos AZD Válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidas azd monitor**: `--live`, `--logs`, `--overview`
- **Funcionalidades removidas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificação**: Comandos validados com Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Conclusão do Workshop e Atualização da Qualidade da Documentação
**Esta versão completa os módulos interactivos do workshop, corrige todos os links de documentação quebrados e melhora a qualidade geral do conteúdo para desenvolvedores de IA que usam Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes para contribuições com:
  - Instruções claras para reportar problemas e propor mudanças
  - Normas de documentação para novo conteúdo
  - Diretrizes para exemplos de código e convenções de mensagens de commit
  - Informação sobre envolvimento da comunidade

#### Concluído
- **🎯 Módulo 7 do Workshop (Conclusão)**: Módulo de encerramento totalmente concluído com:
  - Resumo abrangente das conquistas do workshop
  - Secção de conceitos principais dominados abordando AZD, templates e Microsoft Foundry
  - Recomendações para continuação do percurso de aprendizagem
  - Exercícios desafiantes do workshop com níveis de dificuldade
  - Feedback da comunidade e ligações de suporte

- **📚 Módulo 3 do Workshop (Desconstruir)**: Objetivos de aprendizagem atualizados com:
  - Orientação de ativação do GitHub Copilot com servidores MCP
  - Compreensão da estrutura de pastas dos templates AZD
  - Padrões de organização de infraestrutura como código (Bicep)
  - Instruções práticas de laboratório

- **🔧 Módulo 6 do Workshop (Desmontagem)**: Concluído com:
  - Objetivos de limpeza de recursos e gestão de custos
  - Uso de `azd down` para desprovisionamento seguro da infraestrutura
  - Orientação para recuperação de serviços cognitivos eliminados suavemente
  - Sugestões de exploração bônus para GitHub Copilot e Azure Portal

#### Corrigido
- **🔗 Correções de Links Quebrados**: Resolvidos mais de 15 links internos quebrados na documentação:
  - `docs/ai-foundry/ai-model-deployment.md`: Caminhos corrigidos para microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Caminhos corrigidos para ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Substituído cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Caminhos corrigidos para FAQ e guia de resolução de problemas
  - `examples/container-app/microservices/README.md`: Caminhos corrigidos para curso principal e guia de implantação
  - `resources/faq.md` e `resources/glossary.md`: Atualizadas referências do capítulo de IA
  - `course-outline.md`: Corrigidas referências do guia do instrutor e do laboratório do workshop de IA

- **📅 Banner de Estado do Workshop**: Alterado de "Em Construção" para estado ativo com data de Fevereiro 2026

- **🔗 Navegação do Workshop**: Corrigidos links de navegação quebrados no README.md do workshop apontando para a pasta lab-1-azd-basics inexistente

#### Alterado
- **Apresentação do Workshop**: Removido aviso de "em construção", workshop agora completo e pronto para uso
- **Consistência de Navegação**: Garantida navegação adequada entre todos os módulos do workshop
- **Referências no Percurso de Aprendizagem**: Atualizadas referências cruzadas do capítulo para os caminhos corretos do microsoft-foundry

#### Validado
- ✅ Todos os ficheiros markdown em inglês têm links internos válidos
- ✅ Módulos do workshop 0-7 completos com objetivos de aprendizagem
- ✅ Navegação entre capítulos e módulos funciona corretamente
- ✅ Conteúdo adequado para desenvolvedores IA usando Microsoft AZD
- ✅ Linguagem e estrutura amigáveis para iniciantes mantidas em todo o conteúdo
- ✅ CONTRIBUTING.md fornece orientações claras para contribuintes da comunidade

#### Implementação Técnica
- **Validação de Links**: Script PowerShell automatizado verificou todos os links internos dos .md
- **Auditoria de Conteúdo**: Revisão manual da completude do workshop e adequação a iniciantes
- **Sistema de Navegação**: Aplicados padrões consistentes de navegação por capítulos e módulos

#### Notas
- **Âmbito**: Alterações aplicadas apenas à documentação em inglês
- **Traduções**: Pastas de tradução não atualizadas nesta versão (tradução automática será sincronizada posteriormente)
- **Duração do Workshop**: Workshop completo agora fornece 3-4 horas de aprendizagem prática

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitorização, Segurança e Padrões Multi-Agente
**Esta versão adiciona aulas abrangentes de qualidade A sobre integração com Application Insights, padrões de autenticação e coordenação multi-agente para implantações de produção.**

#### Adicionado
- **📊 Aula de Integração Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Implantação focada em AZD com provisionamento automático
  - Templates Bicep completos para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria customizada (1,200+ linhas)
  - Padrões de monitorização AI/LLM (rastreio de tokens/custos Microsoft Foundry Models)
  - 6 diagramas Mermaid (arquitectura, tracing distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, dashboards, monitorização AI)
  - Exemplos de queries Kusto e estratégias de optimização de custos
  - Streaming de métricas em directo e depuração em tempo real
  - Tempo de aprendizagem 40-50 minutos com padrões prontos para produção

- **🔐 Aula de Padrões de Autenticação & Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (strings de conexão, Key Vault, identidade gerida)
  - Templates completos Bicep para infra-estrutura segura
  - Código de aplicação Node.js com integração SDK Azure
  - 3 exercícios completos (ativar identidade gerida, identidade atribuída a utilizador, rotação Key Vault)
  - Melhores práticas de segurança e configurações RBAC
  - Guia de resolução de problemas e análise de custos
  - Padrões de autenticação sem palavra-passe prontos para produção

- **🤖 Aula de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, baseado em eventos, consenso)
  - Implementação completa do serviço orquestrador (Python/Flask, 1,500+ linhas)
  - 3 implementações especializadas de agentes (Investigação, Escritor, Editor)
  - Integração Service Bus para fila de mensagens
  - Gestão de estado Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interacções entre agentes
  - 3 exercícios avançados (gestão de timeout, lógica de reintentos, disjuntor)
  - Desagregação de custos (240-565$/mês) com estratégias de optimização
  - Integração Application Insights para monitorização

#### Melhorado
- **Capítulo Pré-implantação**: Agora inclui padrões abrangentes de monitorização e coordenação
- **Capítulo Início Rápido**: Melhorado com padrões profissionais de autenticação
- **Preparação para Produção**: Cobertura completa desde segurança a observabilidade
- **Esquema do Curso**: Atualizado para referenciar novas aulas nos Capítulos 3 e 6

#### Alterado
- **Progressão de Aprendizagem**: Melhor integração de segurança e monitorização ao longo do curso
- **Qualidade da Documentação**: Padrões consistentes de qualidade A (95-97%) nas novas aulas
- **Padrões de Produção**: Cobertura completa end-to-end para implantações empresariais

#### Aprimorado
- **Experiência do Desenvolvedor**: Percurso claro desde desenvolvimento à monitorização em produção
- **Normas de Segurança**: Padrões profissionais para autenticação e gestão de segredos
- **Observabilidade**: Integração completa Application Insights com AZD
- **Cargas de Trabalho AI**: Monitorização especializada para Microsoft Foundry Models e sistemas multi-agente

#### Validado
- ✅ Todas as aulas incluem código funcional completo (não fragmentos)
- ✅ Diagramas Mermaid para aprendizagem visual (19 no total em 3 aulas)
- ✅ Exercícios práticos com passos de verificação (9 no total)
- ✅ Templates Bicep prontos para produção implantáveis via `azd up`
- ✅ Análise de custos e estratégias de optimização
- ✅ Guias de resolução de problemas e melhores práticas
- ✅ Pontos de verificação de conhecimento com comandos de verificação

#### Resultados da Avaliação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia abrangente de monitorização
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas avançadas multi-agente
- **Conteúdo Novo Geral**: - Padrões consistentes de alta qualidade

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria customizada + tracing distribuído
- **Autenticação**: Managed Identity + Key Vault + padrões RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitorização**: Métricas em directo + queries Kusto + alertas + dashboards
- **Gestão de Custos**: Estratégias de amostragem, políticas de retenção, controlos de orçamento

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo Microsoft Foundry Models
**Esta versão melhora a qualidade da documentação em todo o repositório e adiciona um exemplo completo de implantação do Microsoft Foundry Models com interface de chat gpt-4.1.**

#### Adicionado
- **🤖 Exemplo de Chat Microsoft Foundry Models**: Implantação completa gpt-4.1 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa Microsoft Foundry Models (implantação modelo gpt-4.1)
  - Interface de chat Python linha de comando com histórico de conversas
  - Integração Key Vault para armazenamento seguro de chaves API
  - Rastreio de uso de tokens e estimativa de custos
  - Limitação de taxa e tratamento de erros
  - README abrangente com guia de implantação de 35-45 minutos
  - 11 ficheiros prontos para produção (templates Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Exercícios práticos adicionados ao guia de configuração:
  - Exercício 1: Configuração multi-ambiente (15 minutos)
  - Exercício 2: Prática de gestão de segredos (10 minutos)
  - Critérios claros de sucesso e passos de verificação
- **✅ Verificação de Implantação**: Secção de verificação adicionada ao guia de implantação:
  - Procedimentos de verificação de saúde
  - Lista de verificação de critérios de sucesso
  - Saídas esperadas para todos os comandos de implantação
  - Referência rápida para resolução de problemas

#### Melhorado
- **examples/README.md**: Atualizado para qualidade A (93%):
  - Adicionado azure-openai-chat a todas as secções relevantes
  - Número local de exemplos atualizado de 3 para 4
  - Adicionado à tabela de Exemplos de Aplicações AI
  - Integrado no Quick Start para utilizadores intermédios
  - Adicionado à secção de Microsoft Foundry Templates
  - Atualizada matriz comparativa e secções de descoberta tecnológica
- **Qualidade da Documentação**: Melhorado de B+ (87%) para A- (92%) na pasta docs:
  - Adicionadas saídas esperadas a exemplos críticos de comando
  - Incluídos passos de verificação para alterações de configuração
  - Aprendizagem prática reforçada com exercícios práticos

#### Alterado
- **Progressão de Aprendizagem**: Melhor integração de exemplos AI para aprendizes intermédios
- **Estrutura da Documentação**: Exercícios mais acionáveis com resultados claros
- **Processo de Verificação**: Critérios explícitos de sucesso adicionados a fluxos chave

#### Aprimorado
- **Experiência do Desenvolvedor**: Implantação Microsoft Foundry Models agora leva 35-45 minutos (vs 60-90 para alternativas complexas)
- **Transparência de Custos**: Estimativas claras ($50-200/mês) para exemplo Microsoft Foundry Models
- **Percurso de Aprendizagem**: Desenvolvedores AI têm ponto de entrada claro com azure-openai-chat
- **Normas de Documentação**: Saídas esperadas e passos de verificação consistentes

#### Validado
- ✅ Exemplo Microsoft Foundry Models totalmente funcional com `azd up`
- ✅ Todos os 11 ficheiros de implementação sintaticamente corretos
- ✅ Instruções README correspondem à experiência real de implantação
- ✅ Links da documentação atualizados em mais de 8 locais
- ✅ Índice de exemplos reflete corretamente 4 exemplos locais
- ✅ Sem links externos duplicados nas tabelas
- ✅ Todas as referências de navegação corretas

#### Implementação Técnica
- **Arquitetura Microsoft Foundry Models**: padrão gpt-4.1 + Key Vault + Container Apps
- **Segurança**: Identidade Gerida pronta, segredos no Key Vault
- **Monitorização**: integração Application Insights
- **Gestão de Custos**: rastreio de tokens e optimização de uso
- **Implantação**: Comando único `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Principal: Exemplos de Implantação Container App
**Esta versão apresenta exemplos abrangentes e prontos para produção de implantação de aplicações containerizadas usando Azure Developer CLI (AZD), com documentação completa e integração no percurso de aprendizagem.**

#### Adicionado
- **🚀 Exemplos Container App**: Novos exemplos locais em `examples/container-app/`:
  - [Guia Mestre](examples/container-app/README.md): Visão geral completa de implementações conteinerizadas, início rápido, produção e padrões avançados
  - [API Flask Simples](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com escala para zero, sondas de integridade, monitorização e resolução de problemas
  - [Arquitetura de Microsserviços](../../examples/container-app/microservices): Implementação multi-serviço pronta para produção (API Gateway, Produto, Pedido, Utilizador, Notificação), mensagens assíncronas, Service Bus, Cosmos DB, Azure SQL, tracing distribuído, deployment blue-green/canário
- **Melhores Práticas**: Segurança, monitorização, otimização de custos e orientação CI/CD para workloads conteinerizados
- **Exemplos de Código**: Completo `azure.yaml`, templates Bicep e implementações de serviços multi-linguagem (Python, Node.js, C#, Go)
- **Testes e Resolução de Problemas**: Cenários de teste end-to-end, comandos de monitorização, orientações de resolução de problemas

#### Alterado
- **README.md**: Atualizado para apresentar e ligar novos exemplos de apps conteinerizadas na secção "Exemplos Locais - Aplicações Conteinerizadas"
- **examples/README.md**: Atualizado para destacar exemplos de apps conteinerizadas, adicionar entradas na matriz comparativa e atualizar referências tecnológicas/arquitectónicas
- **Esquema do Curso & Guia de Estudo**: Atualizados para referenciar novos exemplos de apps conteinerizadas e padrões de implantação nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos implantáveis com `azd up` e seguem melhores práticas
- ✅ Hiperligações e navegação da documentação atualizadas
- ✅ Exemplos abrangem cenários do nível iniciante ao avançado, inclusive microsserviços para produção

#### Notas
- **Âmbito**: Documentação e exemplos apenas em inglês
- **Próximos Passos**: Expandir com padrões adicionais avançados para contentores e automatização CI/CD em versões futuras

### [v3.5.0] - 2025-11-19

#### Rebranding do Produto: Microsoft Foundry
**Esta versão implementa uma alteração abrangente do nome do produto de "Microsoft Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**

#### Alterado
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Microsoft Foundry" para "Microsoft Foundry"
  - Todas as referências atualizadas em documentação em inglês na pasta `docs/`
  - Pasta renomeada: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Ficheiro renomeado: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referências de conteúdo atualizadas em 7 ficheiros de documentação

- **📁 Alterações na Estrutura de Pastas**:
  - `docs/ai-foundry/` renomeado para `docs/microsoft-foundry/`
  - Todas as referências cruzadas atualizadas para refletir a nova estrutura de pastas
  - Links de navegação validados em toda a documentação

- **📄 Rename de Ficheiros**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos os links internos atualizados para referenciar o novo nome de ficheiro

#### Ficheiros Atualizados
- **Documentação de Capítulos** (7 ficheiros):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações em links de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências ao nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já utiliza Microsoft Foundry (de atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback da comunidade, documentação)
  - `docs/getting-started/azd-basics.md` - 4 links de referências cruzadas atualizados
  - `docs/getting-started/first-project.md` - 2 links de navegação de capítulo atualizados
  - `docs/getting-started/installation.md` - 2 links para capítulos seguintes atualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navegação atualizado
  - `docs/troubleshooting/debugging.md` - 1 link de navegação atualizado

- **Ficheiros da Estrutura do Curso** (2 ficheiros):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos de capítulos, secção de templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizagem, recursos do capítulo)

#### Validado
- ✅ Nenhuma referência restante à pasta "ai-foundry" em documentos em inglês
- ✅ Nenhuma referência restante ao nome do produto "Microsoft Foundry" em documentos em inglês
- ✅ Todos os links de navegação funcionais com nova estrutura de pastas
- ✅ Renomeações de ficheiros e pastas concluídas com sucesso
- ✅ Referências cruzadas entre capítulos validadas

#### Notas
- **Âmbito**: Alterações aplicadas apenas à documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de tradução (`translations/`) não atualizadas nesta versão
- **Workshop**: Materiais do workshop (`workshop/`) não atualizados nesta versão
- **Exemplos**: Ficheiros de exemplos podem ainda referir nomes antigos (a abordar em atualização futura)
- **Links Externos**: URLs externos e referências ao repositório do GitHub permanecem inalterados

#### Guia de Migração para Contribuidores
Se tiveres ramos locais ou documentação a referir a antiga estrutura:
1. Atualiza referências de pastas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualiza referências de ficheiros: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substitui o nome do produto: "Microsoft Foundry" → "Microsoft Foundry"
4. Valida que todos os links internos da documentação funcionam corretamente

---

### [v3.4.0] - 2025-10-24

#### Melhorias na Pré-visualização e Validação da Infraestrutura
**Esta versão introduz suporte abrangente para a nova funcionalidade de pré-visualização do Azure Developer CLI e melhora a experiência do utilizador do workshop.**

#### Adicionado
- **🧪 azd provision --preview: Documentação da Funcionalidade**: Cobertura completa da nova capacidade de pré-visualização da infraestrutura
  - Referência de comandos e exemplos de utilização em ficha de consulta rápida
  - Integração detalhada no guia de provisionamento com estudos de caso e benefícios
  - Integração de pré-verificação para validação mais segura da implementação
  - Atualizações no guia de início rápido com práticas de implementação focadas na segurança
- **🚧 Banner de Estado do Workshop**: Banner HTML profissional indicando estado do desenvolvimento do workshop
  - Design com gradiente e indicadores de construção para comunicação clara ao utilizador
  - Marca temporal de última atualização para transparência
  - Design responsivo para dispositivos móveis

#### Melhorado
- **Segurança da Infraestrutura**: Funcionalidade de pré-visualização integrada na documentação completa de deployment
- **Validação Pré-Deployment**: Scripts automatizados agora incluem testes de pré-visualização da infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir pré-visualização como melhor prática
- **Experiência do Workshop**: Expectativas claras definidas para utilizadores sobre o estado do conteúdo em desenvolvimento

#### Alterado
- **Melhores Práticas de Deployment**: Fluxo de trabalho "preview-first" agora recomendado
- **Fluxo da Documentação**: Validação da infraestrutura movida para etapas iniciais do processo de aprendizagem
- **Apresentação do Workshop**: Comunicação profissional do estado com cronograma claro de desenvolvimento

#### Aprimorado
- **Abordagem de Segurança em Primeiro Lugar**: Alterações da infraestrutura agora validadas antes do deployment
- **Colaboração de Equipa**: Resultados da pré-visualização podem ser partilhados para revisão e aprovação
- **Consciência de Custos**: Melhor compreensão dos custos dos recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas no deployment através de validação antecipada

#### Implementação Técnica
- **Integração Multi-documentos**: Funcionalidade de pré-visualização documentada em 4 ficheiros-chave
- **Padrões de Comando**: Sintaxe e exemplos consistentes na documentação
- **Integração de Melhores Práticas**: Pré-visualização incluída em workflows e scripts de validação
- **Indicadores Visuais**: Marcação clara de NOVA funcionalidade para maior descoberta

#### Infraestrutura do Workshop
- **Comunicação do Estado**: Banner HTML profissional com design em gradiente
- **Experiência do Utilizador**: Estado de desenvolvimento claro para evitar confusão
- **Apresentação Profissional**: Mantém credibilidade do repositório e define expectativas
- **Transparência do Cronograma**: Marca temporal de última atualização em outubro de 2025 para responsabilidade

### [v3.3.0] - 2025-09-24

#### Materiais do Workshop Melhorados e Experiência de Aprendizagem Interactiva
**Esta versão apresenta materiais de workshop abrangentes com guias interativos baseados em browser e percursos de aprendizagem estruturados.**

#### Adicionado
- **🎥 Guia Interactivo do Workshop**: Experiência de workshop baseada em browser com capacidade de pré-visualização via MkDocs
- **📝 Instruções Estruturadas do Workshop**: Percurso de aprendizagem guiado de 7 passos da descoberta à personalização
  - 0-Introdução: Visão geral do workshop e configuração
  - 1-Selecionar-Template-AI: Processo de descoberta e seleção de templates
  - 2-Validar-Template-AI: Procedimentos de deployment e validação
  - 3-Desconstruir-Template-AI: Compreensão da arquitetura do template
  - 4-Configurar-Template-AI: Configuração e personalização
  - 5-Personalizar-Template-AI: Modificações avançadas e iterações
  - 6-Demolir-Infrastructure: Limpeza e gestão de recursos
  - 7-Conclusão: Resumo e próximos passos
- **🛠️ Ferramentas do Workshop**: Configuração MkDocs com tema Material para melhorar experiência de aprendizagem
- **🎯 Percurso de Aprendizagem Prático**: Metodologia de 3 passos (Descoberta → Deployment → Personalização)
- **📱 Integração GitHub Codespaces**: Configuração integrada do ambiente de desenvolvimento

#### Melhorado
- **Laboratório AI do Workshop**: Expandido com experiência de aprendizagem estruturada de 2-3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e auxílios visuais
- **Progressão da Aprendizagem**: Orientação clara passo a passo da seleção de template ao deployment em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para workflows de desenvolvimento simplificados

#### Aprimorado
- **Acessibilidade**: Interface baseada em browser com pesquisa, funcionalidade de copiar e alternância de temas
- **Aprendizagem Autodidata**: Estrutura flexível para acomodar diferentes ritmos de aprendizagem
- **Aplicação Prática**: Cenários reais de deployment de templates AI
- **Integração Comunitária**: Integração com Discord para suporte e colaboração no workshop

#### Funcionalidades do Workshop
- **Pesquisa Incorporada**: Descoberta rápida de palavras-chave e lições
- **Bloques de Código com Copiar**: Função de copiar ao passar o rato para todos os exemplos de código
- **Alternância de Tema**: Suporte a modo escuro/claro para diferentes preferências
- **Elementos Visuais**: Capturas de ecrã e diagramas para melhor compreensão
- **Integração de Ajuda**: Acesso direto ao Discord para suporte comunitário

### [v3.2.0] - 2025-09-17

#### Reestruturação Maior da Navegação e Sistema de Aprendizagem Baseado em Capítulos
**Esta versão introduz uma estrutura abrangente de aprendizagem baseada em capítulos com navegação melhorada por todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizagem Baseado em Capítulos**: Reestruturação completa do curso em 8 capítulos progressivos
  - Capítulo 1: Fundamentos & Início Rápido (⭐ - 30-45 mins)
  - Capítulo 2: Desenvolvimento AI-First (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração e Autenticação (⭐⭐ - 45-60 mins)
  - Capítulo 4: Infraestrutura como Código & Deployment (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluções AI Multi-Agente (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação & Planeamento Pré-Deployment (⭐⭐ - 1 hora)
  - Capítulo 7: Resolução de Problemas & Debugging (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Padrões de Produção & Empresariais (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema de Navegação Abrangente**: Cabeçalhos e rodapés de navegação consistentes em toda a documentação
- **🎯 Controle de Progresso**: Lista de verificação para conclusão do curso e sistema de verificação de aprendizagem
- **🗺️ Orientação do Percurso de Aprendizagem**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação de Referências Cruzadas**: Capítulos relacionados e pré-requisitos claramente ligados

#### Melhorado
- **Estrutura do README**: Transformada numa plataforma de aprendizagem estruturada com organização por capítulos
- **Navegação da Documentação**: Cada página inclui agora contexto do capítulo e orientação de progressão
- **Organização de Templates**: Exemplos e templates mapeados para capítulos de aprendizagem apropriados
- **Integração de Recursos**: Fichas de consulta rápida, FAQs e guias de estudo conectados aos capítulos relevantes
- **Integração de Workshop**: Laboratórios práticos ligados a múltiplos objetivos de aprendizagem de capítulos

#### Alterado
- **Progressão da Aprendizagem**: Passou de documentação linear para aprendizagem flexível baseada em capítulos
- **Posicionamento de Configuração**: Guia de configuração reposicionado para Capítulo 3 para melhor fluxo de aprendizagem
- **Integração de Conteúdo AI**: Melhor integração de conteúdo específico AI ao longo da jornada de aprendizagem
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para aprendizes empresariais

#### Aprimorado
- **Experiência do Utilizador**: Breadcrumbs claros e indicadores de progressão de capítulos
- **Acessibilidade**: Padrões de navegação consistentes para facilitar percurso do curso
- **Apresentação Profissional**: Estrutura universitária adequada para formação académica e corporativa
- **Eficiência de Aprendizagem**: Tempo reduzido para encontrar conteúdo relevante por meio de melhor organização

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação padronizada por capítulos em mais de 40 ficheiros de documentação
- **Navegação no Rodapé**: Orientação consistente de progressão e indicadores de conclusão de capítulo
- **Links Cruzados**: Sistema de ligação interna abrangente conectando conceitos relacionados
- **Mapeamento de Capítulos**: Templates e exemplos claramente associados a objetivos de aprendizagem

#### Aprimoramento do Guia de Estudo
- **📚 Objetivos de Aprendizagem Abrangentes**: Guia de estudo reestruturado para alinhar com sistema de 8 capítulos
- **🎯 Avaliação Baseada em Capítulos**: Cada capítulo inclui objetivos específicos de aprendizagem e exercícios práticos
- **📋 Controle de Progresso**: Cronograma semanal de aprendizagem com resultados mensuráveis e listas de verificação de conclusão
- **❓ Questões de Avaliação**: Perguntas de validação de conhecimento para cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades hands-on com cenários reais de implementação e resolução de problemas
- **📊 Progressão de Competências**: Avanço claro de conceitos básicos a padrões empresariais com foco no desenvolvimento de carreira
- **🎓 Estrutura de Certificação**: Resultados de desenvolvimento profissional e sistema de reconhecimento comunitário
- **⏱️ Gestão de Cronograma**: Plano estruturado de aprendizagem de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Soluções AI Multi-Agente Melhoradas
**Esta versão melhora a solução de retalho multi-agente com melhor nomeação de agentes e documentação aprimorada.**

#### Alterado
- **Terminologia Multi-Agente**: Substituído "agente Cora" por "agente Cliente" em toda a solução multi-agente de retalho para maior clareza
- **Arquitetura do Agente**: Atualizada toda a documentação, templates ARM e exemplos de código para usar a nomenclatura consistente "agente Cliente"
- **Exemplos de Configuração**: Modernizados os padrões de configuração do agente com convenções de nomenclatura atualizadas
- **Consistência na Documentação**: Garantido que todas as referências usam nomes descritivos e profissionais para os agentes

#### Melhorado
- **Pacote do Template ARM**: Atualizado o retail-multiagent-arm-template com referências ao agente Cliente
- **Diagramas de Arquitetura**: Atualizados os diagramas Mermaid com nomenclatura atualizada dos agentes
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam a nomenclatura CustomerAgent
- **Variáveis de Ambiente**: Atualizados todos os scripts de deployment para usar convenções CUSTOMER_AGENT_NAME

#### Melhorado
- **Experiência do Desenvolvedor**: Papéis e responsabilidades do agente mais claros na documentação
- **Prontidão para Produção**: Melhor alinhamento com convenções de nomenclatura corporativa
- **Materiais de Aprendizagem**: Nomeação de agentes mais intuitiva para fins educacionais
- **Usabilidade do Template**: Compreensão simplificada das funções de agentes e padrões de deployment

#### Detalhes Técnicos
- Diagramas de arquitetura Mermaid atualizados com referências a CustomerAgent
- Substituídos os nomes das classes CoraAgent por CustomerAgent nos exemplos Python
- Modificadas as configurações JSON do template ARM para usar o tipo de agente "customer"
- Atualizadas as variáveis de ambiente de CORA_AGENT_* para CUSTOMER_AGENT_*
- Atualizados todos os comandos de deployment e configurações de containers

### [v3.0.0] - 2025-09-12

#### Alterações Principais - Foco no Desenvolvedor de IA e Integração Microsoft Foundry
**Esta versão transforma o repositório num recurso de aprendizagem abrangente focado em IA com integração Microsoft Foundry.**

#### Adicionado
- **🤖 Roteiro de Aprendizagem IA-Primeiro**: Reestruturação completa prioritária para desenvolvedores e engenheiros de IA
- **Guia de Integração Microsoft Foundry**: Documentação completa para conectar AZD com serviços Microsoft Foundry
- **Padrões de Deployment de Modelos IA**: Guia detalhado cobrindo seleção de modelos, configuração e estratégias para deployment em produção
- **Workshop Laboratorial de IA**: Workshop prático de 2-3 horas para converter aplicações IA em soluções deployáveis via AZD
- **Melhores Práticas de IA em Produção**: Padrões corporativos para escalamento, monitorização e segurança de cargas de trabalho IA
- **Guia de Resolução de Problemas IA**: Resolução abrangente para modelos Microsoft Foundry, Serviços Cognitivos e problemas de deployment IA
- **Galeria de Templates IA**: Coleção destacada de templates Microsoft Foundry com classificações de complexidade
- **Materiais do Workshop**: Estrutura completa do workshop com laboratórios práticos e materiais de referência

#### Melhorado
- **Estrutura do README**: Focado em desenvolvedores IA com 45% de interesse comunitário do Discord Microsoft Foundry
- **Caminhos de Aprendizagem**: Jornada dedicada a desenvolvedores IA paralelamente a trajetórias tradicionais para estudantes e engenheiros DevOps
- **Recomendações de Templates**: Templates IA destacados incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integração Comunitária**: Suporte comunitário Discord aprimorado com canais e discussões específicos de IA

#### Foco em Segurança & Produção
- **Padrões de Identidade Gerida**: Configurações de autenticação e segurança específicas para IA
- **Otimização de Custos**: Monitorização do uso de tokens e controlos orçamentais para cargas de trabalho IA
- **Deployment Multi-Região**: Estratégias para deployment global de aplicações IA
- **Monitorização de Performance**: Métricas específicas de IA e integração com Application Insights

#### Qualidade da Documentação
- **Estrutura Linear do Curso**: Progressão lógica de padrões de deployment IA desde iniciante a avançado
- **URLs Validadas**: Todos os links externos de repositórios verificados e acessíveis
- **Referência Completa**: Todos os links internos da documentação validados e funcionais
- **Pronto para Produção**: Padrões corporativos de deployment com exemplos reais

### [v2.0.0] - 2025-09-09

#### Alterações Principais - Reestruturação do Repositório e Aprimoramento Profissional
**Esta versão representa uma reformulação significativa da estrutura do repositório e apresentação de conteúdo.**

#### Adicionado
- **Estrutura de Aprendizagem Estruturada**: Todas as páginas de documentação incluem secções de Introdução, Objetivos de Aprendizagem e Resultados de Aprendizagem
- **Sistema de Navegação**: Adicionados links de lição Anterior/Seguinte em toda a documentação para progresso guiado
- **Guia de Estudo**: study-guide.md abrangente com objetivos de aprendizagem, exercícios de prática e materiais de avaliação
- **Apresentação Profissional**: Remoção de todos os ícones emoji para melhorar acessibilidade e aparência profissional
- **Estrutura de Conteúdo Aprimorada**: Melhor organização e fluxo dos materiais de aprendizagem

#### Alterado
- **Formato da Documentação**: Padronizado toda a documentação com estrutura consistente focada em aprendizagem
- **Fluxo de Navegação**: Implementada progressão lógica em todos os materiais de aprendizagem
- **Apresentação de Conteúdo**: Removidos elementos decorativos em favor de formatação clara e profissional
- **Estrutura de Links**: Atualizados todos os links internos para suportar novo sistema de navegação

#### Melhorado
- **Acessibilidade**: Removidas dependências de emoji para melhor compatibilidade com leitores de ecrã
- **Aparência Profissional**: Apresentação limpa, estilo académico, adequada para aprendizagem corporativa
- **Experiência de Aprendizagem**: Abordagem estruturada com objetivos e resultados claros para cada lição
- **Organização de Conteúdo**: Melhor fluxo lógico e ligação entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório Abrangente para Aprendizagem AZD

#### Adicionado
- **Estrutura Central da Documentação**
  - Série completa de guias de introdução
  - Documentação abrangente de deployment e provisionamento
  - Recursos detalhados para resolução de problemas e depuração
  - Ferramentas e procedimentos de validação pré-deployment

- **Módulo de Introdução**
  - Fundamentos AZD: Conceitos e terminologia principais
  - Guia de Instalação: Instruções específicas para plataformas
  - Guia de Configuração: Configuração do ambiente e autenticação
  - Tutorial do Primeiro Projeto: Aprendizagem prática passo a passo

- **Módulo de Deployment e Provisionamento**
  - Guia de Deployment: Documentação completa do fluxo de trabalho
  - Guia de Provisionamento: Infraestrutura como Código com Bicep
  - Melhores práticas para deployments de produção
  - Padrões de arquitetura multi-serviço

- **Módulo de Validação Pré-Deployment**
  - Planeamento de Capacidade: Validação da disponibilidade de recursos Azure
  - Seleção de SKU: Guia abrangente de níveis de serviço
  - Verificações pré-voo: Scripts automáticos de validação (PowerShell e Bash)
  - Ferramentas de estimativa de custo e planeamento orçamental

- **Módulo de Resolução de Problemas**
  - Problemas Comuns: Problemas frequentes e suas soluções
  - Guia de Depuração: Metodologias sistemáticas de troubleshooting
  - Técnicas avançadas de diagnóstico e ferramentas
  - Monitorização e otimização de performance

- **Recursos e Referências**
  - Ficha de Comandos: Referência rápida para comandos essenciais
  - Glossário: Definições abrangentes de termos e acrónimos
  - FAQ: Respostas detalhadas a perguntas comuns
  - Links para recursos externos e conexões comunitárias

- **Exemplos e Templates**
  - Exemplo de Aplicação Web Simples
  - Template para deployment de Website Estático
  - Configuração de Aplicação com Container
  - Padrões de integração de bases de dados
  - Exemplos de arquitetura de microserviços
  - Implementações de funções serverless

#### Funcionalidades
- **Suporte Multi-Plataforma**: Guias de instalação e configuração para Windows, macOS e Linux
- **Múltiplos Níveis de Competência**: Conteúdo desenhado para estudantes até desenvolvedores profissionais
- **Foco Prático**: Exemplos hands-on e cenários do mundo real
- **Cobertura Abrangente**: Desde conceitos básicos a padrões empresariais avançados
- **Abordagem de Segurança em Primeiro Lugar**: Melhores práticas de segurança integradas
- **Otimização de Custos**: Orientações para deployments económicos e gestão de recursos

#### Qualidade da Documentação
- **Exemplos de Código Detalhados**: Amostras de código práticas e testadas
- **Instruções Passo a Passo**: Orientação clara e acionável
- **Gestão Abrangente de Erros**: Resolução para problemas comuns
- **Integração de Melhores Práticas**: Normas industriais e recomendações
- **Compatibilidade de Versão**: Atualizado com os serviços Azure e funcionalidades azd mais recentes

## Melhoramentos Planeados para o Futuro

### Versão 3.1.0 (Planeada)
#### Expansão da Plataforma IA
- **Suporte Multi-Modelo**: Padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados
- **Frameworks de Agentes IA**: Templates para implementações LangChain, Semantic Kernel e AutoGen
- **Padrões RAG Avançados**: Opções de base de dados vetorial para além do Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidade IA**: Monitorização avançada para performance do modelo, uso de tokens, e qualidade de resposta

#### Experiência do Desenvolvedor
- **Extensão VS Code**: Experiência de desenvolvimento integrada AZD + Microsoft Foundry
- **Integração GitHub Copilot**: Geração assistida por IA de templates AZD
- **Tutoriais Interativos**: Exercícios práticos de coding com validação automática para cenários de IA
- **Conteúdo em Vídeo**: Tutoriais visuais suplementares para aprendizes focados em deployments IA

### Versão 4.0.0 (Planeada)
#### Padrões Empresariais de IA
- **Framework de Governação**: Governação, conformidade e auditorias de modelos IA
- **IA Multi-Cliente**: Padrões para servir múltiplos clientes com serviços IA isolados
- **Deployment IA na Edge**: Integração com Azure IoT Edge e instâncias de containers
- **IA Cloud Híbrida**: Padrões de deployment multi-cloud e híbridos para cargas IA

#### Funcionalidades Avançadas
- **Automação de Pipeline IA**: Integração MLOps com pipelines Azure Machine Learning
- **Segurança Avançada**: Padrões zero-trust, endpoints privados e proteção avançada contra ameaças
- **Otimização de Performance**: Estratégias avançadas de tuning e escalamento para aplicações IA de alto débito
- **Distribuição Global**: Padrões de entrega de conteúdo e cache de edge para aplicações IA

### Versão 3.0.0 (Planeada) - Substituída pela Versão Atual
#### Adições Propostas - Agora Implementadas na v3.0.0
- ✅ **Conteúdo Focado em IA**: Integração abrangente Microsoft Foundry (Concluído)
- ✅ **Tutoriais Interativos**: Workshop prático de IA (Concluído)
- ✅ **Módulo Avançado de Segurança**: Padrões de segurança específicos de IA (Concluído)
- ✅ **Otimização de Performance**: Estratégias de tuning para cargas IA (Concluído)

### Versão 2.1.0 (Planeada) - Parcialmente Implementada na v3.0.0
#### Melhorias Menores - Algumas Concluídas na Versão Atual
- ✅ **Exemplos Adicionais**: Cenários de deployment focados em IA (Concluído)
- ✅ **FAQ Expandida**: Perguntas e resolução de problemas específicos de IA (Concluído)
- **Integração de Ferramentas**: Guias aprimorados para IDE e editores
- ✅ **Expansão de Monitorização**: Padrões de monitorização e alertas específicos de IA (Concluído)

#### Ainda Planeado para Versões Futuras
- **Documentação Compatível com Mobile**: Design responsivo para aprendizagem móvel
- **Acesso Offline**: Pacotes de documentação descarregáveis
- **Integração Aprimorada de IDE**: Extensão VS Code para workflows AZD + IA
- **Painel Comunitário**: Métricas comunitárias em tempo real e acompanhamento de contribuições

## Contribuir para o Changelog

### Relatar Alterações
Ao contribuir para este repositório, por favor, assegure que as entradas do changelog incluem:

1. **Número da Versão**: Seguindo versionamento semântico (major.minor.patch)
2. **Data**: Data do lançamento ou atualização no formato AAAA-MM-DD
3. **Categoria**: Adicionado, Alterado, Preterido, Removido, Corrigido, Segurança
4. **Descrição Clara**: Descrição concisa do que foi alterado
5. **Avaliação de Impacto**: Como as alterações afetam os utilizadores existentes

### Categorias de Alterações

#### Adicionado
- Novas funcionalidades, secções de documentação ou capacidades
- Novos exemplos, templates ou recursos de aprendizagem
- Ferramentas, scripts ou utilitários adicionais

#### Alterado
- Modificações à funcionalidade existente ou documentação
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Preterido
- Funcionalidades ou abordagens que estão a ser eliminadas
- Secções de documentação agendadas para remoção
- Métodos que têm alternativas melhores

#### Removido
- Funcionalidades, documentação ou exemplos que já não são relevantes
- Informação desatualizada ou abordagens preteridas
- Conteúdo redundante ou consolidado

#### Corrigido
- Correções de erros na documentação ou código
- Resolução de problemas ou questões reportadas
- Melhorias de precisão ou funcionalidade

#### Segurança
- Melhorias ou correções relacionadas com segurança
- Atualizações das melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Diretrizes de Versionamento Semântico

#### Versão Major (X.0.0)
- Alterações incompatíveis que requerem ação do utilizador
- Reestruturação significativa de conteúdo ou organização
- Mudanças que alteram a abordagem ou metodologia fundamental

#### Versão Minor (X.Y.0)
- Novas funcionalidades ou adições de conteúdo
- Melhorias que mantêm compatibilidade retroativa
- Exemplos, ferramentas ou recursos adicionais

#### Versão Patch (X.Y.Z)
- Correções de bugs e reparações
- Melhorias menores no conteúdo existente
- Esclarecimentos e pequenos aprimoramentos

## Feedback e Sugestões da Comunidade

Encorajamos ativamente o feedback da comunidade para melhorar este recurso de aprendizagem:

### Como Fornecer Feedback
- **GitHub Issues**: Reportar problemas ou sugerir melhorias (problemas específicos de IA são bem-vindos)
- **Discussões no Discord**: Partilhar ideias e envolver-se com a comunidade Microsoft Foundry
- **Pull Requests**: Contribuir melhorias diretas ao conteúdo, especialmente templates e guias IA
- **Discord Microsoft Foundry**: Participar no canal #Azure para discussões AZD + IA
- **Fóruns Comunitários**: Participar em debates mais amplos de desenvolvedores Azure

### Categorias de Feedback
- **Precisão do Conteúdo IA**: Correções à informação de integração e deployment de serviços IA
- **Experiência de Aprendizagem**: Sugestões para fluxo de aprendizagem melhorado para desenvolvedores IA
- **Conteúdo IA em Falta**: Pedidos por templates, padrões ou exemplos IA adicionais
- **Acessibilidade**: Melhorias para necessidades diversas de aprendizagem
- **Integração de Ferramentas IA**: Sugestões para melhor integração de workflows de desenvolvimento IA
- **Padrões IA para Produção**: Pedidos de padrões de deployment IA empresarial

### Compromisso de Resposta
- **Resposta a Problemas**: Dentro de 48 horas para problemas reportados
- **Pedidos de Funcionalidade**: Avaliação dentro de uma semana
- **Contribuições Comunitárias**: Revisão dentro de uma semana
- **Questões de Segurança**: Prioridade imediata com resposta acelerada

## Calendário de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: Precisão do conteúdo e validação de links
- **Atualizações Trimestrais**: Grandes adições e melhorias de conteúdo
- **Revisões Semestrais**: Reestruturação completa e reforço
- **Lançamentos Anuais**: Atualizações de versão major com melhorias significativas

### Monitorização e Garantia de Qualidade
- **Testes Automatizados**: Validação regular de exemplos de código e ligações
- **Integração de Feedback da Comunidade**: Incorporação regular de sugestões dos utilizadores
- **Atualizações Tecnológicas**: Alinhamento com os mais recentes serviços Azure e lançamentos do azd
- **Auditorias de Acessibilidade**: Revisão regular dos princípios de design inclusivo

## Política de Suporte de Versão

### Suporte à Versão Atual
- **Última Versão Principal**: Suporte total com atualizações regulares
- **Versão Principal Anterior**: Atualizações de segurança e correções críticas durante 12 meses
- **Versões Legadas**: Suporte da comunidade apenas, sem atualizações oficiais

### Orientação para Migração
Quando versões principais são lançadas, fornecemos:
- **Guias de Migração**: Instruções passo a passo para a transição
- **Notas de Compatibilidade**: Detalhes sobre alterações que quebram compatibilidade
- **Suporte de Ferramentas**: Scripts ou utilitários para ajudar na migração
- **Suporte Comunitário**: Fóruns dedicados para questões sobre migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)
- **Próxima Lição**: Voltar ao [README Principal](README.md)

**Mantenha-se Atualizado**: Siga este repositório para receber notificações sobre novas versões e atualizações importantes dos materiais de aprendizagem.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->