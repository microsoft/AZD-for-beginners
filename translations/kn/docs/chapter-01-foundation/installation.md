# ಸ್ಥಾಪನೆ & ಸ್ಥಾಪನೆ ಮಾರ್ಗದರ್ಶಿ

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆಜಿಡಿ ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 1 - ಆಧಾರ & ವೇಗದ ಪ್ರಾರಂಭ
- **⬅️ ಹಿಂದಿನದು**: [ಆಜಿಡಿ ಬೆಸಿಕ್ಸ್](azd-basics.md)
- **➡️ ಮುಂದಿನದು**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 2: AI-ಮೊದಲ ಅಭಿವೃದ್ಧಿ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶಿ ನಿಮ್ಮ ವ್ಯವಸ್ಥೆಯಲ್ಲಿ ಅಜೂರ್ ಡೆವಲಪರ್ CLI (azd) ಅನ್ನು ಸ್ಥಾಪಿಸುವುದು ಮತ್ತು ಸಂರಚಿಸುವುದು ಹೇಗೆ ಎಂದು ನಿಮಗೆ ತಿಳಿಸುವುದು. ನೀವು ವಿಭಿನ್ನ ಕಾರ್ಯಾಚರಣಾ ವ್ಯವಸ್ಥೆಗಳಿಗಾಗಿ ಹಲವಾರು ಸ್ಥಾಪನೆ ವಿಧಾನಗಳನ್ನು, ಪ್ರ.authentication ತಯಾರಿಕೆ ಹಾಗೂ ಆರಂಭಿಕ ಸಂರಚನೆಯನ್ನು ಕಲಿಯುತ್ತೀರಿ, ನೀವು ಅಜೂರ್ ನಿಯೋಜನೆಗಳಿಗೆ ನಿಮ್ಮ ಅಭಿವೃದ್ಧಿ ವಾತಾವರಣವನ್ನು ಸಿದ್ಧಪಡಿಸಬಹುದು.

## ಕಲಿಕೆ ಗುರಿಗಳು

ಈ ಪಾಠದ ಅಂತ್ಯಕ್ಕೆ, ನೀವು:
- ನಿಮ್ಮ ಕಾರ್ಯಾಚರಣಾ ವ್ಯವಸ್ಥೆಯಲ್ಲಿ ಅಜೂರ್ ಡೆವಲಪರ್ CLI ಅನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಸ್ಥಾಪಿಸುವಿರಿ
- ಹಲವಾರು ವಿಧಾನಗಳನ್ನು ಉಪಯೋಗಿಸಿ ಅಜೂರ್ೊಂದಿಗೆ authentication ಅನ್ನು ಸಂರಚಿಸುವಿರಿ
- ಅಗತ್ಯ ಪೂರ್ವಾವಶ್ಯಕತೆಗಳೊಂದಿಗೆ ನಿಮ್ಮ ಅಭಿವೃದ್ಧಿ ವಾತಾವರಣವನ್ನು ಸಿದ್ಧಪಡಿಸುವಿರಿ
- ವಿಭಿನ್ನ ಸ್ಥಾಪನೆ ಆಯ್ಕೆಗಳು ಮತ್ತು ಯಾವಾಗ ಯಾವುದನ್ನು ಉಪಯೋಗಿಸಬೇಕೆಂಬುದನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಿರಿ
- ಸಾಮಾನ್ಯ ಸ್ಥಾಪನೆ ಮತ್ತು ಸ್ಥಾಪನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸುವಿರಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಈ ಪಾಠವನ್ನು ಮುಗಿಸಿದ ನಂತರ, ನೀವು:
- ನಿಮ್ಮ ವೇದಿಕೆಯಕ್ಕನುಗುಣವಾಗಿ azd ಸ್ಥಾಪಿಸುವ ವಿಧಾನವನ್ನು ಉಪಯೋಗಿಸುವಿರಿ
- azd auth login ಉಪಯೋಗಿಸಿ ಅಜೂರ್ ಜೊತೆ authentication ಮಾಡುವಿರಿ
- ನಿಮ್ಮ ಸ್ಥಾಪನೆ ಪರಿಶೀಲಿಸಿ ಮತ್ತು ಮೂಲಭೂತ azd ಆದೇಶಗಳನ್ನು ಪರೀಕ್ಷಿಸುವಿರಿ
- azd ಫಲಪ್ರದವಾಗಿ ಬಳಸಲು ನಿಮ್ಮ ಅಭಿವೃದ್ಧಿ ವಾತಾವರಣವನ್ನು ಸಂರಚಿಸುವಿರಿ
- ಸಾಮಾನ್ಯ ಸ್ಥಾಪನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಸ್ವತಂತ್ರವಾಗಿ ಪರಿಹರಿಸುವಿರಿ

ಈ ಮಾರ್ಗದರ್ಶಿ ನಿಮ್ಮ ಕಾರ್ಯಾಚರಣಾ ವ್ಯವಸ್ಥೆ ಅಥವಾ ಅಭಿವೃದ್ಧಿ ವಾತಾವರಣೆ ಪರವಾನಗಿಯೆ ನೋಡದೆ azd ಅನ್ನು ಸ್ಥಾಪಿಸಿ ಸಂರಚಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.

## ಪೂರ್ವಾವಶ್ಯಕತೆಗಳು

azd ಅನ್ನು ಸ್ಥಾಪಿಸುವ ಮೊದಲು, ನೀವು ಹೊಂದಿರಬೇಕು:
- **ಅಜೂರ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್** - [ಉಚಿತ ಖಾತೆ ನಿರ್ಮಿಸಿ](https://azure.microsoft.com/free/)
- **ಅಜೂರ್ CLI** - authentication ಮತ್ತು ಸಂಪನ್ಮೂಲ ನಿರ್ವಹಣೆಗೆ
- **ಗಿಟ್** - ಟೆಂಪ್ಲೆಟ್ ಗಳನ್ನು ಕ್ಲೋನ್ ಮಾಡಲು ಮತ್ತು ಆವೃತ್ತಿ ನಿಯಂತ್ರಣಕ್ಕೆ
- **ಡಾಕರ್** (ಐಚ್ಛಿಕ) - ಕಂಟೇನರ್ ಆಧಾರಿತ ಅಪ್ಲಿಕೇಶನ್ ಗಳಿಗಾಗಿ

## ಸ್ಥಾಪನೆ ವಿಧಾನಗಳು

### ವಿಂಡೋಸ್

#### ಆಯ್ಕೆ 1: ವಿಂಡೋಸ್ ಪ್ಯಾಕೇಜ್ ಮ್ಯಾನೇಜರ್ (ಸರಿಯಾದುದು)
```cmd
winget install microsoft.azd
```

#### ಆಯ್ಕೆ 2: ಪವರ್‌ಷೆಲ್ ಸ್ಥಾಪನೆ ಸ್ಕ್ರಿಪ್ಟ್
```powershell
# winget ಲಭ್ಯವಿಲ್ಲದಾಗ ಉಪಯುಕ್ತವಾಗಿದೆ
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ಆಯ್ಕೆ 3: ಚಾಕೊಲೇಟಿ
```cmd
choco install azd
```

#### ಆಯ್ಕೆ 4: ಕೈಯಿಂದ ಸ್ಥಾಪನೆ
1. ಇತ್ತೀಚಿನ ಬಿಡುಗಡೆಯನ್ನು [GitHub](https://github.com/Azure/azure-dev/releases) ನಿಂದ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ
2. `C:\Program Files\azd\` ಗೆ ಕೈಗೆತ್ತಿಕೊಂಡು ತೆರವುಗೊಳಿಸಿ
3. PATH ಪರಿಸರ ವ್ಯತ್ಯಯಕ್ಕೆ ಸೇರ್ಗೊಳಿಸಿ

### ಮ್ಯಾಕ್‌ಒಎಸ್

#### ಆಯ್ಕೆ 1: ಹೋಮ್‌ಬ್ರೂ (ಸರಿಯಾದುದು)
```bash
brew tap azure/azd
brew install azd
```

#### ಆಯ್ಕೆ 2: ಸ್ಥಾಪನೆ ಸ್ಕ್ರಿಪ್ಟ್
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ಆಯ್ಕೆ 3: ಕೈಯಿಂದ ಸ್ಥಾಪನೆ
```bash
# ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ ಮತ್ತು ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿ
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### ಲಿನಕ್ಸು

#### ಆಯ್ಕೆ 1: ಸ್ಥಾಪನೆ ಸ್ಕ್ರಿಪ್ಟ್ (ಸರಿಯಾದುದು)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ಆಯ್ಕೆ 2: ಪ್ಯಾಕೇಜ್ ಮ್ಯಾನೇಜರ್ಸ್

**ಬಿಡುಗಡೆ ಆಸ್ತಿ ಗಳಿಂದ ಕೈಯಿಂದ ಸ್ಥಾಪನೆ:**
```bash
# ನಿಮ್ಮ ಲಿನಕ್ಸಿನ ವಾಸ್ತುಶಿಲ್ಪಕ್ಕಾಗಿ ಇತ್ತೀಚಿನ ಆರ್ಪಾಯ್ ಬಳಸಿದ ಇಂಡೆಕ್ಸನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ:
# https://github.com/Azure/azure-dev/releases
# ನಂತರ ಅದನ್ನು ಹೊರತೆಗಳಿ ಮತ್ತು azd ಬೈನರಿ ಅನ್ನು ನಿಮ್ಮ PATH ಗೆ ಸೇರಿಸಿ.
```

### GitHub ಕೋಡ್ಸ್‌ಪೇಸಸ್

ಕೆಲವು Codespaces ಮತ್ತು dev ಕಂಟೈನರ್ ವಾತಾವರಣಗಳಲ್ಲಿ `azd` ಈಗಾಗಲೇ ಸೇರಿದೆ, ಆದರೆ ನೀವು ಅಂದುಕೊಳ್ಳದೆ ಪರಿಶೀಲಿಸಬೇಕು:

```bash
azd version
```

`azd` ಕಾಣದಿದ್ದರೆ, ಆ ವಾತಾವರಣಕ್ಕಾಗಿ ಸಾಮಾನ್ಯ ಸ್ಕ್ರಿಪ್ಟ್ ಉಪಯೋಗಿಸಿ ಸ್ಥಾಪಿಸಿ.

### ಡಾಕರ್

```bash
# ಒಂದು ಕಂಟೈನರ್‌ನಲ್ಲಿ azd ಅನ್ನು ಚಾಲನೆಮಾಡಿ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# ಸುಲಭ ಬಳಕೆಗೆ ಒಂದು ಅಲಿಯಾಸ್ ರಚಿಸಿ
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ಸ್ಥಾಪನೆ ಪರಿಶೀಲನೆ

ಸ್ಥಾಪನೆಯ ನಂತರ, azd ಸರಿಯಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ:

```bash
# ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd version

# ಸಹಾಯವನ್ನು ನೋಡುವುದು
azd --help

# ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd template list
```

ನಿರೀಕ್ಷಿತ产	output:
```
azd version 1.x.x (commit xxxxxx)
```

**ಸೂಚನೆ**: ನೈಜ ಆವೃತ್ತಿಯ ಸಂಖ್ಯೆಯು ಬದಲಾಗಬಹುದು. ಇತ್ತೀಚಿನ ಆವೃತ್ತಿಗಾಗಿ [Azure Developer CLI ಬಿಡುಗಡೆಗಳು](https://github.com/Azure/azure-dev/releases) ಪರಿಶೀಲಿಸಿ.

**✅ ಸ್ಥಾಪನೆ ಯಶಸ್ಸು ಪರಿಶೀಲನೆಯ ಪಟ್ಟಿಮಾಡಿ:**
- [ ] `azd version` ಆವೃತ್ತಿ ಸಂಖ್ಯೆಯನ್ನು ತಪ್ಪಿಲ್ಲದೆ ತೋರುತ್ತದೆ
- [ ] `azd --help` ಆಜ್ಞೆಗಳ ದಾಖಲೆಗಳನ್ನು ತೋರಿಸುತ್ತದೆ
- [ ] `azd template list` ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ತೋರಿಸುತ್ತದೆ
- [ ] ನೀವು ಪರೀಕ್ಷಾ ಡೈರೆಕ್ಟರಿಯನ್ನು ರಚಿಸಿ `azd init` ಯಶಸ್ವಿಯಾಗಿ ನಡೆಸಬಹುದು

**ಎಲ್ಲಾ ಪರಿಶೀಲನೆಗಳು ಜಾಸ್ತಿ ಇದ್ದರೆ, ನೀವು [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md) ಗೆ ಮುಂದಾಗಲು ಸಿದ್ಧರಾಗಿದ್ದೀರಿ!**

## authentication ಸಿದ್ಧತೆ

### ಶಿಫಾರಸು ಮಾಡಲಾದ ಆರಂಭಿಕ ಸಿದ್ಧತೆ

AZD-ಮೊದಲ ಕಾರ್-ಪ್ರವಾಹಗಳಿಗಾಗಿ, `azd auth login` ಮೂಲಕ ಸೈನ್ ಇನ್ ಆಗಿ.

```bash
# azd up ಮುಂತಾದ AZD ಆಜ್ಞೆಗಳಿಗಾಗಿ ಅವಶ್ಯವಾಗಿದೆ
azd auth login

# AZD ಪ್ರಾಮಾಣೀಕರಣ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd auth login --check-status
```

ನೀವು ಕೋರ್ಸ್ ವೇಳೆ ಸ್ವತಃ `az` ಆಜ್ಞೆಗಳನ್ನು ನಡೆಸಲು ಬಯಸಿದಾಗ ಮಾತ್ರ ಅಜೂರ್ CLI ಸೈನ್-ಇನ್ ಉಪಯೋಗಿಸಿ.

### ಅಜೂರ್ CLI authentication (ಐಶ್ಚಿಕ)
```bash
# ಈಗಾಗಲೇ ಸ್ಥಾಪಿತವಾಗದಿದ್ದರೆ Azure CLI ಅನ್ನು ಸ್ಥಾಪಿಸಿ
# ವಿಂಡೋಸ್: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# ಲಿನಕ್ಸ್: ನಿಮ್ಮ ವಿತರಣೆಗಾಗಿ Azure CLI ಸ್ಥಾಪನಾ ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳನ್ನು ನೋಡಿ

# Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
az login

# ಪ್ರಾಮಾಣೀಕರಣವನ್ನು ಪರಿಶೀಲಿಸಿ
az account show
```

### ಯಾವ ಸೈನ್ ಇನ್ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಉಪಯೋಗಿಸಬೇಕು?

- ನೀವು ಆರಂಭಿಕ AZD ಮಾರ್ಗವನ್ನು ಅನುಸರಿಸುತ್ತಿದ್ದರೆ ಮತ್ತು ಮುಖ್ಯವಾಗಿ `azd` ಆಜ್ಞೆಗಳನ್ನು ಆಡುವಾಗ `azd auth login` ಉಪಯೋಗಿಸಿ.
- ನೀವು ಅಜೂರ್ CLI ಆಜ್ಞೆಗಳು (ಉದಾ: `az account show`) ನೇರವಾಗಿ ನೋಡಬೇಕಾದರೆ `az login` ಸಹ ಉಪಯೋಗಿಸಿ.
- ವ್ಯಾಯಾಮದಲ್ಲಿ `azd` ಮತ್ತು `az` ಎರಡೂ ಇದ್ದರೆ, ಆರಂಭದಲ್ಲಿ ಎರಡೂ ಸೈನ್ ಇನ್ ಆಜ್ಞೆಗಳನ್ನು ನಡೆಸಿ.

### ಡಿವೈಸ್ ಕೋಡ್ authentication
ನೀವು ಹೆಡ್ಲೆಸ್ ಸಿಸ್ಟಮ್ ಅಥವಾ ಬ್ರೌಸರ್ ಸಮಸ್ಯೆಗಳಿದ್ದರೆ:
```bash
azd auth login --use-device-code
```

### ಸರ್ವಿಸ್ ಪ್ರಿನ್ಸಿಪಲ್ (CI/CD)
ಸ್ವಯಂಚಾಲಿತ ವಾತಾವರಣಗಳಿಗೆ:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### ನಿಮ್ಮ ಸಂಪೂರ್ಣ ಸಿದ್ಧತೆಯನ್ನು ಮೌಲ್ಯಮಾಪನ ಮಾಡಿ

ಅಧ್ಯಾಯ 1 ಆರಂಭಿಸುವ ಮುಂಚೆ ತ್ವರಿತ ಸಿದ್ಧತೆ ಪರಿಶೀಲನೆ ಬೇಕಾದರೆ:

**ವಿಂಡೋಸ್:**
```powershell
.\validate-setup.ps1
```

**ಮ್ಯಾಕ್‌ಒಎಸ್ / ಲಿನಕ್ಸು:**
```bash
bash ./validate-setup.sh
```

## ಸಂರಚನೆ

### ಗ್ಲೋಬಲ್ ಸಂರಚನೆ
```bash
# ಡೀಫಾಲ್ಟ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಅನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set defaults.subscription <subscription-id>

# ಡೀಫಾಲ್ಟ್ ಸ್ಥಳವನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set defaults.location eastus2

# ಎಲ್ಲಾ ಸಂರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
azd config show
```

### ಪರಿಸರ ವ್ಯತ್ಯಯಗಳು
ನಿಮ್ಮ ಶೆಲ್ ಪ್ರೊಫೈಲ್ (`.bashrc`, `.zshrc`, `.profile`) ಗೆ ಸೇರ್ಪಡೆ ಮಾಡಿ:
```bash
# ಅಜೂರ್ ಸಂರಚನೆ
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd ಸಂರಚನೆ
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ಡಿಬಗ್ ಲಾಗಿಂಗ್ ಸಕ್ರಿಯಮಾಡಿ
```

## IDE ಏಕರೂಪತೆ

### Visual Studio Code
ಅಜೂರ್ ಡೆವಲಪರ್ CLI ವಿಸ್ತರಣೆ ಸ್ಥಾಪಿಸಿ:
1. VS ಕೋಡ್ ತೆರೆಯಿರಿ
2. ವಿಸ್ತರಣೆಗಳಿಗೆ ಹೋಗಿರಿ (Ctrl+Shift+X)
3. "Azure Developer CLI" ಹುಡುಕಿ
4. ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ

ಕುತೂಹಲಗಳು:
- azure.yaml ಗಾಗಿ IntelliSense
- ಏಕೀಕೃತ ಟರ್ಮಿನಲ್ ಆಜ್ಞೆಗಳು
- ಟೆಂಪ್ಲೇಟ್ಗಳ ಬ್ರೌಸಿಂಗ್
- ನಿಯೋಜನೆ ಮೇಲ್ವಿಚಾರಣೆ

### GitHub Codespaces
`.devcontainer/devcontainer.json` ಸೃಷ್ಟಿಸಿ:
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
1. ಅಜೂರ್ ಪ್ಲಗಿನನ್ನು ಸ್ಥಾಪಿಸಿ
2. ಅಜೂರ್ ಕ್ರೆಡೆನ್ಶಿಯಲ್ಸ್ ಅನ್ನು ಸಂರಚಿಸಿ
3. azd ಆಜ್ಞೆಗಳಿಗಾಗಿ ಏಕೀಕೃತ ಟರ್ಮಿನಲ್ ಬಳಸಿ

## 🐛 ಸ್ಥಾಪನೆ ದೋಷ ನಿವಾರಣೆ

### ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು

#### ಅನುಮತಿ ನಿರಾಕರಣೆ (ವಿಂಡೋಸ್)
```powershell
# পাওয়ারশেল ಆಡ್ಮಿನಿಸ್ಟ್ರೇಟರ್ ಆಗಿ ಚಲಾಯಿಸಿ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH ಸಮಸ್ಯೆಗಳು
ನಿಮ್ಮ PATH ಗೆ azdವನ್ನು ಕೈಯಿಂದ ಸೇರಿಸಿ:

**ವಿಂಡೋಸ್:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**ಮ್ಯಾಕ್‌ಒಎಸ್/ಲಿನಕ್ಸು:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### ನೆಟ್‌ವರ್ಕ್/ಪ್ರಾಕ್ಸಿ ಸಮಸ್ಯೆಗಳು
```bash
# ಪ್ರಾಕ್ಸಿ ಸಂರಚಿಸಿ
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL ಪರಿಶೀಲನೆಯನ್ನು ತಿರಸ್ಕರಿಸಿ (ಉತ್ಪಾದನೆಗಾಗಿ ಶಿಫಾರಸು ಮಾಡಲಾಗುವುದಿಲ್ಲ)
azd config set http.insecure true
```

#### ಆವೃತ್ತಿಮನಾ ಗೊಂದಲಗಳು
```bash
# ಹಳೆಯ ಸ್ಥಾಪನೆಗಳನ್ನು ತೆಗೆಯಿರಿ
# ವಿಂಡೋಸ್: winget uninstall microsoft.azd
# ಮ್ಯಾಕ್‌ಒಎಸ್: brew uninstall azd
# ಲಿನಕ್ಸ್ನಲ್ಲಿ: ಮರುಸ್ಥಾಪಿಸುವ ಮೊದಲು ಹಿಂದಿನ azd ಬೈನರಿ ಅಥವಾ ಸಿಮೆಲಿಂಕ್ ತೆಗೆಯಿರಿ

# ಸಂರಚನೆಯನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ
rm -rf ~/.azd
```

### ಹೆಚ್ಚಿನ ಸಹಾಯಕತೆ ಪಡೆಯುವುದು
```bash
# ಡಿಬಗ್ ಲಾಗಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true
azd <command> --debug

# ಪ್ರಸ್ತುತ ಸಂರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
azd config show

# ಪ್ರಸ್ತುತ ವಿತರಣಾ ಸ್ಥಿತಿಯನ್ನು ವೀಕ್ಷಿಸಿ
azd show
```

## azd ಅಪ್ಡೇಟ್

### ಅಪ್ಡೇಟ್ ಪರಿಶೀಲನೆ
ಹೊಸ ಬಿಡುಗಡೆಯಿದ್ದಾಗ azd ಎಚ್ಚರಿಸುತ್ತದೆ, ಮತ್ತು ನೀವು ನಿಮ್ಮ ಪ್ರಸ್ತುತ ನಿರ್ಮಾಣವನ್ನು ಪರಿಶೀಲಿಸಬಹುದು:
```bash
azd version
```

### ಕೈಯಿಂದ ಅಪ್ಡೇಟ್

**ವಿಂಡೋಸ್ (winget):**
```cmd
winget upgrade microsoft.azd
```

**ಮ್ಯಾಕ್‌ಒಎಸ್ (Homebrew):**
```bash
brew upgrade azd
```

**ಲಿನಕ್ಸು:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 ತಲೆಮೇಲೆ ಕೇಳಲಾಗುವ ಪ್ರಶ್ನೆಗಳು

<details>
<summary><strong>azd ಮತ್ತು az CLI ನಡುವೆ ವ್ಯತ್ಯಾಸ ಏನು?</strong></summary>

**ಅಜೂರ್ CLI (az)**: ವೈಯಕ್ತಿಕ ಅಜೂರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಿರ್ವಹಿಸುವ ಕಡಿಮೆ ಮಟ್ಟದ ಸಾಧನ
- `az webapp create`, `az storage account create`
- ಒಮ್ಮೆ ಒಂದೇ ಸಂಪನ್ಮೂಲ
- ಮೂಲಸೌಕರ್ಯ ನಿರ್ವಹಣೆ ಮೇಲೆ ಕೇಂದ್ರೀಕರಿಸಿದೆ

**ಅಜೂರ್ ಡೆವಲಪರ್ CLI (azd)**: ಸಂಪೂರ್ಣ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಗೆ ಉನ್ನತ ಮಟ್ಟದ ಸಾಧನ
- `azd up` ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳೊಂದಿಗೆ ಸಂಪೂರ್ಣ ಅಪ್ಲಿಕೇಶನನ್ನು ನಿಯೋಜಿಸುತ್ತದೆ
- ಟೆಂಪ್ಲೇಟು ಆಧಾರಿತ ಕಾರ್ಯಪ್ರವಾಹಗಳು
- ಡೆವಲಪರ್ ಉತ್ಪಾದಕತೆ ಮೇಲೆ ಕೇಂದ್ರೀಕರಿಸಿದೆ

**ನೀವು ಎರಡನ್ನು ಬೇಕಾಗುತ್ತದೆ**: azd authentication ಗೆ az CLI ಉಪಯೋಗಿಸುತ್ತದೆ
</details>

<details>
<summary><strong>ನಾನು azd ಅನ್ನು ಇತ್ತೀಚಿನ ಅಜೂರ್ ಸಂಪನ್ಮೂಲಗಳೊಂದಿಗೆ ಬಳಸಬಹುದೇ?</strong></summary>

ಹೌದು! ನೀವು:
1. ಇತ್ತೀಚಿನ ಸಂಪನ್ಮೂಲಗಳನ್ನು azd ವಾತಾವರಣಗಳಿಗೆ ಆಮದು ಮಾಡಬಹುದು
2. ನಿಮ್ಮ Bicep ಟೆಂಪ್ಲೇಟ್ಗಳಲ್ಲಿ ಇತ್ತೀಚಿನ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಉಲ್ಲೇಖಿಸಬಹುದು
3. ಹೊಸ ನಿಯೋಜನೆಗಳಿಗೆ ಮತ್ತು ಇತ್ತೀಚಿನ ಮೂಲಸೌಕರ್ಯಗಳೊಡನೆ azd ಉಪಯೋಗಿಸಬಹುದು

ವಿವರಗಳಿಗೆ [সংರಚನಾ ಮಾರ್ಗದರ್ಶಿ](configuration.md) ನೋಡಿ.
</details>

<details>
<summary><strong>azd ಅಜೂರ್ ಗವರ್ನಮೆಂಟ್ ಅಥವಾ ಅಜೂರ್ ಚೈನಾದೊಂದಿಗೆ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆಯೇ?</strong></summary>

ಹೌದು, ಕ್ಲೌಡ್ ಅನ್ನು ಸಂರಚಿಸಿ:
```bash
# ಅಜ್ಯೂರ್ ಸರ್ಕಾರ
az cloud set --name AzureUSGovernment
az login

# ಅಜ್ಯೂರ್ ಚೀನಾ
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>ನಾನು azd ಅನ್ನು CI/CD ಪೈಪ್‌ಲೈನ್‌ಗಳಲ್ಲಿ ಬಳಸಬಹುದೇ?</strong></summary>

ಖಂಡಿತ! azd ಸ್ವಯಂಚಾಲಿತಕ್ಕಾಗಿ ವಿನ್ಯಾಸಗೊಳಿಸಲಾಗಿದೆ:
- GitHub Actions ಏಕರೂಪತೆ
- ಅಜೂರ್ ಡೆವ್ಓಪ್ಸ್ ಬೆಂಬಲ
- ಸರ್ವಿಸ್ ಪ್ರಿನ್ಸಿಪಲ್ authentication
- ಅಸಂಬಂಧಿತ ಮೋಡ್

CI/CD ಮಾದರಿಗಳಿಗಾಗಿ [Deploy Guide](../chapter-04-infrastructure/deployment-guide.md) ನೋಡಿ.
</details>

<details>
<summary><strong>azd ಬಳಕೆಯ ವೆಚ್ಚ ಏನು?</strong></summary>

azd ತಾನೇ **ಪೂರ್ಣವಾಗಿ ಉಚಿತ** ಮತ್ತು ಓಪನ್ ಸೋರ್ಸ್. ನೀವು ಕೇವಲ ಪಾವತಿಸುವುದು:
- ನೀವು ನಿಯೋಜಿಸುವ ಅಜೂರ್ ಸಂಪನ್ಮೂಲಗಳು
- ಅಜೂರ್ ಬಳಕೆ ವೆಚ್ಚಗಳು (ಕಂಪ್ಯೂಟ್, ಸಂಗ್ರಹಣೆ, ಇತ್ಯಾದಿ)

ನಿಯೋಜನೆಯ ಮೊದಲು ವೆಚ್ಚ ಅಂದಾಜು ಮಾಡಲು `azd provision --preview` ಬಳಸಿರಿ.
</details>

## ಮುಂದಿನ ಹಂತಗಳು

1. **authentication ಪೂರೈಸಿ**: ನಿಮ್ಮ ಅಜೂರ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್‌ಗೆ ಪ್ರವೇಶ ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ
2. **ಮೊದಲ ನಿಯೋಜನೆ ಪ್ರಯತ್ನಿಸಿ**: [ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್ ಮಾರ್ಗದರ್ಶಿ](first-project.md) ಅನುಸರಿಸಿ
3. **ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಅನ್ವೇಷಿಸಿ**: ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು `azd template list` ಮೂಲಕ ಬ್ರೌಸ್ ಮಾಡಿ
4. **ನಿಮ್ಮ IDE ಸಾಧನಗಳನ್ನು ಸಂರಚಿಸಿ**: ನಿಮ್ಮ ಅಭಿವೃದ್ಧಿ ವಾತಾವರಣವನ್ನು ಸಿದ್ಧಪಡಿಸಿ

## ಸಹಾಯಕತೆ

ನೀವು ಸಮಸ್ಯೆಗಳನ್ನು ಎದುರಿಸಿದರೆ:
- [ಅಧिकारिक ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ಸಮಸ್ಯೆಗಳನ್ನು ವರದಿ ಮಾಡಿ](https://github.com/Azure/azure-dev/issues)
- [ಸಮುದಾಯ ಚರ್ಚೆಗಳು](https://github.com/Azure/azure-dev/discussions)
- [ಅಜೂರ್ ಬೆಂಬಲ](https://azure.microsoft.com/support/)
- [**ಅಜೂರ್ ಎಜೆಂಟ್ ನಿಪುಣತೆಗಳು**](https://skills.sh/microsoft/github-copilot-for-azure) - ನಿಮ್ಮ ಸಂಪಾದಕದಲ್ಲಿ ನೇರವಾಗಿ azd ಆದೇಶ ಮಾರ್ಗದರ್ಶನ ಪಡೆಯಿರಿ `npx skills add microsoft/github-copilot-for-azure` ಮೂಲಕ

---

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆಜಿಡಿ ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 1 - ಆಧಾರ & ವೇಗದ ಪ್ರಾರಂಭ
- **⬅️ ಹಿಂದಿನದು**: [ಆಜಿಡಿ ಬೆಸಿಕ್ಸ್](azd-basics.md)
- **➡️ ಮುಂದಿನದು**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 2: AI-ಮೊದಲ ಅಭಿವೃದ್ಧಿ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ಸ್ಥಾಪನೆ ಪೂರ್ಣವಾಗಿದೆ!** azd ಬಳಸಿ ನಿರ್ಮಾಣ ಪ್ರಾರಂಭಿಸಲು [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md) ಗೆ ಮುಂದಾಗಿ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ತ್ಯಾಗಪತ್ರ**:
ಈ ದಸ್ತಾವೇಜು AI ಭಾಷಾಂತರ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಭಾಷಾಂತರಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯ ಪ್ರಯತ್ನ ಮಾಡುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಭಾಷಾಂತರಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸತ್ಯತೆಗಳು ಇರಬಹುದು ಎಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಷೆಯ ದಸ್ತಾವೇಜೇ ಸರ್ವೋತ್ತಮ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಮಹತ್ವಪೂರ್ಣ ಮಾಹಿತಿ కోసం ವೃತ್ತಿಪರ ಮಾನವ ಭಾಷಾಂತರವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತಿದೆ. ಈ ಭಾಷಾಂತರ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಗ್ರಹಿಕೆಗಳು ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಜವಾಬ್ದಾರಿಯಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->