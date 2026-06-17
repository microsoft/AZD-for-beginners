# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮಾರ್ಗದರ್ಶಿ - AZD ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳಲ್ಲಿ ನಿಪುಣತೆ

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಆರಂಭಿಕರಿಗಾಗಿ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 4 - ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಕೋಡ್ ಆಗಿ ಮತ್ತು ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಕಾನ್ಫಿಗರೇಶನ್](../chapter-03-configuration/configuration.md)
- **➡️ ಮುಂದಿನದು**: [ಸಂಪನ್ಮೂಲಗಳ ಪ್ರೊವಿಷನಿಂಗ್](provisioning.md)
- **🧩 ಈ ಅಧ್ಯಾಯದಲ್ಲೂ ಇದೆ**: [ನಿಮ್ಮ ಸ್ವಂತ ಟೆಂಪ್ಲೇಟ್ ರಚಿಸುವುದು](custom-templates.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 5: ಮಲ್ಟಿ-ಎಜೆಂಟ್ AI ಪರಿಹಾರಗಳು](../../examples/retail-scenario.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI ಬಳಸಿ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಬಗ್ಗೆ ನಿಮಗೆ ಬೇಕಾಗುವ ಎಲ್ಲಾ ವಿಷಯಗಳನ್ನು ಒಳಗೊಂಡಿದೆ — ಮೂಲ ಒಂದೇ ಆದೇಶದ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟಿನಿಂದ ಪ್ರಾರಂಭಿಸಿ, ಕಸ್ಟಮ್ ಹುಕ್‌ಗಳು, ಬಹು ಪರಿಸರಗಳು ಮತ್ತು CI/CD ಏಕೀಕರಣದೊಂದಿಗೆ ಉನ್ನತ ಉತ್ಪಾದನಾ ಪರિસ್ಥಿತಿಗಳಿಂದ ಮುಕ್ತಾಯವಾಗುವವರೆಗೆ. ವ್ಯವಹಾರಿಕ ಉದಾಹರಣೆಗಳು ಮತ್ತು ಅತ್ಯುತ್ತಮ ಅಭ್ಯಾಸಗಳೊಂದಿಗೆ ಸಂಪೂರ್ಣ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಆಯುಷ್ಯಚಕ್ರವನ್ನು ನಿಭಾಯಿಸುವಲ್ಲಿ ನಿಪುಣರಾಗಿರಿ.

## ಕಲಿಕೆ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ ನೀವು:
- ಎಲ್ಲಾ Azure Developer CLI ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಆದೇಶಗಳು ಮತ್ತು ವರ್ಕ್‌ಫ್ಲೋಗಳನ್ನು ನಿಪುಣವಾಗಿ ಬಳಸಲು ಸುಲಭವಾಗಿ ಕಲಿಯಿರಿ
- ಪ್ರೋವಿಷನಿಂಗ್‌ನಿಂದ ಮಾನಿಟರಿಂಗ್ ವರೆಗೆ ಸಂಪೂರ್ಣ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಆಯುಷ್ಯಚಕ್ರವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
- ಪೂರ್ವ ಮತ್ತು ನಂತರದ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸ್ವಯಮಕೃತಿಗಾಗಿ ಕಸ್ಟಮ್ ಡಿಪ್ಲಾಯ್ ಹುಕ್‌ಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
- ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಪರಿಮಾಪಕಗಳೊಂದಿಗೆ ಬಹು ಪರಿಸರಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ
- ಬ್ಲೂ-ಗ್ರೀನ್ ಮತ್ತು ಕ್ಯಾನರಿ ಸೇರಿದಂತೆ ಸುಧಾರಿತ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ತಂತ್ರಗಳನ್ನು ಸ್ಥಾಪಿಸಿ
- azd ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳನ್ನು CI/CD ಪೈಪ್‌ಲೈನ್ಗಳ ಮತ್ತು DevOps ವರ್ಕ್‌ಫ್ಲೋಗಳೊಂದಿಗೆ ಏಕೀಕರಿಸಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಸಾಮರ್ಥ್ಯವಿರುತ್ತೀರಿ:
- ಎಲ್ಲಾ azd ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ವರ್ಕ್‌ಫ್ಲೋಗಳನ್ನು ಸ್ವತಂತರಾಗಿ ನಿರ್ವಹಿಸಿ ಮತ್ತು ಸಮಸ್ಯೆಯನ್ನು ಪರಿಹರಿಸಿ
- ಹುಕ್‌ಗಳ ಬಳಕೆದೊಂದಿಗೆ ಕಸ್ಟಮ್ ಡಿಪ್ಲಾಯ್ ಸ್ವಯಂಪ್ರೇರಣೆಯನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಿ ಮತ್ತು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
- ಸೂಕ್ತ ಭದ್ರತೆ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಜೊತೆ ಉತ್ಪಾದನೆ-ಸಿದ್ಧ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ
- ಸಂಕೀರ್ಣ ಬಹು-ಪರಿಸರ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸಂದರ್ಭಗಳನ್ನು ನಿರ್ವಹಿಸಿ
- ಡಿಪ್ಲಾಯ್ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಶ್ರೇಷ್ಠಗೊಳಿಸಿ ಮತ್ತು ರೋಲ್ಬ್ಯಾಕ್ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
- ಎಂಟರ್ಪ್ರೈಸ್ DevOps ಅಭ್ಯಾಸಗಳಿಗೆ azd ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳನ್ನು ಏಕೀಕರಿಸಿ

## ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಅವಲೋಕನ

Azure Developer CLI ಹಲವು ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಆದೇಶಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ:
- `azd up` - ಸಂಪೂರ್ಣ ವರ್ಕ್‌ಫ್ಲೋ (ಪ್ರೋವಿಷನ್ + ಡಿಪ್ಲಾಯ್)
- `azd provision` - ಕೇವಲ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸಿ/ನವೀಕರಿಸಿ
- `azd deploy` - ಕೇವಲ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
- `azd package` - ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಬಿಲ್ಡ್ ಮಾಡಿ ಮತ್ತು ಪ್ಯಾಕೇಜಿಂಗ್ ಮಾಡಿ

## ಮೂಲ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ವರ್ಕ್‌ಫ್ಲೋಗಳು

### Complete Deployment (azd up)
ಹೊಸ ಪ್ರಾಜೆಕ್ಟ್‌ಗಳಿಗಾಗಿ ಅತ್ಯಂತ ಸಾಮಾನ್ಯ ವರ್ಕ್‌ಫ್ಲೋ:
```bash
# ಆರಂಭದಿಂದ ಎಲ್ಲವನ್ನೂ ನಿಯೋಜಿಸಿ
azd up

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರದೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up --environment production

# ಕಸ್ಟಮ್ ನಿಯತಾಂಕಗಳೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
ನೀವು ಕೇವಲ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅಪ್ಪ್ಡೇಟ್ ಮಾಡಬೇಕಾದಾಗ:
```bash
# ಮೂಲಸೌಕರ್ಯವನ್ನು ಒದಗಿಸಿ/ನವೀಕರಿಸಿ
azd provision

# ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವವೀಕ್ಷಿಸಲು ಡ್ರೈ-ರನ್ ಮೂಲಕ ಒದಗಿಸಿ
azd provision --preview

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಗಳನ್ನು ಒದಗಿಸಿ
azd provision --service database
```

### Code-Only Deployment
ವೇಗದ ಅಪ್ಡೇಟ್‌ಗಳಿಗಾಗಿ:
```bash
# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ನೇರವೇರಿಸಿ
azd deploy

# ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್:
# ಸೇವೆಗಳನ್ನು ನೇರವೇರಲಾಗುತ್ತಿದೆ (azd deploy)
# - web: ನೇರವೇರಿಸಲಾಗುತ್ತಿದೆ... ಪೂರ್ಣಗೊಂಡಿದೆ
# - api: ನೇರವೇರಿಸಲಾಗುತ್ತಿದೆ... ಪೂರ್ಣಗೊಂಡಿದೆ
# ಸಫಲತೆ: ನಿಮ್ಮ ನಿಯೋಜನೆ 2 ನಿಮಿಷ 15 ಸೆಕೆಂಡುಗಳಲ್ಲಿ ಪೂರ್ಣಗೊಂಡಿತು

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನೇರವೇರಿಸಿ
azd deploy --service web
azd deploy --service api

# ಕಸ್ಟಮ್ ನಿರ್ಮಾಣ ಆರ್ಗ್ಯುಮೆಂಟ್‌ಗಳೊಂದಿಗೆ ನೇರವೇರಿಸಿ
azd deploy --service api --build-arg NODE_ENV=production

# ನಿಯೋಜನವನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json | jq '.services'
```

### ✅ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಪರಿಶೀಲನೆ

ಯಾವುದೇ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ನಂತರ, ಯಶಸ್ಸು ಪರಿಶೀಲಿಸಿ:

```bash
# ಎಲ್ಲಾ ಸೇವೆಗಳು ಚಾಲನೆಯಲ್ಲಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
azd show

# ಆರೋಗ್ಯ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ದೋಷಗಳಿಗಾಗಿ ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ (ಡೀಫಾಲ್ಟ್‌ವಾಗಿ ಬ್ರೌಸರ್‌ನಲ್ಲಿ ತೆರೆಯುತ್ತದೆ)
azd monitor --logs
```

**ಯಶಸ್ಸಿನ ನಿರ್ಣಾಯಕಗಳು:**
- ✅ ಎಲ್ಲಾ ಸೇವೆಗಳು "Running" ಸ್ಥಿತಿಯನ್ನು ತೋರಿಸಬೇಕು
- ✅ ಆರೋಗ್ಯ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು HTTP 200 ಅನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತವೆ
- ✅ ಕೊನೆಯ 5 ನಿಮಿಷಗಳಲ್ಲಿ ಯಾವುದೇ ದೋಷ ಲಾಗ್‌ಗಳು ಇರಬಾರದು
- ✅ ಅಪ್ಲಿಕೇಶನ್ ಪರೀಕ್ಷಾ ವಿನಂತಿಗಳಿಗೆ ಪ್ರತಿಕ್ರಿಯಿಸುತ್ತದೆ

## 🏗️ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವದು

### ಹುಕ್‌ಗಳಿಗೆ ಹೊಸವೀರಾ? ಇಲ್ಲಿ ಪ್ರಾರಂಭಿಸಿ

ಒಂದು **ಹುಕ್** ಅಂದರೆ azd ಡಿಪ್ಲಾಯ್ ಪ್ರಕ್ರಿಯೆಯ ನಿರ್ದಿಷ್ಟ ಸಂದರ್ಭದಲ್ಲಿ—ಪ್ರೋವಿಷನಿಂಗ್ ಮುನ್ನ ಅಥವಾ ನಂತರ, ಮತ್ತು ಕೋಡ್ ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಮುನ್ನ ಅಥವಾ ನಂತರ—ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಚಾಲನೆ ಮಾಡುವ ಆಜ್ಞೆ. ಇವು ಡಿಪ್ಲಾಯ್‌ಗೆ ಸುತ್ತಲೂ ಸದಾ ಇರುವ ಸಣ್ಣ ಕೆಲಸಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತಗೊಳಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತವೆ: ಡೇಟಾಬೇಸ್‌ಗೆ ಸೀಡಿಂಗ್ ಮಾಡುವುದು, ಮೈಗ್ರೇಶನ್ಗಳು ಚಲಿಸುವುದು, ಆಸ್ತಿಗಳನ್ನು ಬಿಲ್ಡ್ ಮಾಡುವುದು, ಅಥವಾ ಲೈವ್ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಸ್ಮೋಕ್-ಟೆಸ್ಟಿಂಗ್ ಮಾಡುವುದು.

| ಹುಕ್ | ಚಲಿಸುತ್ತದೆ… | ಸಾಮಾನ್ಯ ಬಳಕೆ |
|------|-------|------------|
| `preprovision` | ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸುವ ಮುನ್ನ | ಪೂರ್ವಾಪೇಕ್ಷತೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ, ರಜಿಸ್ಟ್ರಿಯಲ್ಲಿ ಲಾಗಿನ್ ಮಾಡಿ |
| `postprovision` | ಸಂಪನ್ಮೂಲಗಳು ಇದ್ದ ನಂತರ | ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸಂರಚಿಸಿ, ಡೇಟಾಬೇಸ್ ಅನ್ನು ಸೆಟ್‌ಅಪ್ ಮಾಡಿ |
| `predeploy` | ಕೋಡ್ ಡಿಪ್ಲಾಯ್ ಆಗುವುದಕ್ಕೆ ಮುನ್ನ | ಫ್ರಂಟ್-ಎಂಡ್ ಆಸ್ತಿ ಬಿಲ್ಡ್ ಮಾಡಿ, ಯುನಿಟ್ ಟೆಸ್ಟ್‌ಗಳನ್ನು ನಡೆಸಿ |
| `postdeploy` | ಕೋಡ್ ಲೈವ್ ಆದ ನಂತರ | DB ಮೈಗ್ರೇಶನ್ಗಳು ನಡೆಸಿ, ಎಂಡ್‌ಪಾಯಿಂಟ್‌ನ ಸ್ಮೋಕ್-ಟೆಸ್ಟ್ ನಡೆಸಿ |

ಹುಕ್‌ಗಳು ನಿಮ್ಮ `azure.yaml` ನಲ್ಲಿ ಬದುಕುತ್ತವೆ. ಇದು ಅತ್ಯಂತ ಚಿಕ್ಕ ಉದಾಹರಣೆ — ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಆನಂತರ ಒಂದು ಸಂದೇಶವನ್ನು ಮುದ್ರಿಸುತ್ತದೆ:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

ಅಷ್ಟೇ—ಮುಂದಿನ ಬಾರಿ ನೀವು `azd up` ಅನ್ನು ರನ್ ಮಾಡಿದಾಗ, ಸಂದೇಶ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಮುದ್ರಿಸುತ್ತದೆ. ಸಂಪೂರ್ಣ ಡಿಪ್ಲಾಯ್ ಇಲ್ಲದೆ ನಿಮ್ಮೆಲ್ಲಾ ಹೊಂದಿಕೆಗಳಿಗಾಗಿ ಮಾತ್ರವೂ ಒಂದು ಹುಕ್ ಅನ್ನು ನಿರ್ದಿಷ್ಟವಾಗಿ ಓಡಿಸಬಹುದು — ಇದು ಪರೀಕ್ಷೆಗಾಗಿ ಉತ್ತಮವಾಗಿದೆ:

```bash
azd hooks run postdeploy
```

ಕೆಳಗಿನ ಹಂತಗಳು ಪ್ರತಿ ಹಂತಕ್ಕೆ ನೈಜ-ವಲಯ ಹುಕ್‌ಗಳನ್ನು (ಮೈಗ್ರೇಶನ್ಗಳು, ಟೆಸ್ಟ್‌ಗಳು, ಮಾನ್ಯತೆ) ತೋರಿಸುತ್ತವೆ.

### ಹಂತ 1: ಪೂರ್ವ-ಪ್ರೋವಿಷನ್ ಹುಕ್ಸ್
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### ಹಂತ 2: ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪ್ರೋವಿಷನಿಂಗ್
- ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಓದುತ್ತದೆ (Bicep/Terraform)
- Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸುತ್ತದೆ ಅಥವಾ ನವೀಕರಿಸುತ್ತದೆ
- ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಸುರಕ್ಷತೆಯನ್ನು ಸಂರಚಿಸುತ್ತದೆ
- ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಲಾಗಿಂಗ್ ಅನ್ನು ಸೆಟ್‌ಅಪ್ ಮಾಡುತ್ತದೆ

### ಹಂತ 3: ಪೋಸ್ಟ್-ಪ್ರೋವಿಷನ್ ಹುಕ್ಸ್
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### ಹಂತ 4: ಅಪ್ಲಿಕೇಶನ್ ಪ್ಯಾಕೇಜಿಂಗ್
- ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ಬಿಲ್ಡ್ ಮಾಡುತ್ತದೆ
- ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಆರ್ಟಿಫ್ಯಾಕ್ಟ್‌ಗಳನ್ನು ರಚಿಸುತ್ತದೆ
- ಗುರಿ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ (ಕಂಟೇನರ್‌ಗಳು, ZIP ಫೈಲ್‌ಗಳು, ಇತ್ಯಾದಿ)ಗಾಗಿ ಪ್ಯಾಕೇಜ್ ಮಾಡುತ್ತದೆ

### ಹಂತ 5: ಪೂರ್ವ-ಡಿಪ್ಲಾಯ್ ಹುಕ್ಸ್
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### ಹಂತ 6: ಅಪ್ಲಿಕೇಶನ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್
- ಪ್ಯಾಕೇಜ್ ಮಾಡಲಾದ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು Azure ಸೇವೆಗಳಿಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡುತ್ತದೆ
- ಕಾನ್ಫಿಗರೇಶನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನ обнов

- ಸರ್ವೀಸ್‌ಗಳನ್ನು ಪ್ರಾರಂಭ/ಮರುಪ್ರಾರಂಭ ಮಾಡುತ್ತದೆ

### ಹಂತ 7: ಪೋಸ್ಟ್-ಡಿಪ್ಲಾಯ್ ಹುಕ್ಸ್
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

### ಹುಕ್ ದೋಷಗಳನ್ನು ನಿರ್ವಹಿಸುವುದು

ಡೀಫಾಲ್ಟ್‌ವಾಗಿ, **ಒಂದು ಹುಕ್ ಆಜ್ಞೆ ನಾನ್-ಜಿರೋ ಕೋಡ್ೊಂದಿಗೆ ನಿರ್ಗಮಿಸಿದರೆ, azd ಸಂಪೂರ್ಣ ಕಾರ್ಯಾಚರಣೆಯನ್ನು ನಿಲ್ಲಿಸುತ್ತದೆ.** ಇದು ಸಾಮಾನ್ಯವಾಗಿ ನೀವು ಬಯಸುವೇನೆಂದರೆ — ವೈಫಲ್ಯ ಹೊಂದಿರುವ ಮೈಗ್ರೇಶನ್ ಡಿಪ್ಲಾಯ್ ನಿಲ್ಲಿಸಬೇಕು, ಹಾಳು ಆಪ್ ಬಿಡಬೇಕು ಅಲ್ಲ. ಆದರೆ ಇದರಿಂದ ಹುಕ್‌ಗಳನ್ನು ಸಾವಧಾನವಾಗಿ ಬರೆಯಬೇಕಾಗುತ್ತದೆ.

**1. ವೈಫಲ್ಯಗಳನ್ನು ಗಟ್ಟಿಯಾಗಿ ಮತ್ತು ಉದ್ದೇಶಪೂರಕವಾಗಿರಿಸಿರಿ.** ಹುಕ್‌ನ ಕೊನೆಯ ಆಜ್ಞೆ ನಾನ್-ಜಿರೋ ಎಕ್ಸಿಟ್‌ ಕೋಡ್ ನೀಡಿದಾಗ ಹುಕ್ ವೈಫಲ್ಯಗೊಳ್ಳುತ್ತದೆ. ಶೆಲ್ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳಲ್ಲಿ, ಮೊದಲ ವೈಫಲ್ಯ ಆದ ಆಜ್ಞೆ ನೋಡದೆ ಮುಂದುವರಿಯದಂತೆ `set -e` ಅನ್ನು ಸೇರಿಸಿ:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. azd ನನ್ನು ನಿಲ್ಲಿಸದೆ ಹುಕ್ ವಿಫಲವಾಗುವಂತೆ ಅವಕಾಶಕೊಡಿ.** ಆವಶ್ಯಕವಲ್ಲದ ಹಂತಗಳಿಗಾಗಿ (ಐಚ್ಛಿಕ ಕ್ಯಾಶೆ ವಾರ್ಮ್-ಅಪ್, ಉದ್ದೇಶಾತ್ಮಕ ಸೂಚನೆ), `continueOnError: true` ಅನ್ನು ಸೆಟ್ ಮಾಡಿ. azd ವಿಫಲತೆಯನ್ನು ಲಾಗ್ ಮಾಡುತ್ತದೆ ಆದರೆ ಮುಂದುವರೆಯುತ್ತದೆ:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. ಪೂರ್ಣ ಓಡಾಟಕ್ಕೂ ಮುನ್ನ ಒಂಟಿ ಹುಕ್‌ಗಳನ್ನು ಪ್ರತ್ಯೇಕವಾಗಿ ಪರೀಕ್ಷಿಸಿ.** ಹುಕ್ ಡಿಬಗ್ ಮಾಡಲು ನೀವು `azd up` ಅನ್ನು ಓಡಿಸುವ ಅವಶ್ಯಕತೆ ಇಲ್ಲ — ಅದು ಒಂದೇಡಾಗಿ ಓಡಿಸಿ ಮತ್ತು ತ್ವರಿತವಾಗಿ ಪುನರಾವರ್ತು:

```bash
azd hooks run predeploy          # ಕೇವಲ predeploy ಹುಕ್ ಅನ್ನು ನಡೆಸುತ್ತದೆ
azd hooks run postdeploy --service api
```

**4. OS-ವಿಶಿಷ್ಟ ಶೆಲ್‌ಗಳಿಗಾಗಿ ಗಮನವಿಡಿ.** `shell: pwsh` ಬಳಸುವ ಹುಕ್‌ಗೆ ಆ ಯಂತ್ರದಲ್ಲಿ PowerShell ಇನ್‌ಸ್ಟಾಲ್ ಆಗಿರಬೇಕು (CI ಏಜೆಂಟ್‌ಗಳು ಸಹ). ಹೆಚ್ಚಿನ ಪೋರ್ಟಬಿಲಿಟಿಗೆ `shell: sh` ಅನ್ನು ಉಪಯೋಗಿಸಿ, ಅಥವಾ `windows` ಮತ್ತು `posix` ವಿಭಿನ್ನ ರೂಪಗಳನ್ನು ಒದಗಿಸಿ:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **ಡಿಬಗ್ ಟಿಪ್:** ಯಾವುದಾದರೂ azd ಆದೇಶವನ್ನು `--debug` ಜೊತೆ ಓಡಿಸಿ, ಅದು ನಿಖರ ಹುಕ್ ಕಮಾಂಡ್ ಲೈನ್ ಮತ್ತು ಅದರ ಸಂಪೂರ್ಣ ಔಟ್‌ಪುಟ್ ಅನ್ನು ತೋರಿಸುತ್ತದೆ—ಹುಕ್ ಸ್ಥಳೀಯವಾಗಿ ಕೆಲಸ ಮಾಡುತ್ತಿದ್ದರೂ CI ನಲ್ಲಿ ವಿಫಲವಾದಾಗ ಇದು ಅಮೂಲ್ಯವಾಗಿದೆ.

## 🎛️ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸಂರಚನೆ

### ಸೇವಾ-ನಿರ್ದಿಷ್ಟ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಸಂರಚನೆಗಳು
```bash
# ಅಭಿವೃದ್ಧಿ ಪರಿಸರ
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರ
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ಉತ್ಪಾದನಾ ಪರಿಸರ
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 ಸುಧಾರಿತ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸಂದರ್ಭಗಳು

### ಬಹು-ಸೇವಾ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### ಬ್ಲೂ-ಗ್ರೀನ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳು
```bash
# ನೀಲ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new production-blue
azd up --environment production-blue

# ನೀಲ ಪರಿಸರವನ್ನು ಪರೀಕ್ಷಿಸಿ
./scripts/test-environment.sh production-blue

# ಟ್ರಾಫಿಕ್ ಅನ್ನು ನೀಲಕ್ಕೆ ಸ್ಥಳಾಂತರಿಸಿ (ಹಸ್ತಚಾಲಿತ DNS/ಲೋಡ್ ಬ್ಯಾಲನ್ಸರ್ ನವೀಕರಣ)
./scripts/switch-traffic.sh production-blue

# ಹಸಿರು ಪರಿಸರವನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd env select production-green
azd down --force
```

### ಕ್ಯಾನರಿ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳು
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### ಹಂತಬದ್ಧ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳು
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 ಕಂಟೈನರ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳು

### కಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಡಿಪ್ಲಾಯ్‌ಮೆಂಟ್‌ಗಳು
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### ಬಹು-ಹಂತ Dockerfile ಅನ್ವಯಿಕರಣ
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ ಪ್ರದರ್ಶನ ಸುಧಾರಣೆ

### ಸೇವಾ-ನಿರ್ದಿಷ್ಟ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳು
```bash
# ತ್ವರಿತ ಪುನರಾವೃತ್ತಿಗಾಗಿ ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd deploy --service web
azd deploy --service api

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ಸ್ಥಾಪಿಸಿ
azd deploy
```

### ಬಿಲ್ಡ್ ಕ್ಯಾಶ್‌ಯಿಂಗ್
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### ಪರಿಣಾಮಕಾರಿ ಕೋಡ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳು
```bash
# ಕೋಡ್‌ ಮಾತ್ರದ ಬದಲಾವಣೆಗಳಿಗೆ azd deploy (azd up ಅಲ್ಲ) ಅನ್ನು ಬಳಸಿ
# ಇದು ಮೂಲಸೌಕರ್ಯ ಒದಗಿಸುವಿಕೆಯನ್ನು ಬಿಟ್ಟುಹೋಗುತ್ತದೆ ಮತ್ತು ಬಹಳವೇ ವೇಗವಾಗಿ ನಡೆಯುತ್ತದೆ
azd deploy

# ತ್ವರಿತ ಪುನರಾವೃತ್ತಿಗಾಗಿ ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd deploy --service api
```

## 🔍 ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮಾನಿಟರಿಂಗ್

###实时 ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮಾನಿಟರಿಂಗ್
```bash
# ರಿಯಲ್-ಟೈಮ್‌ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಗಾ ವಹಿಸಿ
azd monitor --live

# ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs

# ಅಳವಡಿಕೆಯ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show
```

### ಆರೋಗ್ಯ ಪರೀಕ್ಷೆಗಳು
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### ಪೋಸ್ಟ್-ಡಿಪ್ಲಾಯ್ ಮಾನ್ಯತೆ
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# ಅಪ್ಲಿಕೇಶನ್ ಆರೋಗ್ಯ ಪರಿಶೀಲಿಸಿ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 ಭದ್ರತಾ ಪರಿಗಣನೆಗಳು

### ರಹಸ್ಸು ನಿರ್ವಹಣೆ
```bash
# ರಹಸ್ಯಗಳನ್ನು ಸುರಕ್ಷಿತವಾಗಿ ಸಂಗ್ರಹಿಸಿ
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml ನಲ್ಲಿ ರಹಸ್ಯಗಳನ್ನು ಉಲ್ಲೇಖಿಸಿ
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### ನೆಟ್ವರ್ಕ್ ಸುರಕ್ಷತೆ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ಐಡೆಂಟಿಟಿ ಮತ್ತು ಪ್ರವೇಶ ನಿರ್ವಹಣೆ
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 ರೋಲ್ಬ್ಯಾಕ್ ತಂತ್ರಗಳು

### ತ್ವರಿತ ರೋಲ್ಬ್ಯಾಕ್
```bash
# AZDಗೆ ಒಳಗೊಂಡಿರುವ ರೋಲ್ಬ್ಯಾಕ್ ಸೌಲಭ್ಯವಿಲ್ಲ. ಶಿಫಾರಸು ಮಾಡಲ್ಪಟ್ಟ ವಿಧಾನಗಳು:

# ಆಯ್ಕೆ 1: Gitರಿಂದ ಮರುನಿಯೋಜನೆ (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)
git revert HEAD  # ಸಮಸ್ಯೆ ಉಂಟುಮಾಡಿದ ಕಮಿಟ್ ಅನ್ನು ಹಿಂಪಡೆಯಿರಿ
git push
azd deploy

# ಆಯ್ಕೆ 2: ನಿರ್ದಿಷ್ಟ ಕಮಿಟ್ ಅನ್ನು ಮರುನಿಯೋಜನೆ ಮಾಡಿ
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ರೋಲ್ಬ್ಯಾಕ್
```bash
# ಅನ್ವಯಿಸುವ ಮೊದಲು ಮೂಲಸೌಕರ್ಯದ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವದೃಶ್ಯಗೊಳಿಸಿ
azd provision --preview

# ಮೂಲಸೌಕರ್ಯವನ್ನು ರೋಲ್ಬ್ಯಾಕ್ ಮಾಡಲು, ವರ್ಸನ್ ಕಂಟ್ರೋಲ್ ಬಳಸಿ:
git revert HEAD  # ಮೂಲಸೌಕರ್ಯದ ಬದಲಾವಣೆಗಳನ್ನು ಹಿಂದಿರುಗಿಸಿ
azd provision    # ಹಿಂದಿನ ಮೂಲಸೌಕರ್ಯದ ಸ್ಥಿತಿಯನ್ನು ಅನ್ವಯಿಸಿ
```

### ಡೇಟಾಬೇಸ್ ಮೈಗ್ರೇಶನ್ ರೋಲ್ಬ್ಯಾಕ್
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮೆಟ್ರಿಕ್ಸ್

### ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ
```bash
# ಪ್ರಸ್ತುತ ನಿಯೋಜನೆಯ ಸ್ಥಿತಿಯನ್ನು ವೀಕ್ಷಿಸಿ
azd show

# Application Insights ಬಳಸಿ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಗಾ ಮಾಡಿ
azd monitor --overview

# ಸಜೀವ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --live
```

### ಕಸ್ಟಮ್ ಮೆಟ್ರಿಕ್ಸ್ ಸಂಗ್ರಹಣೆ
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 ಅತ್ಯುತ್ತಮ ಅಭ್ಯಾಸಗಳು

### 1. ಪರಿಸರ ಸಮ್ಮಿಲನ
```bash
# ಎಲ್ಲೆಡೆ ಒಂದೇ ರೀತಿಯ ಹೆಸರನ್ನು ಬಳಸಿ
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ವಾತಾವರಣಗಳ ಸಮಾನತೆ ಕಾಪಾಡಿ
./scripts/sync-environments.sh
```

### 2. ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಮಾನ್ಯತೆ
```bash
# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗೂ ಮುನ್ನ ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವವೀಕ್ಷಿಸಿ
azd provision --preview

# ARM/Bicep ಲಿಂಟಿಂಗ್ ಅನ್ನು ಬಳಸಿ
az bicep lint --file infra/main.bicep

# Bicep ವಾಕ್ಯರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az bicep build --file infra/main.bicep
```

### 3. ಪರೀಕ್ಷಾ ಏಕೀಕರಣ
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ಮತ್ತು ಲಾಗಿಂಗ್
```bash
# ಸ್ಥಾಪನೆ ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ದಾಖಲಿಸಿ
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ಮುಂದಿನ ಹಂತಗಳು

- [ಸಂಪನ್ಮೂಲಗಳ ಪ್ರೊವಿಷನಿಂಗ್](provisioning.md) - ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ನಿರ್ವಹಣೆಯ ಬಗ್ಗೆ ಆಳವಾದ ಅಧ್ಯಯನ
- [ಪ್ರಿ-ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md) - ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ತಂತ್ರವನ್ನು ಯೋಜಿಸು
- [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](../chapter-07-troubleshooting/common-issues.md) - ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸಿ
- [ಅತ್ಯುತ್ತಮ ಅಭ್ಯಾಸಗಳು](../chapter-07-troubleshooting/debugging.md) - ಉತ್ಪಾದನೆ-ಸಿದ್ಧ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ತಂತ್ರಗಳು

## 🎯 ಪ್ರಾಯೋಗಿಕ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಅಭ್ಯಾಸಗಳು

### ಅಭ್ಯಾಸ 1: ಇನ್ಕ್ರಿಮೆಂಟಲ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ವರ್ಕ್‌ಫ್ಲೋ (20 ನಿಮಿಷ)
**ಗುರಿ**: ಪೂರ್ಣ ಮತ್ತು ಇನ್ಕ್ರಿಮೆಂಟಲ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳ ನಡುವೆ ಇರುವ ವ್ಯತ್ಯಾಸವನ್ನು ನಿಪುಣರಾಗಿರಿ

```bash
# ಆರಂಭಿಕ ನಿಯೋಜನೆ
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ಆರಂಭಿಕ ನಿಯೋಜನೆಯ ಸಮಯವನ್ನು ದಾಖಲಿಸಿ
echo "Full deployment: $(date)" > deployment-log.txt

# ಕೋಡ್‌ನಲ್ಲಿ ಬದಲಾವಣೆ ಮಾಡಿ
echo "// Updated $(date)" >> src/api/src/server.js

# ಕೇವಲ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ (ತ್ವರಿತ)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# ಸಮಯಗಳನ್ನು ಹೋಲಿಸಿ
cat deployment-log.txt

# ಶುದ್ಧೀಕರಿಸಿ
azd down --force --purge
```

**ಯಶಸ್ಸಿನ ನಿರ್ಣायकಗಳು:**
- [ ] ಪೂರ್ಣ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ 5-15 ನಿಮಿಷ ತೆಗೆದುಕೊಳ್ಳುತ್ತದೆ
- [ ] ಕೋಡ್-ಮಾತ್ರ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ 2-5 ನಿಮಿಷ ತೆಗೆದುಕೊಳ್ಳುತ್ತದೆ
- [ ] ಡಿಪ್ಲಾಯ್ ಆಗಿರುವ ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ಕೋಡ್ ಬದಲಾವಣೆಗಳು ಪ್ರತಿಬಿಂಬಿಸುತ್ತವೆ
- [ ] `azd deploy` ನಂತರ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅಪ್ರಭಾವಿತವಾಗಿರುತ್ತದೆ

**ಕಲಿಕೆಯ ಫಲಿತಾಂಶ**: ಕೋಡ್ ಬದಲಾವಣೆಗಳಿಗೆ `azd deploy` `azd up`ಗಿಂತ 50-70% ವೇಗವಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ

### ಅಭ್ಯಾಸ 2: ಕಸ್ಟಮ್ ಡಿಪ್ಲಾಯ್ ಹುಕ್‌ಗಳು (30 ನಿಮಿಷ)
**ಗುರಿ**: ಪೂರ್ವ ಮತ್ತು ನಂತರದ ಡಿಪ್ಲಾಯ್ ಸ್ವಯಂಪ್ರೇರಣೆಯನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ

```bash
# ಪ್ರಿ-ಡಿಪ್ಲಾಯ್ ಮಾನ್ಯತಾ ಸ್ಕ್ರಿಪ್ಟ್ ರಚಿಸಿ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ಟೆಸ್ಟ್‌ಗಳು ಉತ್ತೀರ್ಣವಾಗುತ್ತವೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# ಕಮಿಟ್ಡ್ ಆಗದ ಬದಲಾವಣೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# ಡಿಪ್ಲಾಯ್ ನಂತರದ ಸ್ಮೋಕ್ ಟೆಸ್ಟ್ ರಚಿಸಿ
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# azure.yaml ಗೆ ಹೂಕ್‌ಗಳನ್ನು ಸೇರಿಸಿ
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ಹೂಕ್‌ಗಳೊಂದಿಗೆ ನಿಯೋಜನೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
azd deploy
```

**ಯಶಸ್ಸಿನ ನಿರ್ಣಾಯಕಗಳು:**
- [ ] ಪೂರ್ವ-ಡಿಪ್ಲಾಯ್ ಸ್ಕ್ರಿಪ್ಟ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಿಂತ ಮೊದಲು ಓಡುತ್ತದೆ
- [ ] ಟೆಸ್ಟ್‌ಗಳು ವಿಫಲವಾದರೆ ಡಿಪ್ಲಾಯ್ ನಿಲ್ಲುತ್ತದೆ
- [ ] ಪೋಸ್ಟ್-ಡಿಪ್ಲಾಯ್ ಸ್ಮೋಕ್ ಟೆಸ್ಟ್ ಆರೋಗ್ಯವನ್ನು ಮಾನ್ಯಗೊಳಿಸುತ್ತದೆ
- [ ] ಹುಕ್‌ಗಳು ಸರಿಯಾದ ಕ್ರಮದಲ್ಲಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತವೆ

### ಅಭ್ಯಾಸ 3: ಬಹು-ಪರಿಸರ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ತಂತ್ರ (45 ನಿಮಿಷ)
**ಗುರಿ**: ಹಂತಬದ್ಧ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ವರ್ಕ್‌ಫ್ಲೋ ಅನ್ನು (dev → staging → production) ಅನುಷ್ಠಾನಗೊಳಿಸಿ

```bash
# ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಸ್ಕ್ರಿಪ್ಟ್ ರಚಿಸಿ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ಹಂತ 1: ಡೆವ್‌ಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ಹಂತ 2: ಸ್ಟೇಜಿಂಗ್‌ಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ಹಂತ 3: ಉತ್ಪಾದನೆಗಾಗಿ ಕೈಯಿಂದ ಅನುಮೋದನೆ
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# ಪರಿಸರಗಳನ್ನು ರಚಿಸಿ
azd env new dev
azd env new staging
azd env new production

# ಹಂತಗತ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಅನ್ನು ಚಾಲನೆಗೊಳಿಸಿ
./deploy-staged.sh
```

**ಯಶಸ್ಸಿನ ನಿರ್ಣಾಯಕಗಳು:**
- [ ] Dev ಪರಿಸರ ಯಶಸ್ವಿಯಾಗಿ ಡಿಪ್ಲಾಯ್ ಆಗುತ್ತದೆ
- [ ] Staging ಪರಿಸರ ಯಶಸ್ವಿಯಾಗಿ ಡिप್ಲಾಯ್ ಆಗುತ್ತದೆ
- [ ] ಉತ್ಪಾದನೆಗಾಗಿ ಕೈಯಚ್ಚಿಕೆ ಅಗತ್ಯವಿದೆ
- [ ] ಎಲ್ಲಾ ಪರಿಸರಗಳಲ್ಲಿ ಕೆಲಸಮಾಡುವ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳಿವೆ
- [ ] ಅವಶ್ಯಕತೆ ಇದ್ದರೆ ರೋಲ್ಬ್ಯಾಕ್ ಮಾಡಬಹುದಾಗಿದೆ

### ಅಭ್ಯಾಸ 4: ರೋಲ್ಬ್ಯಾಕ್ ತಂತ್ರ (25 ನಿಮಿಷ)
**ಗುರಿ**: Git ಬಳಸಿ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ರೋಲ್ಬ್ಯಾಕ್ ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ ಮತ್ತು ಪರೀಕ್ಷಿಸಿ

```bash
# v1 ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd env set APP_VERSION "1.0.0"
azd up

# v1 ಕಮಿಟ್ ಹ್ಯಾಶ್ ಅನ್ನು ಉಳಿಸಿ
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# v2 ಅನ್ನು ಬ್ರೇಕಿಂಗ್ ಬದಲಾವಣೆಯೊಂದಿಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ವಿಫಲತೆಯನ್ನು ಪತ್ತೆಹಚ್ಚಿ ಮತ್ತು ರೋಲ್‌ಬ್ಯಾಕ್ ಮಾಡಿ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ಬಳಸಿ ರೋಲ್‌ಬ್ಯಾಕ್ ಮಾಡಿ
    git revert HEAD --no-edit
    
    # ಪರಿಸರವನ್ನು ರೋಲ್‌ಬ್ಯಾಕ್ ಮಾಡಿ
    azd env set APP_VERSION "1.0.0"
    
    # v1 ಅನ್ನು ಮರುಡಿಪ್ಲಾಯ್ ಮಾಡಿ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**ಯಶಸ್ಸಿನ ನಿರ್ಣಾಯಕಗಳು:**
- [ ] ಡಿಪ್ಲಾಯ್ ವೈಫಲ್ಯಗಳನ್ನು ಪತ್ತೆಮಾಡಬಹುದು
- [ ] ರೋಲ್ಬ್ಯಾಕ್ ಸ್ಕ್ರಿಪ್ಟ್ ಸ್ವಯಂಕ್ರಿಯವಾಗಿ ಚಾಲನೆ ಆಗುತ್ತದೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಕಾರ್ಯನಿರತ ಸ್ಥಿತಿಗೆ ಹಿಂದಿರುಗುತ್ತದೆ
- [ ] ರೋಲ್ಬ್ಯಾಕ್ ನಂತರ ಆರೋಗ್ಯ ಪರೀಕ್ಷೆಗಳು ಪಾಸಾಗುತ್ತವೆ

## 📊 ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮೆಟ್ರಿಕ್ಸ್ ಟ್ರ್ಯಾಕಿಂಗ್

### ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ

```bash
# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮೆಟ್ರಿಕ್ಸ್ ಸ್ಕ್ರಿಪ್ಟ್ ರಚಿಸಿ
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# ಫೈಲಿಗೆ ಲಾಗ್ ಮಾಡಿ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ಇದನ್ನು ಬಳಸಿ
./track-deployment.sh
```

**ನಿಮ್ಮ ಮೆಟ್ರಿಕ್ಸ್ ಅನ್ನು ವಿಶ್ಲೇಷಿಸಿ:**
```bash
# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಇತಿಹಾಸವನ್ನು ವೀಕ್ಷಿಸಿ
cat deployment-metrics.csv

# ಸರಾಸರಿ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸಮಯವನ್ನು ಲೆಕ್ಕಿಸಿ
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ನಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](../chapter-01-foundation/first-project.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಸಂಪನ್ಮೂಲಗಳ ಪ್ರೊವಿಷನಿಂಗ್](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->