# Guia de Instalação e Configuração

**Chapter Navigation:**
- **📚 Página do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Início Rápido
- **⬅️ Previous**: [Noções Básicas do AZD](azd-basics.md)
- **➡️ Next**: [O Seu Primeiro Projeto](first-project.md)
- **🚀 Next Chapter**: [Capítulo 2: Desenvolvimento com Foco em IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Este guia abrangente irá guiá-lo na instalação e configuração do Azure Developer CLI (azd) no seu sistema. Irá aprender vários métodos de instalação para diferentes sistemas operativos, configuração de autenticação e configuração inicial para preparar o seu ambiente de desenvolvimento para implantações no Azure.

## Learning Goals

Ao fim desta lição, irá:
- Instalar com sucesso o Azure Developer CLI no seu sistema operativo
- Configurar a autenticação com o Azure usando vários métodos
- Configurar o seu ambiente de desenvolvimento com os pré-requisitos necessários
- Compreender as diferentes opções de instalação e quando usar cada uma
- Solucionar problemas comuns de instalação e configuração

## Learning Outcomes

Após completar esta lição, será capaz de:
- Instalar o azd usando o método apropriado para a sua plataforma
- Autenticar-se com o Azure usando azd auth login
- Verificar a sua instalação e testar comandos básicos do azd
- Configurar o seu ambiente de desenvolvimento para um uso ótimo do azd
- Resolver problemas comuns de instalação de forma autónoma

Este guia irá ajudá-lo a instalar e configurar o Azure Developer CLI no seu sistema, independentemente do seu sistema operativo ou ambiente de desenvolvimento.

## Prerequisites

Antes de instalar o azd, assegure-se de que tem:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Para autenticação e gestão de recursos
- **Git** - Para clonar templates e controlo de versão
- **Docker** (opcional) - Para aplicações conteinerizadas

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# Execute como Administrador ou com privilégios elevados
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Descarregue a versão mais recente a partir de [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extraia para `C:\Program Files\azd\`
3. Adicione à variável de ambiente PATH

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# Descarregar e instalar
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# Adicionar o repositório de pacotes da Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Instalar o azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Adicionar o repositório de pacotes da Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

o azd vem pré-instalado no GitHub Codespaces. Basta criar um codespace e começar a usar o azd imediatamente.

### Docker

```bash
# Execute o azd num contentor
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Crie um alias para facilitar o uso
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verificar Instalação

Após a instalação, verifique se o azd está a funcionar corretamente:

```bash
# Verificar versão
azd version

# Ver ajuda
azd --help

# Listar modelos disponíveis
azd template list
```

Saída esperada:
```
azd version 1.x.x (commit xxxxxx)
```

**Nota**: O número de versão real pode variar. Consulte [versões do Azure Developer CLI](https://github.com/Azure/azure-dev/releases) para a versão mais recente.

**✅ Lista de Verificação de Sucesso da Instalação:**
- [ ] `azd version` mostra o número da versão sem erros
- [ ] `azd --help` mostra a documentação dos comandos
- [ ] `azd template list` mostra templates disponíveis
- [ ] `az account show` mostra a sua subscrição do Azure
- [ ] Pode criar um diretório de teste e executar `azd init` com sucesso

**Se todas as verificações forem bem-sucedidas, está pronto para avançar para [O Seu Primeiro Projeto](first-project.md)!**

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# Instale a CLI do Azure se ainda não estiver instalada
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Inicie sessão no Azure
az login

# Verifique a autenticação
az account show
```

### Device Code Authentication
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

## Configuration

### Global Configuration
```bash
# Definir subscrição predefinida
azd config set defaults.subscription <subscription-id>

# Definir localidade predefinida
azd config set defaults.location eastus2

# Ver toda a configuração
azd config list
```

### Environment Variables
Adicione ao perfil do seu shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Configuração do Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configuração do azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Ativar registo de depuração
```

## IDE Integration

### Visual Studio Code
Instale a extensão Azure Developer CLI:
1. Abra o VS Code
2. Vá para Extensões (Ctrl+Shift+X)
3. Procure por "Azure Developer CLI"
4. Instale a extensão

Funcionalidades:
- IntelliSense para azure.yaml
- Comandos no terminal integrado
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
2. Configure as credenciais do Azure
3. Use o terminal integrado para comandos azd

## 🐛 Resolução de Problemas de Instalação

### Problemas Comuns

#### Permission Denied (Windows)
```powershell
# Execute o PowerShell como administrador
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
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

#### Network/Proxy Issues
```bash
# Configurar proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Ignorar a verificação SSL (não recomendado em produção)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Remover instalações antigas
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Limpar configuração
rm -rf ~/.azd
```

### Obter Mais Ajuda
```bash
# Ativar registo de depuração
export AZD_DEBUG=true
azd <command> --debug

# Ver configuração atual
azd config list

# Ver estado atual da implantação
azd show
```

## Updating azd

### Atualizações Automáticas
o azd notificará quando houver atualizações disponíveis:
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

## 💡 Perguntas Frequentes

<details>
<summary><strong>Qual é a diferença entre azd e az CLI?</strong></summary>

**Azure CLI (az)**: Ferramenta de baixo nível para gerir recursos individuais do Azure
- `az webapp create`, `az storage account create`
- Um recurso de cada vez
- Foco na gestão de infraestrutura

**Azure Developer CLI (azd)**: Ferramenta de alto nível para implantações completas de aplicações
- `azd up` implementa a aplicação inteira com todos os recursos
- Workflows baseados em templates
- Foco na produtividade do desenvolvedor

**Precisa de ambos**: o azd utiliza o az CLI para autenticação
</details>

<details>
<summary><strong>Posso usar o azd com recursos Azure existentes?</strong></summary>

Sim! Pode:
1. Importar recursos existentes para ambientes azd
2. Referenciar recursos existentes nos seus templates Bicep
3. Usar o azd para novas implantações em paralelo com a infraestrutura existente

Veja o [Guia de Configuração](configuration.md) para detalhes.
</details>

<details>
<summary><strong>O azd funciona com o Azure Government ou o Azure China?</strong></summary>

Sim, configure a cloud:
```bash
# Azure Governamental
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Posso usar o azd em pipelines CI/CD?</strong></summary>

Absolutamente! O azd foi concebido para automação:
- Integração com GitHub Actions
- Suporte ao Azure DevOps
- Autenticação por Service Principal
- Modo não interativo

Veja o [Guia de Implementação](../chapter-04-infrastructure/deployment-guide.md) para padrões CI/CD.
</details>

<details>
<summary><strong>Qual é o custo de usar o azd?</strong></summary>

O azd em si é **completamente gratuito** e open-source. Só paga por:
- Recursos do Azure que implementar
- Custos de consumo do Azure (computação, armazenamento, etc.)

Use `azd provision --preview` para estimar custos antes da implantação.
</details>

## Next Steps

1. **Complete a autenticação**: Assegure-se de que consegue aceder à sua subscrição Azure
2. **Experimente a sua primeira implementação**: Siga o [Guia do Primeiro Projeto](first-project.md)
3. **Explore templates**: Navegue pelos templates disponíveis com `azd template list`
4. **Configure o seu IDE**: Configure o seu ambiente de desenvolvimento

## Support

Se encontrar problemas:
- [Documentação Oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Reportar Problemas](https://github.com/Azure/azure-dev/issues)
- [Discussões da Comunidade](https://github.com/Azure/azure-dev/discussions)
- [Suporte Azure](https://azure.microsoft.com/support/)

---

**Chapter Navigation:**
- **📚 Página do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Início Rápido
- **⬅️ Previous**: [Noções Básicas do AZD](azd-basics.md) 
- **➡️ Next**: [O Seu Primeiro Projeto](first-project.md)
- **🚀 Next Chapter**: [Capítulo 2: Desenvolvimento com Foco em IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalação Concluída!** Continue para [O Seu Primeiro Projeto](first-project.md) para começar a construir com o azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso legal**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma original deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer incompreensões ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->