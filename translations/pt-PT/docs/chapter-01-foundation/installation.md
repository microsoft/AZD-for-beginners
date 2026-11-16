# Guia de Instalação e Configuração

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Introdução Rápida
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md)
- **➡️ Seguinte**: [O Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Este guia abrangente irá acompanhá-lo na instalação e configuração do Azure Developer CLI (azd) no seu sistema. Irá aprender múltiplos métodos de instalação para diferentes sistemas operativos, configuração de autenticação e configuração inicial para preparar seu ambiente de desenvolvimento para implementações no Azure.

## Objetivos de Aprendizagem

No final desta lição, irá:
- Instalar com sucesso o Azure Developer CLI no seu sistema operativo
- Configurar a autenticação com o Azure usando vários métodos
- Configurar o seu ambiente de desenvolvimento com os pré-requisitos necessários
- Compreender as diferentes opções de instalação e quando usar cada uma
- Resolver problemas comuns de instalação e configuração

## Resultados de Aprendizagem

Após completar esta lição, será capaz de:
- Instalar o azd usando o método apropriado para a sua plataforma
- Autenticar-se no Azure usando azd auth login
- Verificar a sua instalação e testar comandos básicos do azd
- Configurar o seu ambiente de desenvolvimento para o uso ótimo do azd
- Resolver problemas comuns de instalação de forma independente

Este guia irá ajudá-lo a instalar e configurar o Azure Developer CLI no seu sistema, independentemente do sistema operativo ou ambiente de desenvolvimento.

## Pré-requisitos

Antes de instalar o azd, certifique-se que tem:
- **Assinatura Azure** - [Criar uma conta gratuita](https://azure.microsoft.com/free/)
- **Azure CLI** (opcional) - Para exemplos que explicitamente executam `az`; azd autentica-se independentemente
- **Git** - Para clonar templates e controlo de versões
- **Docker** (opcional) - Para aplicações conteinerizadas

## Métodos de Instalação

### Windows

#### Opção 1: Gestor de Pacotes do Windows (Recomendado)
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
1. Faça download da última versão em [GitHub](https://github.com/Azure/azure-dev/releases)
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
Faça download do arquivo para a arquitetura do seu macOS em [os ativos de lançamento](https://github.com/Azure/azure-dev/releases), extraia e adicione o binário `azd` ao seu `PATH`.

### Linux

#### Opção 1: Script de Instalação (Recomendado)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opção 2: Gestores de Pacotes

**Instalação manual a partir dos ativos de lançamento:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Alguns Codespaces e ambientes de dev container já incluem `azd`, mas deve verificar isso em vez de assumir:

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

Este contentor efémero não preserva o estado de login entre execuções. Para implementações repetidas, utilize a [configuração do contentor de desenvolvimento](dev-containers.md); as construções de contentores também requerem um daemon Docker acessível dentro do contentor.

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

**Nota**: O número da versão real pode variar. Consulte as [releases do Azure Developer CLI](https://github.com/Azure/azure-dev/releases) para a versão mais recente.

**✅ Checklist de Sucesso da Instalação:**
- [ ] `azd version` mostra o número da versão sem erros
- [ ] `azd --help` exibe documentação dos comandos
- [ ] `azd template list` mostra templates disponíveis
- [ ] Pode criar um diretório de teste e executar `azd init` com sucesso

**Se todas as verificações forem aprovadas, está pronto para avançar para [O Seu Primeiro Projeto](first-project.md)!**

## Configuração de Autenticação

### Configuração Recomendada para Iniciantes

Para workflows AZD-first, entre com `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Use o login do Azure CLI apenas quando planeia executar comandos `az` você mesmo durante o curso.

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

### Qual Fluxo de Login Deverá Usar?

- Use `azd auth login` se estiver a seguir o caminho iniciante AZD e a executar principalmente comandos `azd`.
- Use `az login` também quando quiser executar comandos Azure CLI, como `az account show` ou inspecionar recursos diretamente.
- Se um exercício incluir comandos `azd` e `az`, execute ambos os comandos de login uma vez no início.

### Autenticação por Código de Dispositivo
Se estiver num sistema sem interface gráfica ou a ter problemas com browser:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Para ambientes automatizados:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Valide Sua Configuração Completa

Se desejar um rápido teste de prontidão antes de começar o Capítulo 1:

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
2. Vá para Extensões (Ctrl+Shift+X)
3. Pesquise por "Azure Developer CLI"
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
3. Use o terminal integrado para comandos azd

## 🐛 Resolução de Problemas na Instalação

### Problemas Comuns

#### Permissão Negada (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemas com PATH
Adicione manualmente azd ao seu PATH:

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

## Atualizar o azd

### Verificação de Atualização
azd avisa quando uma nova versão está disponível, e pode confirmar a sua build atual com:
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

**Azure CLI (az)**: Ferramenta de baixo nível para gerir recursos individuais do Azure
- `az webapp create`, `az storage account create`
- Um recurso de cada vez
- Foco em gestão de infraestruturas

**Azure Developer CLI (azd)**: Ferramenta de alto nível para implementações completas de aplicações
- `azd up` implementa a app inteira com todos os recursos
- Workflows baseados em templates
- Foco na produtividade do desenvolvedor

**São independentes**: o azd usa a sua própria autenticação por padrão. Instale e faça login no Azure CLI apenas para comandos `az`, ou opte explicitamente pelo `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Posso usar o azd com recursos Azure existentes?</strong></summary>

Sim! Pode:
1. Importar recursos existentes para ambientes azd
2. Referenciar recursos existentes nos seus templates Bicep
3. Usar o azd para novas implementações em conjunto com a infraestrutura existente

Veja o [Guia de Configuração](../chapter-03-configuration/configuration.md) para detalhes.
</details>

<details>
<summary><strong>O azd funciona com Azure Government ou Azure China?</strong></summary>

Sim, configure a cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Se também usar Azure CLI, configure `az cloud set --name ...` separadamente. Os serviços de template e a disponibilidade do modelo variam conforme a cloud.
</details>

<details>
<summary><strong>Posso usar o azd em pipelines CI/CD?</strong></summary>

Absolutamente! O azd foi desenhado para automação:
- Integração com GitHub Actions
- Suporte para Azure DevOps
- Autenticação via service principal
- Modo não interativo

Consulte o [Guia de Implementação](../chapter-04-infrastructure/deployment-guide.md) para padrões CI/CD.
</details>

<details>
<summary><strong>Qual o custo de usar o azd?</strong></summary>

O azd é **completamente gratuito** e open-source. Só paga por:
- Recursos Azure que implementar
- Custos de consumo Azure (computação, armazenamento, etc.)

Use `azd provision --preview` para inspecionar recursos propostos, depois estime os custos com a [Calculadora de Preços Azure](https://azure.microsoft.com/pricing/calculator/). A pré-visualização não calcula preços.
</details>

## Próximos Passos

1. **Complete a autenticação**: Assegure que pode aceder à sua assinatura Azure
2. **Experimente a sua primeira implementação**: Siga o [Guia do Primeiro Projeto](first-project.md)
3. **Explore os templates**: Navegue pelos templates disponíveis com `azd template list`
4. **Configure o seu IDE**: Prepare o seu ambiente de desenvolvimento

## Suporte

Se encontrar problemas:
- [Documentação Oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Reportar Problemas](https://github.com/Azure/azure-dev/issues)
- [Discussões na Comunidade](https://github.com/Azure/azure-dev/discussions)
- [Suporte Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Obtenha orientação de comandos Azure diretamente no seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Introdução Rápida
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md) 
- **➡️ Seguinte**: [O Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalação Completa!** Continue para [O Seu Primeiro Projeto](first-project.md) para começar a construir com azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->