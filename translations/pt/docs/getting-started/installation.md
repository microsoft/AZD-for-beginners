<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-09T16:48:09+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "pt"
}
-->
# Guia de Instalação e Configuração

## Introdução

Este guia abrangente irá orientá-lo na instalação e configuração do Azure Developer CLI (azd) no seu sistema. Aprenderá diferentes métodos de instalação para vários sistemas operativos, configuração de autenticação e configuração inicial para preparar o seu ambiente de desenvolvimento para implementações no Azure.

## Objetivos de Aprendizagem

Ao final desta lição, você será capaz de:
- Instalar com sucesso o Azure Developer CLI no seu sistema operativo
- Configurar autenticação com o Azure utilizando vários métodos
- Preparar o seu ambiente de desenvolvimento com os pré-requisitos necessários
- Compreender as diferentes opções de instalação e quando utilizá-las
- Resolver problemas comuns de instalação e configuração

## Resultados de Aprendizagem

Após concluir esta lição, você será capaz de:
- Instalar o azd utilizando o método apropriado para a sua plataforma
- Autenticar-se com o Azure utilizando o comando `azd auth login`
- Verificar a instalação e testar comandos básicos do azd
- Configurar o seu ambiente de desenvolvimento para uso otimizado do azd
- Resolver problemas comuns de instalação de forma independente

Este guia ajudará você a instalar e configurar o Azure Developer CLI no seu sistema, independentemente do sistema operativo ou ambiente de desenvolvimento.

## Pré-requisitos

Antes de instalar o azd, certifique-se de que possui:
- **Subscrição do Azure** - [Crie uma conta gratuita](https://azure.microsoft.com/free/)
- **Azure CLI** - Para autenticação e gestão de recursos
- **Git** - Para clonar templates e controlo de versão
- **Docker** (opcional) - Para aplicações em contêineres

## Métodos de Instalação

### Windows

#### Opção 1: PowerShell (Recomendado)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opção 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Opção 3: Chocolatey
```cmd
choco install azd
```

#### Opção 4: Instalação Manual
1. Faça o download da última versão em [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extraia para `C:\Program Files\azd\`
3. Adicione ao PATH na variável de ambiente

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
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opção 1: Script de Instalação (Recomendado)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opção 2: Gestores de Pacotes

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

O azd já vem pré-instalado no GitHub Codespaces. Basta criar um codespace e começar a usar o azd imediatamente.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

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
azd version 1.5.0 (commit abc123)
```

## 🔐 Configuração de Autenticação

### Autenticação com Azure CLI (Recomendado)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### Autenticação por Código de Dispositivo
Se estiver num sistema sem interface gráfica ou com problemas no navegador:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Para ambientes automatizados:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 🛠️ Configuração

### Configuração Global
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Variáveis de Ambiente
Adicione ao perfil do seu shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 Integração com IDE

### Visual Studio Code
Instale a extensão Azure Developer CLI:
1. Abra o VS Code
2. Vá para Extensões (Ctrl+Shift+X)
3. Procure por "Azure Developer CLI"
4. Instale a extensão

Funcionalidades:
- IntelliSense para azure.yaml
- Comandos integrados no terminal
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
1. Instale o plugin do Azure
2. Configure as credenciais do Azure
3. Utilize o terminal integrado para comandos azd

## 🐛 Resolução de Problemas de Instalação

### Problemas Comuns

#### Permissão Negada (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemas com PATH
Adicione manualmente o azd ao PATH:

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
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Conflitos de Versão
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Obter Mais Ajuda
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Atualizar o azd

### Atualizações Automáticas
O azd notificará quando houver atualizações disponíveis:
```bash
azd version --check-for-updates
```

### Atualizações Manuais

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## Próximos Passos

1. **Concluir autenticação**: Certifique-se de que pode aceder à sua subscrição do Azure
2. **Experimente a sua primeira implementação**: Siga o [Guia do Primeiro Projeto](first-project.md)
3. **Explore templates**: Navegue pelos templates disponíveis com `azd template list`
4. **Configure o seu IDE**: Prepare o seu ambiente de desenvolvimento

## Suporte

Se encontrar problemas:
- [Documentação Oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Reportar Problemas](https://github.com/Azure/azure-dev/issues)
- [Discussões da Comunidade](https://github.com/Azure/azure-dev/discussions)
- [Suporte do Azure](https://azure.microsoft.com/support/)

---

**Navegação**
- **Lição Anterior**: [Fundamentos do AZD](azd-basics.md)
- **Próxima Lição**: [Configuração](configuration.md)

**Instalação Concluída!** Continue para [O Seu Primeiro Projeto](first-project.md) para começar a construir com azd.

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante ter em conta que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.