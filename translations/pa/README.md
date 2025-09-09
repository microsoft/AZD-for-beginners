<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-09T18:48:08+00:00",
  "source_file": "README.md",
  "language_code": "pa"
}
-->
# AZD ਸ਼ੁਰੂਆਤੀ ਲਈ

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.pa.png) 

ਇਹ ਸਰੋਤਾਂ ਦੀ ਵਰਤੋਂ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਹੇਠਾਂ ਦਿੱਤੇ ਕਦਮਾਂ ਦੀ ਪਾਲਣਾ ਕਰੋ:
1. **ਰੇਪੋਜ਼ਟਰੀ ਨੂੰ ਫੋਰਕ ਕਰੋ**: ਕਲਿਕ ਕਰੋ [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **ਰੇਪੋਜ਼ਟਰੀ ਨੂੰ ਕਲੋਨ ਕਰੋ**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Azure Discord ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ ਅਤੇ ਮਾਹਰਾਂ ਅਤੇ ਹੋਰ ਡਿਵੈਲਪਰਾਂ ਨਾਲ ਮਿਲੋ**](https://discord.com/invite/ByRwuEEgH4)

### 🌐 ਬਹੁ-ਭਾਸ਼ਾ ਸਹਾਇਤਾ

#### GitHub Action ਰਾਹੀਂ ਸਹਾਇਤਾਪ੍ਰਾਪਤ (ਆਟੋਮੈਟਿਕ ਅਤੇ ਹਮੇਸ਼ਾ ਅਪ-ਟੂ-ਡੇਟ)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](./README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**ਜੇ ਤੁਸੀਂ ਹੋਰ ਭਾਸ਼ਾਵਾਂ ਵਿੱਚ ਅਨੁਵਾਦ ਕਰਵਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ ਤਾਂ ਸਹਾਇਤਾਪ੍ਰਾਪਤ ਭਾਸ਼ਾਵਾਂ ਦੀ ਸੂਚੀ [ਇੱਥੇ](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) ਉਪਲਬਧ ਹੈ।**

## ਪਰਿਚਯ

Azure Developer CLI (azd) ਲਈ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਵਿੱਚ ਤੁਹਾਡਾ ਸਵਾਗਤ ਹੈ। ਇਹ ਰੇਪੋਜ਼ਟਰੀ ਵਿਦਿਆਰਥੀਆਂ ਤੋਂ ਲੈ ਕੇ ਪੇਸ਼ੇਵਰ ਡਿਵੈਲਪਰਾਂ ਤੱਕ ਹਰ ਪੱਧਰ ਦੇ ਡਿਵੈਲਪਰਾਂ ਨੂੰ Azure Developer CLI ਸਿੱਖਣ ਅਤੇ ਮਾਹਰ ਬਣਨ ਵਿੱਚ ਮਦਦ ਕਰਨ ਲਈ ਤਿਆਰ ਕੀਤਾ ਗਿਆ ਹੈ। ਇਹ ਸੰਰਚਿਤ ਸਿੱਖਣ ਸਰੋਤ Azure ਕਲਾਉਡ ਡਿਪਲੌਇਮੈਂਟ, ਆਮ ਸਮੱਸਿਆਵਾਂ ਦਾ ਨਿਪਟਾਰਾ ਕਰਨ, ਅਤੇ ਸਫਲ AZD ਟੈਂਪਲੇਟ ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਸ੍ਰੇਸ਼ਠ ਤਰੀਕਿਆਂ ਨੂੰ ਲਾਗੂ ਕਰਨ ਲਈ ਹੱਥ-ਅਨੁਭਵ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਰੇਪੋਜ਼ਟਰੀ 'ਤੇ ਕੰਮ ਕਰਕੇ, ਤੁਸੀਂ:
- Azure Developer CLI ਦੇ ਮੂਲ ਸਿਧਾਂਤ ਅਤੇ ਮੁੱਖ ਧਾਰਨਾਵਾਂ ਵਿੱਚ ਮਾਹਰ ਬਣ ਜਾਓਗੇ
- Infrastructure as Code ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਸਰੋਤਾਂ ਨੂੰ ਡਿਪਲੌਇ ਅਤੇ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਨਾ ਸਿੱਖੋਗੇ
- AZD ਡਿਪਲੌਇਮੈਂਟ ਦੀਆਂ ਆਮ ਸਮੱਸਿਆਵਾਂ ਲਈ ਨਿਪਟਾਰਾ ਕਰਨ ਦੀਆਂ ਯੋਗਤਾਵਾਂ ਵਿਕਸਿਤ ਕਰੋਗੇ
- ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਵੈਰੀਫਿਕੇਸ਼ਨ ਅਤੇ ਸਮਰੱਥਾ ਯੋਜਨਾ ਨੂੰ ਸਮਝੋਗੇ
- ਸੁਰੱਖਿਆ ਦੇ ਸ੍ਰੇਸ਼ਠ ਤਰੀਕਿਆਂ ਅਤੇ ਲਾਗਤ ਨੂੰ ਅਨੁਕੂਲ ਕਰਨ ਦੀਆਂ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋਗੇ
- Azure 'ਤੇ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰਨ ਵਿੱਚ ਭਰੋਸਾ ਬਣਾਉਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਹ ਕੋਰਸ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ:
- ਸਫਲਤਾਪੂਰਵਕ Azure Developer CLI ਨੂੰ ਇੰਸਟਾਲ, ਕਨਫਿਗਰ ਅਤੇ ਵਰਤ ਸਕੋਗੇ
- AZD ਟੈਂਪਲੇਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ ਅਤੇ ਡਿਪਲੌਇ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੋਗੇ
- ਪ੍ਰਮਾਣਿਕਤਾ, ਇੰਫਰਾਸਟਰਕਚਰ, ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਦਾ ਨਿਪਟਾਰਾ ਕਰ ਸਕੋਗੇ
- ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਚੈੱਕ ਕਰ ਸਕੋਗੇ ਜਿਵੇਂ ਕਿ ਸਮਰੱਥਾ ਯੋਜਨਾ ਅਤੇ SKU ਚੋਣ
- ਮਾਨਟਰਿੰਗ, ਸੁਰੱਖਿਆ, ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ ਦੇ ਸ੍ਰੇਸ਼ਠ ਤਰੀਕਿਆਂ ਨੂੰ ਲਾਗੂ ਕਰ ਸਕੋਗੇ
- AZD ਵਰਕਫਲੋਜ਼ ਨੂੰ CI/CD ਪਾਈਪਲਾਈਨ ਵਿੱਚ ਇੰਟੀਗਰੇਟ ਕਰ ਸਕੋਗੇ

## ਸੂਚੀ

- [Azure Developer CLI ਕੀ ਹੈ?](../..)
- [ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ](../..)
- [ਦਸਤਾਵੇਜ਼](../..)
- [ਉਦਾਹਰਨਾਂ ਅਤੇ ਟੈਂਪਲੇਟ](../..)
- [ਸਰੋਤ](../..)
- [ਯੋਗਦਾਨ](../..)

## Azure Developer CLI ਕੀ ਹੈ?

Azure Developer CLI (azd) ਇੱਕ ਡਿਵੈਲਪਰ-ਕੇਂਦਰਤ ਕਮਾਂਡ-ਲਾਈਨ ਇੰਟਰਫੇਸ ਹੈ ਜੋ Azure 'ਤੇ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ ਅਤੇ ਡਿਪਲੌਇ ਕਰਨ ਦੀ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਤੇਜ਼ ਕਰਦਾ ਹੈ। ਇਹ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ:

- **ਟੈਂਪਲੇਟ-ਅਧਾਰਿਤ ਡਿਪਲੌਇਮੈਂਟ** - ਆਮ ਐਪਲੀਕੇਸ਼ਨ ਪੈਟਰਨ ਲਈ ਪਹਿਲਾਂ ਤੋਂ ਬਣੇ ਟੈਂਪਲੇਟ ਦੀ ਵਰਤੋਂ ਕਰੋ
- **Infrastructure as Code** - Bicep ਜਾਂ Terraform ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਸਰੋਤਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ
- **ਇੰਟੀਗਰੇਟਡ ਵਰਕਫਲੋਜ਼** - ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਸਹੀ ਢੰਗ ਨਾਲ ਪ੍ਰੋਵਿਜ਼ਨ, ਡਿਪਲੌਇ ਅਤੇ ਮਾਨਟਰ ਕਰੋ
- **ਡਿਵੈਲਪਰ-ਫ੍ਰੈਂਡਲੀ** - ਡਿਵੈਲਪਰ ਦੀ ਉਤਪਾਦਕਤਾ ਅਤੇ ਅਨੁਭਵ ਲਈ ਅਨੁਕੂਲਿਤ

## ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ

### ਪੂਰਵ ਸ਼ਰਤਾਂ
- Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ
- Azure CLI ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- Git (ਟੈਂਪਲੇਟ ਕਲੋਨ ਕਰਨ ਲਈ)

### ਇੰਸਟਾਲੇਸ਼ਨ
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### ਤੁਹਾਡਾ ਪਹਿਲਾ ਡਿਪਲੌਇਮੈਂਟ
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

## ਦਸਤਾਵੇਜ਼

### ਸ਼ੁਰੂਆਤ
- [**AZD ਬੇਸਿਕਸ**](docs/getting-started/azd-basics.md) - ਮੁੱਖ ਧਾਰਨਾਵਾਂ ਅਤੇ ਸ਼ਬਦਾਵਲੀ
- [**ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ**](docs/getting-started/installation.md) - ਪਲੇਟਫਾਰਮ-ਵਿਸ਼ੇਸ਼ ਇੰਸਟਾਲੇਸ਼ਨ ਗਾਈਡ
- [**ਕਨਫਿਗਰੇਸ਼ਨ**](docs/getting-started/configuration.md) - ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ
- [**ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ**](docs/getting-started/first-project.md) - ਕਦਮ-ਦਰ-ਕਦਮ ਟਿਊਟੋਰਿਅਲ

### ਡਿਪਲੌਇਮੈਂਟ ਅਤੇ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- [**ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ**](docs/deployment/deployment-guide.md) - ਪੂਰੀ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋਜ਼
- [**ਸਰੋਤਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ**](docs/deployment/provisioning.md) - Azure ਸਰੋਤ ਪ੍ਰਬੰਧਨ

### ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਚੈੱਕ
- [**ਸਮਰੱਥਾ ਯੋਜਨਾ**](docs/pre-deployment/capacity-planning.md) - Azure ਸਰੋਤ ਸਮਰੱਥਾ ਵੈਰੀਫਿਕੇਸ਼ਨ
- [**SKU ਚੋਣ**](docs/pre-deployment/sku-selection.md) - ਸਹੀ Azure SKUs ਦੀ ਚੋਣ
- [**ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕ**](docs/pre-deployment/preflight-checks.md) - ਆਟੋਮੈਟਿਕ ਵੈਰੀਫਿਕੇਸ਼ਨ ਸਕ੍ਰਿਪਟ

### ਨਿਪਟਾਰਾ
- [**ਆਮ ਸਮੱਸਿਆਵਾਂ**](docs/troubleshooting/common-issues.md) - ਅਕਸਰ ਆਉਣ ਵਾਲੀਆਂ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਹੱਲ
- [**ਡਿਬੱਗਿੰਗ ਗਾਈਡ**](docs/troubleshooting/debugging.md) - ਕਦਮ-ਦਰ-ਕਦਮ ਡਿਬੱਗਿੰਗ ਰਣਨੀਤੀਆਂ

## ਉਦਾਹਰਨਾਂ ਅਤੇ ਟੈਂਪਲੇਟ

### ਸ਼ੁਰੂਆਤੀ ਟੈਂਪਲੇਟ
- [**ਸਧਾਰਨ ਵੈਬ ਐਪਲੀਕੇਸ਼ਨ**](../../examples/simple-web-app) - ਬੁਨਿਆਦੀ Node.js ਵੈਬ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ
- [**ਸਥਿਰ ਵੈਬਸਾਈਟ**](../../examples/static-website) - Azure Storage 'ਤੇ ਸਥਿਰ ਵੈਬਸਾਈਟ ਹੋਸਟਿੰਗ
- [**ਕੰਟੇਨਰ ਐਪਲੀਕੇਸ਼ਨ**](../../examples/container-app) - ਕੰਟੇਨਰਾਈਜ਼ਡ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ
- [**ਡਾਟਾਬੇਸ ਐਪਲੀਕੇਸ਼ਨ**](../../examples/database-app) - ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ ਵੈਬ ਐਪਲੀਕੇਸ਼ਨ

### ਉੱਚ ਪੱਧਰੀ ਸਥਿਤੀਆਂ
- [**ਮਾਈਕ੍ਰੋਸਰਵਿਸਜ਼**](../../examples/microservices) - ਬਹੁ-ਸਰਵਿਸ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ
- [**ਸਰਵਰਲੈਸ ਫੰਕਸ਼ਨ**](../../examples/serverless-function) - Azure Functions ਡਿਪਲੌਇਮੈਂਟ
- [**ਕਨਫਿਗਰੇਸ਼ਨ ਉਦਾਹਰਨਾਂ**](../../examples/configurations) - ਦੁਬਾਰਾ ਵਰਤਣਯੋਗ ਕਨਫਿਗਰੇਸ਼ਨ ਪੈਟਰਨ

## ਸਰੋਤ

### ਤੁਰੰਤ ਸੰਦਰਭ
- [**ਕਮਾਂਡ ਚੀਟ ਸ਼ੀਟ**](resources/cheat-sheet.md) - ਮੁੱਖ azd ਕਮਾਂਡ
- [**ਗਲੋਸਰੀ**](resources/glossary.md) - Azure ਅਤੇ azd ਸ਼ਬਦਾਵਲੀ
- [**FAQ**](resources/faq.md) - ਅਕਸਰ ਪੁੱਛੇ ਜਾਣ ਵਾਲੇ ਸਵਾਲ
- [**ਅਧਿਐਨ ਗਾਈਡ**](resources/study-guide.md) - ਵਿਸਤ੍ਰਿਤ ਸਿੱਖਣ ਦੇ ਲਕਸ਼ ਅਤੇ ਅਭਿਆਸ ਅਭਿਆਸ

### ਬਾਹਰੀ ਸਰੋਤ
- [Azure Developer CLI ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure ਆਰਕੀਟੈਕਚਰ ਸੈਂਟਰ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure ਪ੍ਰਾਈਸਿੰਗ ਕੈਲਕੂਲੇਟਰ](https://azure.microsoft.com/pricing/calculator/)
- [Azure ਸਥਿਤੀ](https://status.azure.com/)

## ਸਿੱਖਣ ਦਾ ਪਾਥ

### ਵਿਦਿਆਰਥੀਆਂ ਅਤੇ ਸ਼ੁਰੂਆਤੀ ਲਈ
1. [AZD ਬੇਸਿਕਸ](docs/getting-started/azd-basics.md) ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ
2. [ਇੰਸਟਾਲੇਸ਼ਨ ਗਾਈਡ](docs/getting-started/installation.md) ਦੀ ਪਾਲਣਾ ਕਰੋ
3. [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](docs/getting-started/first-project.md) ਪੂਰਾ ਕਰੋ
4. [ਸਧਾਰਨ ਵੈਬ ਐਪ ਉਦਾਹਰਨ](../../examples/simple-web-app) ਨਾਲ ਅਭਿਆਸ ਕਰੋ

### ਡਿਵੈਲਪਰਾਂ ਲਈ
1. [ਕਨਫਿਗਰੇਸ਼ਨ ਗਾਈਡ](docs/getting-started/configuration.md) ਦੀ ਸਮੀਖਿਆ ਕਰੋ
2. [ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ](docs/deployment/deployment-guide.md) ਅਧਿਐਨ ਕਰੋ
3. [ਡਾਟਾਬੇਸ ਐਪ ਉਦਾਹਰਨ](../../examples/database-app) 'ਤੇ ਕੰਮ ਕਰੋ
4. [ਕੰਟੇਨਰ ਐਪ ਉਦਾਹਰਨ](../../examples/container-app) ਦੀ ਖੋਜ ਕਰੋ

### DevOps ਇੰਜੀਨੀਅਰਾਂ ਲਈ
1. [ਸਰੋਤਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ](docs/deployment/provisioning.md) ਵਿੱਚ ਮਾਹਰ ਬਣੋ
2. [ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕ](docs/pre-deployment/preflight-checks.md) ਲਾਗੂ ਕਰੋ
3. [ਸਮਰੱਥਾ ਯੋਜਨਾ](docs/pre-deployment/capacity-planning.md) 'ਤੇ ਅਭਿਆਸ ਕਰੋ
4. ਉੱਚ ਪੱਧਰੀ [ਮਾਈਕ੍ਰੋਸਰਵਿਸਜ਼ ਉਦਾਹਰਨ](../../examples/microservices) 'ਤੇ ਕੰਮ ਕਰੋ

## ਯੋਗਦਾਨ

ਅਸੀਂ ਯੋਗਦਾਨਾਂ ਦਾ ਸਵਾਗਤ ਕਰਦੇ ਹਾਂ! ਕਿਰਪਾ ਕਰਕੇ [ਯੋਗਦਾਨ ਗਾਈਡ](CONTRIBUTING.md) ਨੂੰ ਪੜ੍ਹੋ:
- ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਫੀਚਰ ਦੀਆਂ ਬੇਨਤੀਆਂ ਕਿਵੇਂ ਜਮ੍ਹਾਂ ਕਰਨੀ ਹੈ
- ਕੋਡ ਯੋਗਦਾਨ ਦੇ ਨਿਯਮ
- ਦਸਤਾਵੇਜ਼ ਵਿੱਚ ਸੁਧਾਰ
- ਕਮਿਊਨਿਟੀ ਮਿਆਰ

## ਸਹਾਇਤਾ

- **ਸਮੱਸਿਆਵਾਂ**: [ਬੱਗ ਰਿਪੋਰਟ ਕਰੋ ਅਤੇ ਫੀਚਰ ਦੀਆਂ ਬੇਨਤੀਆਂ](https://github.com/microsoft/azd-for-beginners/issues)
- **ਚਰਚਾ**: [Microsoft Azure Discord ਕਮਿਊਨਿਟੀ Q&A ਅਤੇ ਚਰਚਾ](https://discord.gg/microsoft-azure)
- **ਈਮੇਲ**: ਨਿੱਜੀ ਪੁੱਛਗਿੱਛ ਲਈ
- **Microsoft Learn**: [ਆਧਿਕਾਰਿਕ Azure Developer CLI ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

## ਲਾਇਸੰਸ

ਇਹ ਪ੍ਰੋਜੈਕਟ MIT ਲਾਇਸੰਸ ਅਧੀਨ ਹੈ - ਵੇਰਵੇ ਲਈ [LICENSE](../../LICENSE) ਫਾਈਲ ਦੇਖੋ।

## 🎒 ਹੋਰ ਕੋਰਸ

ਸਾਡੀ ਟੀਮ ਹੋਰ ਕੋਰਸ ਤਿਆਰ ਕਰਦੀ ਹੈ! ਚੈੱਕ ਕਰੋ:

- [**NEW** ਮਾਡਲ ਕਨਟੈਕਸਟ ਪ੍ਰੋਟੋਕੋਲ (MCP) ਸ਼ੁਰੂਆਤੀ ਲਈ](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents ਸ਼ੁਰੂਆਤੀ ਲਈ](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI ਸ਼ੁਰੂਆਤੀ ਲਈ .NET ਦੀ ਵਰਤੋਂ ਕਰਕੇ](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-kore
- [ਵੇਬ ਡਿਵੈਲਪਮੈਂਟ ਸ਼ੁਰੂਆਤੀ ਲਈ](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT ਸ਼ੁਰੂਆਤੀ ਲਈ](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [XR ਡਿਵੈਲਪਮੈਂਟ ਸ਼ੁਰੂਆਤੀ ਲਈ](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [GitHub Copilot ਨੂੰ AI ਜੋੜੇ ਪ੍ਰੋਗਰਾਮਿੰਗ ਲਈ ਮਾਹਰ ਬਣਾਉਣਾ](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [GitHub Copilot ਨੂੰ C#/.NET ਡਿਵੈਲਪਰਾਂ ਲਈ ਮਾਹਰ ਬਣਾਉਣਾ](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [ਆਪਣੀ Copilot ਮੁਹਿੰਮ ਚੁਣੋ](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**ਨੈਵੀਗੇਸ਼ਨ**  
- **ਅਗਲਾ ਪਾਠ**: [AZD ਬੁਨਿਆਦੀਆਂ](docs/getting-started/azd-basics.md)  

---

**ਅਸਵੀਕਾਰਨਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚੱਜੇਪਣ ਹੋ ਸਕਦੇ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼, ਜੋ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੈ, ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।