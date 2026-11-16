# 3. Desconstruir um Template

!!! tip "AO FINAL DESTE MÓDULO, VOCÊ SERÁ CAPAZ DE"

    - [ ] Use GitHub Copilot and optional MCP tools for Azure documentation and read-only exploration
    - [ ] Identify the template's application, infrastructure, configuration, and test entry points
    - [ ] Verify generated explanations against actual repository files
    - [ ] **Lab 3:** Trace one request and one configuration input through the project

---

## 1. Ativar o GitHub Copilot

Abra o exemplo inicializado de IA no VS Code e ative o [GitHub Copilot](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Faça login com uma conta que tenha um plano elegível; os limites de uso variam. Peça ao Copilot para explicar o repositório antes de autorizar alterações.

### Servidores MCP opcionais

Esses serviços podem fornecer ferramentas adicionais:

- [Servidor Azure MCP](https://learn.microsoft.com/azure/developer/azure-mcp-server/overview)
- [Servidor Microsoft Learn MCP](https://learn.microsoft.com/training/support/mcp)

No VS Code, revise a [orientação de configuração do MCP](https://code.visualstudio.com/docs/copilot/chat/mcp-servers) e crie `.vscode/mcp.json` se necessário:

```json
{
  "servers": {
    "Azure MCP Server": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@azure/mcp@latest", "server", "start"]
    },
    "microsoft.docs.mcp": {
      "type": "http",
      "url": "https://learn.microsoft.com/api/mcp"
    }
  }
}
```

O comando `npx` requer uma instalação suportada de Node.js/npm e baixa código executável. Revise o pacote e fixe uma versão aprovada para um setup reprodutível em equipe. Inicie os servidores usando os controles MCP do VS Code e inspecione as ferramentas disponíveis; os nomes podem mudar entre versões.

**A autenticação é separada.** Use `azd auth login` para AZD. Siga o fluxo de autenticação documentado do Azure MCP para suas ferramentas; apenas o login no AZD não estabelece uma sessão MCP. Use `az login` separadamente quando um exercício ou hook invocar o Azure CLI.

Tente prompts com permissão somente para leitura:

1. “Use o Microsoft Learn MCP para encontrar a documentação de configuração do Azure Developer CLI.”
2. “Explique o `azure.yaml` deste repositório; cite os arquivos que implementam cada hook.”
3. “Usando as ferramentas Azure MCP disponíveis, liste meus recursos implantados sem modificar nada.”

Verifique o locatário/assinatura selecionados e cada chamada de ferramenta proposta. Não aprove criação, exclusão ou mudanças de acesso a recursos apenas para explorar a arquitetura.

## 2. Entenda a arquitetura

O exemplo hospeda um backend Python FastAPI e um frontend React/TypeScript em Azure Container Apps. O backend se comunica com um agente em um projeto Microsoft Foundry. A recuperação e a observabilidade dependem dos recursos habilitados no template e da configuração bem-sucedida; não são garantidos apenas porque a aplicação foi implantada.

![Arquitetura ilustrativa](../../../../../translated_images/pt-BR/architecture.8cec470ec15c65c7.webp)

Compare esse diagrama com o [guia de implantação upstream atual](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deployment.md) e seus recursos reais. Verifique a implantação do modelo configurada, as ferramentas do agente, a identidade gerenciada, as atribuições de função e os recursos opcionais do AI Search/Application Insights.

**Exercício:** Peça ao Copilot para traçar uma requisição de chat do frontend pela API até o Foundry, com referências de arquivos e funções. Abra essas referências e verifique a explicação. Não infira autenticação, roteamento ou autorização implementados apenas a partir de um diagrama.

## 3. Estrutura do repositório

Os seguintes caminhos selecionados foram verificados contra o exemplo em 4 de novembro de 2026. Sua revisão inicializada permanece como a fonte da verdade:

```text
get-started-with-ai-agents/
  azure.yaml
  docker-compose.yaml
  requirements-dev.txt
  .devcontainer/
  infra/
    main.bicep
    main.parameters.json
    api.bicep
    core/
  src/
    Dockerfile
    pyproject.toml
    requirements.txt
    api/
      main.py
      routes.py
      search_index_manager.py
    frontend/
      package.json
      src/
    files/
  scripts/
    validate_env_vars.sh
    validate_env_vars.ps1
    postdeploy.sh
    postdeploy.ps1
  tests/
    test_evaluation.py
    test_red_teaming.py
  docs/
    deployment.md
    deploy_customization.md
    ai_search.md
    observability.md
    local_development.md
    troubleshooting.md
```

### Infraestrutura e configuração

`infra/main.bicep` orquestra recursos; `main.parameters.json` conecta entradas do template a valores do ambiente AZD. `azure.yaml` seleciona o serviço da aplicação e os hooks de ciclo de vida. Trace uma entrada como `USE_AZURE_AI_SEARCH_SERVICE` por esses arquivos para descobrir o que realmente muda.

### Aplicação e identidade

Leia `src/api/` e `src/frontend/` juntos. Identifique onde o agente é criado ou recuperado, onde instruções/ferramentas são configuradas, e qual identidade cada chamada Azure usa. Arquivos de amostra sob `src/files/` são dados de demonstração, não um catálogo de produção ou modelo de autorização.

### Testes e observabilidade

Os pontos de entrada atuais para avaliação e red-teaming estão sob `tests/`; referências antigas de diretório `evals/` e `airedteaming/` estão obsoletas para este exemplo. Leia `docs/observability.md` para pré-requisitos e custos antes de executar testes na nuvem. Estes testes em Python são separados da extensão opcional `azure.ai.evaluations` do AZD.

## 4. Verifique suas descobertas

- Identifique a rota da API, interação com o agente, e código de recuperação para uma questão de exemplo.
- Explique qual identidade acessa o Foundry e qual configuração seleciona seu endpoint.
- Encontre os scripts reais de pré-up e pós-deploy e seu comportamento de tratamento de erros.
- Liste quaisquer dependências ou recursos opcionais ausentes da sua implantação.

Continue para [Configurar um Template](4-Configure-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->