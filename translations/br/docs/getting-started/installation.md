<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-20T21:48:32+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "br"
}
-->
# Guia de Instalação e Configuração

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Início Rápido
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md)
- **➡️ Próximo**: [Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../microsoft-foundry/microsoft-foundry-integration.md)

## Introdução

Este guia abrangente irá orientá-lo na instalação e configuração do Azure Developer CLI (azd) no seu sistema. Você aprenderá diferentes métodos de instalação para diversos sistemas operacionais, configuração de autenticação e ajustes iniciais para preparar seu ambiente de desenvolvimento para implantações no Azure.

## Objetivos de Aprendizado

Ao final desta lição, você será capaz de:
- Instalar com sucesso o Azure Developer CLI no seu sistema operacional
- Configurar autenticação com o Azure usando diferentes métodos
- Preparar seu ambiente de desenvolvimento com os pré-requisitos necessários
- Compreender as diferentes opções de instalação e quando utilizá-las
- Solucionar problemas comuns de instalação e configuração

## Resultados de Aprendizado

Após concluir esta lição, você será capaz de:
- Instalar o azd usando o método apropriado para sua plataforma
- Autenticar-se com o Azure usando o comando `azd auth login`
- Verificar sua instalação e testar comandos básicos do azd
- Configurar seu ambiente de desenvolvimento para uso otimizado do azd
- Resolver problemas comuns de instalação de forma independente

Este guia ajudará você a instalar e configurar o Azure Developer CLI no seu sistema, independentemente do sistema operacional ou ambiente de desenvolvimento.

## Pré-requisitos

Antes de instalar o azd, certifique-se de ter:
- **Assinatura do Azure** - [Crie uma conta gratuita](https://azure.microsoft.com/free/)
- **Azure CLI** - Para autenticação e gerenciamento de recursos
- **Git** - Para clonar templates e controle de versão
- **Docker** (opcional) - Para aplicações containerizadas

## Métodos de Instalação

### Windows

#### Opção 1: PowerShell (Recomendado)
```powershell
# Execute como Administrador ou com privilégios elevados
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opção 2: Gerenciador de Pacotes do Windows (winget)
```cmd
winget install Microsoft.Azd
```

#### Opção 3: Chocolatey
```cmd
choco install azd
```

#### Opção 4: Instalação Manual
1. Baixe a versão mais recente no [GitHub](https://github.com/Azure/azure-dev/releases)
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
# Adicionar repositório de pacotes da Microsoft
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
azd version 1.5.0 (commit abc123)
```

**✅ Lista de Verificação de Sucesso na Instalação:**
- [ ] `azd version` exibe o número da versão sem erros
- [ ] `azd --help` mostra a documentação dos comandos
- [ ] `azd template list` exibe os templates disponíveis
- [ ] `az account show` exibe sua assinatura do Azure
- [ ] Você consegue criar um diretório de teste e executar `azd init` com sucesso

**Se todas as verificações forem aprovadas, você está pronto para seguir para [Seu Primeiro Projeto](first-project.md)!**

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
Se você estiver em um sistema sem interface gráfica ou enfrentando problemas com o navegador:
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

## Configuração

### Configuração Global
```bash
# Definir assinatura padrão
azd config set defaults.subscription <subscription-id>

# Definir localização padrão
azd config set defaults.location eastus2

# Visualizar todas as configurações
azd config list
```

### Variáveis de Ambiente
Adicione ao seu perfil de shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Configuração do Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configuração do azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Ativar registro de depuração
```

## Integração com IDE

### Visual Studio Code
Instale a extensão Azure Developer CLI:
1. Abra o VS Code
2. Vá para Extensões (Ctrl+Shift+X)
3. Pesquise por "Azure Developer CLI"
4. Instale a extensão

Funcionalidades:
- IntelliSense para azure.yaml
- Comandos integrados no terminal
- Navegação de templates
- Monitoramento de implantações

### GitHub Codespaces
Crie um arquivo `.devcontainer/devcontainer.json`:
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

## 🐛 Solução de Problemas na Instalação

### Problemas Comuns

#### Permissão Negada (Windows)
```powershell
# Execute o PowerShell como Administrador
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
# Configurar proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Ignorar verificação SSL (não recomendado para produção)
azd config set http.insecure true
```

#### Conflitos de Versão
```bash
# Remova instalações antigas
# Windows: winget desinstalar Microsoft.Azd
# macOS: brew desinstalar azd
# Linux: sudo apt remover azd

# Limpar configuração
rm -rf ~/.azd
```

### Obtendo Mais Ajuda
```bash
# Ativar registro de depuração
export AZD_DEBUG=true
azd <command> --debug

# Visualizar logs detalhados
azd logs

# Verificar informações do sistema
azd info
```

## Atualizando o azd

### Atualizações Automáticas
O azd notificará você quando houver atualizações disponíveis:
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
- Foco em gerenciamento de infraestrutura

**Azure Developer CLI (azd)**: Ferramenta de alto nível para implantações completas de aplicativos
- `azd up` implanta todo o aplicativo com todos os recursos
- Fluxos de trabalho baseados em templates
- Foco na produtividade do desenvolvedor

**Você precisa de ambos**: o azd utiliza o az CLI para autenticação
</details>

<details>
<summary><strong>Posso usar o azd com recursos existentes do Azure?</strong></summary>

Sim! Você pode:
1. Importar recursos existentes para ambientes azd
2. Referenciar recursos existentes em seus templates Bicep
3. Usar o azd para novas implantações junto com a infraestrutura existente

Veja [Guia de Configuração](configuration.md) para mais detalhes.
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
<summary><strong>Posso usar o azd em pipelines CI/CD?</strong></summary>

Com certeza! O azd foi projetado para automação:
- Integração com GitHub Actions
- Suporte ao Azure DevOps
- Autenticação com service principal
- Modo não interativo

Veja [Guia de Implantação](../deployment/deployment-guide.md) para padrões de CI/CD.
</details>

<details>
<summary><strong>Qual é o custo de usar o azd?</strong></summary>

O azd em si é **completamente gratuito** e de código aberto. Você só paga por:
- Recursos do Azure que você implanta
- Custos de consumo do Azure (computação, armazenamento, etc.)

Use `azd provision --preview` para estimar os custos antes da implantação.
</details>

## Próximos Passos

1. **Concluir autenticação**: Certifique-se de que pode acessar sua assinatura do Azure
2. **Experimente sua primeira implantação**: Siga o [Guia do Primeiro Projeto](first-project.md)
3. **Explore templates**: Navegue pelos templates disponíveis com `azd template list`
4. **Configure seu IDE**: Prepare seu ambiente de desenvolvimento

## Suporte

Se você encontrar problemas:
- [Documentação Oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Relatar Problemas](https://github.com/Azure/azure-dev/issues)
- [Discussões da Comunidade](https://github.com/Azure/azure-dev/discussions)
- [Suporte do Azure](https://azure.microsoft.com/support/)

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Início Rápido
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md) 
- **➡️ Próximo**: [Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Instalação Concluída!** Continue para [Seu Primeiro Projeto](first-project.md) para começar a construir com o azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional feita por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->