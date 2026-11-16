# Guia de Instalação e Configuração

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Início Rápido
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md)
- **➡️ Próximo**: [Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Este guia abrangente irá orientá-lo na instalação e configuração do Azure Developer CLI (azd) no seu sistema. Você aprenderá múltiplos métodos de instalação para diferentes sistemas operacionais, configuração de autenticação e configuração inicial para preparar seu ambiente de desenvolvimento para implantações no Azure.

## Objetivos de Aprendizagem

Ao final desta lição, você irá:
- Instalar com sucesso o Azure Developer CLI no seu sistema operacional
- Configurar autenticação com o Azure utilizando múltiplos métodos
- Preparar seu ambiente de desenvolvimento com os pré-requisitos necessários
- Entender as diferentes opções de instalação e quando utilizar cada uma
- Solucionar problemas comuns de instalação e configuração

## Resultados de Aprendizagem

Após completar esta lição, você será capaz de:
- Instalar o azd utilizando o método apropriado para sua plataforma
- Autenticar com o Azure usando azd auth login
- Verificar sua instalação e testar comandos básicos do azd
- Configurar seu ambiente de desenvolvimento para uso ideal do azd
- Resolver problemas comuns de instalação de forma independente

Este guia o ajudará a instalar e configurar o Azure Developer CLI no seu sistema, independentemente do seu sistema operacional ou ambiente de desenvolvimento.

## Pré-requisitos

Antes de instalar o azd, certifique-se de que você possui:
- **Assinatura do Azure** - [Crie uma conta gratuita](https://azure.microsoft.com/free/)
- **Azure CLI** (opcional) - Para exemplos que executam explicitamente `az`; o azd autentica-se independentemente
- **Git** - Para clonar templates e controle de versão
- **Docker** (opcional) - Para aplicações conteinerizadas

## Métodos de Instalação

### Windows

#### Opção 1: Gerenciador de Pacotes do Windows (Recomendado)
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
1. Baixe a última versão no [GitHub](https://github.com/Azure/azure-dev/releases)
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
Baixe o arquivo para a arquitetura do seu macOS em [os arquivos da versão](https://github.com/Azure/azure-dev/releases), extraia e adicione o binário `azd` ao seu `PATH`.

### Linux

#### Opção 1: Script de Instalação (Recomendado)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opção 2: Gerenciadores de Pacotes

**Instalação manual a partir dos arquivos da versão:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Alguns Codespaces e ambientes com contêiner dev já incluem `azd`, mas você deve verificar ao invés de presumir:

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

Este contêiner efêmero não preserva o estado de login entre execuções. Para implantações repetidas, use a [configuração do contêiner dev](dev-containers.md); builds de contêiner também requerem um daemon Docker acessível de dentro do contêiner.

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

**Nota**: O número da versão real pode variar. Confira [Lançamentos do Azure Developer CLI](https://github.com/Azure/azure-dev/releases) para a versão mais recente.

**✅ Lista de Verificação de Sucesso na Instalação:**
- [ ] `azd version` mostra o número da versão sem erros
- [ ] `azd --help` exibe a documentação do comando
- [ ] `azd template list` mostra os templates disponíveis
- [ ] Você pode criar um diretório de teste e executar `azd init` com sucesso

**Se todos os testes passarem, você está pronto para prosseguir para [Seu Primeiro Projeto](first-project.md)!**

## Configuração de Autenticação

### Configuração Recomendável para Iniciantes

Para fluxos de trabalho com foco em AZD, faça login com `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Utilize o login pelo Azure CLI somente quando planejar executar comandos `az` você mesmo durante o curso.

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

### Qual Fluxo de Login Devo Utilizar?

- Use `azd auth login` se você estiver seguindo o caminho iniciante do AZD e principalmente executando comandos `azd`.
- Use também `az login` quando desejar executar comandos Azure CLI, como `az account show` ou inspecionar recursos diretamente.
- Se um exercício incluir comandos `azd` e `az`, execute ambos os comandos de login uma vez no início.

### Autenticação via Código de Dispositivo
Se você estiver em um sistema sem interface gráfica ou com problemas no navegador:
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

### Valide Sua Configuração Completa

Se quiser uma checagem rápida antes de iniciar o Capítulo 1:

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
1. Instale o plugin Azure
2. Configure as credenciais Azure
3. Use o terminal integrado para comandos azd

## 🐛 Solução de Problemas na Instalação

### Problemas Comuns

#### Permissão Negada (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemas com PATH
Adicione o azd manualmente ao seu PATH:

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

## Atualizando o azd

### Verificação de Atualização
O azd avisa quando uma nova versão está disponível, e você pode confirmar sua build atual com:
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

**Azure CLI (az)**: Ferramenta de baixo nível para gerenciamento de recursos individuais do Azure
- `az webapp create`, `az storage account create`
- Um recurso por vez
- Foco em gerenciamento de infraestrutura

**Azure Developer CLI (azd)**: Ferramenta de alto nível para implantações completas de aplicativos
- `azd up` implanta o aplicativo inteiro com todos os recursos
- Fluxos de trabalho baseados em templates
- Foco na produtividade do desenvolvedor

**Eles são independentes**: azd usa sua própria autenticação por padrão. Instale e faça login no Azure CLI somente para comandos `az`, ou opte explicitamente por `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Posso usar azd com recursos existentes do Azure?</strong></summary>

Sim! Você pode:
1. Importar recursos existentes para ambientes azd
2. Referenciar recursos existentes em seus templates Bicep
3. Usar azd para novas implantações junto com a infraestrutura existente

Veja o [Guia de Configuração](../chapter-03-configuration/configuration.md) para detalhes.
</details>

<details>
<summary><strong>azd funciona no Azure Government ou Azure China?</strong></summary>

Sim, configure a nuvem:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Se você também usar o Azure CLI, configure `az cloud set --name ...` separadamente. Serviços de templates e disponibilidade de modelos variam conforme a nuvem.
</details>

<details>
<summary><strong>Posso usar azd em pipelines CI/CD?</strong></summary>

Absolutamente! azd foi projetado para automação:
- Integração com GitHub Actions
- Suporte ao Azure DevOps
- Autenticação via serviço principal
- Modo não interativo

Veja o [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md) para padrões CI/CD.
</details>

<details>
<summary><strong>Qual o custo de usar o azd?</strong></summary>

O azd em si é **completamente gratuito** e open-source. Você paga apenas por:
- Recursos do Azure que você implantar
- Custos de consumo do Azure (computação, armazenamento, etc.)

Use `azd provision --preview` para inspecionar recursos propostos, depois estime seus custos com a [Calculadora de Preços do Azure](https://azure.microsoft.com/pricing/calculator/). O preview não calcula preços.
</details>

## Próximos Passos

1. **Complete a autenticação**: Assegure-se de que pode acessar sua assinatura Azure
2. **Faça sua primeira implantação**: Siga o [Guia do Primeiro Projeto](first-project.md)
3. **Explore templates**: Navegue pelos templates disponíveis com `azd template list`
4. **Configure sua IDE**: Prepare seu ambiente de desenvolvimento

## Suporte

Se encontrar problemas:
- [Documentação Oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Reporte Problemas](https://github.com/Azure/azure-dev/issues)
- [Discussões na Comunidade](https://github.com/Azure/azure-dev/discussions)
- [Suporte Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Receba orientações de comandos Azure diretamente em seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Início Rápido
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md) 
- **➡️ Próximo**: [Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalação Concluída!** Continue para [Seu Primeiro Projeto](first-project.md) para começar a construir com azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->