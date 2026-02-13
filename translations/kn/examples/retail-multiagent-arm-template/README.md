# ರಿಟೇಲ್ ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಪರಿಹಾರ - ಮೂಲಸೌಕರ್ಯ ಟೆಂಪ್ಲೇಟ್

**ಅಧ್ಯಾಯ 5: ಉತ್ಪಾದನಾ ನಿಯೋಜನೆ ಪ್ಯಾಕೇಜ್**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಪ್ರಾರಂಭಿಕರಿಗಾಗಿ](../../README.md)
- **📖 ಸಂಬಂಧಿತ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 5: ಮಲ್ಟಿ-ಏಜೆಂಟ್ AI ಪರಿಹಾರಗಳು](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 ಸನ್ನಿವೇಶ ಮಾರ್ಗದರ್ಶಿ**: [ಸಂಪೂರ್ಣ ಆರ್ಕಿಟೆಕ್ಚರ್](../retail-scenario.md)
- **🎯 ತ್ವರಿತ ನಿಯೋಜನೆ**: [ಒಂದು-ಕ್ಲಿಕ್ ನಿಯೋಜನೆ](../../../../examples/retail-multiagent-arm-template)

> **⚠️ ಕೇವಲ ಮೂಲಸೌಕರ್ಯ ಟೆಂಪ್ಲೇಟ್**  
> ಈ ARM ಟೆಂಪ್ಲೇಟ್ **ಏಜರ್ ಸಂಪತ್ತುಗಳನ್ನು** ಮಲ್ಟಿ-ಏಜೆಂಟ್ ವ್ಯವಸ್ಥೆಗೆ ನಿಯೋಜಿಸುತ್ತದೆ.  
>  
> **ನಿಯೋಜನೆಯಾಗುವವು (15-25 ನಿಮಿಷ):**
> - ✅ ಏಜರ್ OpenAI (GPT-4o, GPT-4o-mini, ಮೂರು ಪ್ರದೇಶಗಳಲ್ಲಿ ಎಂಬೆಡಿಂಗ್ಸ್)
> - ✅ AI ಶೋಧ ಸೇವೆ (ಖಾಲಿ, ಸೂಚಿ ರಚನೆಗೆ ಸಿದ್ಧ)
> - ✅ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು (ಪ್ಲೇಸ್‌ಹೋಲ್ಡರ್ ಇಮೇಜ್‌ಗಳು, ನಿಮ್ಮ ಕೋಡ್‌ಗೆ ಸಿದ್ಧ)
> - ✅ ಸ್ಟೋರೇಜ್, ಕೋಸ್ಮೋಸ್ DB, ಕೀ ವಾಲ್ಟ್, ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್
>  
> **ನಿಯೋಜನೆಯಲ್ಲಿರುವುದಿಲ್ಲ (ಅಭಿವೃದ್ಧಿ ಅಗತ್ಯವಿದೆ):**
> - ❌ ಏಜೆಂಟ್ ಅನುಷ್ಠಾನ ಕೋಡ್ (ಗ್ರಾಹಕ ಏಜೆಂಟ್, ಇನ್‌ವೆಂಟರಿ ಏಜೆಂಟ್)
> - ❌ ಮಾರ್ಗ ನಿರ್ವಹಣೆ ಲಾಜಿಕ್ ಮತ್ತು API ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು
> - ❌ ಮುಂಭಾಗ ಚಾಟ್ UI
> - ❌ ಶೋಧ ಸೂಚಿ ಸ್ಕೀಮಾ ಮತ್ತು ಡೇಟಾ ಪೈಪ್‌ಲೈನ್‌ಗಳು
> - ❌ **ಅಂದಾಜು ಅಭಿವೃದ್ಧಿ ಸಮಯ: 80-120 ಗಂಟೆಗಳು**
>  
> **ಈ ಟೆಂಪ್ಲೇಟ್ ಬಳಸಿರಿ:**
> - ✅ ನೀವು ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಯೋಜನೆಗೆ ಏಜರ್ ಮೂಲಸೌಕರ್ಯವನ್ನು ಒದಗಿಸಲು ಬಯಸಿದರೆ
> - ✅ ನೀವು ಏಜೆಂಟ್ ಅನುಷ್ಠಾನವನ್ನು ಪ್ರತ್ಯೇಕವಾಗಿ ಅಭಿವೃದ್ಧಿಪಡಿಸಲು ಯೋಜಿಸಿದರೆ
> - ✅ ನೀವು ಉತ್ಪಾದನಾ-ಸಿದ್ಧ ಮೂಲಸೌಕರ್ಯ ಆಧಾರವನ್ನು ಅಗತ್ಯವಿದ್ದರೆ
>  
> **ಬಳಸಬೇಡಿ:**
> - ❌ ನೀವು ತಕ್ಷಣವೇ ಕಾರ್ಯನಿರ್ವಹಿಸುವ ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಡೆಮೊ ನಿರೀಕ್ಷಿಸಿದರೆ
> - ❌ ನೀವು ಸಂಪೂರ್ಣ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಉದಾಹರಣೆಗಳನ್ನು ಹುಡುಕುತ್ತಿದ್ದರೆ

## ಅವಲೋಕನ

ಈ ಡೈರೆಕ್ಟರಿ ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಗ್ರಾಹಕ ಬೆಂಬಲ ವ್ಯವಸ್ಥೆಯ **ಮೂಲಸೌಕರ್ಯ ಆಧಾರವನ್ನು** ನಿಯೋಜಿಸಲು ಸಮಗ್ರ ಏಜರ್ ರಿಸೋರ್ಸ್ ಮ್ಯಾನೇಜರ್ (ARM) ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ಒಳಗೊಂಡಿದೆ. ಟೆಂಪ್ಲೇಟ್ ಎಲ್ಲಾ ಅಗತ್ಯ ಏಜರ್ ಸೇವೆಗಳನ್ನು ಸರಿಯಾಗಿ ಸಂರಚಿಸಿ ಮತ್ತು ಪರಸ್ಪರ ಸಂಪರ್ಕಿತವಾಗಿ ನಿಯೋಜಿಸುತ್ತದೆ, ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅಭಿವೃದ್ಧಿಗೆ ಸಿದ್ಧವಾಗಿದೆ.

**ನಿಯೋಜನೆಯ ನಂತರ, ನೀವು ಹೊಂದಿರುವುದು:** ಉತ್ಪಾದನಾ-ಸಿದ್ಧ ಏಜರ್ ಮೂಲಸೌಕರ್ಯ  
**ವ್ಯವಸ್ಥೆಯನ್ನು ಪೂರ್ಣಗೊಳಿಸಲು, ನೀವು ಅಗತ್ಯವಿರುವುದು:** ಏಜೆಂಟ್ ಕೋಡ್, ಮುಂಭಾಗದ UI, ಮತ್ತು ಡೇಟಾ ಸಂರಚನೆ (ನೋಡಿ [ಆರ್ಕಿಟೆಕ್ಚರ್ ಮಾರ್ಗದರ್ಶಿ](../retail-scenario.md))

## 🎯 ನಿಯೋಜನೆಯಾಗುವವು

### ಮೂಲಸೌಕರ್ಯ (ನಿಯೋಜನೆಯ ನಂತರದ ಸ್ಥಿತಿ)

✅ **ಏಜರ್ OpenAI ಸೇವೆಗಳು** (API ಕರೆಗಳಿಗೆ ಸಿದ್ಧ)
  - ಪ್ರಾಥಮಿಕ ಪ್ರದೇಶ: GPT-4o ನಿಯೋಜನೆ (20K TPM ಸಾಮರ್ಥ್ಯ)
  - ದ್ವಿತೀಯ ಪ್ರದೇಶ: GPT-4o-mini ನಿಯೋಜನೆ (10K TPM ಸಾಮರ್ಥ್ಯ)
  - ತೃತೀಯ ಪ್ರದೇಶ: ಪಠ್ಯ ಎಂಬೆಡಿಂಗ್ಸ್ ಮಾದರಿ (30K TPM ಸಾಮರ್ಥ್ಯ)
  - ಮೌಲ್ಯಮಾಪನ ಪ್ರದೇಶ: GPT-4o ಗ್ರೇಡರ್ ಮಾದರಿ (15K TPM ಸಾಮರ್ಥ್ಯ)
  - **ಸ್ಥಿತಿ:** ಸಂಪೂರ್ಣ ಕಾರ್ಯನಿರ್ವಹಣಾ - ತಕ್ಷಣ API ಕರೆಗಳನ್ನು ಮಾಡಬಹುದು

✅ **ಏಜರ್ AI ಶೋಧ** (ಖಾಲಿ - ಸಂರಚನೆಗೆ ಸಿದ್ಧ)
  - ವೆಕ್ಟರ್ ಶೋಧ ಸಾಮರ್ಥ್ಯಗಳು ಸಕ್ರಿಯಗೊಂಡಿವೆ
  - ಸ್ಟ್ಯಾಂಡರ್ಡ್ ಟಿಯರ್ 1 ವಿಭಾಗ, 1 ಪ್ರತಿನಿಧಿ
  - **ಸ್ಥಿತಿ:** ಸೇವೆ ಚಲಿಸುತ್ತಿದೆ, ಆದರೆ ಸೂಚಿ ರಚನೆ ಅಗತ್ಯವಿದೆ
  - **ಕೃತ್ಯ ಅಗತ್ಯವಿದೆ:** ನಿಮ್ಮ ಸ್ಕೀಮಾದೊಂದಿಗೆ ಶೋಧ ಸೂಚಿಯನ್ನು ರಚಿಸಿ

✅ **ಏಜರ್ ಸ್ಟೋರೇಜ್ ಅಕೌಂಟ್** (ಖಾಲಿ - ಅಪ್ಲೋಡ್‌ಗಳಿಗೆ ಸಿದ್ಧ)
  - ಬ್ಲಾಬ್ ಕಂಟೈನರ್‌ಗಳು: `documents`, `uploads`
  - ಸುರಕ್ಷಿತ ಸಂರಚನೆ (ಕೇವಲ HTTPS, ಸಾರ್ವಜನಿಕ ಪ್ರವೇಶವಿಲ್ಲ)
  - **ಸ್ಥಿತಿ:** ಫೈಲ್‌ಗಳನ್ನು ಸ್ವೀಕರಿಸಲು ಸಿದ್ಧ
  - **ಕೃತ್ಯ ಅಗತ್ಯವಿದೆ:** ನಿಮ್ಮ ಉತ್ಪನ್ನ ಡೇಟಾ ಮತ್ತು ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳನ್ನು ಅಪ್ಲೋಡ್ ಮಾಡಿ

⚠️ **ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಪರಿಸರ** (ಪ್ಲೇಸ್‌ಹೋಲ್ಡರ್ ಇಮೇಜ್‌ಗಳು ನಿಯೋಜಿಸಲಾಗಿದೆ)
  - ಏಜೆಂಟ್ ರೌಟರ್ ಅಪ್ಲಿಕೇಶನ್ (nginx ಡೀಫಾಲ್ಟ್ ಇಮೇಜ್)
  - ಮುಂಭಾಗದ ಅಪ್ಲಿಕೇಶನ್ (nginx ಡೀಫಾಲ್ಟ್ ಇಮೇಜ್)
  - ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಸಂರಚಿಸಲಾಗಿದೆ (0-10 ಉದಾಹರಣೆಗಳು)
  - **ಸ್ಥಿತಿ:** ಪ್ಲೇಸ್‌ಹೋಲ್ಡರ್ ಕಂಟೈನರ್‌ಗಳು ಚಲಿಸುತ್ತಿವೆ
  - **ಕೃತ್ಯ ಅಗತ್ಯವಿದೆ:** ನಿಮ್ಮ ಏಜೆಂಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಿ ಮತ್ತು ನಿಯೋಜಿಸಿ

✅ **ಏಜರ್ ಕೋಸ್ಮೋಸ್ DB** (ಖಾಲಿ - ಡೇಟಾಗೆ ಸಿದ್ಧ)
  - ಡೇಟಾಬೇಸ್ ಮತ್ತು ಕಂಟೈನರ್ ಪೂರ್ವಸಂರಚಿಸಲಾಗಿದೆ
  - ಕಡಿಮೆ-ವಿಳಂಬ ಕಾರ್ಯಾಚರಣೆಗಳಿಗೆ ಆಪ್ಟಿಮೈಸ್ ಮಾಡಲಾಗಿದೆ
  - TTL ಸಕ್ರಿಯಗೊಂಡಿದೆ ಸ್ವಯಂ ಸ್ವಚ್ಛತೆಯಿಗಾಗಿ
  - **ಸ್ಥಿತಿ:** ಚಾಟ್ ಇತಿಹಾಸವನ್ನು ಸಂಗ್ರಹಿಸಲು ಸಿದ್ಧ

✅ **ಏಜರ್ ಕೀ ವಾಲ್ಟ್** (ಐಚ್ಛಿಕ - ರಹಸ್ಯಗಳಿಗೆ ಸಿದ್ಧ)
  - ಸಾಫ್ಟ್ ಡಿಲೀಟ್ ಸಕ್ರಿಯಗೊಂಡಿದೆ
  - ನಿರ್ವಹಿತ ಗುರುತಿಗಾಗಿ RBAC ಸಂರಚಿಸಲಾಗಿದೆ
  - **ಸ್ಥಿತಿ:** API ಕೀಗಳು ಮತ್ತು ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್‌ಗಳನ್ನು ಸಂಗ್ರಹಿಸಲು ಸಿದ್ಧ

✅ **ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್** (ಐಚ್ಛಿಕ - ನಿಗಾವಹಿಸುವಿಕೆ ಸಕ್ರಿಯವಾಗಿದೆ)
  - ಲಾಗ್ ಅನಾಲಿಟಿಕ್ಸ್ ವರ್ಕ್‌ಸ್ಪೇಸ್‌ಗೆ ಸಂಪರ್ಕಿಸಲಾಗಿದೆ
  - ಕಸ್ಟಮ್ ಮೆಟ್ರಿಕ್‌ಗಳು ಮತ್ತು ಎಚ್ಚರಿಕೆಗಳು ಸಂರಚಿಸಲಾಗಿದೆ
  - **ಸ್ಥಿತಿ:** ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಂದ ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ಸ್ವೀಕರಿಸಲು ಸಿದ್ಧ

✅ **ಡಾಕ್ಯುಮೆಂಟ್ ಇಂಟೆಲಿಜೆನ್ಸ್** (API ಕರೆಗಳಿಗೆ ಸಿದ್ಧ)
  - S0 ಟಿಯರ್ ಉತ್ಪಾದನಾ ಕಾರ್ಯಭಾರಗಳಿಗೆ
  - **ಸ್ಥಿತಿ:** ಅಪ್ಲೋಡ್ ಮಾಡಿದ ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳನ್ನು ಪ್ರಕ್ರಿಯೆಗೊಳಿಸಲು ಸಿದ್ಧ

✅ **ಬಿಂಗ್ ಶೋಧ API** (API ಕರೆಗಳಿಗೆ ಸಿದ್ಧ)
  - S1 ಟಿಯರ್ ರಿಯಲ್-ಟೈಮ್ ಶೋಧಗಳಿಗೆ
  - **ಸ್ಥಿತಿ:** ವೆಬ್ ಶೋಧ ಪ್ರಶ್ನೆಗಳಿಗೆ ಸಿದ್ಧ

### ನಿಯೋಜನೆ ಮೋಡ್‌ಗಳು

| ಮೋಡ್ | OpenAI ಸಾಮರ್ಥ್ಯ | ಕಂಟೈನರ್ ಉದಾಹರಣೆಗಳು | ಶೋಧ ಟಿಯರ್ | ಸ್ಟೋರೇಜ್ ರೆಡಂಡೆನ್ಸಿ | ಉತ್ತಮವಾಗಿದೆ |
|------|-----------------|---------------------|-------------|-------------------|----------|
| **ಕನಿಷ್ಠ** | 10K-20K TPM | 0-2 ಪ್ರತಿನಿಧಿಗಳು | ಬೇಸಿಕ್ | LRS (ಲೋಕಲ್) | ಡೆವ್/ಟೆಸ್ಟ್, ಕಲಿಕೆ, ಪೂರಕ-ಸಿದ್ಧಾಂತ |
| **ಸ್ಟ್ಯಾಂಡರ್ಡ್** | 30K-60K TPM | 2-5 ಪ್ರತಿನಿಧಿಗಳು | ಸ್ಟ್ಯಾಂಡರ್ಡ್ | ZRS (ಝೋನ್) | ಉತ್ಪಾದನೆ, ಮಧ್ಯಮ ಟ್ರಾಫಿಕ್ (<10K ಬಳಕೆದಾರರು) |
| **ಪ್ರೀಮಿಯಂ** | 80K-150K TPM | 5-10 ಪ್ರತಿನಿಧಿಗಳು, ಝೋನ್-ರೆಡಂಡೆಂಟ್ | ಪ್ರೀಮಿಯಂ | GRS (ಜಿಯೋ) | ಎಂಟರ್‌ಪ್ರೈಸ್, ಹೆಚ್ಚಿನ ಟ್ರಾಫಿಕ್ (>10K ಬಳಕೆದಾರರು), 99.99% SLA |

**ವೆಚ್ಚದ ಪರಿಣಾಮ:**
- **ಕನಿಷ್ಠ → ಸ್ಟ್ಯಾಂಡರ್ಡ್:** ~4x ವೆಚ್ಚದ ಹೆಚ್ಚಳ ($100-370/ತಿಂಗಳು → $420-1,450/ತಿಂಗಳು)
- **ಸ್ಟ್ಯಾಂಡರ್ಡ್ → ಪ್ರೀಮಿಯಂ:** ~3x ವೆಚ್ಚದ ಹೆಚ್ಚಳ ($420-1,450/ತಿಂಗಳು → $1,150-3,500/ತಿಂಗಳು)
- **ಆಯ್ಕೆ ಮಾಡಿ ಆಧರಿಸಿ:** ನಿರೀಕ್ಷಿತ ಲೋಡ್, SLA ಅಗತ್ಯಗಳು, ಬಜೆಟ್ ನಿರ್ಬಂಧಗಳು

**ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ:**
- **TPM (ನಿಮಿಷಕ್ಕೆ ಟೋಕನ್‌ಗಳು):** ಎಲ್ಲಾ ಮಾದರಿ ನಿಯೋಜನೆಗಳ ಒಟ್ಟು
- **ಕಂಟೈನರ್ ಉದಾಹರಣೆಗಳು:** ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಶ್ರೇಣಿ (ಕನಿಷ್ಠ-ಗರಿಷ್ಠ ಪ್ರತಿನಿಧಿಗಳು)
- **ಶೋಧ ಟಿಯರ್:** ಪ್ರಶ್ನೆ ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ಸೂಚಿ ಗಾತ್ರದ ಮಿತಿಗಳನ್ನು ಪ್ರಭಾವಿಸುತ್ತದೆ

## 📋 ಪೂರ್ವಾಪೇಕ್ಷಿತಗಳು

### ಅಗತ್ಯವಿರುವ ಸಾಧನಗಳು
1. **ಏಜರ್ CLI** (ಆವೃತ್ತಿ 2.50.0 ಅಥವಾ ಹೆಚ್ಚಿನದು)
   ```bash
   az --version  # ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
   az login      # ದೃಢೀಕರಿಸಿ
   ```

2. **ಸಕ್ರಿಯ ಏಜರ್ ಚಂದಾದಾರಿಕೆ** ಮಾಲೀಕ ಅಥವಾ ಕೊಡುಗಿದಾರರ ಪ್ರವೇಶದೊಂದಿಗೆ
   ```bash
   az account show  # ಚಂದಾದಾರಿಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
   ```

### ಅಗತ್ಯವಿರುವ ಏಜರ್ ಕೋಟಾಗಳು

ನಿಯೋಜನೆಯ ಮೊದಲು, ನಿಮ್ಮ ಗುರಿ ಪ್ರದೇಶಗಳಲ್ಲಿ ಸಾಕಷ್ಟು ಕೋಟಾಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:

```bash
# ನಿಮ್ಮ ಪ್ರದೇಶದಲ್ಲಿ Azure OpenAI ಲಭ್ಯತೆ ಪರಿಶೀಲಿಸಿ
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# OpenAI ಕೋಟಾವನ್ನು ಪರಿಶೀಲಿಸಿ (ಉದಾಹರಣೆಗೆ gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಕೋಟಾವನ್ನು ಪರಿಶೀಲಿಸಿ
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**ಕನಿಷ್ಠ ಅಗತ್ಯವಿರುವ ಕೋಟಾಗಳು:**
- **ಏಜರ್ OpenAI:** 3-4 ಮಾದರಿ ನಿಯೋಜನೆಗಳು ಪ್ರದೇಶಗಳಲ್ಲಿ
  - GPT-4o: 20K TPM (ನಿಮಿಷಕ್ಕೆ ಟೋಕನ್‌ಗಳು)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **ಗಮನಿಸಿ:** ಕೆಲವು ಪ್ರದೇಶಗಳಲ್ಲಿ GPT-4o ವೇಟ್ಲಿಸ್ಟ್‌ ಇರಬಹುದು - [ಮಾದರಿ ಲಭ್ಯತೆ](https://learn.microsoft.com/azure/ai-services/openai/concepts/models) ಪರಿಶೀಲಿಸಿ
- **ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು:** ನಿರ್ವಹಿತ ಪರಿಸರ + 2-10 ಕಂಟೈನರ್ ಉದಾಹರಣೆಗಳು
- **AI ಶೋಧ:** ಸ್ಟ್ಯಾಂಡರ್ಡ್ ಟಿಯರ್ (ವೆಕ್ಟರ್ ಶೋಧಕ್ಕೆ ಬೇಸಿಕ್ ಅಪರ್ಯಾಯವಲ್ಲ)
- **ಕೋಸ್ಮೋಸ್ DB:** ಸ್ಟ್ಯಾಂಡರ್ಡ್ ಪ್ರೊವಿಷನ್ಡ್ ಥ್ರೂಪುಟ್

**ಕೋಟಾ ಅಪರ್ಯಾಯವಿಲ್ಲದಿದ್ದರೆ:**
1. ಏಜರ್ ಪೋರ್ಟಲ್ → ಕೋಟಾಗಳು → ಹೆಚ್ಚಳಕ್ಕಾಗಿ ವಿನಂತಿ
2. ಅಥವಾ ಏಜರ್ CLI ಬಳಸಿ:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. ಲಭ್ಯತೆಯೊಂದಿಗೆ ಪರ್ಯಾಯ ಪ್ರದೇಶಗಳನ್ನು ಪರಿಗಣಿಸಿ

## 🚀 ತ್ವರಿತ ನಿಯೋಜನೆ

### ಆಯ್ಕೆ 1: ಏಜರ್ CLI ಬಳಸಿ

```bash
# ಟೆಂಪ್ಲೇಟ್ ಫೈಲ್‌ಗಳನ್ನು ಕ್ಲೋನ್ ಅಥವಾ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸ್ಕ್ರಿಪ್ಟ್ ಅನ್ನು ಕಾರ್ಯನಿರ್ವಹಿಸಬಹುದಾಗಿರಿಸಿ
chmod +x deploy.sh

# ಡಿಫಾಲ್ಟ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳೊಂದಿಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
./deploy.sh -g myResourceGroup

# ಪ್ರೀಮಿಯಂ ವೈಶಿಷ್ಟ್ಯಗಳೊಂದಿಗೆ ಉತ್ಪಾದನೆಗಾಗಿ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### ಆಯ್ಕೆ 2: ಏಜರ್ ಪೋರ್ಟಲ್ ಬಳಸಿ

[![ಏಜರ್‌ಗೆ ನಿಯೋಜಿಸಿ](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### ಆಯ್ಕೆ 3: ನೇರವಾಗಿ ಏಜರ್ CLI ಬಳಸಿ

```bash
# ಸಂಪತ್ತಿನ ಗುಂಪನ್ನು ರಚಿಸಿ
az group create --name myResourceGroup --location eastus2

# ಟೆಂಪ್ಲೇಟನ್ನು ನಿಯೋಜಿಸಿ
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ ನಿಯೋಜನೆ ಸಮಯರೇಖೆ

### ನಿರೀಕ್ಷಿಸಬೇಕಾದುದು

| ಹಂತ | ಅವಧಿ | ಏನಾಗುತ್ತದೆ |
|-------|----------|--------------||
| **ಟೆಂಪ್ಲೇಟ್ ಮಾನ್ಯತೆ** | 30-60 ಸೆಕೆಂಡುಗಳು | ಏಜರ್ ARM ಟೆಂಪ್ಲೇಟ್ ಸಿಂಟ್ಯಾಕ್ಸ್ ಮತ್ತು ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸುತ್ತದೆ |
| **ಸಂಪತ್ತು ಗುಂಪು ಸೆಟಪ್** | 10-20 ಸೆಕೆಂಡುಗಳು | ಸಂಪತ್ತು ಗುಂಪು ರಚಿಸುತ್ತದೆ (ಅಗತ್ಯವಿದ್ದರೆ) |
| **OpenAI ನಿಯೋಜನೆ** | 5-8 ನಿಮಿಷ | 3-4 OpenAI ಖಾತೆಗಳನ್ನು ರಚಿಸುತ್ತದೆ ಮತ್ತು ಮಾದರಿಗಳನ್ನು ನಿಯೋಜಿಸುತ್ತದೆ |
| **ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು** | 3-5 ನಿಮಿಷ | ಪರಿಸರವನ್ನು ರಚಿಸುತ್ತದೆ ಮತ್ತು ಪ್ಲೇಸ್‌ಹೋಲ್ಡರ್ ಕಂಟೈನರ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುತ್ತದೆ |
| **ಶೋಧ ಮತ್ತು ಸ್ಟೋರೇಜ್** | 2-4 ನಿಮಿಷ | AI ಶೋಧ ಸೇವೆ ಮತ್ತು ಸ್ಟೋರೇಜ್ ಅಕೌಂಟ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುತ್ತದೆ |
| **ಕೋಸ್ಮೋಸ್ DB** | 2-3 ನಿಮಿಷ | ಡೇಟಾಬೇಸ್ ರಚಿಸುತ್ತದೆ ಮತ್ತು ಕಂಟೈನರ್‌ಗಳನ್ನು ಸಂರಚಿಸುತ್ತದೆ |
| **ನಿಗಾವಹಿಸುವಿಕೆ ಸೆಟಪ್** | 2-3 ನಿಮಿಷ | ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಮತ್ತು ಲಾಗ್ ಅನಾಲಿಟಿಕ್ಸ್ ಅನ್ನು ಸೆಟಪ್ ಮಾಡುತ್ತದೆ |
| **RBAC ಸಂರಚನೆ** | 1-2 ನಿಮಿಷ | ನಿರ್ವಹಿತ ಗುರುತಿಗೆ ಅನುಮತಿಗಳನ್ನು ಸಂರಚಿಸುತ್ತದೆ |
| **ಒಟ್ಟು ನಿಯೋಜನೆ** | **15-25 ನಿಮಿಷ** | ಸಂಪೂರ್ಣ ಮೂಲಸೌಕರ್ಯ ಸಿದ್ಧ |

**ನಿಯೋಜನೆಯ ನಂತರ:**
- ✅ **ಮೂಲಸೌಕರ್ಯ ಸಿದ್ಧ:** ಎಲ್ಲಾ ಏಜರ್ ಸೇವೆಗಳು ನಿಯೋಜಿತ ಮತ್ತು ಚಲಿಸುತ್ತಿವೆ
- ⏱️ **ಅಪ್ಲಿಕೇಶನ್ ಅಭಿವೃದ್ಧಿ:** 80-120 ಗಂಟೆಗಳು (ನಿಮ್ಮ ಜವಾಬ್ದಾರಿ)
- ⏱️ **ಸೂಚಿ ಸಂರಚನೆ:** 15-30 ನಿಮಿಷ (ನಿಮ್ಮ ಸ್ಕೀಮಾ ಅಗತ್ಯವಿದೆ)
- ⏱️ **ಡೇಟಾ ಅಪ್ಲೋಡ್:** ಡೇಟಾಸೆಟ್ ಗಾತ್ರದ ಪ್ರಕಾರ ಬದಲಾಗುತ್ತದೆ
- ⏱️ **ಪರೀಕ್ಷೆ ಮತ್ತು ಮಾನ್ಯತೆ:** 2-4 ಗಂಟೆಗಳು

---

## ✅ ನಿಯೋಜನೆ ಯಶಸ್ಸು ಪರಿಶೀಲಿಸಿ

### ಹಂತ 1: ಸಂಪತ್ತು ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ (2 ನಿಮಿಷ)

```bash
# ಎಲ್ಲಾ ಸಂಪತ್ತುಗಳು ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿತವಾಗಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**ನಿರೀಕ್ಷಿತ:** ಖಾಲಿ ಟೇಬಲ್ (ಎಲ್ಲಾ ಸಂಪತ್ತುಗಳು "Succeeded" ಸ್ಥಿತಿಯನ್ನು ತೋರಿಸುತ್ತವೆ)

### ಹಂತ 2: ಏಜರ್ OpenAI ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ (3 ನಿಮಿಷ)

```bash
# ಎಲ್ಲಾ OpenAI ಖಾತೆಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# ಪ್ರಾಥಮಿಕ ಪ್ರದೇಶಕ್ಕಾಗಿ ಮಾದರಿ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**ನಿರೀಕ್ಷಿತ:** 
- 3-4 OpenAI ಖಾತೆಗಳು (ಪ್ರಾಥಮಿಕ, ದ್ವಿತೀಯ, ತೃತೀಯ, ಮೌಲ್ಯಮಾಪನ ಪ್ರದೇಶಗಳು)
- ಪ್ರತಿ ಖಾತೆಗೆ 1-2 ಮಾದರಿ ನಿಯೋಜನೆಗಳು (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### ಹಂತ 3: ಮೂಲಸೌಕರ್ಯ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ (5 ನಿಮಿಷ)

```bash
# ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ URLಗಳನ್ನು ಪಡೆಯಿರಿ
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# ರೌಟರ್ ಎಂಡ್ಪಾಯಿಂಟ್ ಪರೀಕ್ಷಿಸಿ (ಪ್ಲೇಸ್‌ಹೋಲ್ಡರ್ ಚಿತ್ರ ಪ್ರತಿಕ್ರಿಯಿಸುತ್ತದೆ)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**ನಿರೀಕ್ಷಿತ:** 
- ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು "ಚಲಿಸುತ್ತಿವೆ" ಸ್ಥಿತಿಯನ್ನು ತೋರಿಸುತ್ತವೆ
- ಪ್ಲೇಸ್‌ಹೋಲ್ಡರ್ nginx HTTP 200 ಅಥವಾ 404 ಪ್ರತಿಕ್ರಿಯೆ ನೀಡುತ್ತದೆ (ಯಾವುದೇ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಇಲ್ಲ)

### ಹಂತ 4: ಏಜರ್ OpenAI API ಪ್ರವೇಶವನ್ನು ಪರಿಶೀಲಿಸಿ (3 ನಿಮಿಷ)

```bash
# ಓಪನ್‌ಎಐ ಎಂಡ್ಪಾಯಿಂಟ್ ಮತ್ತು ಕೀ ಪಡೆಯಿರಿ
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# GPT-4o ನಿಯೋಜನೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**ನಿರೀಕ್ಷಿತ:** JSON ಪ್ರತಿಕ್ರಿಯೆ ಚಾಟ್ ಪೂರ್ಣಗೊಳಿಸುವಿಕೆಯಿಂದ (OpenAI ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿದೆ ಎಂದು ದೃಢಪಡಿಸುತ್ತದೆ)

### ಏನು ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿದೆ ಮತ್ತು ಏನು ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿಲ್ಲ

**✅ ನಿಯೋಜನೆಯ ನಂತರ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿದೆ:**
- ಏಜರ್ OpenAI ಮಾದರಿ ನಿಯೋಜನೆಗಳು ಮತ್ತು API ಕರೆಗಳನ್ನು ಸ್ವೀಕರಿಸುತ್ತಿವೆ
- AI ಶೋಧ ಸೇವೆ ಚಲಿಸುತ್ತಿದೆ (ಖಾಲಿ, ಯಾವುದೇ ಸೂಚಿ ಇಲ್ಲ)
- ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು ಚಲಿಸುತ್ತಿವೆ (ಪ್ಲೇಸ್‌ಹೋಲ್ಡರ್ nginx ಇಮೇಜ್‌ಗಳು)
- ಸ್ಟೋರೇಜ್ ಅಕೌಂಟ್‌ಗಳು ಪ್ರವೇಶಯೋಗ್ಯ ಮತ್ತು ಅಪ್ಲೋಡ್‌ಗಳಿಗೆ ಸಿದ್ಧ
- ಕೋಸ್ಮೋಸ್ DB ಡೇಟಾ ಕಾರ್ಯಾಚರಣೆಗಳಿಗೆ ಸಿದ್ಧ
- ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಮೂಲಸೌಕರ್ಯ ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ಸಂಗ್ರಹಿಸುತ್ತಿದೆ
- ಕೀ ವಾಲ್ಟ್ ರಹಸ್ಯ ಸಂಗ್ರಹಣೆಗೆ ಸಿದ್ಧ

**❌ ಇನ್ನೂ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿಲ್ಲ (ಅಭಿವೃದ್ಧಿ ಅಗತ್ಯವಿದೆ):**
- ಏಜೆಂಟ್ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು (ಯಾವುದೇ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ನಿಯೋಜನೆಗೊಂಡಿಲ್ಲ)

> **📝 ಮುಖ್ಯವಾದುದು:** ಮೂಲಸೌಕರ್ಯವನ್ನು ನಿಯೋಜಿಸಲಾಗಿದೆ, ಆದರೆ ನೀವು ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ಅಭಿವೃದ್ಧಿಪಡಿಸಿ ನಿಯೋಜಿಸಬೇಕಾಗಿದೆ.

### ಹಂತ 1: ಏಜೆಂಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಅಭಿವೃದ್ಧಿಪಡಿಸಿ (ನಿಮ್ಮ ಜವಾಬ್ದಾರಿ)

ARM ಟೆಂಪ್ಲೇಟ್ **ಖಾಲಿ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು** ಪ್ಲೇಸ್‌ಹೋಲ್ಡರ್ nginx ಇಮೇಜ್‌ಗಳೊಂದಿಗೆ ರಚಿಸುತ್ತದೆ. ನೀವು ಮಾಡಬೇಕಾದದ್ದು:

**ಅಗತ್ಯವಿರುವ ಅಭಿವೃದ್ಧಿ:**
1. **ಏಜೆಂಟ್ ಅನುಷ್ಠಾನ** (30-40 ಗಂಟೆಗಳು)
   - GPT-4o ಇಂಟಿಗ್ರೇಶನ್‌ನೊಂದಿಗೆ ಗ್ರಾಹಕ ಸೇವಾ ಏಜೆಂಟ್
   - GPT-4o-mini ಇಂಟಿಗ್ರೇಶನ್‌ನೊಂದಿಗೆ ಇನ್‌ವೆಂಟರಿ ಏಜೆಂಟ್
   - ಏಜೆಂಟ್ ರೌಟಿಂಗ್ ಲಾಜಿಕ್

2. **ಫ್ರಂಟ್‌ಎಂಡ್ ಅಭಿವೃದ್ಧಿ** (20-30 ಗಂಟೆಗಳು)
   - ಚಾಟ್ ಇಂಟರ್ಫೇಸ್ UI (React/Vue/Angular)
   - ಫೈಲ್ ಅಪ್ಲೋಡ್ ಕಾರ್ಯಕ್ಷಮತೆ
   - ಪ್ರತಿಕ್ರಿಯೆ ರೆಂಡರಿಂಗ್ ಮತ್ತು ಫಾರ್ಮ್ಯಾಟಿಂಗ್

3. **ಬ್ಯಾಕ್‌ಎಂಡ್ ಸೇವೆಗಳು** (12-16 ಗಂಟೆಗಳು)
   - FastAPI ಅಥವಾ Express ರೌಟರ್
   - ಆಥೆಂಟಿಕೇಶನ್ ಮಿಡಲ್‌ವೇರ್
   - ಟೆಲಿಮೆಟ್ರಿ ಇಂಟಿಗ್ರೇಶನ್

**ನೋಡಿ:** [ಆರ್ಕಿಟೆಕ್ಚರ್ ಗೈಡ್](../retail-scenario.md) ವಿವರವಾದ ಅನುಷ್ಠಾನ ಮಾದರಿಗಳು ಮತ್ತು ಕೋಡ್ ಉದಾಹರಣೆಗಳಿಗಾಗಿ

### ಹಂತ 2: AI ಶೋಧ ಸೂಚಿಯನ್ನು ಸಂರಚಿಸಿ (15-30 ನಿಮಿಷಗಳು)

ನಿಮ್ಮ ಡೇಟಾ ಮಾದರಿಯನ್ನು ಹೊಂದುವ ಶೋಧ ಸೂಚಿಯನ್ನು ರಚಿಸಿ:

```bash
# ಹುಡುಕಾಟ ಸೇವೆಯ ವಿವರಗಳನ್ನು ಪಡೆಯಿರಿ
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# ನಿಮ್ಮ ಸ್ಕೀಮಾದೊಂದಿಗೆ ಸೂಚಿಯನ್ನು ರಚಿಸಿ (ಉದಾಹರಣೆ)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**ಸಂಪತ್ತುಗಳು:**
- [AI ಶೋಧ ಸೂಚಿ ಸ್ಕೀಮಾ ವಿನ್ಯಾಸ](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [ವೆಕ್ಟರ್ ಶೋಧ ಸಂರಚನೆ](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### ಹಂತ 3: ನಿಮ್ಮ ಡೇಟಾವನ್ನು ಅಪ್ಲೋಡ್ ಮಾಡಿ (ಸಮಯ ಬದಲಾಗುತ್ತದೆ)

ನಿಮ್ಮ ಉತ್ಪನ್ನ ಡೇಟಾ ಮತ್ತು ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳನ್ನು ಹೊಂದಿದ ನಂತರ:

```bash
# ಸಂಗ್ರಹಣಾ ಖಾತೆ ವಿವರಗಳನ್ನು ಪಡೆಯಿರಿ
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# ನಿಮ್ಮ ದಾಖಲೆಗಳನ್ನು ಅಪ್ಲೋಡ್ ಮಾಡಿ
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# ಉದಾಹರಣೆ: ಒಬ್ಬ ಫೈಲ್ ಅನ್ನು ಅಪ್ಲೋಡ್ ಮಾಡಿ
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### ಹಂತ 4: ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಿ ಮತ್ತು ನಿಯೋಜಿಸಿ (8-12 ಗಂಟೆಗಳು)

ನೀವು ನಿಮ್ಮ ಏಜೆಂಟ್ ಕೋಡ್ ಅನ್ನು ಅಭಿವೃದ್ಧಿಪಡಿಸಿದ ನಂತರ:

```bash
# 1. ಆಜೂರ್ ಕಂಟೈನರ್ ರಿಜಿಸ್ಟ್ರಿ ರಚಿಸಿ (ಅಗತ್ಯವಿದ್ದಲ್ಲಿ)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. ಏಜೆಂಟ್ ರೌಟರ್ ಇಮೇಜ್ ನಿರ್ಮಿಸಿ ಮತ್ತು ಪುಷ್ ಮಾಡಿ
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. ಫ್ರಂಟ್ಎಂಡ್ ಇಮೇಜ್ ನಿರ್ಮಿಸಿ ಮತ್ತು ಪುಷ್ ಮಾಡಿ
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. ನಿಮ್ಮ ಇಮೇಜ್‌ಗಳೊಂದಿಗೆ ಕಂಟೈನರ್ ಆ್ಯಪ್ಗಳನ್ನು ನವೀಕರಿಸಿ
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. ಪರಿಸರ ಚರಾಂಶಗಳನ್ನು ಸಂರಚಿಸಿ
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### ಹಂತ 5: ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ (2-4 ಗಂಟೆಗಳು)

```bash
# ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ URL ಪಡೆಯಿರಿ
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# ಏಜೆಂಟ್ ಎಂಡ್ಪಾಯಿಂಟ್ ಪರೀಕ್ಷಿಸಿ (ನಿಮ್ಮ ಕೋಡ್ ಡಿಪ್ಲಾಯ್ ಮಾಡಿದ ನಂತರ)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### ಅನುಷ್ಠಾನ ಸಂಪತ್ತುಗಳು

**ಆರ್ಕಿಟೆಕ್ಚರ್ ಮತ್ತು ವಿನ್ಯಾಸ:**
- 📖 [ಸಂಪೂರ್ಣ ಆರ್ಕಿಟೆಕ್ಚರ್ ಗೈಡ್](../retail-scenario.md) - ವಿವರವಾದ ಅನುಷ್ಠಾನ ಮಾದರಿಗಳು
- 📖 [ಮಲ್ಟಿ-ಏಜೆಂಟ್ ವಿನ್ಯಾಸ ಮಾದರಿಗಳು](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**ಕೋಡ್ ಉದಾಹರಣೆಗಳು:**
- 🔗 [Azure OpenAI ಚಾಟ್ ಮಾದರಿ](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG ಮಾದರಿ
- 🔗 [ಸೆಮಾಂಟಿಕ್ ಕರ್ಣೆಲ್](https://github.com/microsoft/semantic-kernel) - ಏಜೆಂಟ್ ಫ್ರೇಮ್‌ವರ್ಕ್ (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - ಏಜೆಂಟ್ ಸಂಯೋಜನೆ (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಸಂಭಾಷಣೆಗಳು

**ಅಂದಾಜಿತ ಒಟ್ಟು ಪ್ರಯತ್ನ:**
- ಮೂಲಸೌಕರ್ಯ ನಿಯೋಜನೆ: 15-25 ನಿಮಿಷಗಳು (✅ ಪೂರ್ಣಗೊಂಡಿದೆ)
- ಅಪ್ಲಿಕೇಶನ್ ಅಭಿವೃದ್ಧಿ: 80-120 ಗಂಟೆಗಳು (🔨 ನಿಮ್ಮ ಕೆಲಸ)
- ಪರೀಕ್ಷೆ ಮತ್ತು ಆಪ್ಟಿಮೈಜೇಶನ್: 15-25 ಗಂಟೆಗಳು (🔨 ನಿಮ್ಮ ಕೆಲಸ)

## 🛠️ ತೊಂದರೆ ಪರಿಹಾರ

### ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು

#### 1. Azure OpenAI ಕೋಟಾ ಮೀರಿಸಲಾಗಿದೆ

```bash
# ಪ್ರಸ್ತುತ ಕೋಟಾ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus2

# ಕೋಟಾ ಹೆಚ್ಚಳವನ್ನು ವಿನಂತಿಸಿ
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ ವಿಫಲವಾಗಿದೆ

```bash
# ಕಂಟೈನರ್ ಆಪ್ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# ಕಂಟೈನರ್ ಆಪ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಿ
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. ಶೋಧ ಸೇವೆ ಪ್ರಾರಂಭ

```bash
# ಹುಡುಕಾಟ ಸೇವೆಯ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# ಹುಡುಕಾಟ ಸೇವೆಯ ಸಂಪರ್ಕತೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### ನಿಯೋಜನೆ ಮಾನ್ಯತೆ

```bash
# ಎಲ್ಲಾ ಸಂಪತ್ತುಗಳು ರಚನೆಯಾಗಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
az resource list \
  --resource-group myResourceGroup \
  --output table

# ಸಂಪತ್ತಿನ ಆರೋಗ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 ಭದ್ರತಾ ಪರಿಗಣನೆಗಳು

### ಕೀ ನಿರ್ವಹಣೆ
- ಎಲ್ಲಾ ಸೀಕ್ರೆಟ್‌ಗಳನ್ನು Azure Key Vault ನಲ್ಲಿ ಸಂಗ್ರಹಿಸಲಾಗಿದೆ (ಸಕ್ರಿಯಗೊಳಿಸಿದಾಗ)
- ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು ಪ್ರಬಂಧಿತ ಐಡೆಂಟಿಟಿಯನ್ನು ಆಧಾರಿತವಾಗಿ ಪ್ರಾಮಾಣೀಕರಿಸುತ್ತವೆ
- ಸ್ಟೋರೇಜ್ ಖಾತೆಗಳಲ್ಲಿ ಸುರಕ್ಷಿತ ಡೀಫಾಲ್ಟ್‌ಗಳು (HTTPS ಮಾತ್ರ, ಸಾರ್ವಜನಿಕ ಬ್ಲಾಬ್ ಪ್ರವೇಶವಿಲ್ಲ)

### ನೆಟ್‌ವರ್ಕ್ ಭದ್ರತೆ
- ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು ಸಾಧ್ಯವಾದಷ್ಟು ಆಂತರಿಕ ನೆಟ್‌ವರ್ಕಿಂಗ್ ಅನ್ನು ಬಳಸುತ್ತವೆ
- ಶೋಧ ಸೇವೆಯನ್ನು ಖಾಸಗಿ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಆಯ್ಕೆಯೊಂದಿಗೆ ಸಂರಚಿಸಲಾಗಿದೆ
- Cosmos DB ಅನ್ನು ಕನಿಷ್ಠ ಅಗತ್ಯ ಅನುಮತಿಗಳೊಂದಿಗೆ ಸಂರಚಿಸಲಾಗಿದೆ

### RBAC ಸಂರಚನೆ
```bash
# ನಿರ್ವಹಿತ ಗುರುತಿಗೆ ಅಗತ್ಯವಾದ ಪಾತ್ರಗಳನ್ನು ನಿಯೋಜಿಸಿ
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 ವೆಚ್ಚ ಆಪ್ಟಿಮೈಜೇಶನ್

### ವೆಚ್ಚ ಅಂದಾಜುಗಳು (ತಿಂಗಳ, USD)

| ಮೋಡ್ | OpenAI | ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು | ಶೋಧ | ಸ್ಟೋರೇಜ್ | ಒಟ್ಟು ಅಂದಾಜು |
|------|--------|----------------|--------|---------|------------|
| ಕನಿಷ್ಠ | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| ಸ್ಟ್ಯಾಂಡರ್ಡ್ | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| ಪ್ರೀಮಿಯಂ | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### ವೆಚ್ಚ ಮೇಲ್ವಿಚಾರಣೆ

```bash
# ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡಿ
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 ನವೀಕರಣಗಳು ಮತ್ತು ನಿರ್ವಹಣೆ

### ಟೆಂಪ್ಲೇಟ್ ನವೀಕರಣಗಳು
- ARM ಟೆಂಪ್ಲೇಟ್ ಫೈಲ್‌ಗಳನ್ನು ಆವೃತ್ತಿ ನಿಯಂತ್ರಣದಲ್ಲಿ ಇಡಿ
- ಅಭಿವೃದ್ಧಿ ಪರಿಸರದಲ್ಲಿ ಬದಲಾವಣೆಗಳನ್ನು ಮೊದಲು ಪರೀಕ್ಷಿಸಿ
- ನವೀಕರಣಗಳಿಗಾಗಿ ಇನ್‌ಕ್ರಿಮೆಂಟಲ್ ನಿಯೋಜನೆ ಮೋಡ್ ಅನ್ನು ಬಳಸಿ

### ಸಂಪತ್ತು ನವೀಕರಣಗಳು
```bash
# ಹೊಸ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳೊಂದಿಗೆ ನವೀಕರಿಸಿ
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### ಬ್ಯಾಕಪ್ ಮತ್ತು ಪುನಃಪ್ರಾಪ್ತಿ
- Cosmos DB ಸ್ವಯಂಚಾಲಿತ ಬ್ಯಾಕಪ್ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ
- Key Vault ಸಾಫ್ಟ್ ಡಿಲೀಟ್ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ
- ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಪರಿಷ್ಕರಣೆಗಳನ್ನು ರೋಲ್‌ಬ್ಯಾಕ್‌ಗಾಗಿ ನಿರ್ವಹಿಸಲಾಗಿದೆ

## 📞 ಬೆಂಬಲ

- **ಟೆಂಪ್ಲೇಟ್ ಸಮಸ್ಯೆಗಳು:** [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure ಬೆಂಬಲ:** [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **ಸಮುದಾಯ:** [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ ನಿಮ್ಮ ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಪರಿಹಾರವನ್ನು ನಿಯೋಜಿಸಲು ಸಿದ್ಧವೇ?**

ಪ್ರಾರಂಭಿಸಿ: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸಮಾಕ್ಷಿಕೆ**:  
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸಮಾಕ್ಷಿತೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಮಹತ್ವದ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->