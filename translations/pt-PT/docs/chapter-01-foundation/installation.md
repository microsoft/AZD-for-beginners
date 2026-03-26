# Guia de Instalação e Configuração

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md)
- **➡️ Próximo**: [O Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Este guia abrangente irá acompanhá-lo na instalação e configuração do Azure Developer CLI (azd) no seu sistema. Vai aprender vários métodos de instalação para diferentes sistemas operativos, configuração de autenticação e configuração inicial para preparar o seu ambiente de desenvolvimento para implementações no Azure.

## Objetivos de Aprendizagem

No final desta lição, irá:
- Instalar com sucesso o Azure Developer CLI no seu sistema operativo
- Configurar a autenticação com o Azure usando vários métodos
- Configurar o seu ambiente de desenvolvimento com os pré-requisitos necessários
- Compreender as diferentes opções de instalação e quando usar cada uma
- Resolver problemas comuns de instalação e configuração

## Resultados da Aprendizagem

Após completar esta lição, será capaz de:
- Instalar o azd usando o método apropriado para a sua plataforma
- Autenticar-se no Azure usando azd auth login
- Verificar a sua instalação e testar comandos básicos do azd
- Configurar o seu ambiente de desenvolvimento para um uso óptimo do azd
- Resolver problemas comuns de instalação de forma independente

Este guia irá ajudá-lo a instalar e configurar o Azure Developer CLI no seu sistema, independentemente do sistema operativo ou ambiente de desenvolvimento.

## Pré-requisitos

Antes de instalar o azd, certifique-se que tem:
- **Assinatura Azure** - [Criar uma conta gratuita](https://azure.microsoft.com/free/)
- **Azure CLI** - Para autenticação e gestão de recursos
- **Git** - Para clonar templates e controlo de versões
- **Docker** (opcional) - Para aplicações conteinerizadas

## Métodos de Instalação

### Windows

#### Opção 1: PowerShell (Recomendado)
```powershell
# Executar como Administrador ou com privilégios elevados
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opção 2: Gestor de Pacotes do Windows (winget)
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
# Descarregar e instalar
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
# Adicionar o repositório de pacotes da Microsoft
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

O azd vem pré-instalado no GitHub Codespaces. Basta criar um codespace e começar a usar o azd imediatamente.

### Docker

```bash
# Executar azd num contentor
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Criar um pseudónimo para uso mais fácil
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

**Nota**: O número da versão real pode variar. Verifique [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) para a versão mais recente.

**✅ Checklist de Sucesso na Instalação:**
- [ ] `azd version` mostra o número da versão sem erros
- [ ] `azd --help` exibe a documentação dos comandos
- [ ] `azd template list` mostra os templates disponíveis
- [ ] `az account show` exibe a sua assinatura Azure
- [ ] Consegue criar um diretório de teste e executar `azd init` com sucesso

**Se todas as verificações forem aprovadas, está pronto para avançar para [O Seu Primeiro Projeto](first-project.md)!**

## Configuração de Autenticação

### Autenticação via Azure CLI (Recomendado)
```bash
# Instalar o Azure CLI se ainda não estiver instalado
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Iniciar sessão no Azure
az login

# Verificar autenticação
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

## Configuração

### Configuração Global
```bash
# Definir subscrição predefinida
azd config set defaults.subscription <subscription-id>

# Definir localização predefinida
azd config set defaults.location eastus2

# Ver todas as configurações
azd config list
```

### Variáveis de Ambiente
Adicione ao seu perfil do shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Configuração do Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configuração azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Ativar registo de depuração
```

## Integração no IDE

### Visual Studio Code
Instale a extensão Azure Developer CLI:
1. Abra o VS Code
2. Vá a Extensões (Ctrl+Shift+X)
3. Procure por "Azure Developer CLI"
4. Instale a extensão

Funcionalidades:
- IntelliSense para azure.yaml
- Comandos integrados no terminal
- Navegação pelos templates
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

### Problemas Frequentes

#### Permissão Negada (Windows)
```powershell
# Executar o PowerShell como Administrador
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

# Ver estado atual da implementação
azd show
```

## Atualizando o azd

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

## 💡 Perguntas Frequentes

<details>
<summary><strong>Qual é a diferença entre azd e az CLI?</strong></summary>

**Azure CLI (az)**: Ferramenta de baixo nível para gerir recursos individuais do Azure
- `az webapp create`, `az storage account create`
- Um recurso de cada vez
- Foco na gestão de infraestrutura

**Azure Developer CLI (azd)**: Ferramenta de alto nível para implementações completas de aplicações
- `azd up` implementa toda a app com todos os recursos
- Fluxos de trabalho baseados em templates
- Foco na produtividade do programador

**Precisa de ambos**: azd usa az CLI para autenticação
</details>

<details>
<summary><strong>Posso usar azd com recursos Azure existentes?</strong></summary>

Sim! Pode:
1. Importar recursos existentes para ambientes azd
2. Referenciar recursos existentes nos seus templates Bicep
3. Usar azd para novas implementações juntamente com infraestrutura existente

Consulte [Guia de Configuração](configuration.md) para detalhes.
</details>

<details>
<summary><strong>O azd funciona com Azure Government ou Azure China?</strong></summary>

Sim, configure o cloud:
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
<summary><strong>Posso usar azd em pipelines CI/CD?</strong></summary>

Absolutamente! azd é projetado para automação:
- Integração com GitHub Actions
- Suporte Azure DevOps
- Autenticação por service principal
- Modo não-interativo

Consulte [Guia de Implementação](../chapter-04-infrastructure/deployment-guide.md) para padrões CI/CD.
</details>

<details>
<summary><strong>Qual é o custo de usar azd?</strong></summary>

O azd em si é **completamente gratuito** e open-source. Apenas paga por:
- Recursos Azure que desplegar
- Custos de consumo do Azure (computação, armazenamento, etc.)

Use `azd provision --preview` para estimar custos antes da implementação.
</details>

## Próximos Passos

1. **Complete a autenticação**: Certifique-se que consegue aceder à sua assinatura Azure
2. **Experimente a sua primeira implementação**: Siga o [Guia do Primeiro Projeto](first-project.md)
3. **Explore os templates**: Navegue pelos templates disponíveis com `azd template list`
4. **Configure o seu IDE**: Configure o seu ambiente de desenvolvimento

## Suporte

Se encontrar problemas:
- [Documentação Oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Reportar Problemas](https://github.com/Azure/azure-dev/issues)
- [Discussões da Comunidade](https://github.com/Azure/azure-dev/discussions)
- [Suporte Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Obtenha orientação de comandos Azure diretamente no seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md) 
- **➡️ Próximo**: [O Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalação Completa!** Continue para [O Seu Primeiro Projeto](first-project.md) para começar a desenvolver com azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->