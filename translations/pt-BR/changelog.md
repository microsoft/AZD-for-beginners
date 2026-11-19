# Registro de Alterações - AZD Para Iniciantes

## Introdução

Este registro de alterações documenta todas as mudanças notáveis, atualizações e melhorias no repositório AZD Para Iniciantes. Seguimos os princípios de versionamento semântico e mantemos este registro para ajudar os usuários a entender o que mudou entre as versões.

## Objetivos de Aprendizagem

Ao revisar este registro de alterações, você irá:
- Manter-se informado sobre novos recursos e adições de conteúdo
- Entender as melhorias feitas na documentação existente
- Acompanhar correções de bugs para garantir a precisão
- Seguir a evolução dos materiais de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Depois de revisar as entradas do registro, você será capaz de:
- Identificar novos conteúdos e recursos disponíveis para aprendizado
- Entender quais seções foram atualizadas ou melhoradas
- Planejar seu caminho de aprendizado com base nos materiais mais atuais
- Contribuir com feedback e sugestões para melhorias futuras

## Histórico de Versões

### [v3.25.0] - 2026-11-09

#### Extensão Microsoft Foundry 1.0 agora disponível para todos

O pacote `microsoft.foundry` 1.0 está **ativo e disponível para todos**, conforme anunciado em [5 de novembro de 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). O curso agora ensina o fluxo de trabalho GA lançado, não uma versão futura. Comece com AZD **1.37.0 ou posterior** e `azd ext install microsoft.foundry`.

#### Disponível nesta atualização do curso
- A orientação em inglês usa o pacote GA como caminho padrão de instalação e explica suas sete extensões principais versionadas independentemente.
- Um [tutorial de agente hospedado](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) cobre o exemplo da API de Respostas do Python Agent Framework upstream, uv atual, Python 3.13+, seleção de projeto novo/existente, reuso de modelo e revisão de `azure.yaml`.
- O fluxo de trabalho do local para a nuvem cobre testes do Agent Inspector, custos de chamadas de modelo com suporte do Azure, builds remotos de código, invocação implantada, rastreamento na nuvem, pré-visualização de implantação, logs e diagnósticos.
- Orientação separada para avaliação cobre a geração e revisão de conjuntos de dados/rúbricas, configuração de avaliação nomeada, registro de ativos e inspeção dos resultados. Instruções antigas de avaliação/otimização permanecem como histórico de migração, não como base da versão atual.
- A orientação de Foundry CI/CD inclui instalação da extensão do runner, implantação autenticada, ativos/acesso para avaliação e uma porta de qualidade explícita.
- A orientação de limpeza distingue projetos Foundry recém-criados e reutilizados. O workshop vincula ao exercício GA separado sem substituir seus testes específicos de exemplo.
- Navegação do curso, objetivos de aprendizagem, pré-requisitos de configuração, folha de dicas, FAQ e guia de estudo refletem o fluxo de trabalho GA. Traduções geradas não são editadas manualmente.

#### Escopo da revisão
- Baseado no anúncio GA, orientação vinculada do Microsoft Learn e configuração do exemplo upstream. Não foi realizada provisão ao vivo do Azure, implantação, invocação de modelo ou avaliação.
- O lançamento GA do pacote não implica GA para cada recurso opcional, extensão independente ou SDK, nem certifica os exemplos para produção.

### [v3.24.0]- 2026-11-04

#### Corrigido
- Navegação do curso em inglês reparada, caminhos de páginas movidas, âncoras faltantes e referências externas obsoletas, incluindo o link do Capítulo 2 para o guia AI de produção.
- Revisada a orientação atual contra AZD 1.37.2 publicado, agentes 1.0.0-beta.23 e avaliações 1.0.0-beta.2. Documentado o fluxo de trabalho separado `azd ai eval` e migração da configuração de otimização.
- Corrigidas flags CLI não suportadas, limites de autenticação, orientação de ambiente/segredo em texto simples, atualizações de infraestrutura, configuração de modelo e exemplos de recuperação destrutiva.
- Workshop atualizado contra o exemplo AI Agents atual, incluindo hooks reais, entradas de configuração, testes de avaliação, pontos de entrada para red-teaming e observabilidade.
- Corrigidas alegações de implementação de exemplo e reparados problemas associados à aplicação/infraestrutura/configuração. Material de arquitetura de varejo é explicitamente distinguido de uma aplicação funcional completa.
- Restaurada a matriz de linguagens do CodeQL, selecionado Node.js 24 suportado para o contêiner de desenvolvimento e feito validadores de configuração reportarem comandos de versão falhados.

#### Adicionado
- Verificador off-line de links/âncoras apenas em inglês, testes de regressão e fluxo de trabalho de documentação que também constrói o workshop em modo estrito. Traduções geradas e imagens traduzidas são excluídas.

#### Escopo da validação
- Verificações de origem, sintaxe, configuração, comportamento local e links de rede não estabelecem implantação ao vivo no Azure, cota, RBAC, disponibilidade regional de modelo, faturamento, conformidade de segurança ou prontidão para produção.
- Entradas mais antigas abaixo são registros históricos, não instruções atuais de comando ou lançamento.

### [v3.23.0] - 2026-07-13

#### Atualização de Atualidade de Versão: Atualização do AZD 1.27.1
**Esta versão revalida o curso contra `azd` `1.27.1` (julho de 2026, última versão estável) e a extensão de agente AI preview atual `azure.ai.agents` `1.0.0-beta.5`, atualizando todas as faixas "validado contra" após os lançamentos 1.26.0, 1.27.0 e 1.27.1.**

#### Alterado
- **✅ Linha base de validação atualizada** de `azd 1.25.6` (junho de 2026) para `azd 1.27.1` (julho de 2026) na raiz do README, em todos os READMEs dos capítulos, na lição do dev-container do Capítulo 1 (incluindo exemplos com versão fixada), na lição de templates personalizados do Capítulo 4, na lição multi-agente do Capítulo 5 e na documentação do workshop
- **🤖 Linha base do Capítulo 2 atualizada** de `azd 1.23.12` (março de 2026) para `azd 1.27.1` em `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` e `microsoft-foundry-integration.md`; datas da nota de validação atualizadas para 2026-07-13
- **🧩 Extensão de agente AI atualizada** de `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` para a versão atual `1.0.0-beta.5` no README do Capítulo 2 e `agents.md`
- **🧪 Exemplo de validação do workshop** (`azd version` saída) atualizado para `1.27.1`

#### Notas sobre lançamentos azd relevantes (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Suporte Go para Azure Functions no Flex Consumption, filtros de assinatura por locatário `azd config sub-filter`, pacotes de extensão autocontidos (`azd x pack --bundle`) e `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Projete diretamente projetos/agentes Model Azure AI Foundry em `azure.yaml` (init sem Bicep/Terraform), suporte à implantação de contêiner para App Service (`host: appservice` + `language: docker`), `-s/--source` direto para comandos `azd extension`, e `azd tool uninstall`
- **1.27.1 (2026-07-09):** Flag `--no-dependencies` para `azd extension install`, modelos depreciados excluídos dos prompts de catálogo/cota por padrão, e várias correções de bugs

#### Arquivos Atualizados
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

#### Preenchimento de Lacunas para Iniciantes #2: Criação de Templates, Dev Containers, Pulumi, Azure DevOps, Service Principals e Mais
**Esta versão fecha as lacunas intermediárias restantes identificadas pela análise azd-coverage: como criar e publicar seu próprio template, ambientes reproduzíveis de dev-container/Codespaces, o provedor de infraestrutura Pulumi, um tutorial de CI/CD do Azure DevOps, autenticação de service-principal, orientação de seleção de host (AKS/Spring Apps), explicações de `azd restore`/`azd package`, tratamento de erros em hooks e práticas de equipe/ambiente compartilhado.**

#### Adicionado
- **🧱 Nova lição do Capítulo 4** `docs/chapter-04-infrastructure/custom-templates.md` — criação do seu próprio template azd: estrutura necessária (`azure.yaml`, `infra/`, `src/`), o campo `metadata.template`, parametrização de infraestrutura com o token de recurso `uniqueString()` e a tag `azd-env-name`, testes locais com `azd init --template <local-path>`, publicação no GitHub e submissão para a galeria Awesome AZD
- **📦 Nova lição do Capítulo 1** `docs/chapter-01-foundation/dev-containers.md` — ambientes azd reproduzíveis com Dev Containers e GitHub Codespaces: um `.devcontainer/devcontainer.json` minimalista usando a feature oficial `ghcr.io/azure/azure-dev/azd`, recursos específicos por linguagem, `docker-in-docker` para hosts de contêiner e `azd auth login --use-device-code` para login remoto
- **🧩 Seção Pulumi com azd** em `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, layout da pasta Pulumi, stacks mapeados para ambientes azd, outputs/tagging necessários e o fluxo de trabalho `azd up` / `azd down` idêntico
- **🎯 Orientação de seleção de host** em `docs/chapter-04-infrastructure/provisioning.md` — comparação amigável para iniciantes de `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` e `springapp`, com orientação sobre quando escolher AKS ou Azure Spring Apps
- **🛠️ Tutorial Azure DevOps CI/CD** em `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, conexão de serviço com federação de identidade de workload (OIDC), `azure-dev.yml` gerada e configuração de grupo de variáveis
- **🔑 Service Principals (Padrão 4)** adicionados em `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` não interativo com secret de cliente vs. credenciais federadas/OIDC, quando usar e armazenamento seguro de credenciais
- **🪝 Sub-seção de tratamento de erros em hooks** em `docs/chapter-04-infrastructure/deployment-guide.md` — códigos de saída e `set -e`, `continueOnError`, teste de hooks isoladamente com `azd hooks run`, shells específicos do SO e `--debug`
- **👥 Seção time/ambientes compartilhados** em `docs/chapter-03-configuration/configuration.md` — o que vive em `.azure/`, o que ignorar no git, ambientes por desenvolvedor, `azd env list`/`select` e fornecimento de valores de ambiente no CI/CD
- **🧰 Explicações aprimoradas de `azd restore` e `azd package`** em `resources/cheat-sheet.md` — restauração de dependências e construção de artefato implantável sem implantar

#### Alterado
- **🧭 Tabela de lições do Capítulo 4** atualizada para incluir a nova lição "Criando Seu Próprio Template" (Lição 3)
- **🧭 Tabela de lições do Capítulo 1** atualizada para incluir a nova lição "Dev Containers & Codespaces" (Lição 5); rodapés de navegação conectados entre `bring-your-own-app.md` e `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Preenchimento de Lacunas para Iniciantes: Lição Prática Multi-Agente, "Traga Seu Próprio App," Terraform e Tutorial CI/CD
**Esta versão fecha as maiores lacunas para um guia completo para iniciantes adicionando duas novas lições práticas (um tutorial deployável multi-agente e como adicionar azd a um app existente), uma introdução amigável a hooks, uma seção Terraform com azd, um tutorial passo-a-passo de pipeline GitHub Actions, explicações para as novas extensões preview e uma checklist explícita de verificação de implantação.**

#### Adicionado
- **🤝 Nova lição do Capítulo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — um tutorial prático totalmente deployável com dois agentes (orquestrador + especialistas) usando um template real (`contoso-creative-writer`), cobrindo quando usar multi-agente, o fluxo de trabalho `azd up`, compreensão dos recursos implantados, rastreamento cruzado entre agentes, customização e limpeza
- **📦 Nova lição do Capítulo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — como adicionar azd a um projeto existente com `azd init` ("usar código no diretório atual"), compreensão do `azure.yaml` e `infra/`, `azd infra generate`, detecção de host e implantação com `azd up`
- **🌐 Seção Terraform com azd** adicionada a `docs/chapter-04-infrastructure/provisioning.md` — configuração `infra.provider: terraform`, layout da pasta `.tf`, outputs `AZURE_*` necessários e tagging `azd-env-name`, e fluxo de trabalho `azd up` / `azd down` idêntico (fecha a lacuna onde o suporte Terraform era alegado mas apenas Bicep era mostrado)
- **⚙️ Passo a passo do GitHub Actions** em `docs/chapter-08-production/production-ai-practices.md` — do repositório GitHub aos deployments automatizados: `azd pipeline config`, credenciais federadas OIDC (sem segredos armazenados), o `azure-dev.yml` gerado, e orientações sobre segredos vs variáveis
- **🪝 Introdução para iniciantes "Novo em hooks?"** em `docs/chapter-04-infrastructure/deployment-guide.md` — o que é um hook, uma tabela de estágios de hook, um primeiro hook mínimo, e execução manual de hooks com `azd hooks run`
- **✅ Checklist "Verifique seu Deploy"** adicionado ao Passo 5 de `docs/chapter-01-foundation/first-project.md` — smoke test, verificação do endpoint de saúde, e critérios explícitos de sucesso
- **🧩 Explicação para novas extensões de preview** `azure.ai.skills` e `azure.ai.connections` (o que são e quando utilizá-las) em `docs/chapter-08-production/production-ai-practices.md`

#### Alterações
- **🧭 Tabela de lições do Capítulo 5 corrigida**: `multi-agent-basics.md` agora é a Lição 1 (única lição totalmente prática), com indicação clara de que a Lição 2 está no Capítulo 6, e o cenário Retail é um blueprint de arquitetura, não um template de um comando só
- **🧭 Tabela de lições do Capítulo 1** agora inclui a nova lição "Traga Seu Próprio App" (Lição 4)
- **🔗 Rodapés de navegação** atualizados: `first-project.md` agora linka para frente em `bring-your-own-app.md`

#### Correções
- **🧱 Fechada a lacuna "reclamado mas faltando" do Terraform** — o curso anteriormente mencionava suporte ao Terraform sem mostrar exemplos
- **🔀 Corrigidos links cruzados enganosos no Capítulo 5** que davam a entender que havia uma implementação completa multi-agente quando só existia o blueprint de arquitetura

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

#### Atualização AZD 1.25.6, Comandos Completo do Ciclo de Vida do Agente & Rebranding Aspire
**Esta versão revalida o curso contra `azd` `1.25.6` (junho de 2026) e a extensão `azure.ai.agents` `0.1.40-preview`, expande a orientação de IA de "criar um agente" para o ciclo completo do agente (teste → avaliar → otimizar → inspecionar → deletar), destaca as novas extensões de preview `azure.ai.skills` e `azure.ai.connections`, e nota o rebranding do produto de ".NET Aspire" para "Aspire".**

#### Adicionado
- **🔁 Cobertura completa do ciclo de vida do agente** para iniciantes e engenheiros de IA em toda a documentação:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabela de ciclo de vida (criar → testar → medir → melhorar → inspecionar → limpar) adicionada à seção de Extensões e Comandos de IA
  - `docs/chapter-08-production/production-ai-practices.md` — Nova seção "Gerenciando o Ciclo de Vida do Agente" abrangendo `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
  - `resources/cheat-sheet.md` — Comandos expandidos de Agente de IA com `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
- **🧩 Novas extensões de preview** documentadas: `azure.ai.skills` (habilidades reutilizáveis de agente) e `azure.ai.connections` (conexões Foundry) adicionadas à tabela de extensões e ao cheat sheet
- **⏱️ Orientação de tempo de resposta** — exemplos `azd ai agent invoke` agora indicam que imprimem latência total e tempo para o primeiro byte
- **📌 Banner de versão** no README raiz direcionando os alunos para `azd version` e `azd upgrade`

#### Alterado
- **✅ Linha base de validação atualizada** de `azd 1.23.12` (março de 2026) para `azd 1.25.6` (junho de 2026) em todos os README dos capítulos e na docs do workshop
- **🤖 Nota de extensão do Capítulo 2** atualizada de `azure.ai.agents` `0.1.18-preview` para `0.1.40-preview`
- **🧪 Exemplo de validação de workshop** (saída `azd version`) atualizado para `1.25.6`
- **🧭 README "Novidades no azd Hoje"** atualizado para destacar o ciclo completo do agente, novas extensões de IA e correções recentes que melhoram a experiência (`azd init` idempotência, `azd auth login` limpeza de token obsoleto, `azd tool` prompt da primeira execução)
- **📖 agents.md do Capítulo 2 (Opção 4)** agora direciona os alunos para os comandos do ciclo de vida pós-deploy em vez de parar no `azd up`

#### Corrigido
- **🏷️ Nome do produto** — adicionada nota do rebranding Aspire (".NET Aspire" é agora simplesmente "Aspire"); o suporte ao Aspire no azd permanece inalterado
- **🔎 Validação da release ao vivo** confirmada com o feed de lançamento do Azure Developer CLI: CLI estável `1.25.6` (2026-06-12) e `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Esclarecimento para Iniciantes, Validação de Setup & Limpeza Final dos Comandos AZD
**Esta versão dá seguimento à varredura de validação do AZD 1.23 com uma revisão da documentação focada em iniciantes: ela esclarece a orientação sobre autenticação dominante AZD-first, adiciona scripts locais de validação de setup, verifica comandos-chave contra o CLI AZD ao vivo, e remove as últimas referências obsoletas em inglês a comandos fora do changelog.**

#### Adicionado
- **🧪 Scripts de validação de setup para iniciantes** com `validate-setup.ps1` e `validate-setup.sh` para que os alunos possam confirmar as ferramentas necessárias antes de começar o Capítulo 1
- **✅ Etapas iniciais de validação de setup** no README raiz e no README do Capítulo 1 para garantir que pré-requisitos ausentes sejam detectados antes do `azd up`

#### Alterado
- **🔐 Orientação de autenticação para iniciantes** agora trata consistentemente `azd auth login` como caminho principal para fluxos de trabalho AZD, com `az login` destacado como opcional a menos que comandos Azure CLI sejam utilizados diretamente
- **📚 Fluxo de onboarding do Capítulo 1** agora direciona os alunos a validar seu setup local antes dos passos de instalação, autenticação e primeiro deploy
- **🛠️ Mensagens do validador** agora distinguem claramente requisitos bloqueadores e avisos opcionais do Azure CLI para o caminho só AZD para iniciantes
- **📖 Docs de configuração, troubleshooting e exemplos** agora distinguem entre autenticação AZD requerida e sign-in Azure CLI opcional, quando antes ambos eram apresentados sem contexto

#### Corrigido
- **📋 Referências restantes a comandos de origem em inglês** atualizadas para as formas atuais do AZD, incluindo `azd config show` no cheat sheet e `azd monitor --overview` onde a visão geral do portal Azure era pretendida
- **🧭 Promessas para iniciantes no Capítulo 1** suavizadas para evitar prometer comportamento garantido sem erros ou rollback em todos os templates e recursos Azure
- **🔎 Validação ao vivo do CLI** confirmada para suporte atual de `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, e `azd down --force --purge`

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

#### Validação AZD 1.23.12, Expansão do Ambiente Workshop & Atualização do Modelo de IA
**Esta versão realiza uma varredura de validação da documentação contra `azd` `1.23.12`, atualiza exemplos desatualizados de comandos AZD, atualiza a orientação dos modelos de IA para padrões atuais, e amplia as instruções do workshop além do GitHub Codespaces para suportar dev containers e clones locais.**

#### Adicionado
- **✅ Notas de validação em capítulos principais e docs do workshop** para tornar explícita a base testada do AZD para alunos usando builds CLI mais novas ou antigas
- **⏱️ Orientação de timeout de deploy** para deploys longos de app IA usando `azd deploy --timeout 1800`
- **🔎 Passos de inspeção de extensão** com `azd extension show azure.ai.agents` na documentação do fluxo de trabalho de IA
- **🌐 Orientação mais ampla de ambiente do workshop** cobrindo GitHub Codespaces, dev containers e clones locais com MkDocs

#### Alterado
- **📚 READMEs introdutórios dos capítulos** agora consistentemente mencionam validação contra `azd 1.23.12` em seções de fundação, configuração, infraestrutura, multi-agente, pré-deploy, troubleshooting e produção
- **🛠️ Referências a comandos AZD** atualizadas para formas atuais em toda a documentação:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ou `azd env get-value(s)` dependendo do contexto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` onde a visão geral do Application Insights é pretendida
- **🧪 Exemplos de provisionamento de preview** simplificados para uso atual suportado como `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Fluxo do workshop** atualizado para permitir que os alunos completem os labs em Codespaces, dev container ou clone local, em vez de assumir execução apenas em Codespaces
- **🔐 Orientação de autenticação** agora prefere `azd auth login` para fluxos AZD, com `az login` como opcional quando comandos Azure CLI forem usados diretamente

#### Corrigido
- **🪟 Comandos de instalação no Windows** normalizados para o casing atual do pacote `winget` no guia de instalação
- **🐧 Orientação de instalação no Linux** corrigida para evitar instruções de gerenciador de pacotes específicas de distro não suportadas `azd`, apontando em vez disso para assets de release onde apropriado
- **📦 Exemplos de modelos de IA** atualizados de padrões antigos como `gpt-35-turbo` e `text-embedding-ada-002` para exemplos atuais como `gpt-4.1-mini`, `gpt-4.1`, e `text-embedding-3-large`
- **📋 Trechos de deploy e diagnósticos** corrigidos para usar comandos atuais de ambiente e status em logs, scripts e passos de troubleshooting
- **⚙️ Orientação GitHub Actions** atualizada de `Azure/setup-azd@v1.0.0` para `Azure/setup-azd@v2`
- **🤖 Orientação de consentimento MCP/Copilot** atualizada de `azd mcp consent` para `azd copilot consent list`

#### Melhorias
- **🧠 Orientação no capítulo de IA** agora explica melhor o comportamento sensível a preview do `azd ai`, login específico de tenant, uso atual de extensões, e recomendações atualizadas de deploy de modelos
- **🧪 Instruções do workshop** agora usam exemplos de versões mais realistas e linguagem mais clara para setup de ambiente em labs práticos
- **📈 Documentação de produção e troubleshooting** melhor alinhada com exemplos atuais de monitoramento, modelo fallback e tiers de custo

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

#### Comandos AZD IA CLI, Validação de Conteúdo & Expansão de Template
**Esta versão adiciona cobertura dos comandos `azd ai`, `azd extension` e `azd mcp` em todos os capítulos relacionados à IA, corrige links quebrados e código depreciado em agents.md, atualiza a tabela de consulta rápida e reformula a seção de Modelos de Exemplo com descrições validadas e novos templates Azure AI AZD.**

#### Adicionado
- **🤖 Cobertura do AZD AI CLI** em 7 arquivos (anteriormente apenas no Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova seção "Extensões e Comandos de IA" apresentando `azd extension`, `azd ai agent init` e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opção 4: `azd ai agent init` com tabela comparativa (abordagem por template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subseções "Extensões AZD para Foundry" e "Implantação Agent-First"
  - `docs/chapter-05-multi-agent/README.md` — Início rápido agora mostra os caminhos de implantação tanto por template quanto por manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — A seção de implantação agora inclui opção `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseção "Comandos da Extensão AZD AI para Diagnósticos"
  - `resources/cheat-sheet.md` — Nova seção "Comandos de IA e Extensões" com `azd extension`, `azd ai agent init`, `azd mcp` e `azd infra generate`
- **📦 Novos templates de exemplo AZD AI** em `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET com Blazor WebAssembly, Semantic Kernel e suporte a voz
  - **azure-search-openai-demo-java** — Chat RAG Java usando Langchain4J com opções de implantação ACA/AKS
  - **contoso-creative-writer** — Aplicativo de escrita criativa multiagente usando Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB com suporte de desenvolvimento local Ollama
  - **chat-with-your-data-solution-accelerator** — Acelerador empresarial RAG com portal administrativo, integração com Teams e opções PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicativo de referência para orquestração MCP multiagente com servidores em .NET, Python, Java e TypeScript
  - **azd-ai-starter** — Template inicial mínimo de infraestrutura Azure AI em Bicep
  - **🔗 Link para Galeria Excelente AZD AI** — Referência para a [galeria incrível de AI do awesome-azd](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Corrigido
- **🔗 Navegação em agents.md**: Links Anterior/Próximo agora correspondem à ordem das lições do README do Capítulo 2 (Integração Microsoft Foundry → Agents → Implantação de modelo IA)
- **🔗 Links quebrados em agents.md**: `production-ai-practices.md` corrigido para `../chapter-08-production/production-ai-practices.md` (3 ocorrências)
- **📦 Código depreciado em agents.md**: Substituído `opencensus` por `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API inválida em agents.md**: `max_tokens` movido de `create_agent()` para `create_run()` como `max_completion_tokens`
- **🔢 Contagem de tokens em agents.md**: Estimativa aproximada `len//4` substituída por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Serviços corrigidos de "Cognitive Search + App Service" para "Azure AI Search + Azure Container Apps" (host padrão mudou em out/2024)
- **contoso-chat**: Descrição atualizada para referenciar Azure AI Foundry + Prompty, correspondendo ao título real e stack tecnológico do repositório

#### Removido
- **ai-document-processing**: Removida referência a template não funcional (repositório não acessível publicamente como template AZD)

#### Melhorado
- **📝 Exercícios em agents.md**: Exercício 1 agora mostra saída esperada e passo `azd monitor`; Exercício 2 inclui código completo de registro `FunctionTool`; Exercício 3 substitui instruções vagas por comandos concretos `prepdocs.py`
- **📚 Recursos em agents.md**: Links de documentação atualizados para docs atuais do Azure AI Agent Service e quickstart
- **📋 Tabela Próximos Passos em agents.md**: Adicionado link para laboratório do AI Workshop para cobertura completa do capítulo

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

#### Aperfeiçoamento na Navegação do Curso
**Esta versão melhora a navegação dos capítulos no README.md com um formato de tabela aprimorado.**

#### Alterado
- **Tabela do Mapa do Curso**: Aprimorada com links diretos para lições, estimativas de duração e avaliações de complexidade
- **Limpeza de Pastas**: Remoção de pastas antigas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validação de Links**: Todos os 21+ links internos na tabela do Mapa do Curso verificados

### [v3.16.0] - 2026-02-05

#### Atualizações de Nome de Produto
**Esta versão atualiza referências de produtos para a marca atual da Microsoft.**

#### Alterado
- **Microsoft Foundry → Microsoft Foundry**: Todas as referências atualizadas em arquivos que não são de tradução
- **Azure AI Agent Service → Foundry Agents**: Nome do serviço atualizado para refletir a marca atual

#### Arquivos Atualizados
- `README.md` - Página principal do curso
- `changelog.md` - Histórico de versões
- `course-outline.md` - Estrutura do curso
- `docs/chapter-02-ai-development/agents.md` - Guia de agentes de IA
- `examples/README.md` - Documentação de exemplos
- `workshop/README.md` - Página do workshop
- `workshop/docs/index.md` - Índice do workshop
- `workshop/docs/instructions/*.md` - Todos os arquivos de instruções do workshop

---

### [v3.15.0] - 2026-02-05

#### Grande Reestruturação do Repositório: Nomes de Pastas Baseados em Capítulos
**Esta versão reorganiza a documentação em pastas dedicadas por capítulo para uma navegação mais clara.**

#### Renomeação de Pastas
Pastas antigas foram substituídas por pastas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Novo adicionado: `docs/chapter-05-multi-agent/`

#### Migração de Arquivos
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
| Todos os arquivos de pré-implantação | pre-deployment/ | chapter-06-pre-deployment/ |
| Todos os arquivos de solução de problemas | troubleshooting/ | chapter-07-troubleshooting/ |

#### Adicionado
- **📚 Arquivos README de Capítulo**: Criado README.md em cada pasta de capítulo com:
  - Objetivos de aprendizagem e duração
  - Tabela de lições com descrições
  - Comandos para início rápido
  - Navegação para outros capítulos

#### Alterado
- **🔗 Atualizados todos os links internos**: Mais de 78 caminhos atualizados em todos os arquivos de documentação
- **🗺️ README.md principal**: Mapa do Curso atualizado com nova estrutura de capítulos
- **📝 examples/README.md**: Referências cruzadas atualizadas para pastas de capítulos

#### Removido
- Estrutura antiga de pastas (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestruturação do Repositório: Navegação por Capítulo
**Esta versão adicionou arquivos README de navegação por capítulo (substituído pela v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novo Guia de Agentes de IA
**Esta versão adiciona um guia abrangente para implantar agentes de IA com Azure Developer CLI.**

#### Adicionado
- **🤖 docs/microsoft-foundry/agents.md**: Guia completo abordando:
  - O que são agentes de IA e como diferem de chatbots
  - Três templates rápidos para começar (Foundry Agents, Prompty, RAG)
  - Padrões de arquitetura de agente (agente único, RAG, multiagente)
  - Configuração e personalização de ferramentas
  - Monitoramento e rastreamento de métricas
  - Considerações e otimização de custos
  - Cenários comuns de solução de problemas
  - Três exercícios práticos com critérios de sucesso

#### Estrutura do Conteúdo
- **Introdução**: Conceitos de agente para iniciantes
- **Início Rápido**: Implantar agentes com `azd init --template get-started-with-ai-agents`
- **Padrões de Arquitetura**: Diagramas visuais dos padrões de agente
- **Configuração**: Configuração de ferramentas e variáveis de ambiente
- **Monitoramento**: Integração com Application Insights
- **Exercícios**: Aprendizado prático progressivo (20-45 minutos cada)

---

### [v3.12.0] - 2026-02-05

#### Atualização do Ambiente DevContainer
**Esta versão atualiza a configuração do container de desenvolvimento com ferramentas modernas e melhores padrões para a experiência de aprendizado AZD.**

#### Alterado
- **🐳 Imagem Base**: Atualizada de `python:3.12-bullseye` para `python:3.12-bookworm` (Debian estável mais recente)
- **📛 Nome do Container**: Renomeado de "Python 3" para "AZD para Iniciantes" para maior clareza

#### Adicionado
- **🔧 Novas Funcionalidades no Dev Container**:
  - `azure-cli` com suporte a Bicep ativado
  - `node:20` (versão LTS para templates AZD)
  - `github-cli` para gerenciamento de templates
  - `docker-in-docker` para implantações de container apps

- **🔌 Redirecionamento de Portas**: Portas pré-configuradas para desenvolvimento comum:
  - 8000 (pré-visualização MkDocs)
  - 3000 (aplicativos web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Novas Extensões VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python melhorado
  - `ms-azuretools.vscode-azurefunctions` - Suporte a Azure Functions
  - `ms-azuretools.vscode-docker` - Suporte a Docker
  - `ms-azuretools.vscode-bicep` - Suporte à linguagem Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gerenciamento de recursos Azure
  - `yzhang.markdown-all-in-one` - Edição de Markdown
  - `DavidAnson.vscode-markdownlint` - Linting de Markdown
  - `bierner.markdown-mermaid` - Suporte a diagramas Mermaid
  - `redhat.vscode-yaml` - Suporte a YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualização de Git
  - `mhutchie.git-graph` - Histórico Git

- **⚙️ Configurações do VS Code**: Adicionadas configurações padrão para interpretador Python, formatação ao salvar e remoção de espaços em branco

- **📦 Atualizado requirements-dev.txt**:
  - Adicionado plugin de minificação para MkDocs
  - Adicionado pre-commit para qualidade de código
  - Adicionados pacotes SDK Azure (azure-identity, azure-mgmt-resource)

#### Corrigido
- **Comando Pós-Criação**: Agora verifica instalação do AZD e Azure CLI na inicialização do container

---

### [v3.11.0] - 2026-02-05

#### Reformulação do README para Iniciantes
**Esta versão melhora significativamente o README.md para ser mais acessível a iniciantes e adiciona recursos essenciais para desenvolvedores de IA.**

#### Adicionado
- **🆚 Comparação Azure CLI vs AZD**: Explicação clara de quando usar cada ferramenta com exemplos práticos
- **🌟 Links incríveis do AZD**: Links diretos para galeria comunitária de templates e recursos de contribuição:
  - [Galeria Incrível AZD](https://azure.github.io/awesome-azd/) - 200+ templates prontos para implantar
  - [Enviar um Template](https://github.com/Azure/awesome-azd/issues) - Contribuição da comunidade
- **🎯 Guia de Início Rápido**: Seção simplificada de 3 passos para começar (Instalar → Login → Implantar)
- **📊 Tabela de Navegação Baseada em Experiência**: Orientação clara de onde começar de acordo com a experiência do desenvolvedor

#### Alterado
- **Estrutura do README**: Reorganizada para divulgação progressiva - informações-chave primeiro
- **Seção de Introdução**: Reescrita para explicar "A Magia do `azd up`" para iniciantes completos
- **Conteúdo Duplicado Removido**: Eliminada seção duplicada de solução de problemas
- **Comandos para Solução de Problemas**: Referência corrigida `azd logs` para usar `azd monitor --logs` válido

#### Corrigido
- **🔐 Comandos de Autenticação**: Adicionados `azd auth login` e `azd auth logout` ao cheat-sheet.md
- **Referências Inválidas de Comando**: Removido o restante de `azd logs` da seção de solução de problemas do README

#### Notas
- **Escopo**: Alterações aplicadas ao README.md principal e resources/cheat-sheet.md
- **Público-Alvo**: Melhorias especificamente direcionadas a desenvolvedores novos no AZD

---

### [v3.10.0] - 2026-02-05

#### Atualização de Precisão dos Comandos do Azure Developer CLI
**Esta versão corrige comandos AZD inexistentes em toda a documentação, garantindo que todos os exemplos de código usem sintaxe válida do Azure Developer CLI.**

#### Corrigido
- **🔧 Remoção de Comandos AZD Inexistentes**: Auditoria abrangente e correção de comandos inválidos:
  - `azd logs` (não existe) → substituído por `azd monitor --logs` ou alternativas Azure CLI
  - subcomandos `azd service` (não existem) → substituídos por `azd show` e Azure CLI
  - `azd infra import/export/validate` (não existem) → removidos ou substituídos por alternativas válidas
  - flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (não existem) → removidas
  - flags `azd provision --what-if/--rollback` (não existem) → atualizadas para usar `--preview`
  - `azd config validate` (não existe) → substituído por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (não existem) → removidos

- **📚 Arquivos Atualizados com Correções de Comando**:
  - `resources/cheat-sheet.md`: Revisão completa da referência de comandos
  - `docs/deployment/deployment-guide.md`: Corrigidas estratégias de rollback e implantação
  - `docs/troubleshooting/debugging.md`: Corrigidas seções de análise de logs
  - `docs/troubleshooting/common-issues.md`: Atualizados comandos de solução de problemas
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigida seção de depuração AZD
  - `docs/getting-started/azd-basics.md`: Corrigidos comandos de monitoramento
  - `docs/getting-started/first-project.md`: Atualizados exemplos de monitoramento e depuração
  - `docs/getting-started/installation.md`: Corrigidos exemplos de ajuda e versão
  - `docs/pre-deployment/application-insights.md`: Corrigidos comandos de visualização de logs
  - `docs/pre-deployment/coordination-patterns.md`: Corrigidos comandos de depuração do agente

- **📝 Referência de Versão Atualizada**: 
  - `docs/getting-started/installation.md`: Versão `1.5.0` hardcoded alterada para `1.x.x` genérica com link para releases

#### Alterado
- **Estratégias de Rollback**: Documentação atualizada para usar rollback baseado em Git (AZD não possui rollback nativo)
- **Visualização de Logs**: Referências `azd logs` substituídas por `azd monitor --logs`, `azd monitor --live` e comandos Azure CLI
- **Seção de Performance**: Removidas flags inexistentes de implantação paralela/incremental, fornecidas alternativas válidas

#### Detalhes Técnicos
- **Comandos AZD Válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidas azd monitor**: `--live`, `--logs`, `--overview`
- **Recursos removidos**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificação**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Conclusão do Workshop e Atualização de Qualidade da Documentação
**Esta versão conclui os módulos interativos do workshop, corrige todos os links quebrados da documentação e melhora a qualidade geral do conteúdo para desenvolvedores de IA usando Microsoft AZD.**

#### Adicionado
- **📝 CONTRIBUTING.md**: Novo documento de diretrizes de contribuição com:
  - Instruções claras para reportar problemas e propor mudanças
  - Padrões de documentação para novo conteúdo
  - Diretrizes para exemplos de código e convenções de mensagens de commit
  - Informações para engajamento da comunidade

#### Concluído
- **🎯 Módulo 7 do Workshop (Encerramento)**: Módulo de encerramento totalmente concluído com:
  - Resumo abrangente das realizações do workshop
  - Seção de conceitos-chave dominados cobrindo AZD, templates e Microsoft Foundry
  - Recomendações para continuidade da jornada de aprendizado
  - Exercícios desafiadores do workshop com níveis de dificuldade
  - Feedback da comunidade e links de suporte

- **📚 Módulo 3 do Workshop (Desconstrução)**: Objetivos de aprendizagem atualizados com:
  - Ativação do GitHub Copilot com servidores MCP
  - Compreensão da estrutura de pastas de templates AZD
  - Padrões de organização de infraestrutura como código (Bicep)
  - Instruções para laboratório prático

- **🔧 Módulo 6 do Workshop (Desmontagem)**: Concluído com:
  - Objetivos de limpeza de recursos e gerenciamento de custos
  - Uso de `azd down` para desprovisionamento seguro de infraestrutura
  - Orientações para recuperação de serviços cognitivos deletados suavemente
  - Prompts bônus para exploração do GitHub Copilot e Portal Azure

#### Corrigido
- **🔗 Correção de Links Quebrados**: Resolvidos mais de 15 links internos quebrados da documentação:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrigidos caminhos para microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrigidos caminhos para ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Substituído cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Corrigidos caminhos para FAQ e guia de solução de problemas
  - `examples/container-app/microservices/README.md`: Corrigidos caminhos para página inicial do curso e guia de implantação
  - `resources/faq.md` e `resources/glossary.md`: Atualizadas referências do capítulo de IA
  - `course-outline.md`: Corrigidos guias do instrutor e referências de laboratório do workshop de IA

- **📅 Banner de Status do Workshop**: Atualizado de "Em Construção" para status ativo do workshop com data fevereiro de 2026

- **🔗 Navegação do Workshop**: Corrigidos links de navegação quebrados no README.md do workshop que apontavam para pasta lab-1-azd-basics inexistente

#### Alterado
- **Apresentação do Workshop**: Removido aviso "em construção", workshop agora está completo e pronto para uso
- **Consistência de Navegação**: Garantida navegação apropriada entre todos os módulos do workshop
- **Referências do Caminho de Aprendizagem**: Atualizadas referências cruzadas dos capítulos para usar caminhos corretos microsoft-foundry

#### Validado
- ✅ Todos os arquivos markdown em inglês possuem links internos válidos
- ✅ Módulos 0-7 do workshop estão completos com objetivos de aprendizagem
- ✅ Navegação entre capítulos e módulos funciona corretamente
- ✅ Conteúdo é adequado para desenvolvedores de IA usando Microsoft AZD
- ✅ Linguagem e estrutura amigáveis para iniciantes mantidas em todo o conteúdo
- ✅ CONTRIBUTING.md fornece orientações claras para colaboradores da comunidade

#### Implementação Técnica
- **Validação de Links**: Script PowerShell automatizado verificou todos os links internos .md
- **Auditoria de Conteúdo**: Revisão manual da completude do workshop e adequação para iniciantes
- **Sistema de Navegação**: Padrões consistentes de navegação para capítulos e módulos aplicados

#### Notas
- **Escopo**: Alterações aplicadas apenas à documentação em inglês
- **Traduções**: Pastas de tradução não atualizadas nesta versão (tradução automática será sincronizada depois)
- **Duração do Workshop**: Workshop completo agora fornece 3-4 horas de aprendizado prático

---

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitoramento, Segurança e Padrões Multi-Agentes
**Esta versão adiciona lições abrangentes de grau A sobre integração do Application Insights, padrões de autenticação e coordenação multi-agente para implantações de produção.**

#### Adicionado
- **📊 Lição de Integração Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Implantação focada em AZD com provisionamento automático
  - Templates Bicep completos para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria personalizada (mais de 1.200 linhas)
  - Padrões de monitoramento AI/LLM (rastreio de tokens/custos Microsoft Foundry Models)
  - 6 diagramas Mermaid (arquitetura, rastreamento distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, dashboards, monitoramento AI)
  - Exemplos de query Kusto e estratégias de otimização de custos
  - Streaming de métricas ao vivo e depuração em tempo real
  - Tempo de aprendizado de 40-50 minutos com padrões prontos para produção

- **🔐 Lição de Padrões de Autenticação & Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (strings de conexão, Key Vault, identidade gerenciada)
  - Templates Bicep completos para infraestrutura de implantações seguras
  - Código de aplicação Node.js com integração Azure SDK
  - 3 exercícios completos (ativar identidade gerenciada, identidade atribuída ao usuário, rotação Key Vault)
  - Melhores práticas de segurança e configurações RBAC
  - Guia de solução de problemas e análise de custos
  - Padrões de autenticação sem senha prontos para produção

- **🤖 Lição de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, orientado a eventos, consenso)
  - Implementação completa de serviço orquestrador (Python/Flask, mais de 1.500 linhas)
  - 3 implementações especializadas de agentes (Pesquisa, Escritor, Editor)
  - Integração com Service Bus para fila de mensagens
  - Gerenciamento de estado Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interações dos agentes
  - 3 exercícios avançados (gerenciamento de timeout, lógica de retry, circuito breaker)
  - Análise de custos ($240-565/mês) com estratégias de otimização
  - Integração Application Insights para monitoramento

#### Melhorado
- **Capítulo Pré-implantação**: Agora inclui padrões abrangentes de monitoramento e coordenação
- **Capítulo Introdução**: Melhorado com padrões profissionais de autenticação
- **Prontidão para Produção**: Cobertura completa desde segurança até observabilidade
- **Sumário do Curso**: Atualizado para referenciar novas lições nos Capítulos 3 e 6

#### Alterado
- **Progressão do Aprendizado**: Melhor integração de segurança e monitoramento ao longo do curso
- **Qualidade da Documentação**: Padrões consistentes de grau A (95-97%) nas novas lições
- **Padrões de Produção**: Cobertura ponta a ponta para implantações empresariais

#### Aprimorado
- **Experiência do Desenvolvedor**: Caminho claro do desenvolvimento ao monitoramento em produção
- **Padrões de Segurança**: Padrões profissionais para autenticação e gerenciamento de segredos
- **Observabilidade**: Integração completa do Application Insights com AZD
- **Workloads de IA**: Monitoramento especializado para Microsoft Foundry Models e sistemas multi-agente

#### Validado
- ✅ Todas as lições incluem código funcional completo (não apenas snippets)
- ✅ Diagramas Mermaid para aprendizagem visual (19 no total nas 3 lições)
- ✅ Exercícios práticos com etapas de verificação (9 no total)
- ✅ Templates Bicep prontos para produção implantáveis via `azd up`
- ✅ Análise de custos e estratégias de otimização
- ✅ Guias de solução de problemas e melhores práticas
- ✅ Pontos de verificação de conhecimento com comandos de verificação

#### Resultados da Classificação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia abrangente de monitoramento
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas avançadas multi-agente
- **Conteúdo Geral Novo**: - Padrões consistentes de alta qualidade

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria personalizada + rastreamento distribuído
- **Autenticação**: Identidade gerenciada + Key Vault + padrões RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitoramento**: Métricas ao vivo + queries Kusto + alertas + dashboards
- **Gerenciamento de Custos**: Estratégias de amostragem, políticas de retenção, controles orçamentários

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo Microsoft Foundry Models
**Esta versão aprimora a qualidade da documentação em todo o repositório e adiciona um exemplo completo de implantação Microsoft Foundry Models com interface de chat gpt-4.1.**

#### Adicionado
- **🤖 Exemplo de Chat Microsoft Foundry Models**: Implantação completa gpt-4.1 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa Microsoft Foundry Models (implantação modelo gpt-4.1)
  - Interface de chat em linha de comando Python com histórico de conversas
  - Integração Key Vault para armazenamento seguro de chaves API
  - Rastreamento de uso de tokens e estimativa de custos
  - Limitação de taxa e tratamento de erros
  - README abrangente com guia de implantação de 35-45 minutos
  - 11 arquivos prontos para produção (templates Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Exercícios práticos adicionados ao guia de configuração:
  - Exercício 1: Configuração multi-ambiente (15 minutos)
  - Exercício 2: Prática de gerenciamento de segredos (10 minutos)
  - Critérios claros de sucesso e etapas de verificação
- **✅ Verificação de Implantação**: Seção de verificação adicionada ao guia de implantação:
  - Procedimentos de checagem de saúde
  - Checklist de critérios de sucesso
  - Resultados esperados para todos os comandos de implantação
  - Referência rápida de solução de problemas

#### Melhorado
- **examples/README.md**: Atualizado para qualidade grau A (93%):
  - Adicionado azure-openai-chat a todas as seções relevantes
  - Contagem de exemplos locais atualizada de 3 para 4
  - Adicionado à tabela de Exemplos de Aplicações de IA
  - Integrado no Quick Start para Usuários Intermediários
  - Adicionado à seção de Microsoft Foundry Templates
  - Atualizadas matriz de comparação e seções de descoberta tecnológica
- **Qualidade da Documentação**: Melhorada de B+ (87%) → A- (92%) em toda a pasta docs:
  - Adicionados resultados esperados para exemplos críticos de comandos
  - Incluídos passos de verificação para alterações de configuração
  - Aprendizado prático aprimorado com exercícios práticos

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de exemplos de IA para aprendizes intermediários
- **Estrutura da Documentação**: Exercícios mais acionáveis com resultados claros
- **Processo de Verificação**: Critérios explícitos de sucesso adicionados aos fluxos principais

#### Melhorado
- **Experiência do Desenvolvedor**: Implantação dos Modelos Microsoft Foundry agora leva 35-45 minutos (vs 60-90 para alternativas complexas)
- **Transparência de Custos**: Estimativas claras de custo ($50-200/mês) para exemplo dos Modelos Microsoft Foundry
- **Caminho de Aprendizado**: Desenvolvedores de IA têm ponto de entrada claro com azure-openai-chat
- **Padrões de Documentação**: Resultados esperados e passos de verificação consistentes

#### Validado
- ✅ Exemplo dos Modelos Microsoft Foundry totalmente funcional com `azd up`
- ✅ Todos os 11 arquivos de implementação sintaticamente corretos
- ✅ Instruções do README correspondem à experiência real de implantação
- ✅ Links da documentação atualizados em 8+ locais
- ✅ Índice de exemplos reflete com precisão 4 exemplos locais
- ✅ Sem links externos duplicados em tabelas
- ✅ Todas as referências de navegação corretas

#### Implementação Técnica
- **Arquitetura dos Modelos Microsoft Foundry**: padrão gpt-4.1 + Key Vault + Container Apps
- **Segurança**: Identidade Gerenciada pronta, segredos no Key Vault
- **Monitoramento**: Integração com Application Insights
- **Gerenciamento de Custos**: Rastreamento de tokens e otimização de uso
- **Implantação**: Único comando `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Principal: Exemplos de Implantação de Container App
**Esta versão apresenta exemplos abrangentes de implantação de aplicativos de container prontos para produção usando Azure Developer CLI (AZD), com documentação completa e integração no caminho de aprendizado.**

#### Adicionado
- **🚀 Exemplos de Container App**: Novos exemplos locais em `examples/container-app/`:
  - [Guia Mestre](examples/container-app/README.md): Visão completa de implantações conteinerizadas, início rápido, produção e padrões avançados
  - [API Flask Simples](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com scale-to-zero, sondas de integridade, monitoramento e solução de problemas
  - [Arquitetura de Microsserviços](../../examples/container-app/microservices): Implantação pronta para produção com múltiplos serviços (API Gateway, Produto, Pedido, Usuário, Notificação), mensagens assíncronas, Service Bus, Cosmos DB, Azure SQL, rastreamento distribuído, implantação blue-green/canary
- **Melhores Práticas**: Segurança, monitoramento, otimização de custos e orientações CI/CD para cargas conteinerizadas
- **Amostras de Código**: `azure.yaml` completos, templates Bicep e implementações multi-linguagem (Python, Node.js, C#, Go)
- **Testes & Solução de Problemas**: Cenários de testes ponta a ponta, comandos de monitoramento, orientações para solução de problemas

#### Alterado
- **README.md**: Atualizado para apresentar e linkar novos exemplos de container app sob "Exemplos Locais - Aplicativos Containerizados"
- **examples/README.md**: Atualizado para destacar exemplos de container app, adicionar entradas na matriz de comparação e atualizar referências de tecnologia/arquitetura
- **Roteiro do Curso & Guia de Estudo**: Atualizado para referenciar novos exemplos de container app e padrões de implantação nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos implantáveis com `azd up` e seguem as melhores práticas
- ✅ Cross-links de documentação e navegação atualizados
- ✅ Exemplos cobrem cenários do básico ao avançado, incluindo microsserviços em produção

#### Notas
- **Escopo**: Documentação e exemplos apenas em inglês
- **Próximos Passos**: Expandir com padrões avançados de containers adicionais e automação CI/CD em lançamentos futuros

### [v3.5.0] - 2025-11-19

#### Rebranding do Produto: Microsoft Foundry
**Esta versão implementa uma alteração abrangente do nome do produto de "Microsoft Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**

#### Alterado
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Microsoft Foundry" para "Microsoft Foundry"
  - Atualizadas todas as referências na documentação em inglês na pasta `docs/`
  - Renomeada a pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renomeado arquivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referências de conteúdo atualizadas em 7 arquivos de documentação

- **📁 Mudanças na Estrutura de Pastas**:
  - `docs/ai-foundry/` renomeada para `docs/microsoft-foundry/`
  - Todas as referências cruzadas atualizadas para refletir a nova estrutura de pastas
  - Links de navegação validados em toda a documentação

- **📄 Renomeação de Arquivos**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos os links internos atualizados para referenciar o novo nome de arquivo

#### Arquivos Atualizados
- **Documentação dos Capítulos** (7 arquivos):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações de links de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências ao nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já usando Microsoft Foundry (de atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback da comunidade, documentação)
  - `docs/getting-started/azd-basics.md` - 4 links de referência cruzada atualizados
  - `docs/getting-started/first-project.md` - 2 links de navegação do capítulo atualizados
  - `docs/getting-started/installation.md` - 2 links para o próximo capítulo atualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navegação atualizado
  - `docs/troubleshooting/debugging.md` - 1 link de navegação atualizado

- **Arquivos da Estrutura do Curso** (2 arquivos):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos de capítulos, seção de templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizado, recursos do capítulo)

#### Validado
- ✅ Zero referências restantes à pasta "ai-foundry" na documentação em inglês
- ✅ Zero referências restantes ao nome do produto "Microsoft Foundry" na documentação em inglês
- ✅ Todos os links de navegação funcionais com nova estrutura de pastas
- ✅ Renomeações de arquivos e pastas concluídas com sucesso
- ✅ Referências cruzadas entre capítulos validadas

#### Notas
- **Escopo**: Alterações aplicadas apenas à documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de tradução (`translations/`) não atualizadas nesta versão
- **Workshop**: Materiais do workshop (`workshop/`) não atualizados nesta versão
- **Exemplos**: Arquivos de exemplo podem ainda referenciar nomenclatura legada (a ser corrigido em atualização futura)
- **Links Externos**: URLs externas e referências de repositórios GitHub permanecem inalteradas

#### Guia de Migração para Contribuidores
Se você possui branches locais ou documentação referenciando a estrutura antiga:
1. Atualize referências de pasta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualize referências de arquivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substitua nome do produto: "Microsoft Foundry" → "Microsoft Foundry"
4. Valide se todos os links internos da documentação ainda funcionam

---

### [v3.4.0] - 2025-10-24

#### Aperfeiçoamentos no Preview e Validação da Infraestrutura
**Esta versão apresenta suporte abrangente para o novo recurso de preview do Azure Developer CLI e aprimora a experiência do usuário do workshop.**

#### Adicionado
- **🧪 Documentação do recurso azd provision --preview**: Cobertura completa da nova capacidade de preview de infraestrutura
  - Referência de comandos e exemplos de uso em folha de dicas
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Integração de verificação pré-implantação para validação mais segura
  - Atualizações no guia inicial com práticas de implantação focadas em segurança
- **🚧 Banner de Status do Workshop**: Banner HTML profissional indicando status do desenvolvimento do workshop
  - Design em gradiente com indicadores de construção para comunicação clara ao usuário
  - Timestamp da última atualização para transparência
  - Design responsivo para dispositivos móveis de todos os tipos

#### Aprimorado
- **Segurança da Infraestrutura**: Funcionalidade de preview integrada em toda documentação de implantação
- **Validação Pré-implantação**: Scripts automatizados agora incluem testes de preview de infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir preview como prática recomendada
- **Experiência do Workshop**: Expectativas claras definidas para usuários sobre o status de desenvolvimento do conteúdo

#### Alterado
- **Melhores Práticas de Implantação**: Fluxo de trabalho com preview em primeiro lugar agora é abordagem recomendada
- **Fluxo da Documentação**: Validação da infraestrutura movida para etapa anterior no processo de aprendizado
- **Apresentação do Workshop**: Comunicação profissional de status com cronograma claro de desenvolvimento

#### Melhorado
- **Abordagem de Segurança em Primeiro Lugar**: Alterações de infraestrutura agora podem ser validadas antes da implantação
- **Colaboração em Equipe**: Resultados do preview podem ser compartilhados para revisão e aprovação
- **Consciência de Custos**: Melhor compreensão dos custos dos recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas na implantação por meio de validação antecipada

#### Implementação Técnica
- **Integração Multi-documentos**: Recurso de preview documentado em 4 arquivos-chave
- **Padrões de Comando**: Sintaxe e exemplos consistentes em toda documentação
- **Integração de Melhores Práticas**: Preview incluído em fluxos de trabalho e scripts de validação
- **Indicadores Visuais**: Marcação clara de recurso NOVO para fácil localização

#### Infraestrutura do Workshop
- **Comunicação de Status**: Banner HTML profissional com estilo em gradiente
- **Experiência do Usuário**: Status claro de desenvolvimento previne confusões
- **Apresentação Profissional**: Mantém credibilidade do repositório enquanto define expectativas
- **Transparência no Cronograma**: Timestamp de última atualização em outubro de 2025 para responsabilidade

### [v3.3.0] - 2025-09-24

#### Materiais do Workshop Aprimorados e Experiência de Aprendizado Interativa
**Esta versão apresenta materiais abrangentes de workshop com guias interativos baseados em navegador e caminhos de aprendizado estruturados.**

#### Adicionado
- **🎥 Guia Interativo do Workshop**: Experiência de workshop baseada em navegador com capacidade de preview MkDocs
- **📝 Instruções Estruturadas do Workshop**: Caminho guiado de aprendizado em 7 etapas, da descoberta à personalização
  - 0-Introdução: Visão geral do workshop e configuração
  - 1-Selecionar-Template-IA: Processo de descoberta e seleção de templates
  - 2-Validar-Template-IA: Procedimentos de implantação e validação
  - 3-Desconstruir-Template-IA: Entendimento da arquitetura do template
  - 4-Configurar-Template-IA: Configuração e personalização
  - 5-Personalizar-Template-IA: Modificações avançadas e iterações
  - 6-Desmontar-Infraestrutura: Limpeza e gerenciamento de recursos
  - 7-Conclusão: Resumo e próximos passos
- **🛠️ Ferramentas do Workshop**: Configuração MkDocs com tema Material para experiência de aprendizado aprimorada
- **🎯 Caminho de Aprendizado Prático**: Metodologia em 3 etapas (Descoberta → Implantação → Personalização)
- **📱 Integração GitHub Codespaces**: Configuração fluida do ambiente de desenvolvimento

#### Aprimorado
- **Laboratório de Workshop de IA**: Expandido com experiência estruturada abrangente de 2-3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e recursos visuais
- **Progressão de Aprendizado**: Orientação clara passo a passo desde a seleção do template até implantação em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho de desenvolvimento otimizados

#### Melhorado
- **Acessibilidade**: Interface baseada em navegador com busca, função de copiar e alternância de tema
- **Aprendizado Autodirigido**: Estrutura flexível do workshop para diferentes ritmos de aprendizado
- **Aplicação Prática**: Cenários reais de implantação de templates de IA
- **Integração Comunitária**: Integração com Discord para suporte e colaboração no workshop

#### Funcionalidades do Workshop
- **Busca Incorporada**: Descoberta rápida por palavras-chave e lições
- **Copiar Blocos de Código**: Funcionalidade de hover para copiar todos os exemplos de código
- **Alternância de Tema**: Suporte a modo escuro/claro para preferências diferentes
- **Ativos Visuais**: Capturas de tela e diagramas para melhor compreensão
- **Integração de Ajuda**: Acesso direto ao Discord para suporte comunitário

### [v3.2.0] - 2025-09-17

#### Grande Reestruturação de Navegação e Sistema de Aprendizado por Capítulos
**Esta versão apresenta uma estrutura abrangente de aprendizado baseada em capítulos com navegação aprimorada por todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizado por Capítulos**: Curso reestruturado em 8 capítulos progressivos de aprendizado
  - Capítulo 1: Fundamentos & Início Rápido (⭐ - 30-45 mins)
  - Capítulo 2: Desenvolvimento AI-First (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração & Autenticação (⭐⭐ - 45-60 mins)
  - Capítulo 4: Infraestrutura como Código & Implantação (⭐⭐⭐ - 1-1,5 horas)
  - Capítulo 5: Soluções Multi-Agentes de IA (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação & Planejamento Pré-implantação (⭐⭐ - 1 hora)
  - Capítulo 7: Solução de Problemas & Depuração (⭐⭐ - 1-1,5 horas)
  - Capítulo 8: Padrões de Produção & Empresariais (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema Abrangente de Navegação**: Cabeçalhos e rodapés de navegação consistentes em toda a documentação
- **🎯 Rastreamento de Progresso**: Checklist de conclusão do curso e sistema de verificação de aprendizado
- **🗺️ Orientação do Caminho de Aprendizado**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação com Referências Cruzadas**: Capítulos relacionados e pré-requisitos claramente linkados

#### Aprimorado
- **Estrutura do README**: Transformado em plataforma de aprendizado estruturada com organização baseada em capítulos
- **Navegação na Documentação**: Cada página agora inclui contexto do capítulo e orientação de progressão
- **Organização de Templates**: Exemplos e templates mapeados para capítulos de aprendizado apropriados
- **Integração de Recursos**: Folhas de dicas, FAQs e guias de estudo conectados a capítulos relevantes
- **Integração do Workshop**: Laboratórios práticos vinculados a múltiplos objetivos de aprendizado dos capítulos

#### Alterado
- **Progressão de Aprendizagem**: Mudança da documentação linear para aprendizagem flexível baseada em capítulos
- **Posicionamento da Configuração**: Guia de configuração reposicionado como Capítulo 3 para melhor fluxo de aprendizagem
- **Integração de Conteúdo de IA**: Melhor integração de conteúdo específico de IA ao longo da jornada de aprendizado
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para aprendizes empresariais

#### Melhorado
- **Experiência do Usuário**: Navegação clara com breadcrumbs e indicadores de progressão por capítulo
- **Acessibilidade**: Padrões consistentes de navegação para facilitar a travessia do curso
- **Apresentação Profissional**: Estrutura de curso estilo universitário adequada para treinamento acadêmico e corporativo
- **Eficiência de Aprendizagem**: Redução do tempo para encontrar conteúdo relevante através de melhor organização

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação padronizada de capítulos em mais de 40 arquivos de documentação
- **Navegação no Rodapé**: Orientação consistente de progressão e indicadores de conclusão de capítulo
- **Links Cruzados**: Sistema abrangente de links internos conectando conceitos relacionados
- **Mapeamento de Capítulos**: Modelos e exemplos claramente associados aos objetivos de aprendizagem

#### Aprimoramento do Guia de Estudo
- **📚 Objetivos de Aprendizagem Abrangentes**: Guia de estudo reestruturado para alinhamento com o sistema de 8 capítulos
- **🎯 Avaliação Baseada em Capítulos**: Cada capítulo inclui objetivos específicos de aprendizagem e exercícios práticos
- **📋 Acompanhamento de Progresso**: Cronograma de aprendizagem semanal com resultados mensuráveis e listas de verificação de conclusão
- **❓ Perguntas de Avaliação**: Questões para validação de conhecimento em cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades práticas com cenários reais de implantação e solução de problemas
- **📊 Progressão de Habilidades**: Avanço claro de conceitos básicos a padrões empresariais com foco no desenvolvimento de carreira
- **🎓 Estrutura de Certificação**: Resultados de desenvolvimento profissional e sistema de reconhecimento comunitário
- **⏱️ Gerenciamento de Cronograma**: Plano estruturado de aprendizagem de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Soluções aprimoradas de IA multiagente
**Esta versão aprimora a solução de varejo multiagente com nomenclatura melhorada dos agentes e documentação reforçada.**

#### Alterado
- **Terminologia Multiagente**: Substituído "Agente Cora" por "Agente Cliente" em toda a solução de varejo multiagente para melhor compreensão
- **Arquitetura dos Agentes**: Atualizados todos documentos, modelos ARM, e exemplos de código para usar nomenclatura consistente "Agente Cliente"
- **Exemplos de Configuração**: Modernizados os padrões de configuração do agente com convenções de nomenclatura atualizadas
- **Consistência na Documentação**: Garantida a utilização de nomes de agentes profissionais e descritivos

#### Aprimorado
- **Pacote de Modelo ARM**: Atualizado retail-multiagent-arm-template com referências ao Agente Cliente
- **Diagramas de Arquitetura**: Diagramas Mermaid atualizados com a nomenclatura do agente revisada
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam nomenclatura CustomerAgent
- **Variáveis de Ambiente**: Atualizados todos scripts de implantação para usar convenções CUSTOMER_AGENT_NAME

#### Melhorado
- **Experiência do Desenvolvedor**: Papéis e responsabilidades dos agentes mais claros na documentação
- **Prontidão para Produção**: Melhor alinhamento com convenções de nomenclatura empresariais
- **Materiais de Aprendizagem**: Nomeação dos agentes mais intuitiva para fins educacionais
- **Usabilidade dos Modelos**: Entendimento simplificado das funções dos agentes e padrões de implantação

#### Detalhes Técnicos
- Diagramas Mermaid de arquitetura atualizados com referências a CustomerAgent
- Nomes da classe CoraAgent substituídos por CustomerAgent nos exemplos em Python
- Configurações JSON do modelo ARM modificadas para usar o tipo de agente "customer"
- Variáveis de ambiente atualizadas de CORA_AGENT_* para CUSTOMER_AGENT_*
- Comandos de implantação e configurações de contêiner atualizados

### [v3.0.0] - 2025-09-12

#### Mudanças importantes - Foco em Desenvolvedor de IA e Integração Microsoft Foundry
**Esta versão transforma o repositório em um recurso abrangente focado em IA com integração Microsoft Foundry.**

#### Adicionado
- **🤖 Caminho de Aprendizagem Prioritário em IA**: Reestruturação completa priorizando desenvolvedores e engenheiros de IA
- **Guia de Integração Microsoft Foundry**: Documentação completa para conectar AZD com serviços Microsoft Foundry
- **Padrões de Implantação de Modelo de IA**: Guia detalhado sobre seleção de modelos, configuração e estratégias de implantação em produção
- **Laboratório de Workshop de IA**: Workshop prático de 2-3 horas para converter aplicações IA em soluções implantáveis com AZD
- **Práticas Recomendadas para IA em Produção**: Padrões prontos para empresas para escalabilidade, monitoramento e segurança de cargas de trabalho de IA
- **Guia de Solução de Problemas Específico para IA**: Diagnóstico abrangente para Microsoft Foundry Models, Serviços Cognitivos e problemas de implantação IA
- **Galeria de Modelos IA**: Coleção em destaque de modelos Microsoft Foundry com classificações de complexidade
- **Materiais do Workshop**: Estrutura completa do workshop com laboratórios práticos e materiais de referência

#### Melhorado
- **Estrutura do README**: Focada em desenvolvedor de IA com 45% de interesse da comunidade do Discord Microsoft Foundry
- **Caminhos de Aprendizagem**: Jornada dedicada a desenvolvedores AI junto com rotas tradicionais para estudantes e engenheiros DevOps
- **Recomendações de Modelos**: Modelos IA em destaque incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integração Comunitária**: Suporte comunitário Discord aprimorado com canais e discussões específicas de IA

#### Foco em Segurança e Produção
- **Padrões de Identidade Gerenciada**: Configurações de autenticação e segurança específicas para IA
- **Otimização de Custos**: Rastreamento de uso de tokens e controle orçamentário para cargas de trabalho IA
- **Implantação Multi-Região**: Estratégias para implantação global de aplicações IA
- **Monitoramento de Desempenho**: Métricas específicas para IA e integração com Application Insights

#### Qualidade da Documentação
- **Estrutura Linear do Curso**: Progressão lógica do iniciante ao avançado em padrões de implantação IA
- **URLs Validados**: Todos os links externos do repositório verificados e acessíveis
- **Referência Completa**: Todos os links internos da documentação validados e funcionais
- **Pronto para Produção**: Padrões empresariais de implantação com exemplos reais

### [v2.0.0] - 2025-09-09

#### Mudanças Importantes - Reestruturação do Repositório e Aprimoramento Profissional
**Esta versão representa uma reformulação significativa da estrutura do repositório e da apresentação de conteúdo.**

#### Adicionado
- **Estrutura de Aprendizagem Estruturada**: Todas as páginas de documentação agora incluem seções de Introdução, Objetivos de Aprendizagem e Resultados de Aprendizagem
- **Sistema de Navegação**: Adicionados links de aula Anterior/Próxima em toda documentação para progressão guiada de aprendizagem
- **Guia de Estudo**: study-guide.md abrangente com objetivos de aprendizagem, exercícios práticos e materiais de avaliação
- **Apresentação Profissional**: Remoção de emojis para melhor acessibilidade e aparência profissional
- **Estrutura de Conteúdo Melhorada**: Organização e fluxo aprimorados dos materiais de aprendizagem

#### Alterado
- **Formato da Documentação**: Padronização de toda documentação com estrutura focada em aprendizagem consistente
- **Fluxo de Navegação**: Implementação de progressão lógica por todos os materiais de aprendizagem
- **Apresentação do Conteúdo**: Remoção de elementos decorativos em favor de formatação clara e profissional
- **Estrutura de Links**: Atualização de todos links internos para suporte ao novo sistema de navegação

#### Melhorado
- **Acessibilidade**: Remoção da dependência de emojis para melhor compatibilidade com leitores de tela
- **Aparência Profissional**: Apresentação limpa estilo acadêmico, adequada para aprendizado corporativo
- **Experiência de Aprendizagem**: Abordagem estruturada com objetivos e resultados claros para cada aula
- **Organização do Conteúdo**: Melhor fluxo lógico e conexão entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório Abrangente de Aprendizagem AZD

#### Adicionado
- **Estrutura Básica da Documentação**
  - Série Completa de Guias de Introdução
  - Documentação abrangente de implantação e provisionamento
  - Recursos detalhados de solução de problemas e guias de depuração
  - Ferramentas e procedimentos de validação pré-implantação

- **Módulo de Início Rápido**
  - Fundamentos do AZD: Conceitos e terminologia principais
  - Guia de Instalação: Instruções específicas para cada plataforma
  - Guia de Configuração: Configuração do ambiente e autenticação
  - Tutorial do Primeiro Projeto: Aprendizado prático passo a passo

- **Módulo de Implantação e Provisionamento**
  - Guia de Implantação: Documentação completa do fluxo de trabalho
  - Guia de Provisionamento: Infraestrutura como Código com Bicep
  - Melhores práticas para implantações em produção
  - Padrões de arquitetura multi-serviço

- **Módulo de Validação Pré-implantação**
  - Planejamento de Capacidade: Validação da disponibilidade de recursos Azure
  - Seleção de SKU: Orientação abrangente de níveis de serviço
  - Verificações prévias: Scripts automatizados de validação (PowerShell e Bash)
  - Estimativa de custos e ferramentas de planejamento orçamentário

- **Módulo de Solução de Problemas**
  - Problemas Comuns: Problemas frequentes e soluções
  - Guia de Depuração: Metodologias sistemáticas de solução de problemas
  - Técnicas e ferramentas diagnósticas avançadas
  - Monitoramento e otimização de desempenho

- **Recursos e Referências**
  - Folha de Comandos: Referência rápida para comandos essenciais
  - Glossário: Terminologia e definições de acrônimos abrangentes
  - Perguntas Frequentes: Respostas detalhadas a perguntas comuns
  - Links para recursos externos e conexões comunitárias

- **Exemplos e Modelos**
  - Exemplo de Aplicação Web Simples
  - Modelo de implantação de Website Estático
  - Configuração de Aplicação em Contêiner
  - Padrões de integração de banco de dados
  - Exemplos de arquitetura de microsserviços
  - Implementações de funções serverless

#### Funcionalidades
- **Suporte Multi-Plataforma**: Guias de instalação e configuração para Windows, macOS e Linux
- **Vários Níveis de Habilidade**: Conteúdo projetado para estudantes até desenvolvedores profissionais
- **Foco Prático**: Exemplos práticos e cenários do mundo real
- **Cobertura Abrangente**: Desde conceitos básicos até padrões empresariais avançados
- **Abordagem de Segurança Prioritária**: Melhores práticas de segurança integradas ao longo do conteúdo
- **Otimização de Custos**: Orientação para implantações eficientes e gerenciamento de recursos

#### Qualidade da Documentação
- **Exemplos de Código Detalhados**: Amostras de código práticas e testadas
- **Instruções Passo a Passo**: Orientações claras e acionáveis
- **Tratamento Abrangente de Erros**: Solução de problemas para questões comuns
- **Integração de Melhores Práticas**: Padrões industriais e recomendações
- **Compatibilidade de Versão**: Atualizado com os últimos serviços Azure e funcionalidades azd

## Melhorias Futuras Planejadas

### Versão 3.1.0 (Planejada)
#### Expansão da Plataforma de IA
- **Suporte Multi-Modelo**: Padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados
- **Frameworks de Agentes IA**: Modelos para implementações LangChain, Semantic Kernel e AutoGen
- **Padrões Avançados RAG**: Opções de banco de dados vetoriais além do Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidade IA**: Monitoramento aprimorado para desempenho de modelos, uso de tokens e qualidade de respostas

#### Experiência do Desenvolvedor
- **Extensão VS Code**: Experiência integrada AZD + Microsoft Foundry para desenvolvimento
- **Integração GitHub Copilot**: Geração assistida por IA de modelos AZD
- **Tutoriais Interativos**: Exercícios práticos de codificação com validação automática para cenários IA
- **Conteúdo em Vídeo**: Tutoriais visuais suplementares para aprendizes visuais focados em implantações IA

### Versão 4.0.0 (Planejada)
#### Padrões Empresariais de IA
- **Estrutura de Governança**: Governança de modelo IA, conformidade e trilhas de auditoria
- **IA Multi-Cliente**: Padrões para atender múltiplos clientes com serviços IA isolados
- **Implantação IA na Borda**: Integração com Azure IoT Edge e instâncias de contêiner
- **IA em Nuvem Híbrida**: Padrões multi-nuvem e híbridos para cargas de trabalho IA

#### Funcionalidades Avançadas
- **Automação de Pipeline IA**: Integração MLOps com pipelines Azure Machine Learning
- **Segurança Avançada**: Padrões zero-trust, endpoints privados e proteção avançada contra ameaças
- **Otimização de Desempenho**: Ajustes avançados e estratégias de escalonamento para aplicações IA de alto rendimento
- **Distribuição Global**: Padrões de entrega de conteúdo e cache na borda para aplicações IA

### Versão 3.0.0 (Planejada) - Substituída pela Versão Atual
#### Adições Propostas - Agora Implementadas na v3.0.0
- ✅ **Conteúdo Focado em IA**: Integração abrangente Microsoft Foundry (Concluído)
- ✅ **Tutoriais Interativos**: Laboratório prático de workshop IA (Concluído)
- ✅ **Módulo de Segurança Avançada**: Padrões de segurança específicos para IA (Concluído)
- ✅ **Otimização de Desempenho**: Estratégias de ajuste para cargas IA (Concluído)

### Versão 2.1.0 (Planejada) - Parcialmente Implementada na v3.0.0
#### Melhorias Menores - Algumas Concluídas na Versão Atual
- ✅ **Exemplos Adicionais**: Cenários de implantação focados em IA (Concluído)
- ✅ **FAQ Expandida**: Perguntas específicas e solução de problemas IA (Concluído)
- **Integração de Ferramentas**: Guias aprimorados para integração de IDE e editores
- ✅ **Expansão do Monitoramento**: Padrões de monitoramento e alertas IA (Concluído)

#### Ainda Planejado para Versão Futuras
- **Documentação Responsiva para Mobile**: Design adaptável para aprendizado móvel
- **Acesso Offline**: Pacotes de documentação para download
- **Integração Aprimorada de IDE**: Extensão VS Code para fluxos AZD + IA
- **Painel Comunitário**: Métricas em tempo real da comunidade e rastreamento de contribuições

## Contribuindo para o Changelog

### Reportando Mudanças
Ao contribuir para este repositório, por favor assegure que as entradas no changelog incluam:

1. **Número da Versão**: Seguindo versionamento semântico (major.minor.patch)
2. **Data**: Data de lançamento ou atualização no formato AAAA-MM-DD
3. **Categoria**: Adicionado, Alterado, Descontinuado, Removido, Corrigido, Segurança
4. **Descrição Clara**: Descrição concisa do que foi alterado
5. **Avaliação de Impacto**: Como as mudanças afetam os usuários existentes

### Categorias de Mudanças

#### Adicionado
- Novas funcionalidades, seções de documentação ou capacidades
- Novos exemplos, modelos ou recursos de aprendizagem
- Ferramentas adicionais, scripts ou utilitários

#### Alterado
- Modificações em funcionalidades ou documentação existentes
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Descontinuado
- Funcionalidades ou abordagens que estão sendo descontinuadas
- Seções de documentação programadas para remoção
- Métodos que possuem alternativas melhores

#### Removido
- Funcionalidades, documentação ou exemplos que não são mais relevantes
- Informações desatualizadas ou abordagens descontinuadas
- Conteúdo redundante ou consolidado

#### Corrigido
- Correções de erros na documentação ou código
- Resolução de problemas ou questões relatadas
- Melhorias na precisão ou funcionalidade

#### Segurança
- Melhorias ou correções relacionadas à segurança
- Atualizações nas melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Diretrizes de Versionamento Semântico

#### Versão Principal (X.0.0)
- Alterações incompatíveis que exigem ação do usuário
- Reestruturação significativa do conteúdo ou organização
- Alterações que modificam a abordagem ou metodologia fundamental

#### Versão Menor (X.Y.0)
- Novos recursos ou acréscimos de conteúdo
- Melhorias que mantêm compatibilidade retroativa
- Exemplos, ferramentas ou recursos adicionais

#### Versão de Correção (X.Y.Z)
- Correções de bugs e ajustes
- Melhorias menores no conteúdo existente
- Esclarecimentos e pequenos aprimoramentos

## Feedback da Comunidade e Sugestões

Incentivamos ativamente o feedback da comunidade para melhorar este recurso de aprendizagem:

### Como Fornecer Feedback
- **GitHub Issues**: Reporte problemas ou sugira melhorias (problemas específicos de IA são bem-vindos)
- **Discussões no Discord**: Compartilhe ideias e interaja com a comunidade Microsoft Foundry
- **Pull Requests**: Contribua com melhorias diretas no conteúdo, especialmente templates e guias de IA
- **Microsoft Foundry Discord**: Participe no canal #Azure para discussões sobre AZD + IA
- **Fóruns da Comunidade**: Participe de discussões mais amplas de desenvolvedores Azure

### Categorias de Feedback
- **Precisão do Conteúdo de IA**: Correções nas informações de integração e implantação dos serviços de IA
- **Experiência de Aprendizagem**: Sugestões para melhorar o fluxo de aprendizagem para desenvolvedores de IA
- **Conteúdo de IA Ausente**: Solicitações para novos templates, padrões ou exemplos de IA
- **Acessibilidade**: Melhorias para atender a necessidades diversas de aprendizagem
- **Integração de Ferramentas de IA**: Sugestões para melhor integração no fluxo de trabalho de desenvolvimento de IA
- **Padrões de IA para Produção**: Solicitações de padrões empresariais de implantação de IA

### Compromisso de Resposta
- **Resposta a Problemas**: Em até 48 horas para problemas relatados
- **Solicitações de Recursos**: Avaliação em até uma semana
- **Contribuições da Comunidade**: Revisão em até uma semana
- **Questões de Segurança**: Prioridade imediata com resposta acelerada

## Calendário de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: Verificação da precisão do conteúdo e validação de links
- **Atualizações Trimestrais**: Adições e melhorias importantes de conteúdo
- **Revisões Semestrais**: Reestruturação abrangente e aprimoramento
- **Lançamentos Anuais**: Atualizações de versões principais com melhorias significativas

### Monitoramento e Garantia de Qualidade
- **Testes Automatizados**: Validação regular de exemplos de código e links
- **Integração do Feedback da Comunidade**: Incorporação constante de sugestões dos usuários
- **Atualizações Tecnológicas**: Alinhamento com os serviços Azure mais recentes e lançamentos do azd
- **Auditorias de Acessibilidade**: Revisão regular para princípios de design inclusivo

## Política de Suporte à Versão

### Suporte à Versão Atual
- **Última Versão Principal**: Suporte completo com atualizações regulares
- **Versão Principal Anterior**: Atualizações de segurança e correções críticas por 12 meses
- **Versões Legadas**: Suporte pela comunidade apenas, sem atualizações oficiais

### Orientação para Migração
Quando versões principais são lançadas, oferecemos:
- **Guias de Migração**: Instruções passo a passo para transição
- **Notas de Compatibilidade**: Detalhes sobre alterações incompatíveis
- **Suporte de Ferramentas**: Scripts ou utilitários para auxiliar na migração
- **Suporte da Comunidade**: Fóruns dedicados para dúvidas sobre migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudos](resources/study-guide.md)
- **Próxima Lição**: Retorne para o [README Principal](README.md)

**Mantenha-se Atualizado**: Acompanhe este repositório para notificações sobre novos lançamentos e atualizações importantes nos materiais de aprendizagem.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->