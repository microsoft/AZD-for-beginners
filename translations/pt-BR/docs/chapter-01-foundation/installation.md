# Guia de Instalação e Configuração

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Início Rápido
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md)
- **➡️ Próximo**: [Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Este guia abrangente irá orientá-lo na instalação e configuração do Azure Developer CLI (azd) no seu sistema. Você aprenderá diversos métodos de instalação para diferentes sistemas operacionais, configuração de autenticação e a configuração inicial para preparar seu ambiente de desenvolvimento para implantações no Azure.

## Objetivos de Aprendizagem

Ao final desta lição, você irá:
- Instalar com sucesso o Azure Developer CLI no seu sistema operacional
- Configurar a autenticação com Azure usando vários métodos
- Preparar seu ambiente de desenvolvimento com os pré-requisitos necessários
- Compreender as diferentes opções de instalação e quando usar cada uma
- Resolver problemas comuns de instalação e configuração

## Resultados de Aprendizagem

Após completar esta lição, você será capaz de:
- Instalar o azd usando o método apropriado para sua plataforma
- Autenticar-se com Azure usando o comando azd auth login
- Verificar sua instalação e testar comandos básicos do azd
- Configurar seu ambiente de desenvolvimento para uso ideal do azd
- Resolver problemas comuns de instalação de forma independente

Este guia ajudará você a instalar e configurar o Azure Developer CLI no seu sistema, independentemente do sistema operacional ou ambiente de desenvolvimento.

## Pré-requisitos

Antes de instalar o azd, certifique-se de ter:
- **Assinatura Azure** - [Crie uma conta gratuita](https://azure.microsoft.com/free/)
- **Azure CLI** (opcional) - Para exemplos que explicitamente executam `az`; azd autentica independentemente
- **Git** - Para clonar modelos e controle de versão
- **Docker** (opcional) - Para aplicações conteinerizadas

**Caminho GA do Capítulo 2 Foundry:** Use o AZD **1.37.0 ou superior**, instale o pacote com `azd ext install microsoft.foundry`, e use Python **3.13+** e o **uv** atual para o exemplo hosted-agent. O modo de implantação de código constrói remotamente, então não requer build Docker local. Permissões do Foundry, disponibilidade regional de modelos e cota ainda são necessários; veja a [configuração do hosted-agent](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Métodos de Instalação

### Windows

#### Opção 1: Windows Package Manager (Recomendado)
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
1. Baixe a versão mais recente de [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extraia para `C:\Program Files\azd\`
3. Adicione ao variável de ambiente PATH

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
Baixe o arquivo para sua arquitetura macOS a partir dos [ativos do lançamento](https://github.com/Azure/azure-dev/releases), extraia e adicione o binário `azd` ao seu `PATH`.

### Linux

#### Opção 1: Script de Instalação (Recomendado)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opção 2: Gerenciadores de Pacotes

**Instalação manual a partir dos ativos do lançamento:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Alguns Codespaces e ambientes de container dev já incluem `azd`, mas você deve verificar isso em vez de assumir:

```bash
azd version
```

Se `azd` estiver ausente, instale-o com o script padrão para o ambiente.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Este contêiner efêmero não preserva o estado de login entre execuções. Para implantações repetidas, use a [configuração do container dev](dev-containers.md); builds de container também requerem um daemon Docker acessível de dentro do container.

## ✅ Verificar Instalação

Após a instalação, verifique se o azd está funcionando corretamente:

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

**Nota**: O número da versão pode variar. Consulte os [lançamentos do Azure Developer CLI](https://github.com/Azure/azure-dev/releases) para a versão mais recente.

**✅ Lista de Verificação de Sucesso na Instalação:**
- [ ] `azd version` mostra o número da versão sem erros
- [ ] `azd --help` exibe a documentação dos comandos
- [ ] `azd template list` mostra os modelos disponíveis
- [ ] Você pode criar um diretório de teste e executar `azd init` com sucesso

**Se todos os testes forem aprovados, você está pronto para prosseguir para [Seu Primeiro Projeto](first-project.md)!**

## Configuração de Autenticação

### Configuração Recomendada para Iniciantes

Para fluxos de trabalho AZD-primeiro, faça login com `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Use o login do Azure CLI apenas quando planejar executar comandos `az` você mesmo durante o curso.

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

### Qual Fluxo de Login Você Deve Usar?

- Use `azd auth login` se estiver seguindo o caminho iniciante do AZD e principalmente executando comandos `azd`.
- Use `az login` também quando quiser executar comandos Azure CLI como `az account show` ou inspecionar recursos diretamente.
- Se um exercício incluir ambos os comandos `azd` e `az`, execute ambos os comandos de login uma vez no início.

### Autenticação via Código do Dispositivo
Se você estiver em um sistema sem interface gráfica ou com problemas no navegador:
```bash
azd auth login --use-device-code
```

### Principal de Serviço (CI/CD)
Para ambientes automatizados:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Valide Sua Configuração Completa

Se quiser uma verificação rápida de prontidão antes de iniciar o Capítulo 1:

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
Adicione ao seu perfil do shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Integração com IDE

### Visual Studio Code
Instale a extensão Azure Developer CLI:
1. Abra o VS Code
2. Vá para Extensões (Ctrl+Shift+X)
3. Pesquise por "Azure Developer CLI"
4. Instale a extensão

Recursos:
- IntelliSense para azure.yaml
- Comandos integrados no terminal
- Navegação por modelos
- Monitoramento de implantações

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
3. Use o terminal integrado para os comandos azd

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

### Obtenha Mais Ajuda
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Atualizando o azd

### Verificação de Atualização
O azd avisa quando há uma nova versão disponível, e você pode confirmar sua versão atual com:
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
<summary><strong>Qual a diferença entre azd e az CLI?</strong></summary>

**Azure CLI (az)**: Ferramenta de baixo nível para gerenciar recursos individuais do Azure
- `az webapp create`, `az storage account create`
- Um recurso de cada vez
- Foco no gerenciamento de infraestrutura

**Azure Developer CLI (azd)**: Ferramenta de alto nível para implantações completas de aplicações
- `azd up` implanta toda a aplicação com todos os recursos
- Fluxos de trabalho baseados em modelos
- Foco na produtividade do desenvolvedor

**São independentes**: azd usa sua própria autenticação por padrão. Instale e faça login no Azure CLI apenas para comandos `az`, ou opte explicitamente pelo `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Posso usar azd com recursos Azure existentes?</strong></summary>

Sim! Você pode:
1. Importar recursos existentes para ambientes azd
2. Referenciar recursos existentes em seus modelos Bicep
3. Usar azd para novas implantações ao lado da infraestrutura existente

Veja o [Guia de Configuração](../chapter-03-configuration/configuration.md) para detalhes.
</details>

<details>
<summary><strong>O azd funciona com Azure Government ou Azure China?</strong></summary>

Sim, configure a nuvem:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Se também usar o Azure CLI, configure `az cloud set --name ...` separadamente. Serviços de modelo e disponibilidade variam por nuvem.
</details>

<details>
<summary><strong>Posso usar azd em pipelines CI/CD?</strong></summary>

Com certeza! azd é projetado para automação:
- Integração GitHub Actions
- Suporte Azure DevOps
- Autenticação via principal de serviço
- Modo não interativo

Veja o [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md) para padrões de CI/CD.
</details>

<details>
<summary><strong>Qual o custo de usar azd?</strong></summary>

O próprio azd é **completamente gratuito** e open-source. Você paga apenas por:
- Recursos Azure que você implantar
- Custos de consumo Azure (computação, armazenamento, etc.)

Use `azd provision --preview` para inspecionar os recursos propostos, e então estime seus custos com o [Calculador de Preços Azure](https://azure.microsoft.com/pricing/calculator/). O preview não calcula preços.
</details>

## Próximos Passos

1. **Complete a autenticação**: Certifique-se de que pode acessar sua assinatura Azure
2. **Tente sua primeira implantação**: Siga o [Guia do Primeiro Projeto](first-project.md)
3. **Explore modelos**: Navegue pelos modelos disponíveis com `azd template list`
4. **Configure sua IDE**: Prepare seu ambiente de desenvolvimento

## Suporte

Se encontrar problemas:
- [Documentação Oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Reporte Problemas](https://github.com/Azure/azure-dev/issues)
- [Discussões na Comunidade](https://github.com/Azure/azure-dev/discussions)
- [Suporte Azure](https://azure.microsoft.com/support/)
- [**Habilidades do Agente Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Obtenha orientação de comandos Azure diretamente no seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Início Rápido
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md) 
- **➡️ Próximo**: [Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalação Completa!** Continue para [Seu Primeiro Projeto](first-project.md) para começar a construir com azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->