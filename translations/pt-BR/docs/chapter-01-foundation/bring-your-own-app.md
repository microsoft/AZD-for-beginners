# Traga Seu Próprio App - Adicionar azd a um Projeto Existente

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Seu Primeiro Projeto](first-project.md)
- **➡️ Próximo**: [Dev Containers & Codespaces](dev-containers.md)

> Validado contra `azd 1.25.6` em junho de 2026.

## Introdução

Em [Seu Primeiro Projeto](first-project.md) você implantou um aplicativo iniciando a partir de um template. Mas na maioria das vezes você já *tem* um app—uma API Node.js, um serviço Python Flask, um app web .NET—em uma pasta na sua máquina. Esta lição mostra como adicionar o azd a esse código existente para que você possa implantá-lo com `azd up`, sem precisar de template.

## Objetivos de Aprendizagem

Ao final desta lição, você irá:
- Entender as três maneiras de iniciar um projeto azd
- Executar `azd init` dentro de uma base de código existente
- Entender o que `azure.yaml` e a pasta `infra/` fazem pelo seu app
- Saber quando deixar o azd gerar infraestrutura vs. escrever a sua própria
- Implantar seu app existente no Azure com `azd up`

## Resultados Esperados

Após completar esta lição, você será capaz de:
- Inicializar o azd em um projeto que você já tem
- Ler e editar um arquivo básico `azure.yaml`
- Gerar infraestrutura inicial com `azd infra generate`
- Escolher um host Azure apropriado para seu aplicativo
- Implantar e remover seu próprio aplicativo

---

## Três Maneiras de Iniciar um Projeto azd

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Learning, or starting a new app from a proven sample |
| **From your existing code** | `azd init` (in your project folder) | You already have an app and want to deploy it |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Adopting azd for an existing repository |

Você já praticou a primeira opção. Esta lição cobre a segunda—a mais comum no cenário real.

---

## Passo 1: Execute `azd init` no Seu Projeto

Abra um terminal **dentro da pasta do seu projeto existente** e execute:

```bash
cd my-existing-app
azd init
```

o azd perguntará como você quer inicializar. Escolha:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Escolha **"Use code in the current directory."** o azd então escaneia sua pasta, detecta sua linguagem e framework, e propõe um host.

### O que o azd detecta

o azd procura por sinais como `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, ou um `Dockerfile`, e sugere um host Azure correspondente:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Confirme o(s) serviço(s) detectado(s), e o azd cria os arquivos de que você precisa.

---

## Passo 2: Entenda o que o azd Criou

Depois do init, você terá duas novas coisas no seu projeto:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — a definição do projeto

Este é o coração de um projeto azd. Um exemplo mínimo se parece com isto:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

O bloco `services` é a parte chave: cada entrada mapeia uma pasta do seu código para um host Azure. Se seu app tiver frontend e API, você terá dois serviços.

### `infra/` — seus recursos Azure como código

A pasta `infra/` contém arquivos Bicep que definem os recursos Azure que seu app precisa (o App Service, o banco de dados, etc.). Você não precisa escrever isso à mão—o azd gera um ponto de partida funcional. Você *pode* editá-los depois para adicionar recursos ou reforçar a segurança (abordado no [Capítulo 4](../chapter-04-infrastructure/README.md)).

> **Dica:** Quer ver ou personalizar a infraestrutura gerada antes de implantar? Execute `azd infra generate` (também disponível como `azd infra synth`) para gravar o IaC no disco para que você possa revisar e versioná-lo.

---

## Passo 3: Defina a Configuração Necessária

Se seu app precisa de configurações ou segredos (uma connection string, uma chave de API), não os codifique no código. Use valores de ambiente:

```bash
# Criar um ambiente
azd env new dev

# Definir um valor não secreto
azd env set API_VERSION 1.0.0
```

Para segredos reais, armazene-os no Key Vault e referencie-os na sua infraestrutura—veja o [Capítulo 3: Configuração & Autenticação](../chapter-03-configuration/authsecurity.md).

---

## Passo 4: Implantar

Agora use o mesmo fluxo de trabalho que você já conhece:

```bash
# Autenticar (obrigatório para azd)
azd auth login

# Visualizar os recursos que serão criados
azd provision --preview

# Provisionar a infraestrutura e implantar seu código
azd up
```

Quando terminar, o azd imprime o URL do seu aplicativo. Verifique-o da mesma forma que qualquer app azd:

```bash
azd show           # mostrar endpoints
azd monitor --logs # verifique os logs se necessário
```

---

## Problemas Comuns na Primeira Vez

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| Build fails during `azd up` | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| App starts but returns errors | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

Para mais, veja [Capítulo 7: Solução de Problemas](../chapter-07-troubleshooting/README.md).

---

## Limpeza

```bash
azd down --force --purge
```

---

## Resumo

- `azd init` → **"Use code in the current directory"** adiciona o azd a um app que você já tem.
- `azure.yaml` mapeia suas pastas de código para hosts Azure; `infra/` define os recursos como Bicep.
- `azd infra generate` permite revisar ou personalizar a infraestrutura gerada.
- Uma vez inicializado, seu app existente usa o mesmo fluxo `azd up` / `azd down` que um app baseado em template.

---

## 🔗 Navegação

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Seu Primeiro Projeto](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Recursos Relacionados

- [AZD Basics](azd-basics.md)
- [Capítulo 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuração & Autenticação](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->