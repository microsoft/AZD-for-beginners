# Guia de Instalação e Configuração

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Introdução Rápida
- **⬅️ Anterior**: [Conceitos Básicos de AZD](azd-basics.md)
- **➡️ Seguinte**: [O Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Este guia abrangente irá orientá-lo na instalação e configuração do Azure Developer CLI (azd) no seu sistema. Vai aprender vários métodos de instalação para diferentes sistemas operativos, configuração de autenticação e configuração inicial para preparar o seu ambiente de desenvolvimento para implementações Azure.

## Objetivos de Aprendizagem

No final desta lição, você irá:
- Instalar com sucesso o Azure Developer CLI no seu sistema operativo
- Configurar a autenticação com Azure utilizando múltiplos métodos
- Preparar o seu ambiente de desenvolvimento com os pré-requisitos necessários
- Compreender as diferentes opções de instalação e quando usar cada uma
- Solucionar problemas comuns de instalação e configuração

## Resultados de Aprendizagem

Após concluir esta lição, você será capaz de:
- Instalar o azd usando o método adequado para a sua plataforma
- Autenticar-se com Azure usando azd auth login
- Verificar a instalação e testar comandos básicos azd
- Configurar o seu ambiente de desenvolvimento para uso ótimo do azd
- Resolver de forma autónoma problemas comuns de instalação

Este guia irá ajudá-lo a instalar e configurar o Azure Developer CLI no seu sistema, independentemente do seu sistema operativo ou ambiente de desenvolvimento.

## Pré-Requisitos

Antes de instalar o azd, certifique-se que tem:
- **Subscrição Azure** - [Crie uma conta gratuita](https://azure.microsoft.com/free/)
- **Azure CLI** (opcional) - Para exemplos que executam explicitamente `az`; azd autentica de forma independente
- **Git** - Para clonar templates e controlo de versões
- **Docker** (opcional) - Para aplicações conteinerizadas

**Caminho Foundry GA do Capítulo 2:** Use AZD **1.37.0 ou posterior**, instale o pacote com `azd ext install microsoft.foundry`, e use Python **3.13+** e o atual **uv** para o exemplo hosted-agent. O seu modo de implantação de código é remoto, portanto não requer uma compilação Docker local. Permissões do Foundry, disponibilidade regional do modelo e quota são ainda necessárias; veja a [configuração do hosted-agent](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Métodos de Instalação

### Windows

#### Opção 1: Gestor de Pacotes Windows (Recomendado)
```cmd
winget install microsoft.azd
```

#### Opção 2: Script de Instalação PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opção 3: Chocolatey
```cmd
choco install azd
```

#### Opção 4: Instalação Manual
1. Faça download da versão mais recente em [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extraia para `C:\Program Files\azd\`
3. Adicione à variável de ambiente PATH

### macOS

#### Opção 1: Homebrew (Recomendado)
```bash
brew tap azure/azd
brew install azd
```

#### Opção 2: Script de Instalação
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opção 3: Instalação Manual
Faça download do arquivo para a arquitetura macOS em [os assets da versão](https://github.com/Azure/azure-dev/releases), extraia-o e adicione o binário `azd` ao seu `PATH`.

### Linux

#### Opção 1: Script de Instalação (Recomendado)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opção 2: Gestores de Pacotes

**Instalação manual a partir dos assets da versão:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Alguns ambientes Codespaces e dev container já incluem `azd`, mas deve verificar isso em vez de assumir:

```bash
azd version
```

Se faltar `azd`, instale-o com o script padrão para o ambiente.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Este container efémero não preserva o estado de login entre execuções. Para implementações repetidas, use a [configuração do dev container](dev-containers.md); compilação de containers também requer um daemon Docker acessível dentro do container.

## ✅ Verificar Instalação

Após a instalação, verifique se o azd está a funcionar corretamente:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Saída esperada:
```
azd version 1.x.x (commit xxxxxx)
```

**Nota**: O número de versão real pode variar. Consulte [Lançamentos do Azure Developer CLI](https://github.com/Azure/azure-dev/releases) para a versão mais recente.

**✅ Lista de Verificação de Sucesso da Instalação:**
- [ ] `azd version` mostra o número da versão sem erros
- [ ] `azd --help` exibe a documentação dos comandos
- [ ] `azd template list` mostra os templates disponíveis
- [ ] Pode criar um diretório de teste e executar `azd init` com sucesso

**Se todas as verificações passarem, está pronto para continuar para [O Seu Primeiro Projeto](first-project.md)!**

## Configuração de Autenticação

### Configuração Recomendadada para Iniciantes

Para fluxos de trabalho com foco em AZD, faça login com `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Utilize o login Azure CLI apenas se planeia executar comandos `az` você mesmo durante o curso.

### Autenticação Azure CLI (Opcional)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### Qual fluxo de login deve usar?

- Use `azd auth login` se estiver a seguir o caminho AZD para principiantes e principalmente executar comandos `azd`.
- Use também `az login` quando quiser executar comandos Azure CLI como `az account show` ou inspecionar recursos diretamente.
- Se um exercício incluir ambos comandos `azd` e `az`, execute ambos os comandos de login uma vez no início.

### Autenticação por Código de Dispositivo
Se estiver num sistema sem interface gráfica ou com problemas no navegador:
```bash
azd auth login --use-device-code
```

### Serviço Principal (CI/CD)
Para ambientes automatizados:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Valide a Configuração Completa

Se quiser um teste rápido de prontidão antes de começar o Capítulo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Configuração

### Configuração Global
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Variáveis de Ambiente
Adicione ao seu perfil de shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Integração IDE

### Visual Studio Code
Instale a extensão Azure Developer CLI:
1. Abra o VS Code
2. Vá a Extensões (Ctrl+Shift+X)
3. Procure por "Azure Developer CLI"
4. Instale a extensão

Funcionalidades:
- IntelliSense para azure.yaml
- Comandos do terminal integrados
- Navegação de templates
- Monitorização de implementações

### GitHub Codespaces
Crie um `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Instale o plugin Azure
2. Configure as credenciais Azure
3. Utilize o terminal integrado para comandos azd

## 🐛 Solução de Problemas na Instalação

### Problemas Comuns

#### Permissão Negada (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemas com PATH
Adicione manualmente o azd ao seu PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problemas de Rede/Proxy
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Conflitos de Versão
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Obter Mais Ajuda
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Atualização do azd

### Verificar Atualização
O azd avisa quando há uma versão mais recente disponível, e pode confirmar a sua versão atual com:
```bash
azd version
```

### Atualizações Manuais

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Perguntas Frequentes

<details>
<summary><strong>Qual é a diferença entre azd e az CLI?</strong></summary>

**Azure CLI (az)**: Ferramenta de baixo nível para gerir recursos individuais Azure
- `az webapp create`, `az storage account create`
- Um recurso de cada vez
- Foco na gestão da infraestrutura

**Azure Developer CLI (azd)**: Ferramenta de alto nível para implementações completas de aplicações
- `azd up` implementa a aplicação completa com todos os recursos
- Fluxos de trabalho baseados em templates
- Foco na produtividade do programador

**Eles são independentes**: o azd usa a sua própria autenticação por defeito. Instale e entre no Azure CLI apenas para comandos `az`, ou opte explicitamente pelo `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Posso usar o azd com recursos existentes do Azure?</strong></summary>

Sim! Pode:
1. Importar recursos existentes para ambientes azd
2. Referenciar recursos existentes nos seus templates Bicep
3. Usar o azd para novas implementações junto da infraestrutura existente

Veja o [Guia de Configuração](../chapter-03-configuration/configuration.md) para detalhes.
</details>

<details>
<summary><strong>O azd funciona com Azure Government ou Azure China?</strong></summary>

Sim, configure o cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Se usar também o Azure CLI, configure `az cloud set --name ...` separadamente. Serviços template e disponibilidade de modelos variam por cloud.
</details>

<details>
<summary><strong>Posso usar o azd em pipelines CI/CD?</strong></summary>

Absolutamente! O azd é projetado para automação:
- Integração com GitHub Actions
- Suporte Azure DevOps
- Autenticação por serviço principal
- Modo não interativo

Veja o [Guia de Implementação](../chapter-04-infrastructure/deployment-guide.md) para padrões CI/CD.
</details>

<details>
<summary><strong>Qual o custo de usar o azd?</strong></summary>

O azd em si é **completamente gratuito** e open-source. Você só paga por:
- Recursos Azure que implementar
- Custos de consumo Azure (computação, armazenamento, etc.)

Use `azd provision --preview` para inspecionar recursos propostos e depois estime os custos com o [Calculador de Preços Azure](https://azure.microsoft.com/pricing/calculator/). O modo Preview não calcula preços.
</details>

## Próximos Passos

1. **Complete a autenticação**: Certifique-se que pode aceder à sua subscrição Azure
2. **Experimente a sua primeira implementação**: Siga o [Guia do Primeiro Projeto](first-project.md)
3. **Explore templates**: Navegue pelos templates disponíveis com `azd template list`
4. **Configure o seu IDE**: Prepare o seu ambiente de desenvolvimento

## Suporte

Se encontrar problemas:
- [Documentação Oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Reportar Problemas](https://github.com/Azure/azure-dev/issues)
- [Discussões da Comunidade](https://github.com/Azure/azure-dev/discussions)
- [Suporte Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Obtenha orientação de comandos Azure diretamente no seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Introdução Rápida
- **⬅️ Anterior**: [Conceitos Básicos de AZD](azd-basics.md) 
- **➡️ Seguinte**: [O Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalação Completa!** Continue para [O Seu Primeiro Projeto](first-project.md) para começar a construir com azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->