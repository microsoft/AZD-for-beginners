# Guia de Instalação e Configuração

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundação & Início Rápido
- **⬅️ Anterior**: [AZD Basics](azd-basics.md)
- **➡️ Próximo**: [Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Este guia abrangente irá guiá-lo pela instalação e configuração do Azure Developer CLI (azd) em seu sistema. Você aprenderá vários métodos de instalação para diferentes sistemas operacionais, configuração de autenticação e configuração inicial para preparar seu ambiente de desenvolvimento para implantações no Azure.

## Objetivos de Aprendizagem

Ao final desta lição, você irá:
- Instalar com sucesso o Azure Developer CLI em seu sistema operacional
- Configurar autenticação com o Azure usando múltiplos métodos
- Configurar seu ambiente de desenvolvimento com os pré-requisitos necessários
- Entender as diferentes opções de instalação e quando usar cada uma
- Solucionar problemas comuns de instalação e configuração

## Resultados de Aprendizagem

Depois de completar esta lição, você será capaz de:
- Instalar azd usando o método apropriado para sua plataforma
- Autenticar-se com o Azure usando azd auth login
- Verificar sua instalação e testar comandos básicos do azd
- Configurar seu ambiente de desenvolvimento para uso ideal do azd
- Resolver problemas comuns de instalação de forma independente

Este guia ajudará você a instalar e configurar o Azure Developer CLI em seu sistema, independentemente do seu sistema operacional ou ambiente de desenvolvimento.

## Pré-requisitos

Antes de instalar o azd, certifique-se de que você tem:
- **Assinatura do Azure** - [Crie uma conta gratuita](https://azure.microsoft.com/free/)
- **Azure CLI** - Para autenticação e gerenciamento de recursos
- **Git** - Para clonar templates e controle de versão
- **Docker** (opcional) - Para aplicações conteinerizadas

## Métodos de Instalação

### Windows

#### Opção 1: PowerShell (Recomendado)
```powershell
# Execute como administrador ou com privilégios elevados
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
1. Baixe a versão mais recente em [GitHub](https://github.com/Azure/azure-dev/releases)
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
```bash
# Baixar e instalar
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opção 1: Script de Instalação (Recomendado)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opção 2: Gerenciadores de Pacotes

**Ubuntu/Debian:**
```bash
# Adicionar repositório de pacotes da Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Instalar azd
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

O azd já vem pré-instalado no GitHub Codespaces. Basta criar um codespace e começar a usar o azd imediatamente.

### Docker

```bash
# Execute o azd em um contêiner
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Crie um alias para facilitar o uso
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verificar Instalação

Após a instalação, verifique se o azd está funcionando corretamente:

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

**Observação**: O número da versão real variará. Verifique [lançamentos do Azure Developer CLI](https://github.com/Azure/azure-dev/releases) para a versão mais recente.

**✅ Lista de Verificação de Instalação Bem-sucedida:**
- [ ] `azd version` mostra o número da versão sem erros
- [ ] `azd --help` exibe a documentação de comandos
- [ ] `azd template list` mostra templates disponíveis
- [ ] `az account show` exibe sua assinatura do Azure
- [ ] Você pode criar um diretório de teste e executar `azd init` com sucesso

**Se todas as verificações passarem, você está pronto para prosseguir para [Seu Primeiro Projeto](first-project.md)!**

## Configuração de Autenticação

### Autenticação com Azure CLI (Recomendado)
```bash
# Instale o Azure CLI se ainda não estiver instalado
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Faça login no Azure
az login

# Verifique a autenticação
az account show
```

### Autenticação por Código de Dispositivo
Se você estiver em um sistema sem interface gráfica (headless) ou tiver problemas com o navegador:
```bash
az login --use-device-code
```

### Principal de Serviço (CI/CD)
Para ambientes automatizados:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configuração

### Configuração Global
```bash
# Definir assinatura padrão
azd config set defaults.subscription <subscription-id>

# Definir localização padrão
azd config set defaults.location eastus2

# Ver todas as configurações
azd config list
```

### Variáveis de Ambiente
Adicione ao seu profile do shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Configuração do Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configuração do azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Ativar logs de depuração
```

## Integração com IDE

### Visual Studio Code
Instale a extensão Azure Developer CLI:
1. Abra o VS Code
2. Vá para Extensões (Ctrl+Shift+X)
3. Procure por "Azure Developer CLI"
4. Instale a extensão

Recursos:
- IntelliSense para azure.yaml
- Comandos integrados no terminal
- Navegação de templates
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
1. Instale o plugin do Azure
2. Configure as credenciais do Azure
3. Use o terminal integrado para comandos do azd

## 🐛 Solução de Problemas na Instalação

### Problemas Comuns

#### Permissão Negada (Windows)
```powershell
# Execute o PowerShell como administrador
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemas de PATH
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
# Configurar proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Ignorar verificação SSL (não recomendado em produção)
azd config set http.insecure true
```

#### Conflitos de Versão
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
# Ativar logs de depuração
export AZD_DEBUG=true
azd <command> --debug

# Ver configuração atual
azd config list

# Ver status atual da implantação
azd show
```

## Atualizando o azd

### Atualizações Automáticas
O azd irá notificar você quando atualizações estiverem disponíveis:
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

**Azure CLI (az)**: Ferramenta de baixo nível para gerenciar recursos individuais do Azure
- `az webapp create`, `az storage account create`
- Um recurso por vez
- Foco no gerenciamento de infraestrutura

**Azure Developer CLI (azd)**: Ferramenta de alto nível para implantações completas de aplicações
- `azd up` implanta toda a aplicação com todos os recursos
- Fluxos de trabalho baseados em templates
- Foco na produtividade do desenvolvedor

**Você precisa de ambos**: o azd usa o az CLI para autenticação
</details>

<details>
<summary><strong>Posso usar azd com recursos do Azure existentes?</strong></summary>

Sim! Você pode:
1. Importar recursos existentes em ambientes do azd
2. Referenciar recursos existentes em seus templates Bicep
3. Usar o azd para novas implantações ao lado da infraestrutura existente

Veja o [Guia de Configuração](configuration.md) para mais detalhes.
</details>

<details>
<summary><strong>O azd funciona com Azure Government ou Azure China?</strong></summary>

Sim, configure a nuvem:
```bash
# Azure Governo
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Posso usar azd em pipelines de CI/CD?</strong></summary>

Absolutamente! o azd foi projetado para automação:
- Integração com GitHub Actions
- Suporte ao Azure DevOps
- Autenticação por principal de serviço
- Modo não interativo

Veja [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md) para padrões de CI/CD.
</details>

<details>
<summary><strong>Qual é o custo de usar o azd?</strong></summary>

O azd em si é **completamente gratuito** e open-source. Você paga apenas por:
- Recursos do Azure que você implantar
- Custos de consumo do Azure (compute, armazenamento, etc.)

Use `azd provision --preview` para estimar custos antes da implantação.
</details>

## Próximos Passos

1. **Complete a autenticação**: Garanta que você consegue acessar sua assinatura do Azure
2. **Faça sua primeira implantação**: Siga o [Guia do Primeiro Projeto](first-project.md)
3. **Explore templates**: Navegue pelos templates disponíveis com `azd template list`
4. **Configure sua IDE**: Configure seu ambiente de desenvolvimento

## Suporte

Se você encontrar problemas:
- [Documentação Oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Reportar Problemas](https://github.com/Azure/azure-dev/issues)
- [Discussões da Comunidade](https://github.com/Azure/azure-dev/discussions)
- [Suporte Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Obtenha orientação de comandos do Azure diretamente no seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundação & Início Rápido
- **⬅️ Anterior**: [AZD Basics](azd-basics.md) 
- **➡️ Próximo**: [Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalação Concluída!** Continue para [Seu Primeiro Projeto](first-project.md) para começar a construir com o azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->